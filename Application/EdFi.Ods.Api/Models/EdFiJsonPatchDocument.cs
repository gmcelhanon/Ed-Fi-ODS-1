// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Collections.Generic;
using Microsoft.AspNetCore.JsonPatch;
using Newtonsoft.Json;

namespace EdFi.Ods.Api.Models
{
    public class EdFiJsonPatchRequest : EdFiJsonPatchDocument
    {
        public Guid Id { get; set; }
        
        public string ETag { get; set; }
    }

    public class EdFiJsonPatchDocument
    {
        [JsonProperty("resourceKey")]
        public IDictionary<string, object> ResourceKey { get; set; }

        [JsonProperty("patch")]
        public JsonPatchDocument Patch { get; set; }

        [JsonProperty("collectionKeys")]
        public IDictionary<string, IDictionary<string, object>> CollectionKeys { get; set; }
    }
}
