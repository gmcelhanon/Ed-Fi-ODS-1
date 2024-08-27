// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System.Buffers;
using System.Collections.Generic;
using System.Linq;
using Autofac.Extras.DynamicProxy;
using EdFi.Ods.Common.Caching;
using EdFi.Ods.Common.Security.Authorization;
using EdFi.Ods.Common.Security.Claims;

namespace EdFi.Ods.Api.Security.Authorization;

[Intercept(InterceptorCacheKeys.Security)]
public interface IAuthorizationBasisMetadataSelector
{
    /// <summary>
    /// Finds the authorization metadata appropriate for the current request based on the claims, resource, action and context data (if available) in the <see cref="EdFiAuthorizationContext.Data"/>.
    /// </summary>
    AuthorizationBasisMetadata SelectAuthorizationBasisMetadata(
        string claimSetName,
        IList<string> requestResourceClaimUris,
        string requestAction);
}

public class AuthorizationBasisMetadata
{
    /// <summary>
    /// Initializes a new instance of the <see cref="AuthorizationBasisMetadata"/> class.
    /// </summary>
    public AuthorizationBasisMetadata(
        IReadOnlyList<IAuthorizationStrategy> authorizationStrategies,
        EdFiResourceClaim relevantClaim,
        string validationRuleSetName)
    {
        AuthorizationStrategies = authorizationStrategies;
        RelevantClaim = relevantClaim;
        ValidationRuleSetName = validationRuleSetName;
    }

    public IReadOnlyList<IAuthorizationStrategy> AuthorizationStrategies { get; }

    public EdFiResourceClaim RelevantClaim { get; }

    public string ValidationRuleSetName { get; }

    private ulong _hashCode;
    
    /// <summary>
    /// Gets a unique value uniquely identifying the authorization basis, incorporating the authorization strategies being applied as well
    /// as the validation rule set, if applicable. 
    /// </summary>
    public ulong HashCode
    {
        get
        {
            if (_hashCode == 0)
            {
                var hashValues = AuthorizationStrategies
                    .OrderBy(strat => strat.Name)
                    .Select(strat => XxHash3Code.Combine(strat.Name))
                    .ToList();

                if (ValidationRuleSetName != null)
                {
                    hashValues.Add(XxHash3Code.Combine(ValidationRuleSetName));
                }

                _hashCode = XxHash3Code.Combine(hashValues);
            }

            return _hashCode;
        }
    }
}
