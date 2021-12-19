// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Threading;
using System.Threading.Tasks;
using EdFi.Ods.Common.Repositories;
using NHibernate;

namespace EdFi.Ods.Common.Infrastructure.Repositories
{
    public class DeleteEntityById<TEntity> : IDeleteEntityById<TEntity>
        where TEntity : IHasIdentifier, IDateVersionedEntity
    {
        private readonly ISessionFactory _sessionFactory;
        private readonly IGetEntityById<TEntity> _getEntityById;
        private readonly IDeleteEntity<TEntity> _deleteEntity;

        public DeleteEntityById(ISessionFactory sessionFactory, IGetEntityById<TEntity> getEntityById, IDeleteEntity<TEntity> deleteEntity)
        {
            _sessionFactory = sessionFactory;
            _getEntityById = getEntityById;
            _deleteEntity = deleteEntity;
        }

        public async Task DeleteByIdAsync(Guid id, string etag, CancellationToken cancellationToken)
        {
            using (var sessionScope = new SessionScope(_sessionFactory))
            {
                // First we must load the entity (this call is also used by the authorization decorators
                // to authorize according to the value returned by the GetById method).
                var persistedEntity = await _getEntityById.GetByIdAsync(id, cancellationToken);

                using (var trans = sessionScope.Session.BeginTransaction())
                {
                    try
                    {
                        await _deleteEntity.DeleteAsync(persistedEntity, etag, cancellationToken);
                        await trans.CommitAsync(cancellationToken);
                    }
                    catch (Exception)
                    {
                        await trans.RollbackAsync(cancellationToken);
                        throw;
                    }
                }
            }
        }
    }
}
