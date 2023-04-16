// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Globalization;

namespace EdFi.Ods.Features.ExternalCache.Serialization;

public class GuidDistributedCacheSerializationHandler : IDistributedCacheSerializationHandler
{
    public bool TryHandle(object value, out string serializedValue)
    {
        if (value is Guid guidValue)
        {
            serializedValue = $"{SerializationPrefixes.Guid}{guidValue.ToString("N", CultureInfo.InvariantCulture)}";
            return true;
        }

        serializedValue = null;
        return false;
    }
}