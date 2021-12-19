// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using EdFi.Ods.Api.Infrastructure.Pipelines.Steps;
using EdFi.Ods.Common.Infrastructure.Pipelines;

namespace EdFi.Ods.Api.Infrastructure.Pipelines.Factories
{
    /// <summary>
    /// Provides the core Ed-Fi ODS API steps for "GetById" access.
    /// </summary>
    public class GetPipelineStepsProvider : IGetPipelineStepsProvider
    {
        /// <summary>
        /// Provides the core Ed-Fi ODS API steps for "GetById" access.
        /// </summary>
        public Type[] GetSteps()
        {
            return new[]
                   {
                       typeof(GetEntityModelById<,,,>), typeof(DetectUnmodifiedEntityModel<,,,>), typeof(MapEntityModelToResourceModel<,,,>)
                   };
        }
    }

    /// <summary>
    /// Provides the core Ed-Fi ODS API steps for "GetBySpecification" access.
    /// </summary>
    public class GetBySpecificationPipelineStepsProvider : IGetBySpecificationPipelineStepsProvider
    {
        public Type[] GetSteps()
        {
            return new[]
                   {
                       typeof(MapResourceModelToEntityModel<,,,>),
                       typeof(GetEntityModelsBySpecification<,,,>),
                       typeof(MapEntityModelsToResourceModels<,,,>)
            };
        }
    }

    /// <summary>
    /// Provides the core Ed-Fi ODS API steps for "GetTrackedDelete" access.
    /// </summary>
    public class GetDeletedResourceIdsPipelineStepsProvider : IGetDeletedResourceIdsPipelineStepsProvider
    {
        public Type[] GetSteps()
        {
            return new[]
            {
                typeof(GetDeletedResourceModelByIds<,,>),
                   };
        }
    }

    /// <summary>
    /// Provides the core Ed-Fi ODS API steps for "Upsert" persistence.
    /// </summary>
    public class PutPipelineStepsProvider : IPutPipelineStepsProvider
    {
        public virtual Type[] GetSteps()
        {
            return new[]
                   {
                       typeof(ValidateResourceModel<,,,>), typeof(MapResourceModelToEntityModel<,,,>), typeof(PersistEntityModel<,,,>)
                   };
        }
    }
    
    /// <summary>
    /// Provides the core Ed-Fi ODS API steps for "patch" persistence.
    /// </summary>
    public class PatchPipelineStepsProvider : IPatchPipelineStepsProvider
    {
        public virtual Type[] GetSteps()
        {
            return new[]
                   {
                       // Validate the patch (e.g. id vs. key)
                       // typeof(ValidatePatch<,,,>),
                       
                       // Copy the patch resource key values to the specification entity
                       typeof(MapPatchKeyToEntitySpecificationModel<,,,>),
                       
                       // Use specification entity to get the persistent entity
                       typeof(ResolvePatchEntity<,,,>),
                       
                       // Map the existing persistent entity back to a canonical resource model
                       // TODO: For Profiles, this needs to be the *writable* model, not the readable one
                       typeof(MapEntityModelToResourceModel<,,,>),
                       
                       // Apply the patch document to the canonical resource model
                       typeof(ApplyPatchToResourceModel<,,,>),

                       // Repeat the Put pipeline steps
                       typeof(ValidateResourceModel<,,,>), 
                       typeof(MapResourceModelToEntityModel<,,,>), 
                       typeof(PersistEntityModel<,,,>)
                   };
        }
    }

    /// <summary>
    /// Provides the core Ed-Fi ODS API steps for "Delete" persistence.
    /// </summary>
    public class DeletePipelineStepsProvider : IDeletePipelineStepsProvider
    {
        public Type[] GetSteps()
        {
            return new[]
                   {
                       typeof(DeleteEntityModel<,,,>)
                   };
        }
    }
}
