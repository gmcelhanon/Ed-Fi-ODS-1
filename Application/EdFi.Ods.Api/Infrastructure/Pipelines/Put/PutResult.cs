// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using EdFi.Ods.Common.Infrastructure.Pipelines;

namespace EdFi.Ods.Api.Infrastructure.Pipelines.Put
{
    public class PutResult : PipelineResultBase, IHasResourceChangeDetails
    {
        /// <summary>
        /// Gets or sets the new ETag value for the resource.
        /// </summary>
        public string ETag { get; set; }

        /// <summary>
        /// Gets or sets the identifier of the resource that was created/updated.
        /// </summary>
        public Guid? ResourceId { get; set; }
    }
}
