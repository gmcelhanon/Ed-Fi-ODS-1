﻿// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.
 
namespace EdFi.Ods.Common.Caching
{
    public interface IDescriptorsCache
    {
        int GetId(string descriptorName, string descriptorValue);

        string GetValue(string descriptorName, int id);

        bool TryRefreshSingleDescriptorCache(string descriptorName);
    }
}
