// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.
using EdFi.Ods.Api.Caching;
using Newtonsoft.Json;

namespace EdFi.Ods.Features.ExternalCache.Serialization;

public class PersonIdentityValueMapDistributedCacheDeserializationHandler : IDistributedCacheDeserializationHandler
{
    public bool TryHandle(string key, string cachedValue, out object value)
    {
        if (key.StartsWith(PersonUniqueIdToUsiCache.CacheKeyPrefix))
        {
            if (!string.IsNullOrEmpty(cachedValue))
            {
                var identityValueMaps = JsonConvert.DeserializeObject<PersonUniqueIdToUsiCache.IdentityValueMaps>(cachedValue);

                if (identityValueMaps.UsiByUniqueId == null && identityValueMaps.UniqueIdByUsi == null)
                {
                    // initialized but not set
                    value = null;
                }
                else
                {
                    value = identityValueMaps;
                }
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