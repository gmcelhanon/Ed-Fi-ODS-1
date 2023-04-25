// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using EdFi.Common.Utils.Extensions;
using EdFi.Ods.Common.Context;
using EdFi.Ods.Common.Exceptions;
using EdFi.Ods.Common.Models.Domain;
using EdFi.Ods.Common.Security.Claims;
using NHibernate;
using NHibernate.Dialect.Schema;
using NHibernate.Persister.Entity;

namespace EdFi.Ods.Common.Infrastructure.Repositories
{
    public class NHibernateRepositoryDeleteOperationBase<TEntity>
        : NHibernateRepositoryOperationBase
        where TEntity : DomainObjectBase, IHasIdentifier, IDateVersionedEntity
    {
        private readonly IETagProvider _eTagProvider;
        private readonly IContextProvider<DataManagementResourceContext> _dataManagementResourceContextProvider;

        public NHibernateRepositoryDeleteOperationBase(
            ISessionFactory sessionFactory,
            IETagProvider eTagProvider,
            IContextProvider<DataManagementResourceContext> dataManagementResourceContextProvider)
            : base(sessionFactory)
        {
            _eTagProvider = eTagProvider;
            _dataManagementResourceContextProvider = dataManagementResourceContextProvider;
        }

        protected async Task DeleteAsync(TEntity persistedEntity, string etag, CancellationToken cancellationToken)
        {
            using (new SessionScope(SessionFactory))
            {
                if (persistedEntity == null)
                {
                    throw new NotFoundException("Resource to delete was not found.");
                }

                // only check last modified data
                if (!string.IsNullOrEmpty(etag))
                {
                    var lastModifiedDate = _eTagProvider.GetDateTime(etag);

                    if (!persistedEntity.LastModifiedDate.Equals(lastModifiedDate))
                    {
                        throw new ConcurrencyException("Resource was modified by another consumer.");
                    }
                }

                using (var trans = await Session.Connection.BeginTransactionAsync(cancellationToken))
                {
                    try
                    {
                        Entity entity = _dataManagementResourceContextProvider.Get().Resource.Entity;

                        await DeleteRecordForEntity(trans, entity);

                        if (entity.IsDerived)
                        {
                            await DeleteRecordForEntity(trans, entity.BaseEntity);
                        }

                        await trans.CommitAsync(cancellationToken);
                    }
                    catch (Exception)
                    {
                        await trans.RollbackAsync(cancellationToken);
                        throw;
                    }
                }
            }

            async Task DeleteRecordForEntity(DbTransaction trans, Entity entity)
            {
                var cmd = Session.Connection.CreateCommand();
                cmd.Transaction = trans;

                if (entity.IsDerived)
                {
                    var builder = new StringBuilder($"DELETE FROM {entity.FullName} WHERE ");

                    entity.Identifier.Properties.ForEach(
                        (property, i) =>
                        {
                            builder.Append($"{property.PropertyName} = @pk{i}");

                            var idParm = cmd.CreateParameter();
                            idParm.ParameterName = $"pk{i}";
                            idParm.DbType = property.PropertyType.DbType;
                            idParm.Value = persistedEntity.GetType().GetProperty(property.PropertyName).GetValue(persistedEntity);
                            cmd.Parameters.Add(idParm);
                        });

                    cmd.CommandText = builder.ToString();
                }
                else
                {
                    cmd.CommandText = $"DELETE FROM {entity.FullName} WHERE Id = @id";

                    var idParm = cmd.CreateParameter();
                    idParm.ParameterName = "id";
                    idParm.DbType = DbType.Guid;
                    idParm.Value = persistedEntity.Id;
                    cmd.Parameters.Add(idParm);
                }

                await cmd.ExecuteNonQueryAsync(cancellationToken);
            }
        }
    }
}
