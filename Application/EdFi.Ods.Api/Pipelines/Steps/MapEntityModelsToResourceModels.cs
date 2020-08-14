// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using EdFi.Ods.Api.Extensions;
using EdFi.Ods.Common;
using EdFi.Ods.Common.Models;
using EdFi.Ods.Pipelines;
using EdFi.Ods.Pipelines.Common;

namespace EdFi.Ods.Api.Pipelines.Steps
{
    public class MapEntityModelsToResourceModels<TContext, TResult, TResourceModel, TEntityModel, TSynchronizationContext>
        : IStep<TContext, TResult>
        where TContext : IHasPersistentModels<TEntityModel>
        where TResult : PipelineResultBase, IHasResources<TResourceModel>
        where TResourceModel : IHasETag //, new()
        where TEntityModel : class, IMappable
        where TSynchronizationContext : class
    {
        private readonly ISynchronizationContextProvider _synchronizationContextProvider;

        public MapEntityModelsToResourceModels(ISynchronizationContextProvider synchronizationContextProvider)
        {
            _synchronizationContextProvider = Preconditions.ThrowIfNull(synchronizationContextProvider, nameof(synchronizationContextProvider));
        }
        
        public Task ExecuteAsync(TContext context, TResult result, CancellationToken cancellationToken)
        { 
            try
            {
                // Get the root resource/entity mapping/synchronization context
                var synchronizationContext = _synchronizationContextProvider.GetSynchronizationContext<TSynchronizationContext>();
                
                // Map the persistent models to resources
                IList<TResourceModel> resources = new List<TResourceModel>();
                context.PersistentModels.MapCollectionTo(resources, synchronizationContext);

                result.Resources = resources;
            }
            catch (Exception ex)
            {
                result.Exception = ex;
            }

            return Task.CompletedTask;
        }
    }
}
