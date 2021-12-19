// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Threading;
using System.Threading.Tasks;
using EdFi.Ods.Api.Infrastructure.Pipelines.Patch;
using EdFi.Ods.Common;
using EdFi.Ods.Common.Exceptions;
using EdFi.Ods.Common.Infrastructure.Pipelines;
using EdFi.Ods.Common.Repositories;

namespace EdFi.Ods.Api.Infrastructure.Pipelines.Steps
{
    public class ResolvePatchEntity<TContext, TResult, TResourceModel, TEntityModel>
        : IStep<TContext, TResult>
        where TEntityModel : class, IHasIdentifier, IDateVersionedEntity
        where TContext : PatchContext<TResourceModel, TEntityModel>
        where TResult : PatchResult<TResourceModel>
        where TResourceModel : IHasETag
    {
        private readonly IGetEntityById<TEntityModel> _getEntityById;
        private readonly IGetEntityByKey<TEntityModel> _getEntityByKey;

        public ResolvePatchEntity(IGetEntityById<TEntityModel> getEntityById, IGetEntityByKey<TEntityModel> getEntityByKey)
        {
            _getEntityById = getEntityById;
            _getEntityByKey = getEntityByKey;
        }
        
        public async Task ExecuteAsync(TContext context, TResult result, CancellationToken cancellationToken)
        {
            try
            {
                TEntityModel entity;

                if (context.PatchRequest.Id != default)
                {
                    // Load the entity, by id
                    entity = await _getEntityById.GetByIdAsync(context.PatchRequest.Id, cancellationToken).ConfigureAwait(false);
                }
                else
                {
                    // Load the entity, by key
                    entity = await _getEntityByKey.GetByKeyAsync(context.SpecificationModel, cancellationToken).ConfigureAwait(false);
                }

                if (entity == null)
                {
                    result.Exception = new NotFoundException("Resource item to be patched was not found.");

                    return;
                }

                context.PersistentModel = entity;
            }
            catch (Exception ex)
            {
                result.Exception = ex;
            }
        }
    }
}
