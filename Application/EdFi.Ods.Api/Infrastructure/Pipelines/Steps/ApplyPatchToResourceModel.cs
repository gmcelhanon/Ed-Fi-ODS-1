// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using EdFi.Ods.Api.Infrastructure.Pipelines.Patch;
using EdFi.Ods.Common;
using EdFi.Ods.Common.Infrastructure.Pipelines;
using Microsoft.AspNetCore.JsonPatch.Adapters;
using Microsoft.AspNetCore.JsonPatch.Internal;
using Newtonsoft.Json.Serialization;

namespace EdFi.Ods.Api.Infrastructure.Pipelines.Steps
{
    public class ApplyPatchToResourceModel<TContext, TResult, TResourceModel, TEntityModel>
        : IStep<TContext, TResult>
        where TContext : PatchContext<TResourceModel, TEntityModel>
        where TResult : PatchResult<TResourceModel>
        where TEntityModel : class, IHasIdentifier, IDateVersionedEntity
        where TResourceModel : IHasETag
    {
        public Task ExecuteAsync(TContext context, TResult result, CancellationToken cancellationToken)
        {
            try
            {
                var patchDocument = context.PatchRequest.Patch;
                var collectionKeys = context.PatchRequest.CollectionKeys;

                // This step is needed because of use of result instead of context during MapEntityToResource step.
                // May want to consider consolidating the two classes into context alone.
                context.Resource = result.Resource;

                patchDocument.ApplyTo(
                    context.Resource,
                    new ObjectAdapter(
                        new DefaultContractResolver(),
                        null,
                        new EdFiListAdapterFactoryDecorator(new AdapterFactory(), collectionKeys)));

                // Set the etag value
                //result.ETag = _etagProvider.GetETag(updatedEntityResult.Entity);
            }

            catch (Exception ex)
            {
                result.Exception = ex;
            }
            
            return Task.CompletedTask;
        }
    }

    public class EdFiListAdapterFactoryDecorator : IAdapterFactory
    {
        private readonly IAdapterFactory _adapterFactory;
        private readonly IDictionary<string, IDictionary<string, object>> _collectionKeys;

        public EdFiListAdapterFactoryDecorator(IAdapterFactory adapterFactory, IDictionary<string, IDictionary<string, object>> collectionKeys)
        {
            _adapterFactory = adapterFactory;
            _collectionKeys = collectionKeys;
        }

        public IAdapter Create(object target, IContractResolver contractResolver)
        {
            if (target == null)
            {
                throw new ArgumentNullException(nameof(target));
            }

            if (contractResolver == null)
            {
                throw new ArgumentNullException(nameof(contractResolver));
            }

            if (target is IList)
            {
                return new EdFiResourceListAdapter(_collectionKeys);
            }

            return _adapterFactory.Create(target, contractResolver);
        }
    }
    
    public class EdFiResourceListAdapter : ListAdapter
    {
        private readonly IDictionary<string, IDictionary<string, object>> _resourceCollectionKeys;

        public EdFiResourceListAdapter(IDictionary<string, IDictionary<string, object>> resourceCollectionKeys)
        {
            _resourceCollectionKeys = resourceCollectionKeys;
        }
        
        protected override bool TryGetPositionInfo(
            IList list,
            string segment,
            OperationType operationType,
            out PositionInfo positionInfo,
            out string errorMessage)
        {
            // Handle key to index resolution
            if (segment.StartsWith("$"))
            {
                if (_resourceCollectionKeys.TryGetValue(segment, out var keyValues))
                {
                    int index = 0;
                    
                    foreach (object item in list)
                    {
                        var itemType = item.GetType();

                        var propertyByName = itemType.GetProperties()
                            .ToDictionary(p => p.Name, p => p, StringComparer.OrdinalIgnoreCase);

                        if (keyValues.All(kvp => kvp.Value.Equals(propertyByName[kvp.Key]?.GetValue(item))))
                        {
                            segment = index.ToString();

                            break;
                        }

                        index++;
                    }
                }
            }

            return base.TryGetPositionInfo(list, segment, operationType, out positionInfo, out errorMessage);
        }
        
        public override bool TryTraverse(
            object target,
            string segment,
            IContractResolver contractResolver,
            out object value,
            out string errorMessage)
        {
            var list = target as IList;

            // Handle key to index resolution
            if (segment.StartsWith("$"))
            {
                if (TryGetPositionInfo(list, segment, OperationType.Get, out var positionInfo, out errorMessage))
                {
                    string resolvedSegment = positionInfo.Index.ToString();

                    return base.TryTraverse(target, resolvedSegment, contractResolver, out value, out errorMessage);
                }
            }

            return base.TryTraverse(target, segment, contractResolver, out value, out errorMessage);
        }
    }
}
