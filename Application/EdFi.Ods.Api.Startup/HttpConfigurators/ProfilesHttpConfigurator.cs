// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System.Linq;
using System.Net.Http.Formatting;
using System.Web.Http;
using EdFi.Ods.Api.Architecture;
using EdFi.Ods.Api.Services.Filters;
using EdFi.Ods.Common;
using EdFi.Ods.Common.Metadata;
using EdFi.Ods.Common.Models;
using EdFi.Ods.Common.Profiles;
using EdFi.Ods.Common.Security;

namespace EdFi.Ods.Api.Startup.HttpConfigurators
{
    public class ProfilesHttpConfigurator : IHttpConfigurator
    {
        private readonly IProfileResourceModelProvider _profileResourceModelProvider;
        private readonly ISynchronizationContextProvider _synchronizationContextProvider;
        private readonly IApiKeyContextProvider _apiKeyContextProvider;
        private readonly IProfileResourceNamesProvider _profileResourceNamesProvider;
        private readonly IHttpRouteDataProvider _httpRouteDataProvider;
        private readonly IProfileRequestContextProvider _profileRequestContextProvider;

        public ProfilesHttpConfigurator(IApiKeyContextProvider apiKeyContextProvider,
            IProfileResourceNamesProvider profileResourceNamesProvider,
            // SPIKE NOTE: These dependencies were injected here so they could be provided to the controller selector,
            // which was removed in the interim from when the spike was done to current development. This needs clean up.
            IHttpRouteDataProvider httpRouteDataProvider,
            IProfileRequestContextProvider profileRequestContextProvider,
            ISynchronizationContextProvider synchronizationContextProvider,
            IProfileResourceModelProvider profileResourceModelProvider)
        {
            _profileResourceModelProvider = Preconditions.ThrowIfNull(profileResourceModelProvider, nameof(profileResourceModelProvider));
            _apiKeyContextProvider = Preconditions.ThrowIfNull(apiKeyContextProvider, nameof(apiKeyContextProvider));

            _profileResourceNamesProvider = Preconditions.ThrowIfNull(
                profileResourceNamesProvider, nameof(profileResourceNamesProvider));

            _profileRequestContextProvider = Preconditions.ThrowIfNull(profileRequestContextProvider, nameof(profileRequestContextProvider));
            _synchronizationContextProvider = Preconditions.ThrowIfNull(synchronizationContextProvider, nameof(synchronizationContextProvider));

            _httpRouteDataProvider = Preconditions.ThrowIfNull(httpRouteDataProvider, nameof(httpRouteDataProvider));
        }

        public void Configure(HttpConfiguration config)
        {
            Preconditions.ThrowIfNull(config, nameof(config));

            ConfigureProfilesJsonSerializer(config);
            ConfigureProfilesAuthorizationFilter(config);

            HttpConfigHelper.ConfigureJsonFormatter(
                config, 
                _profileRequestContextProvider, 
                _synchronizationContextProvider,
                _profileResourceModelProvider);
        }


        private void ConfigureProfilesJsonSerializer(HttpConfiguration config)
        {
            // Replace existing JSON formatter to be profiles-aware
            var existingJsonFormatter = config.Formatters.SingleOrDefault(f => f is JsonMediaTypeFormatter);

            // Remove the original one
            if (existingJsonFormatter != null)
            {
                config.Formatters.Remove(existingJsonFormatter);
            }

            // Add our customized json formatter, supporting dynamic addition of media types for deserializing messages
            config.Formatters.Insert(0, new ProfilesContentTypeAwareJsonMediaTypeFormatter());
        }

        private void ConfigureProfilesAuthorizationFilter(HttpConfiguration config)
        {
            config.Filters.Add(new ProfilesAuthorizationFilter(_apiKeyContextProvider, _profileResourceNamesProvider));
        }
    }
}
