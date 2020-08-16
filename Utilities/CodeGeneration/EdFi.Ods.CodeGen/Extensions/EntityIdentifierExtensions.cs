// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System.Linq;
using EdFi.Ods.Common.Models.Domain;

namespace EdFi.Ods.CodeGen.Extensions
{
    public static class EntityIdentifierExtensions
    {
        public static bool IsServerAssigned(this EntityIdentifier entityIdentifier)
        {
            return entityIdentifier.Properties.Any(p => p.IsServerAssigned);
        }
    }
}
