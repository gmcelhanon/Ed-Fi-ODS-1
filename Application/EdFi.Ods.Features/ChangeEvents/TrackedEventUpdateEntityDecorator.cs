using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Reflection.Emit;
using System.Threading;
using System.Threading.Tasks;
using EdFi.Ods.Common;
using EdFi.Ods.Common.Extensions;
using EdFi.Ods.Common.Infrastructure;
using EdFi.Ods.Common.Infrastructure.Database.NamingConventions;
using EdFi.Ods.Common.Infrastructure.Repositories;
using EdFi.Ods.Common.Models;
using EdFi.Ods.Common.Models.Domain;
using EdFi.Ods.Common.Models.Dynamic;
using EdFi.Ods.Common.Repositories;
using NHibernate;
using NHibernate.Mapping;
using Stubble.Core.Builders;
using Stubble.Core.Settings;

namespace EdFi.Ods.Features.ChangeEvents
{
    public class TrackedEventUpdateEntityDecorator<TEntity> : IUpdateEntity<TEntity>
        where TEntity : DomainObjectBase, IHasIdentifier, IDateVersionedEntity
    {
        private readonly ISessionFactory _sessionFactory;
        private readonly IUpdateEntity<TEntity> _decoratedInstance;

        private readonly IDomainModelProvider _domainModelProvider;
        private readonly IDatabaseNamingConvention _databaseNamingConvention;
        private readonly DbProviderFactory _dbProviderFactory;
        private readonly Lazy<Entity> _entityModel;
        private readonly Lazy<string> _insertSql;

        private delegate void AssignParametersDelegate(DbCommand command, TEntity target);
        private readonly Lazy<AssignParametersDelegate> _assignParameters;

        private const string TrackedEventsSchemaPrefix = "tracked_events_";
        private const string ChangeVersionSequenceFullName = "changes.ChangeVersionSequence";

        public TrackedEventUpdateEntityDecorator(
            ISessionFactory sessionFactory,
            IUpdateEntity<TEntity> decoratedInstance,
            IDomainModelProvider domainModelProvider,
            IDatabaseNamingConvention databaseNamingConvention,
            DbProviderFactory dbProviderFactory)
        {
            _sessionFactory = sessionFactory;
            _decoratedInstance = decoratedInstance;
            
            _domainModelProvider = domainModelProvider;
            _databaseNamingConvention = databaseNamingConvention;
            _dbProviderFactory = dbProviderFactory;

            _entityModel = new Lazy<Entity>(
                () =>
                {
                    // Capture update event
                    if (!_domainModelProvider.GetDomainModel()
                        .EntityByFullName.TryGetValue(typeof(TEntity).GetFullName(), out var entity))
                    {
                        throw new Exception($"Unable to find entity '{typeof(TEntity).GetFullName()}' in the model.");
                    }

                    return entity;
                });

            _insertSql = new Lazy<string>(
                () =>
                {
                    dynamic codeGenModel = new DynamicModel();

                    codeGenModel.ChangeEventColumns = GetChangeEventColumns();
                    
                    var entityModel = _entityModel.Value;

                    // Add joins, if necessary
                    if (!entityModel.IsDerived)
                    {
                        codeGenModel.Joins = entityModel.GetChangeDataProperties()
                            .SelectMany((p, i) => p.JoinForApiResourceData(i, _databaseNamingConvention))
                            .ToArray();
                    }

                    codeGenModel.TrackedEventsSchema = $"{TrackedEventsSchemaPrefix}{_databaseNamingConvention.Schema(entityModel)}";
                    codeGenModel.TableName = _databaseNamingConvention.TableName(entityModel);
                    codeGenModel.HasDiscriminator = entityModel.IsBase && entityModel.HasDiscriminator();
                    
                    string sqlTemplate =
                        @"
        INSERT INTO {{TrackedEventsSchema}}.{{TableName}} (
            {{#ChangeEventColumns}}Old{{ColumnName}}, {{/ChangeEventColumns}}
            {{#ChangeEventColumns}}New{{ColumnName}}, {{/ChangeEventColumns}}
            Id, {{#HasDiscriminator}}Discriminator, {{/HasDiscriminator}}ChangeVersion, JsonPatch)
        VALUES (
            {{#ChangeEventColumns}}@{{ColumnName}}, {{/ChangeEventColumns}}
            {{#ChangeEventColumns}}@{{ColumnName}}, {{/ChangeEventColumns}}
            @Id, {{#HasDiscriminator}}@Discriminator, {{/HasDiscriminator}}(NEXT VALUE FOR changes.ChangeVersionSequence), @JsonPatch)";

                    string sql = RenderAsync(sqlTemplate, codeGenModel, new Dictionary<string, string>());

                    return sql;
                });

            _assignParameters = new Lazy<AssignParametersDelegate>(CreateAssignParametersDelegate);
            
            string RenderAsync(string templateContent, object templateModel, IDictionary<string, string> partials)
            {
                var renderer = new StubbleBuilder()
                    .Configure(
                        settings =>
                        {
                            settings.SetMaxRecursionDepth(512);
                            settings.SetIgnoreCaseOnKeyLookup(true);
                        }
                    )
                    .Build();
                
                string renderedContent = renderer.Render(templateContent, templateModel, partials, new RenderSettings {SkipHtmlEncoding = true});

                return renderedContent;
            }
        }

        private ChangeEventColumn[] GetChangeEventColumns()
        {
            var entityModel = _entityModel.Value;

            // Get Event Key Columns
            if (entityModel.IsDerived)
            {
                return entityModel.GetChangeDataProperties()
                    .SelectMany((p, i) => p.ExpandForApiResourceData(i, _databaseNamingConvention))
                    .ToArray();
            }
            
            return entityModel.GetChangeDataProperties()
                .SelectMany((p, i) => p.ExpandForApiResourceData(i, _databaseNamingConvention))
                .ToArray();
        } 

        public async Task UpdateAsync(TEntity persistentEntity, CancellationToken cancellationToken, string jsonPatch)
        {
            await _decoratedInstance.UpdateAsync(persistentEntity, cancellationToken, jsonPatch);

            using var sessionScope = (new SessionScope(_sessionFactory));

            // Initialize a new command
            var cmd = _dbProviderFactory.CreateCommand();
            cmd.Connection = sessionScope.Session.Connection;
            sessionScope.Session.Transaction.Enlist(cmd);
            cmd.CommandText = _insertSql.Value;
            
            // Assign the command parameters
            _assignParameters.Value(cmd, persistentEntity);

            var idParameter = cmd.CreateParameter();
            idParameter.ParameterName = "@Id";
            idParameter.DbType = DbType.Guid;
            idParameter.Value = persistentEntity.Id;
            cmd.Parameters.Add(idParameter);

            var jsonPatchParameter = cmd.CreateParameter();
            jsonPatchParameter.ParameterName = "@JsonPatch";
            jsonPatchParameter.DbType = DbType.String;
            jsonPatchParameter.Value = jsonPatch;
            cmd.Parameters.Add(jsonPatchParameter);

            if (_entityModel.Value.IsBase && _entityModel.Value.HasDiscriminator())
            {
                var discriminatorParameter = cmd.CreateParameter();
                discriminatorParameter.ParameterName = "@Discriminator";
                discriminatorParameter.DbType = DbType.String;
                discriminatorParameter.Value = _entityModel.Value.FullName.ToString();
                cmd.Parameters.Add(discriminatorParameter);
            }
            
            await cmd.ExecuteNonQueryAsync(cancellationToken);
        }

        private AssignParametersDelegate CreateAssignParametersDelegate()
        {
            var m = new DynamicMethod(
                // $"AssignParameters_{_entityModel.Value.FullName.ToString().Replace(".", "_")}",
                $"AssignParameters",
                null,
                new[]
                {
                    typeof(DbCommand), typeof(TEntity)
                },
                true);

            var il = m.GetILGenerator();
            il.DeclareLocal(typeof(DbParameterCollection));
            il.DeclareLocal(typeof(DbParameter));
            
            il.Emit(OpCodes.Nop);

            var getParameters = typeof(DbCommand).GetMethod("get_Parameters");
            var createParameter = typeof(DbCommand).GetMethod("CreateParameter");

            var add = typeof(DbParameterCollection).GetMethod("Add", new[] { typeof(object) });

            var setParameterName = typeof(DbParameter).GetMethod("set_ParameterName", new[] { typeof(string) });
            var setDbType = typeof(DbParameter).GetMethod("set_DbType", new[] { typeof(DbType) });
            var setValue = typeof(DbParameter).GetMethod("set_Value");

            // Get change event columns
            var columnMethods = GetChangeEventColumns()
                .Select(
                    c => new
                    {
                        Column = c,
                        // GetterMethodInfo = typeof(TEntity).GetMethod($"get_{c.PropertyName}"),
                        GetterMethodInfo = typeof(TEntity).GetProperty(c.PropertyName).GetGetMethod(),
                    });
            
            // var getStudentUniqueId = typeof(TEntity).GetMethod("get_StudentUniqueId");
            // var getAcademicSubjectDescriptor = typeof(TEntity).GetMethod("get_AcademicSubjectDescriptor");
            // var getSchoolId = typeof(TEntity).GetMethod("get_SchoolId");
            // var getBeginDate = typeof(TEntity).GetMethod("get_BeginDate");
      
            il.Emit(OpCodes.Ldarg_0); // command
            il.Emit(OpCodes.Callvirt, getParameters);
            il.Emit(OpCodes.Stloc_0); // parameters

            foreach (var columnMethod in columnMethods)
            {
                // ---------------------------------------------------------
                il.Emit(OpCodes.Ldarg_0); // command
                il.Emit(OpCodes.Callvirt, createParameter);
                il.Emit(OpCodes.Stloc_1); // p1
            
                il.Emit(OpCodes.Ldloc_1); // p1
                il.Emit(OpCodes.Ldstr, $"@{columnMethod.Column.PropertyName}");
                il.Emit(OpCodes.Callvirt, setParameterName);
                il.Emit(OpCodes.Nop);
            
                il.Emit(OpCodes.Ldloc_1); // p1
                il.Emit(OpCodes.Ldc_I4_S, (int) columnMethod.Column.DbType);
                il.Emit(OpCodes.Callvirt, setDbType);
                il.Emit(OpCodes.Nop);
            
                il.Emit(OpCodes.Ldloc_1); // p1
                il.Emit(OpCodes.Ldarg_1); // entity
                il.Emit(OpCodes.Callvirt, columnMethod.GetterMethodInfo);

                // Check for need to box the argument
                if (columnMethod.Column.DbType != DbType.String)
                {
                    il.Emit(OpCodes.Box, columnMethod.Column.DbType.ToSystemType());
                }
                
                il.Emit(OpCodes.Callvirt, setValue);
                il.Emit(OpCodes.Nop);
            
                il.Emit(OpCodes.Ldloc_0); // parameters
                il.Emit(OpCodes.Ldloc_1); // p1
                il.Emit(OpCodes.Callvirt, add);
                il.Emit(OpCodes.Pop);
            }
            
            il.Emit(OpCodes.Ret);
            
            var d = (AssignParametersDelegate) m.CreateDelegate(typeof(AssignParametersDelegate));

            return d;
        }
    }
}