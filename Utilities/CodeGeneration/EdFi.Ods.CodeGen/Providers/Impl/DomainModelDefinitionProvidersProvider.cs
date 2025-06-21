// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Collections.Generic;
using System.IO;
using EdFi.Ods.Common.Models;

namespace EdFi.Ods.CodeGen.Providers.Impl
{
    public class DomainModelDefinitionProvidersProvider
        : MetadataProvidersFactoryBase<IDomainModelDefinitionsProvider>, IDomainModelDefinitionsProviderProvider
    {
        private readonly Lazy<Dictionary<string, IDomainModelDefinitionsProvider>> _domainModelDefinitionProvidersByProjectName;

        public DomainModelDefinitionProvidersProvider(
            ICodeRepositoryProvider codeRepositoryProvider,
            IExtensionPluginsProvider extensionPluginsProviderProvider,
            IExtensionVersionsPathProvider extensionVersionsPathProvider,
            IStandardVersionPathProvider standardVersionPathProvider)
            : base(codeRepositoryProvider, extensionPluginsProviderProvider, extensionVersionsPathProvider, standardVersionPathProvider)
        {
            _domainModelDefinitionProvidersByProjectName =
                new Lazy<Dictionary<string, IDomainModelDefinitionsProvider>>(CreateMetadataProviderByProjectName);
        }

        protected override string StandardMetadataFileRelativePath
        {
            get => Path.Combine("Artifacts", "Metadata", "ApiModel.json");
        }

        protected override string ExtensionMetadataFileRelativePath
        {
            get => Path.Combine("Artifacts", "Metadata", "ApiModel-EXTENSION.json");
        }

        protected override IDomainModelDefinitionsProvider CreateProviderForMetadataFile(string metadataFilePath)
            => new DomainModelDefinitionsJsonFileSystemProvider(metadataFilePath);

        /// <summary>
        /// Discover and instantiate all IDomainModelDefinitionsProviders in the solution
        /// Associate each provider with corresponding project type.
        /// </summary>
        /// <returns>An enumerable of IDomainModelDefinitionsProvider</returns>
        public IEnumerable<IDomainModelDefinitionsProvider> DomainModelDefinitionProviders()
        {
            return _domainModelDefinitionProvidersByProjectName.Value.Values;
        }

        public IDictionary<string, IDomainModelDefinitionsProvider> DomainModelDefinitionsProvidersByProjectName()
        {
            return _domainModelDefinitionProvidersByProjectName.Value;
        }
    }
}
