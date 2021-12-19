// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Data;
using System.Data.Common;
using System.Threading;
using System.Threading.Tasks;
using EdFi.Ods.Common;
using EdFi.Ods.Common.Infrastructure;
using EdFi.Ods.Common.Infrastructure.Database.NamingConventions;
using EdFi.Ods.Common.Models;
using EdFi.Ods.Common.Models.Domain;
using EdFi.Ods.Common.Patch;
using EdFi.Ods.Common.Repositories;
using NHibernate;

namespace EdFi.Ods.Features.ChangeEvents
{
    public class TrackedEventInsertEntityDecorator<TEntity> : TrackedEventDecoratorBase<TEntity>, ICreateEntity<TEntity>
        where TEntity : IHasIdentifier, IDateVersionedEntity, ISynchronizable
    {
        private readonly ISessionFactory _sessionFactory;
        private readonly ICreateEntity<TEntity> _decoratedInstance;
        private readonly DbProviderFactory _dbProviderFactory;
                
        public TrackedEventInsertEntityDecorator(
            ISessionFactory sessionFactory,
            ICreateEntity<TEntity> decoratedInstance,
            IDomainModelProvider domainModelProvider,
            IDatabaseNamingConvention databaseNamingConvention,
            DbProviderFactory dbProviderFactory) : base(domainModelProvider, databaseNamingConvention)
        {
            _sessionFactory = sessionFactory;
            _decoratedInstance = decoratedInstance;
            _dbProviderFactory = dbProviderFactory;
        }

        public async Task CreateAsync(TEntity entity, bool enforceOptimisticLock, CancellationToken cancellationToken)
        {
            await _decoratedInstance.CreateAsync(entity, enforceOptimisticLock, cancellationToken);
            
            using var sessionScope = (new SessionScope(_sessionFactory));

            // Initialize a new command
            var cmd = _dbProviderFactory.CreateCommand() ?? throw new Exception("Unable to create DbCommand.");
            cmd.Connection = sessionScope.Session.Connection;
            sessionScope.Session.Transaction.Enlist(cmd);
            cmd.CommandText = _insertSql.Value;
            
            // Assign the command parameters
            _assignParameters.Value(cmd, entity);

            var idParameter = cmd.CreateParameter();
            idParameter.ParameterName = "@Id";
            idParameter.DbType = DbType.Guid;
            idParameter.Value = entity.Id;
            cmd.Parameters.Add(idParameter);

            // Build a Patch for adding the item to the collection
            var patchBuilder = new EdFiApiPatchBuilder();
            patchBuilder.ItemAdded(entity.MapToResource());

            var jsonPatchParameter = cmd.CreateParameter();
            jsonPatchParameter.ParameterName = "@JsonPatch";
            jsonPatchParameter.DbType = DbType.String;
            jsonPatchParameter.Value = patchBuilder.ToJson();
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
        
        protected override string TemplateSql
        {
            get => @"
            INSERT INTO {{TrackedEventsSchema}}.{{TableName}} (
                {{#ChangeEventColumns}}New{{ColumnName}}, {{/ChangeEventColumns}}
                Id, {{#HasDiscriminator}}Discriminator, {{/HasDiscriminator}}ChangeEventId, JsonPatch)
            VALUES (
                {{#ChangeEventColumns}}@{{ColumnName}}, {{/ChangeEventColumns}}
                @Id, {{#HasDiscriminator}}@Discriminator, {{/HasDiscriminator}}(NEXT VALUE FOR {{SequenceFullName}}), @JsonPatch)";
        }
    }

    // public class TrackedEventInsertEntityDecorator<TEntity> : ICreateEntity<TEntity>
    //     where TEntity : IHasIdentifier, IDateVersionedEntity, ISynchronizable
    // {
    //     private readonly ISessionFactory _sessionFactory;
    //     private readonly ICreateEntity<TEntity> _decoratedInstance;
    //     private readonly IDatabaseNamingConvention _databaseNamingConvention;
    //     private readonly DbProviderFactory _dbProviderFactory;
    //
    //     private readonly Lazy<Entity> _entityModel;
    //     private readonly Lazy<string> _insertSql;
    //
    //     private readonly Lazy<Action<DbCommand, TEntity>> _assignParameters;
    //
    //     private const string TrackedEventsSchemaPrefix = "tracked_events_";
    //     private const string ChangeVersionSequenceFullName = "changes.ChangeVersionSequence";
    //
    //     public TrackedEventInsertEntityDecorator(
    //         ISessionFactory sessionFactory,
    //         ICreateEntity<TEntity> decoratedInstance,
    //         IDomainModelProvider domainModelProvider,
    //         IDatabaseNamingConvention databaseNamingConvention,
    //         DbProviderFactory dbProviderFactory)
    //     {
    //         _sessionFactory = sessionFactory;
    //         _decoratedInstance = decoratedInstance;
    //         _databaseNamingConvention = databaseNamingConvention;
    //         _dbProviderFactory = dbProviderFactory;
    //
    //         _entityModel = new Lazy<Entity>(
    //             () =>
    //             {
    //                 // Capture insert event
    //                 if (!domainModelProvider.GetDomainModel()
    //                     .EntityByFullName.TryGetValue(typeof(TEntity).GetFullName(), out var entity))
    //                 {
    //                     throw new Exception($"Unable to find entity '{typeof(TEntity).GetFullName()}' in the model.");
    //                 }
    //
    //                 return entity;
    //             });
    //
    //         _insertSql = new Lazy<string>(
    //             () =>
    //             {
    //                 dynamic codeGenModel = new DynamicModel();
    //
    //                 codeGenModel.ChangeEventColumns = GetChangeEventColumns();
    //                 
    //                 var entityModel = _entityModel.Value;
    //
    //                 codeGenModel.TrackedEventsSchema = _databaseNamingConvention.IdentifierName($"{TrackedEventsSchemaPrefix}{_databaseNamingConvention.Schema(entityModel)}");
    //                 codeGenModel.TableName = _databaseNamingConvention.TableName(entityModel);
    //                 codeGenModel.HasDiscriminator = entityModel.IsBase && entityModel.HasDiscriminator();
    //                 codeGenModel.SequenceFullName = ChangeVersionSequenceFullName;
    //
    //                 string sqlTemplate =
    //                     @"
    //     INSERT INTO {{TrackedEventsSchema}}.{{TableName}} (
    //         {{#ChangeEventColumns}}New{{ColumnName}}, {{/ChangeEventColumns}}
    //         Id, {{#HasDiscriminator}}Discriminator, {{/HasDiscriminator}}ChangeVersion, JsonPatch)
    //     VALUES (
    //         {{#ChangeEventColumns}}@{{ColumnName}}, {{/ChangeEventColumns}}
    //         @Id, {{#HasDiscriminator}}@Discriminator, {{/HasDiscriminator}}(NEXT VALUE FOR {{SequenceFullName}}), @JsonPatch)";
    //
    //                 string sql = RenderAsync(sqlTemplate, codeGenModel, new Dictionary<string, string>());
    //
    //                 return sql;
    //             });
    //         
    //         _assignParameters = new Lazy<Action<DbCommand, TEntity>>(
    //             () => CreateAssignParametersExpression().Compile());
    //         // () => CreateAssignParametersExpression().CompileFast());
    //
    //         string RenderAsync(string templateContent, object templateModel, IDictionary<string, string> partials)
    //         {
    //             var renderer = new StubbleBuilder()
    //                 .Configure(
    //                     settings =>
    //                     {
    //                         settings.SetMaxRecursionDepth(512);
    //                         settings.SetIgnoreCaseOnKeyLookup(true);
    //                     }
    //                 )
    //                 .Build();
    //             
    //             string renderedContent = renderer.Render(templateContent, templateModel, partials, new RenderSettings {SkipHtmlEncoding = true});
    //
    //             return renderedContent;
    //         }
    //     }
    //     
    //     private ChangeEventColumn[] GetChangeEventColumns()
    //     {
    //         var entityModel = _entityModel.Value;
    //
    //         // Get Event Key Columns
    //         return entityModel.GetChangeDataProperties()
    //             .SelectMany((p, i) => p.ExpandForApiResourceData(i, _databaseNamingConvention))
    //             .ToArray();
    //     } 
    //
    //     public async Task CreateAsync(TEntity entity, bool enforceOptimisticLock, CancellationToken cancellationToken)
    //     {
    //         await _decoratedInstance.CreateAsync(entity, enforceOptimisticLock, cancellationToken);
    //         
    //         using var sessionScope = (new SessionScope(_sessionFactory));
    //
    //         // Initialize a new command
    //         var cmd = _dbProviderFactory.CreateCommand();
    //         cmd.Connection = sessionScope.Session.Connection;
    //         sessionScope.Session.Transaction.Enlist(cmd);
    //         cmd.CommandText = _insertSql.Value;
    //         
    //         // Assign the command parameters
    //         _assignParameters.Value(cmd, entity);
    //
    //         var idParameter = cmd.CreateParameter();
    //         idParameter.ParameterName = "@Id";
    //         idParameter.DbType = DbType.Guid;
    //         idParameter.Value = entity.Id;
    //         cmd.Parameters.Add(idParameter);
    //
    //         // Build a Patch for adding the item to the collection
    //         var patchBuilder = new EdFiApiPatchBuilder();
    //         patchBuilder.ItemAdded(entity.MapToResource());
    //
    //         var jsonPatchParameter = cmd.CreateParameter();
    //         jsonPatchParameter.ParameterName = "@JsonPatch";
    //         jsonPatchParameter.DbType = DbType.String;
    //         jsonPatchParameter.Value = patchBuilder.ToJson();
    //         cmd.Parameters.Add(jsonPatchParameter);
    //
    //         if (_entityModel.Value.IsBase && _entityModel.Value.HasDiscriminator())
    //         {
    //             var discriminatorParameter = cmd.CreateParameter();
    //             discriminatorParameter.ParameterName = "@Discriminator";
    //             discriminatorParameter.DbType = DbType.String;
    //             discriminatorParameter.Value = _entityModel.Value.FullName.ToString();
    //             cmd.Parameters.Add(discriminatorParameter);
    //         }
    //         
    //         await cmd.ExecuteNonQueryAsync(cancellationToken);
    //     }
    //     
    //     private Expression<Action<DbCommand, TEntity>> CreateAssignParametersExpression()
    //     {
    //         var command = Expression.Parameter(typeof(DbCommand), "command");
    //         var entity = Expression.Parameter(typeof(TEntity), "entity");
    //
    //         var parameters = Expression.Variable(typeof(DbParameterCollection), "parameters");
    //         var parameter = Expression.Variable(typeof(DbParameter), "parameter");
    //
    //         var getParameters = typeof(DbCommand).GetProperty("Parameters");
    //         var createParameter = typeof(DbCommand).GetMethod("CreateParameter");
    //
    //         var addMethod = typeof(DbParameterCollection).GetMethod("Add", new[] { typeof(object) });
    //
    //         var parameterNameProperty = typeof(DbParameter).GetProperty("ParameterName"); //, new[] { typeof(string) });
    //         var dbTypeProperty = typeof(DbParameter).GetProperty("DbType"); //, new[] { typeof(DbType) });
    //         var valueProperty = typeof(DbParameter).GetProperty("Value");
    //
    //         var columns = GetChangeEventColumns();
    //         
    //         var mainBlock = Expression.Block(
    //             new[] { parameters, parameter },
    //             CreateBodyBlocks(columns));
    //
    //         return Expression.Lambda<Action<DbCommand, TEntity>>(mainBlock, command, entity);
    //
    //         IEnumerable<Expression> CreateBodyBlocks(ChangeEventColumn[] changeEventColumns)
    //         {
    //             yield return Expression.Assign(parameters, Expression.Property(command, getParameters));
    //
    //             foreach (var column in columns)
    //             {
    //                 yield return CreateParameterBlock(column.PropertyName, column.DbType);
    //             }
    //         }
    //
    //         Expression CreateParameterBlock(string propertyName, DbType dbType)
    //         {
    //             var property = typeof(TEntity).GetProperty(propertyName);
    //             
    //             var parameterBlock = Expression.Block(
    //                 // Create and add the parameter
    //                 Expression.Assign(parameter, Expression.Call(command, createParameter)),
    //                 Expression.Assign(Expression.Property(parameter, parameterNameProperty), Expression.Constant($"@{propertyName}", typeof(string))),
    //                 Expression.Assign(Expression.Property(parameter, dbTypeProperty), Expression.Constant(dbType, typeof(DbType))),
    //                 Expression.Assign(Expression.Property(parameter, valueProperty),  Expression.Convert(Expression.Property(entity, property), typeof(object))),
    //                 Expression.Call(parameters, addMethod, parameter)
    //             );
    //
    //             return parameterBlock;
    //         }
    //     }
    // }
}
