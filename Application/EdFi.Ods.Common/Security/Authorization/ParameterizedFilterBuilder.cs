// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.
 
using System.Collections.Generic;

namespace EdFi.Ods.Common.Security.Authorization
{
    // TODO: Delete
    // public class ParameterizedFilterBuilder
    // {
    //     private readonly IDictionary<string, AuthorizationFilterDetails> _authorizationFilterByFilterName =
    //         new Dictionary<string, AuthorizationFilterDetails>();
    //     
    //     public IDictionary<string, AuthorizationFilterDetails> Value
    //     {
    //         get => _authorizationFilterByFilterName;
    //     } 
    //
    //     public FilterDescriptor Filter(string filterName)
    //     {
    //         if (!Value.ContainsKey(filterName))
    //         {
    //             Value[filterName] = new AuthorizationFilterDetails(filterName);
    //         }
    //
    //         return new FilterDescriptor(Value[filterName]);
    //     }
    // }
    //
    // public class FilterDescriptor
    // {
    //     public FilterDescriptor(AuthorizationFilterDetails filter)
    //     {
    //         Value = filter;
    //     }
    //
    //     public AuthorizationFilterDetails Value { get; }
    //
    //     public FilterDescriptor Parameter(string parameterName, object parameterValue)
    //     {
    //         Value.ParameterValues[parameterName] = parameterValue;
    //
    //         return this;
    //     }
    //
    //     public FilterDescriptor Claim(string claimEndpointName)
    //     {
    //         Value.ClaimEndpointName = claimEndpointName;
    //
    //         return this;
    //     }
    //
    //     public FilterDescriptor Subject(string subjectEndpointName)
    //     {
    //         Value.SubjectEndpointName = subjectEndpointName;
    //
    //         return this;
    //     }
    // }
}
