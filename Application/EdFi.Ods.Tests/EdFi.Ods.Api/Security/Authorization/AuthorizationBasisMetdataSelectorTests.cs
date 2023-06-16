// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Collections.Generic;
using System.Security.Claims;
using EdFi.Ods.Api.Security.Authorization;
using EdFi.Ods.Common.Models.Resource;
using EdFi.Ods.Common.Security;
using EdFi.Ods.Common.Security.Authorization;
using EdFi.Ods.Common.Security.Claims;
using EdFi.Security.DataAccess.Repositories;
using FakeItEasy;
using Newtonsoft.Json;
using NUnit.Framework;
using Shouldly;
using Action = EdFi.Security.DataAccess.Models.Action;

namespace EdFi.Ods.Tests.EdFi.Ods.Api.Security.Authorization;

public class AuthorizationBasisMetdataSelectorTests
{
    public enum Actions
    {
        None,
        Create,
        Read,
        Update,
        Delete,
        ReadChanges
    }
    
    public class Fake1AuthorizationStrategy : IAuthorizationStrategy
    {
        public AuthorizationStrategyFiltering GetAuthorizationStrategyFiltering(
            IEnumerable<Claim> relevantClaims,
            EdFiAuthorizationContext authorizationContext)
            => new();
    }

    public class Fake2AuthorizationStrategy : IAuthorizationStrategy
    {
        public AuthorizationStrategyFiltering GetAuthorizationStrategyFiltering(
            IEnumerable<Claim> relevantClaims,
            EdFiAuthorizationContext authorizationContext)
            => new();
    }

    [TestFixture]
    public class AuthorizationBasisMetadataSelectorTests
    {
        private IResourceAuthorizationMetadataProvider _resourceAuthorizationMetadataProvider;
        private ISecurityRepository _securityRepository;
        private IAuthorizationStrategy[] _suppliedAuthorizationStrategies;
        private AuthorizationBasisMetadataSelector _authorizationBasisMetadataSelector;
        
        private readonly Fake1AuthorizationStrategy _fake1AuthorizationStrategy = new();
        private readonly Fake2AuthorizationStrategy _fake2AuthorizationStrategy = new();
        private ApiKeyContext _suppliedApiKeyContext;

        private const string SuppliedClaimSetName = "ApiClientClaimSet";

        [SetUp]
        public void SetUp()
        {
            _resourceAuthorizationMetadataProvider = A.Fake<IResourceAuthorizationMetadataProvider>();
            _securityRepository = A.Fake<ISecurityRepository>();

            A.CallTo(() => _securityRepository.GetActionByName("Create"))
                .Returns(new Action()
                {
                    ActionName = "Create",
                    ActionUri = "createUri"
                });
            A.CallTo(() => _securityRepository.GetActionByName("Read"))
                .Returns(new Action()
                {
                    ActionName = "Read",
                    ActionUri = "readUri"
                });
            A.CallTo(() => _securityRepository.GetActionByName("Update"))
                .Returns(new Action()
                {
                    ActionName = "Update",
                    ActionUri = "updateUri"
                });
            A.CallTo(() => _securityRepository.GetActionByName("Delete"))
                .Returns(new Action()
                {
                    ActionName = "Delete",
                    ActionUri = "deleteUri"
                });
            A.CallTo(() => _securityRepository.GetActionByName("ReadChanges"))
                .Returns(new Action()
                {
                    ActionName = "ReadChanges",
                    ActionUri = "readChangesUri"
                });
            
            _suppliedAuthorizationStrategies = new IAuthorizationStrategy[]
            {
                _fake1AuthorizationStrategy, 
                _fake2AuthorizationStrategy
            };

            _suppliedApiKeyContext = new ApiKeyContext("API_KEY",
                SuppliedClaimSetName,
                Array.Empty<int>(),
                Array.Empty<string>(),
                Array.Empty<string>(),
                null,
                null,
                Array.Empty<short>(),
                Array.Empty<int>(),
                99);

            _authorizationBasisMetadataSelector = new AuthorizationBasisMetadataSelector(
                _resourceAuthorizationMetadataProvider,
                _securityRepository,
                _suppliedAuthorizationStrategies);
        }

