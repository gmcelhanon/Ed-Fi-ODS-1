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
    public class DeleteEntityByKey<TEntity> : IDeleteEntityByKey<TEntity>
        where TEntity : IHasIdentifier
    {
        private readonly ISessionFactory _sessionFactory;
        private readonly IGetEntityByKey<TEntity> _getEntityByKey;
        private readonly IDeleteEntity<TEntity> _deleteEntity;

        public DeleteEntityByKey(
            ISessionFactory sessionFactory,
            IGetEntityByKey<TEntity> getEntityByKey,
            IDeleteEntity<TEntity> deleteEntity)
        {
            _sessionFactory = sessionFactory;
            _getEntityByKey = getEntityByKey;
            _deleteEntity = deleteEntity;
        }

        public async Task DeleteByKeyAsync(TEntity specification, string etag, CancellationToken cancellationToken)
        {
            using (var sessionScope = new SessionScope(_sessionFactory))
            {
                // First we must load the entity
                var persistedEntity = await _getEntityByKey.GetByKeyAsync(specification, cancellationToken);

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
