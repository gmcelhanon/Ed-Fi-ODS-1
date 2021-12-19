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
    public class TrackedEventDeleteEntityDecorator<TEntity> : TrackedEventDecoratorBase<TEntity>, IDeleteEntity<TEntity>
        where TEntity : IHasIdentifier, IDateVersionedEntity, IHasPrimaryKeyValues
    {
        private readonly ISessionFactory _sessionFactory;
        private readonly IDeleteEntity<TEntity> _decoratedInstance;
        private readonly DbProviderFactory _dbProviderFactory;
                
        public TrackedEventDeleteEntityDecorator(
            ISessionFactory sessionFactory,
            IDeleteEntity<TEntity> decoratedInstance,
            IDomainModelProvider domainModelProvider,
            IDatabaseNamingConvention databaseNamingConvention,
            DbProviderFactory dbProviderFactory) : base(domainModelProvider, databaseNamingConvention)
        {
            _sessionFactory = sessionFactory;
            _decoratedInstance = decoratedInstance;
            _dbProviderFactory = dbProviderFactory;
        }

        public async Task DeleteAsync(TEntity entity, string etag, CancellationToken cancellationToken)
        {
            await _decoratedInstance.DeleteAsync(entity, etag, cancellationToken);
            
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

            // Build a Patch for removing the item from the collection
            var patchBuilder = new EdFiApiPatchBuilder();
            patchBuilder.ItemRemoved(entity.GetResourceKeyValues());

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
                {{#ChangeEventColumns}}Old{{ColumnName}}, {{/ChangeEventColumns}}
                Id, {{#HasDiscriminator}}Discriminator, {{/HasDiscriminator}}ChangeEventId, JsonPatch)
            VALUES (
                {{#ChangeEventColumns}}@{{ColumnName}}, {{/ChangeEventColumns}}
                @Id, {{#HasDiscriminator}}@Discriminator, {{/HasDiscriminator}}(NEXT VALUE FOR {{SequenceFullName}}), @JsonPatch)";
        }
    }
}
