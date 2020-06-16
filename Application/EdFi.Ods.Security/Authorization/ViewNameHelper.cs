// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;

namespace EdFi.Ods.Security.Authorization
{
    public static class ViewNameHelper
    {
        public static string GetAuthorizationViewName(string endpoint1, string endpoint2, string authorizationPathModifier)
        {
            if (string.Compare(endpoint1, endpoint2, StringComparison.InvariantCultureIgnoreCase) < 0)
            {
                return $"{endpoint1}To{endpoint2}{authorizationPathModifier}";
            }

            return $"{endpoint2}To{endpoint1}{authorizationPathModifier}";
        }
    }
}
