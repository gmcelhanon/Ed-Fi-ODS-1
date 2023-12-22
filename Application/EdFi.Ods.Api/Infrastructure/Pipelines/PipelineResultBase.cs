// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using EdFi.Ods.Api.Models;
using EdFi.Ods.Common.Repositories;

namespace EdFi.Ods.Api.Infrastructure.Pipelines
{
    public abstract class PipelineResultBase
    {
        public OperationStatus OperationStatus { get; set; }

        public EdFiProblemDetails ProblemDetails { set; get; }

        /// <summary>
        /// Gets or sets a raw exception that occurred during pipeline processing and needs to be translated to a response.
        /// </summary>
        public Exception Exception { get; set; }

        public ResultMetadata ResultMetadata { get; set; }

        // This might actually be removed from here and packed into a ProblemDetails response prior creating the result object.
        public List<ValidationResult> ValidationResults { get; set; }
    }
}
