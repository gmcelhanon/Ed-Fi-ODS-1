// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading;
using System.Threading.Tasks;
using EdFi.Ods.Common.Exceptions;
using EdFi.Ods.Common.Extensions;
using EdFi.Ods.Common.Models;
using EdFi.Ods.Common.Models.Domain;
using EdFi.Ods.Common.Patch;
using EdFi.Ods.Common.Repositories;
using NHibernate;
// using FastExpressionCompiler.LightExpression;

namespace EdFi.Ods.Common.Infrastructure.Repositories
{
    public class UpsertEntity<TEntity> : NHibernateRepositoryOperationBase, IUpsertEntity<TEntity>
        where TEntity : DomainObjectBase, IHasIdentifier, IHasIdentifierSource, IDateVersionedEntity, ISynchronizable
    {
        private readonly ICreateEntity<TEntity> _createEntity;
        private readonly IGetEntityById<TEntity> _getEntityById;
        private readonly IGetEntityByKey<TEntity> _getEntityByKey;
        private readonly IUpdateEntity<TEntity> _updateEntity;

        private readonly Lazy<Action<TEntity, IDictionary<string, object>>> _mapEntityToResourceKeyValues;
        
        public UpsertEntity(
            ISessionFactory sessionFactory,
            IGetEntityById<TEntity> getEntityById,
            IGetEntityByKey<TEntity> getEntityByKey,
            ICreateEntity<TEntity> createEntity,
            IUpdateEntity<TEntity> updateEntity,
            IResourceModelProvider resourceModelProvider)
            : base(sessionFactory)
        {
            _getEntityById = getEntityById;
            _getEntityByKey = getEntityByKey;
            _createEntity = createEntity;
            _updateEntity = updateEntity;
            
            _mapEntityToResourceKeyValues = new Lazy<Action<TEntity, IDictionary<string, object>>>(
                () => CreateMapEntityToResourceKeyExpression(resourceModelProvider).Compile());
                // () => CreateMapEntityToResourceKeyExpression(resourceModelProvider).CompileFast());
        }

        public async Task<UpsertEntityResult<TEntity>> UpsertAsync(TEntity entity, bool enforceOptimisticLock, CancellationToken cancellationToken)
        {
            using (new SessionScope(SessionFactory))
            {
                var isCreated = false;
                var isModified = false;

                // Go try to get the existing entity
                TEntity persistentEntity = null;

                // Do we have an 'Id' value present?
                bool idHasValue = !entity.Id.Equals(default(Guid));

                if (idHasValue)
                {
                    // Look up by provided Id
                    persistentEntity = await _getEntityById.GetByIdAsync(entity.Id, cancellationToken);

                    // If attempt to look up by Id failed, don't allow create to proceed if Id was supplied by API client
                    if (persistentEntity == null && entity.IdSource == IdentifierSource.ClientSupplied)
                    {
                        throw new NotFoundException("Resource to update was not found.");
                    }
                }
                else
                {
                    // Get it by primary key
                    persistentEntity = await _getEntityByKey.GetByKeyAsync(entity, cancellationToken);
                }

                using var trans = Session.BeginTransaction();

                try
                {
                    // If there is no existing entity...
                    if (persistentEntity == null)
                    {
                        // Create the entity
                        await _createEntity.CreateAsync(entity, enforceOptimisticLock, cancellationToken);
                        persistentEntity = entity;
                        isCreated = true;
                    }
                    else
                    {
                        // Update the entity
                        if (enforceOptimisticLock)
                        {
                            if (!persistentEntity.LastModifiedDate.Equals(entity.LastModifiedDate))
                            {
                                throw new ConcurrencyException("Resource was modified by another consumer.");
                            }
                        }

                        // Synchronize using strongly-typed generated code
                        var patchBuilder = new EdFiApiPatchBuilder();
                        isModified = entity.Synchronize(persistentEntity, patchBuilder);

                        // Force aggregate root to be touched with an updated date if aggregate has been modified
                        if (isModified)
                        {
                            // Copy the resource key values to the patch
                            var resourceKeyValues = new Dictionary<string, object>();
                            _mapEntityToResourceKeyValues.Value(persistentEntity, resourceKeyValues);
                            patchBuilder.SetResourceKey(resourceKeyValues);

                            // Make root dirty, NHibernate will override the value during update (through a hook)
                            persistentEntity.LastModifiedDate = persistentEntity.LastModifiedDate.AddSeconds(1);

                            await _updateEntity.UpdateAsync(persistentEntity, cancellationToken, patchBuilder.ToJson());
                        }
                    }

                    await trans.CommitAsync(cancellationToken);
                }
                catch (Exception)
                {
                    await trans.RollbackAsync(cancellationToken);
                    throw;
                }

                return new UpsertEntityResult<TEntity>
                {
                    Entity = persistentEntity,
                    IsCreated = isCreated,
                    IsModified = isModified
                };
            }
        }

        private Expression<Action<TEntity, IDictionary<string, object>>> CreateMapEntityToResourceKeyExpression(
            IResourceModelProvider resourceModelProvider)
        {
            Type entityType = typeof(TEntity);

            var entityParameter = Expression.Parameter(entityType, "entity");
            var dictionaryParameter = Expression.Parameter(typeof(IDictionary<string, object>), "patchRequest");

            var resource = resourceModelProvider.GetResourceModel().GetResourceByFullName(entityType.GetFullName());
            var propertyNames = resource.AllIdentifyingProperties.Select(rp => new { rp.PropertyName, rp.JsonPropertyName });
            
            // Get the general model interface for the entity
            var modelInterface = entityType.GetInterface($"I{entityType.Name}");

            var modelVariable = Expression.Variable(modelInterface, "model");

            var mainBlock = Expression.Block(
                new[] { modelVariable },
                GetAssignmentExpressions());

            return Expression.Lambda<Action<TEntity, IDictionary<string, object>>>(mainBlock, entityParameter, dictionaryParameter);

            IEnumerable<Expression> GetAssignmentExpressions()
            {
                yield return Expression.Assign(modelVariable, Expression.Convert(entityParameter, modelInterface));

                var addMethod = typeof(IDictionary<string, object>).GetMethod("Add", new [] { typeof(string), typeof(object) });

                var modelProperties = propertyNames.Select(
                    x => new
                    {
                        JsonPropertyName = x.JsonPropertyName,
                        PropertyInfo = modelInterface.GetProperty(x.PropertyName)
                    });

                // Copy the key properties from the supplied dictionary to the entity (specification model)
                foreach (var modelProperty in modelProperties)
                {
                    yield return Expression.Call(dictionaryParameter, addMethod, 
                        Expression.Constant(modelProperty.JsonPropertyName), 
                        Expression.Convert(
                            Expression.Property(modelVariable, modelProperty.PropertyInfo),
                            typeof(object)));
                }
            }
        }
    }
}
