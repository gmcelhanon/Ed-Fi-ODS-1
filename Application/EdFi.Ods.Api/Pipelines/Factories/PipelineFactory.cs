// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Collections.Generic;
using System.Linq;
using EdFi.Ods.Api.ChangeQueries.Pipelines.GetDeletedResource;
using EdFi.Ods.Api.Pipelines.Factories;
using EdFi.Ods.Common;
using EdFi.Ods.Common.InversionOfControl;
using EdFi.Ods.Pipelines.Common;
using EdFi.Ods.Pipelines.Delete;
using EdFi.Ods.Pipelines.Get;
using EdFi.Ods.Pipelines.GetMany;
using EdFi.Ods.Pipelines.Put;

namespace EdFi.Ods.Pipelines.Factories
{
    public class PipelineFactory : IPipelineFactory
    {
        private readonly IServiceLocator _locator;
        private readonly IDeletePipelineStepsProvider _deletePipelineStepsProvider;
        private readonly IGetBySpecificationPipelineStepsProvider _getBySpecificationPipelineStepsProvider;
        private readonly IGetPipelineStepsProvider _getPipelineStepsProvider;
        private readonly IGetDeletedResourceIdsPipelineStepsProvider _getDeletedResourceIdsPipelineStepsProvider;
        private readonly IPutPipelineStepsProvider _putPipelineStepsProvider;

        public PipelineFactory(
            IServiceLocator locator,
            IGetPipelineStepsProvider getPipelineStepsProvider,
            IGetBySpecificationPipelineStepsProvider getBySpecificationPipelineStepsProvider,
            IGetDeletedResourceIdsPipelineStepsProvider getDeletedResourceIdsPipelineStepsProvider,
            IPutPipelineStepsProvider putPipelineStepsProvider,
            IDeletePipelineStepsProvider deletePipelineStepsProvider)
        {
            _locator = locator;
            _getPipelineStepsProvider = getPipelineStepsProvider;
            _getBySpecificationPipelineStepsProvider = getBySpecificationPipelineStepsProvider;
            _getDeletedResourceIdsPipelineStepsProvider = getDeletedResourceIdsPipelineStepsProvider;
            _putPipelineStepsProvider = putPipelineStepsProvider;
            _deletePipelineStepsProvider = deletePipelineStepsProvider;
        }

        public GetPipeline<TResourceModel, TEntityModel> CreateGetPipeline<TResourceModel, TEntityModel, TSynchronizationContext>()
            where TResourceModel : IHasETag
            where TEntityModel : class
        {
            var stepTypes = _getPipelineStepsProvider.GetSteps();
            var steps = ResolvePipelineSteps<GetContext<TEntityModel>, GetResult<TResourceModel>, TResourceModel, TEntityModel, TSynchronizationContext>(stepTypes);
            return new GetPipeline<TResourceModel, TEntityModel>(steps);
        }

        public GetManyPipeline<TResourceModel, TEntityModel> CreateGetManyPipeline<TResourceModel, TEntityModel, TSynchronizationContext>()
            where TResourceModel : IHasETag
            where TEntityModel : class
        {
            var stepTypes = _getBySpecificationPipelineStepsProvider.GetSteps();

            var steps =
                ResolvePipelineSteps<GetManyContext<TResourceModel, TEntityModel>, GetManyResult<TResourceModel>, TResourceModel, TEntityModel, TSynchronizationContext>(
                    stepTypes);

            return new GetManyPipeline<TResourceModel, TEntityModel>(steps);
        }

        public GetDeletedResourcePipeline<TEntityModel> CreateGetDeletedResourcePipeline<TResourceModel, TEntityModel, TSynchronizationContext>()
            where TEntityModel : class
        {
            var stepsTypes = _getDeletedResourceIdsPipelineStepsProvider.GetSteps();
            var steps = ResolvePipelineSteps<GetDeletedResourceContext<TEntityModel>, GetDeletedResourceResult, TResourceModel, TEntityModel, TSynchronizationContext>(stepsTypes);
            return new GetDeletedResourcePipeline<TEntityModel>(steps);
        }

        public PutPipeline<TResourceModel, TEntityModel> CreatePutPipeline<TResourceModel, TEntityModel, TSynchronizationContext>()
            where TEntityModel : class, IHasIdentifier, new()
            where TResourceModel : IHasETag
        {
            var stepTypes = _putPipelineStepsProvider.GetSteps();
            var steps = ResolvePipelineSteps<PutContext<TResourceModel, TEntityModel>, PutResult, TResourceModel, TEntityModel, TSynchronizationContext>(stepTypes);
            return new PutPipeline<TResourceModel, TEntityModel>(steps);
        }

        public DeletePipeline CreateDeletePipeline<TResourceModel, TEntityModel, TSynchronizationContext>()
        {
            var stepTypes = _deletePipelineStepsProvider.GetSteps();
            var steps = ResolvePipelineSteps<DeleteContext, DeleteResult, TResourceModel, TEntityModel, TSynchronizationContext>(stepTypes);
            return new DeletePipeline(steps);
        }

        private IStep<TContext, TResult>[] ResolvePipelineSteps<TContext, TResult, TResourceModel, TEntityModel, TSynchronizationContext>(IEnumerable<Type> stepTypes)
        {
            var pipelineStepTypes = new List<IStep<TContext, TResult>>();

            foreach (var pipelineStepType in stepTypes)
            {
                Type resolutionType;

                if (pipelineStepType.IsGenericTypeDefinition)
                {
                    var typeArgsNames = pipelineStepType.GetGenericArguments()
                                                        .Select(x => x.Name);

                    var typeArgs = GetGenericTypes<TContext, TResult, TResourceModel, TEntityModel, TSynchronizationContext>(typeArgsNames);

                    resolutionType = pipelineStepType.MakeGenericType(typeArgs.ToArray());
                }
                else
                {
                    resolutionType = pipelineStepType;
                }

                pipelineStepTypes.Add((IStep<TContext, TResult>) _locator.Resolve(resolutionType));
            }

            return pipelineStepTypes.ToArray();
        }

        private IEnumerable<Type> GetGenericTypes<TContext, TResult, TResourceModel, TEntityModel, TSynchronizationContext>(IEnumerable<string> genericArgNames)
        {
            foreach (var genericArgName in genericArgNames)
            {
                switch (genericArgName)
                {
                    case "TContext":
                        yield return typeof(TContext);

                        break;

                    case "TResult":
                        yield return typeof(TResult);

                        break;

                    case "TResourceModel":
                        yield return typeof(TResourceModel);

                        break;

                    case "TEntityModel":
                        yield return typeof(TEntityModel);

                        break;

                    case "TSynchronizationContext":
                        yield return typeof(TSynchronizationContext);

                        break;
                    
                    default:

                        // Defensive programming
                        throw new Exception(string.Format("Unsupported generic type argument name '{0}'.", genericArgName));
                }
            }
        }
    }
}
