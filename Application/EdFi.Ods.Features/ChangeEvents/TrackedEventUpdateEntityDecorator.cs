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
using EdFi.Ods.Common.Repositories;
using NHibernate;

namespace EdFi.Ods.Features.ChangeEvents
{
    public class TrackedEventUpdateEntityDecorator<TEntity> : TrackedEventDecoratorBase<TEntity>, IUpdateEntity<TEntity>
        where TEntity : DomainObjectBase, IHasIdentifier, IDateVersionedEntity
    {
        private readonly ISessionFactory _sessionFactory;
        private readonly IUpdateEntity<TEntity> _decoratedInstance;
        private readonly DbProviderFactory _dbProviderFactory;
        
        public TrackedEventUpdateEntityDecorator(
            ISessionFactory sessionFactory,
            IUpdateEntity<TEntity> decoratedInstance,
            IDomainModelProvider domainModelProvider,
            IDatabaseNamingConvention databaseNamingConvention,
            DbProviderFactory dbProviderFactory) : base(domainModelProvider, databaseNamingConvention)
        {
            _sessionFactory = sessionFactory;
            _decoratedInstance = decoratedInstance;
            _dbProviderFactory = dbProviderFactory;
        }
        
        public async Task UpdateAsync(TEntity persistentEntity, CancellationToken cancellationToken, string jsonPatch)
        {
            await _decoratedInstance.UpdateAsync(persistentEntity, cancellationToken, jsonPatch);

            using var sessionScope = (new SessionScope(_sessionFactory));

            // Initialize a new command
            var cmd = _dbProviderFactory.CreateCommand() ?? throw new Exception("Unable to create DbCommand.");
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

        protected override string TemplateSql
        {
            get => @"
        INSERT INTO {{TrackedEventsSchema}}.{{TableName}} (
            {{#ChangeEventColumns}}Old{{ColumnName}}, {{/ChangeEventColumns}}
            {{#ChangeEventColumns}}New{{ColumnName}}, {{/ChangeEventColumns}}
            Id, {{#HasDiscriminator}}Discriminator, {{/HasDiscriminator}}ChangeEventId, JsonPatch)
        VALUES (
            {{#ChangeEventColumns}}@{{ColumnName}}, {{/ChangeEventColumns}}
            {{#ChangeEventColumns}}@{{ColumnName}}, {{/ChangeEventColumns}}
            @Id, {{#HasDiscriminator}}@Discriminator, {{/HasDiscriminator}}(NEXT VALUE FOR {{SequenceFullName}}), @JsonPatch)";
        }
    }
}