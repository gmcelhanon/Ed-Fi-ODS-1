// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using EdFi.Common.Security;
using EdFi.Ods.Api.Authentication;
using Newtonsoft.Json;

namespace EdFi.Ods.Features.ExternalCache.Serialization;

public class ApiClientDetailsDistributedCacheDeserializationHandler : IDistributedCacheDeserializationHandler
{
    public bool TryHandle(string key, string cachedValue, out object value)
    {
        if (key.StartsWith(ApiClientDetailsCacheKeyProvider.CacheKeyPrefix))
        {
            if (cachedValue != null)
            {
                value = JsonConvert.DeserializeObject<ApiClientDetails>(cachedValue);
            }
            else
            {
                value = null;
            }

            return true;
        }

        value = null;
        return false;
    }
}