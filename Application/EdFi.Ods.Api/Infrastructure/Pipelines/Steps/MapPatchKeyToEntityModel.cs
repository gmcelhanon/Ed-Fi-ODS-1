// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;

using System.Linq.Expressions;
using System.Threading;
using System.Threading.Tasks;
using EdFi.Ods.Api.Infrastructure.Pipelines.Patch;
using EdFi.Ods.Api.Models;
using EdFi.Ods.Common;
using EdFi.Ods.Common.Exceptions;
using EdFi.Ods.Common.Extensions;
using EdFi.Ods.Common.Infrastructure.Pipelines;
using EdFi.Ods.Common.Models;
// using Expression = System.Linq.Expressions.Expression;
// using FastExpressionCompiler.LightExpression;

namespace EdFi.Ods.Api.Infrastructure.Pipelines.Steps
{
    public class MapPatchKeyToEntitySpecificationModel<TContext, TResult, TResourceModel, TEntityModel> : IStep<TContext, TResult>
        where TContext : PatchContext<TResourceModel, TEntityModel> //IHasPersistentModel<TEntityModel>, IHasResource<TResourceModel>
        where TResult : PipelineResultBase
        where TResourceModel : class, IMappable, IHasETag
        where TEntityModel : class, IHasIdentifier, new()
    {
        private readonly Lazy<Action<EdFiJsonPatchRequest, TEntityModel>> _mapPatchResourceKeyToEntity;

        public MapPatchKeyToEntitySpecificationModel(IResourceModelProvider resourceModelProvider)
        {
            _mapPatchResourceKeyToEntity = new Lazy<Action<EdFiJsonPatchRequest, TEntityModel>>(
                () => CreateMapPatchResourceKeyToEntityExpression(resourceModelProvider).Compile());
                // () => CreateMapPatchResourceKeyToEntityExpression(resourceModelProvider).CompileFast());
        }
        
        public Task ExecuteAsync(TContext context, TResult result, CancellationToken cancellationToken)
        {
            try
            {
                if (context.PatchRequest == default(EdFiJsonPatchRequest))
                {
                    return Task.CompletedTask;
                }

                var entity = new TEntityModel();
                _mapPatchResourceKeyToEntity.Value(context.PatchRequest, entity);
                context.SpecificationModel = entity;
            }
            catch (Exception ex)
            {
                result.Exception = ex;
            }

            return Task.CompletedTask;
        }

        private Expression<Action<EdFiJsonPatchRequest, TEntityModel>> CreateMapPatchResourceKeyToEntityExpression(IResourceModelProvider resourceModelProvider)
        {
            Type entityType = typeof(TEntityModel);

            var patchRequestParameter = Expression.Parameter(typeof(EdFiJsonPatchRequest), "patchRequest");
            var entityParameter = Expression.Parameter(entityType, "entity");
            
            var resource = resourceModelProvider.GetResourceModel().GetResourceByFullName(entityType.GetFullName());
            var propertyNames = resource.AllIdentifyingProperties.Select(rp => new { rp.PropertyName, rp.JsonPropertyName });
            
            // Get the general model interface for the entity
            var modelInterface = entityType.GetInterface($"I{entityType.Name}");
            var keyValuesProperty = typeof(EdFiJsonPatchRequest).GetProperty("ResourceKey");

            // Define variables
            var modelVariable = Expression.Variable(modelInterface, "model");
            var keyDictionaryVariable = Expression.Variable(typeof(IDictionary<string, object>), "keyDictionary");
            var valueVariable = Expression.Variable(typeof(object), "value");

            var mainBlock = Expression.Block(
                new[]
                {
                    modelVariable,
                    keyDictionaryVariable,
                    valueVariable
                },
                GetAssignmentExpressions());

            return Expression.Lambda<Action<EdFiJsonPatchRequest, TEntityModel>>(mainBlock, patchRequestParameter, entityParameter);
            
            IEnumerable<Expression> GetAssignmentExpressions()
            {
                yield return Expression.Assign(modelVariable, Expression.Convert(entityParameter, modelInterface));

                yield return Expression.Assign(
                    keyDictionaryVariable,
                    Expression.Property(patchRequestParameter, keyValuesProperty));
                
                var tryGetValueMethod = typeof(IDictionary<string, object>).GetMethod("TryGetValue");
                var containsKeyMethod = typeof(IDictionary<string, object>).GetMethod("ContainsKey");
                var getItemMethod = typeof(IDictionary<string, object>).GetMethod("get_Item");

                // IDictionary<string, object> x; x.
                
                var modelProperties = propertyNames.Select(
                    x => new
                    {
                        JsonPropertyName = x.JsonPropertyName,
                        PropertyInfo = modelInterface.GetProperty(x.PropertyName)
                    });

                // Copy the key properties from the supplied dictionary to the entity (specification model)
                foreach (var modelProperty in modelProperties)
                {
                    yield return 
                        Expression.IfThenElse(
                            // If
                            Expression.Call(keyDictionaryVariable, containsKeyMethod, Expression.Constant(modelProperty.JsonPropertyName)),
                            // Expression.Call(keyDictionaryVariable, tryGetValueMethod, Expression.Constant(modelProperty.JsonPropertyName), Expression. valueVariable),
                            // Then
                            Expression.Assign(
                                Expression.Property(modelVariable, modelProperty.PropertyInfo),
                                GetConversionExpression(
                                    Expression.Call(keyDictionaryVariable, getItemMethod, Expression.Constant(modelProperty.JsonPropertyName)),
                                    modelProperty.PropertyInfo.PropertyType)),
                                // GetConversionExpression(valueVariable, modelProperty.PropertyInfo.PropertyType)),
                                // Expression.Call(ConvertReflectionHelper.ConvertMethodsByType.Value[modelProperty.PropertyInfo.PropertyType], valueVariable)),
                                // Expression.Convert(valueVariable, modelProperty.PropertyInfo.PropertyType)),
                            // Else
                            Expression.Throw(Expression.Constant(new BadRequestException($"Expected resource key value for '{modelProperty.JsonPropertyName}' was not found.")))
                            );
                }

                Expression GetConversionExpression(Expression valueExpression, Type targetType)
                {
                    if (targetType == typeof(Int32))
                    {
                        return Expression.Call(typeof(Convert).GetMethod("ToInt32", new Type[] { typeof(object) }), valueExpression);
                    }
                    
                    return Expression.Convert(valueExpression, targetType);
                }
            }
        }
    }

    public static class ConvertReflectionHelper
    {
        public static Lazy<IDictionary<Type, MethodInfo>> ConvertMethodsByType = new Lazy<IDictionary<Type, MethodInfo>>(()
            => typeof(Convert).GetMethods()
                .Select(m => new { MethodInfo = m, Parameters = m.GetParameters() })
                .Where(x => 
                    x.MethodInfo.Name == $"To{x.MethodInfo.ReturnType.Name}" 
                    && x.Parameters.Length == 1
                    && x.Parameters.Single().ParameterType == typeof(object))
                .ToDictionary(m => m.MethodInfo.ReturnType, m => m.MethodInfo));
    }
}
