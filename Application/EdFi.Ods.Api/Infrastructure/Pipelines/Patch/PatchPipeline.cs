// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using EdFi.Ods.Common;
using EdFi.Ods.Common.Infrastructure.Pipelines;

namespace EdFi.Ods.Api.Infrastructure.Pipelines.Patch
{
    public class PatchPipeline<TResourceModel, TEntityModel> : PipelineBase<PatchContext<TResourceModel, TEntityModel>, PatchResult<TResourceModel>>
        where TResourceModel : IHasETag
        where TEntityModel : class, IHasIdentifier
    {
        public PatchPipeline(IStep<PatchContext<TResourceModel, TEntityModel>, PatchResult<TResourceModel>>[] steps)
            : base(steps) { }
    }
}
