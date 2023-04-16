// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;

namespace EdFi.Ods.Features.ExternalCache.Serialization;

public class GuidDistributedCacheDeserializationHandler : IDistributedCacheDeserializationHandler
{
    public bool TryHandle(string key, string cachedValue, out object value)
    {
        if ((cachedValue?.StartsWith(SerializationPrefixes.Guid, StringComparison.InvariantCulture) ?? false) 
            && Guid.TryParse(cachedValue[SerializationPrefixes.Guid.Length..], out Guid guidValue))
        {
            value = guidValue;
            return true;
        }

        value = null;
        return false;
    }
}