        private static IEnumerable<object[]> GetActionScenarios()
        {
            // Request actions to enumerate
            (string actionUri, Actions action, int bitValue)[] actionDetails = {
                ("createUri", Actions.Create, (int) Math.Pow(2, 0)),
                ("readUri", Actions.Read, (int) Math.Pow(2, 1)),
                ("updateUri", Actions.Update, (int) Math.Pow(2, 2)),
                ("deleteUri", Actions.Delete, (int) Math.Pow(2, 3)),
                ("readChangesUri", Actions.ReadChanges, (int) Math.Pow(2, 4)),
            };
            
            for (int requestActionIndex = 0; requestActionIndex < actionDetails.Length; requestActionIndex++)
            {
                for (int i = 0; i < Math.Pow(2, actionDetails.Length); i++)
                {
                    yield return new object[]
                    {
                        actionDetails[requestActionIndex].actionUri, 
                        (i & actionDetails[0].bitValue) != 0 ? actionDetails[0].action : Actions.None,
                        (i & actionDetails[1].bitValue) != 0 ? actionDetails[1].action : Actions.None,
                        (i & actionDetails[2].bitValue) != 0 ? actionDetails[2].action : Actions.None, 
                        (i & actionDetails[3].bitValue) != 0 ? actionDetails[3].action : Actions.None,
                        (i & actionDetails[4].bitValue) != 0 ? actionDetails[4].action : Actions.None, 
                        (i & (int) Math.Pow(2, requestActionIndex)) != 0
                    };
                }
            }
        }
        
        [TestCaseSource("GetActionScenarios")]
        public void SelectAuthorizationBasisMetadata_ClaimAction_MatchingSucceeds_OtherwiseException(
            string requestActionUri,
            Actions hasCreate,
            Actions hasRead,
            Actions hasUpdate,
            Actions hasDelete,
            Actions hasReadChanges,
            bool expectSuccess)
        {
            var claimsIdentity = new ClaimsIdentity(new[]
            {
                new Claim(EdFiOdsApiClaimTypes.ClaimSetName, SuppliedClaimSetName),
                new Claim("resourceClaimUri1", ActionsJson(read: true, update: true), "application/json"),
                new Claim("resourceClaimUri2", ActionsJson(
                    create: hasCreate == Actions.Create, 
                    read: hasRead == Actions.Read, 
                    update: hasUpdate == Actions.Update, 
                    delete: hasDelete == Actions.Delete, 
                    readChanges: hasReadChanges == Actions.ReadChanges), 
                    "application/json"),
            });
            
            var claimsPrincipal = new ClaimsPrincipal(claimsIdentity);
            
            // Arrange
            var suppliedAuthorizationMetadata = new List<ResourceClaimAuthorizationMetadata>
            {
                new()
                {
                    ClaimName = "resourceClaimUri2",
                    AuthorizationStrategies = new List<string> { "fake2" }
                }
            };

            A.CallTo(() =>  
                    _resourceAuthorizationMetadataProvider.GetResourceClaimAuthorizationMetadata(
                            "resourceClaimUri2", requestActionUri))
                .Returns(suppliedAuthorizationMetadata);

            // Act
            var authorizationContext = new EdFiAuthorizationContext(
                _suppliedApiKeyContext,
                claimsPrincipal,
                new Resource("Ignored"),
                new[]
                {
                    "resourceClaimUri1",
                    "resourceClaimUri2",
                },
                requestActionUri,
                new object());

            // Assert

            if (expectSuccess)
            {
                var result = _authorizationBasisMetadataSelector.SelectAuthorizationBasisMetadata(authorizationContext);

                result.ShouldNotBeNull();
                result.AuthorizationStrategies.ShouldNotBeNull();
                result.AuthorizationStrategies.ShouldContain(_fake2AuthorizationStrategy);
                result.RelevantClaim.Type.ShouldBe("resourceClaimUri2");
                result.RelevantClaim.ValueType.ShouldBe("application/json");
                result.RelevantClaim.Value.ShouldContain(requestActionUri);
            }
            else
            {
                Should.Throw<EdFiSecurityException>(() => _authorizationBasisMetadataSelector.SelectAuthorizationBasisMetadata(authorizationContext))
                    .Message.ShouldBe($"Access to the resource could not be authorized for the requested action '{requestActionUri}'.");
            }
        }

        private static string ActionsJson(bool create = false, bool read = false, bool update = false, bool delete = false, bool readChanges = false)
        {
            var resourceActions = new List<ResourceAction>();

            if (create)
            {
                resourceActions.Add(new ResourceAction("createUri"));
            }
            
            if (read)
            {
                resourceActions.Add(new ResourceAction("readUri"));
            }
            
            if (update)
            {
                resourceActions.Add(new ResourceAction("updateUri"));
            }
            
            if (delete)
            {
                resourceActions.Add(new ResourceAction("deleteUri"));
            }
            
            if (readChanges)
            {
                resourceActions.Add(new ResourceAction("readChangesUri"));
            }
            
            return JsonConvert.SerializeObject(
                new EdFiResourceClaimValue()
                {
                    Actions = resourceActions.ToArray()
                });
        }
    }
}