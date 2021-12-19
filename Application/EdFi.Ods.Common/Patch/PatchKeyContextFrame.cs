// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System.Collections;

namespace EdFi.Ods.Common.Patch
{
    public class PatchKeyContextFrame : PatchContextFrame
    {
        public PatchKeyContextFrame(int previousPathLength, int index, IDictionary keyProperties)
            : base(previousPathLength)
        {
            ContextKeyIndex = index;
            ContextKey = $"${index}";
            ContextKeyProperties = keyProperties;
        }

        public int ContextKeyIndex { get; }
        public string ContextKey { get; }
        public IDictionary ContextKeyProperties{ get; }
        
        public bool ContextKeyUsed { get; set; }
    }
}
