// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using EdFi.Ods.Common.Dependencies;
using EdFi.Ods.Common.Models;
using EdFi.Ods.Common.Models.Domain;
using EdFi.Ods.Common.Repositories;
using NHibernate;

namespace EdFi.Ods.Common.Infrastructure.Repositories
{
    public class UpdateEntity<TEntity> : ValidatingNHibernateRepositoryOperationBase, IUpdateEntity<TEntity>
        where TEntity : DomainObjectBase, IHasIdentifier, IDateVersionedEntity
    {
        private readonly IDomainModelProvider _domainModelProvider;

        public UpdateEntity(ISessionFactory sessionFactory, IEnumerable<IEntityValidator> validators, IDomainModelProvider domainModelProvider)
            : base(sessionFactory, validators)
        {
            _domainModelProvider = domainModelProvider;
        }

        public async Task UpdateAsync(TEntity persistentEntity, CancellationToken cancellationToken, string jsonPatch)
        {
            using (new SessionScope(SessionFactory))
            {
                ValidateEntity(persistentEntity);

                using (var trans = Session.BeginTransaction())
                {
                    try
                    {
                        await Session.UpdateAsync(persistentEntity, cancellationToken);
                        
                        // Capture update event
                        
                    }
                    catch (Exception)
                    {
                        await trans.RollbackAsync(cancellationToken);
                        throw;
                    }
                    finally
                    {
                        if (!trans.WasRolledBack)
                        {
                            await trans.CommitAsync(cancellationToken);
                        }
                    }
                }
            }
        }
    }
}
