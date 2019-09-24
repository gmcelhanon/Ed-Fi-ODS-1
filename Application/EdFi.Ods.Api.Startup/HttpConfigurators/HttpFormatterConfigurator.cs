// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System.Web.Http;
using EdFi.Ods.Api.Architecture;
using EdFi.Ods.Common;
using EdFi.Ods.Common.Models;
using EdFi.Ods.Common.Profiles;

namespace EdFi.Ods.Api.Startup.HttpConfigurators
{
    public class HttpFormatterConfigurator : IHttpConfigurator
    {
        private readonly IProfileResourceModelProvider _profileResourceModelProvider;
        private readonly IProfileRequestContextProvider _profileRequestContextProvider;
        private readonly ISynchronizationContextProvider _synchronizationContextProvider;

        public HttpFormatterConfigurator(
            IProfileRequestContextProvider profileRequestContextProvider, 
            ISynchronizationContextProvider synchronizationContextProvider,
            IProfileResourceModelProvider profileResourceModelProvider)
        {
            _profileResourceModelProvider = Preconditions.ThrowIfNull(profileResourceModelProvider, nameof(profileResourceModelProvider));
            _profileRequestContextProvider = Preconditions.ThrowIfNull(profileRequestContextProvider, nameof(profileRequestContextProvider));
            _synchronizationContextProvider = Preconditions.ThrowIfNull(synchronizationContextProvider, nameof(synchronizationContextProvider));
        }
        
        public void Configure(HttpConfiguration config)
        {
            Preconditions.ThrowIfNull(config, nameof(config));

            // Add support for graphml format
            config.Formatters.Insert(0, new GraphMLMediaTypeFormatter());

            HttpConfigHelper.ConfigureJsonFormatter(
                config,
                _profileRequestContextProvider, 
                _synchronizationContextProvider,
                _profileResourceModelProvider);
        }
    }
}
