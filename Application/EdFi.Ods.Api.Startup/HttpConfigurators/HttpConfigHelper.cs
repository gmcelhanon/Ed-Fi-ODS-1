// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Headers;
using System.Reflection;
using System.Web.Http;
using EdFi.Ods.Api.Services;
using EdFi.Ods.Common;
using EdFi.Ods.Common.Extensions;
using EdFi.Ods.Common.Models;
using EdFi.Ods.Common.Models.Domain;
using EdFi.Ods.Common.Profiles;
using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;

namespace EdFi.Ods.Api.Startup.HttpConfigurators
{
    public static class HttpConfigHelper
    {
        public static void ConfigureJsonFormatter(HttpConfiguration config,
            IProfileRequestContextProvider profileRequestContextProvider,
            ISynchronizationContextProvider synchronizationContextProvider,
            IProfileResourceModelProvider profileResourceModelProvider)
        {
            config.Formatters.JsonFormatter.SupportedMediaTypes.Add(new MediaTypeHeaderValue("text/html"));

            // configure JSON formatter serialization
            config.Formatters.JsonFormatter.SerializerSettings.DateTimeZoneHandling = DateTimeZoneHandling.Utc;
            config.Formatters.JsonFormatter.SerializerSettings.DateParseHandling = DateParseHandling.None;
            config.Formatters.JsonFormatter.SerializerSettings.Formatting = Formatting.Indented;

            config.Formatters.JsonFormatter.SerializerSettings.ContractResolver
                = new EdFiOdsApiContractResolver(
                    profileRequestContextProvider, 
                    synchronizationContextProvider,
                    profileResourceModelProvider)
                {
                    NamingStrategy = new CamelCaseNamingStrategy()
                };

            config.Formatters.JsonFormatter.SerializerSettings.NullValueHandling = NullValueHandling.Ignore;
            config.Formatters.JsonFormatter.RequiredMemberSelector = new NoRequiredMemberSelector();
        }
    }

    public class EdFiOdsApiContractResolver : DefaultContractResolver
    {
        private readonly IProfileResourceModelProvider _profileResourceModelProvider;
        private readonly ISynchronizationContextProvider _synchronizationContextProvider;
        private readonly IProfileRequestContextProvider _profileRequestContextProvider;

        public EdFiOdsApiContractResolver(
            IProfileRequestContextProvider profileRequestContextProvider,
            ISynchronizationContextProvider synchronizationContextProvider,
            IProfileResourceModelProvider profileResourceModelProvider)
        {
            _profileResourceModelProvider = Preconditions.ThrowIfNull(profileResourceModelProvider, nameof(profileResourceModelProvider));
            _profileRequestContextProvider = Preconditions.ThrowIfNull(profileRequestContextProvider, nameof(profileRequestContextProvider));
            _synchronizationContextProvider = Preconditions.ThrowIfNull(synchronizationContextProvider, nameof(synchronizationContextProvider));
        }
        
        private readonly ConcurrentDictionary<SynchronizationContextKey, JsonContract> _contractByKey =
            new ConcurrentDictionary<SynchronizationContextKey, JsonContract>();
	
        public override JsonContract ResolveContract(Type type)
        {
            string typeFullName = type.FullName;

            // Use default behavior for everything but custom classes
            if (!typeFullName.StartsWith("EdFi"))
            {
                return base.ResolveContract(type);
            }
            
            var profileRequestContext = _profileRequestContextProvider.GetProfileRequestContext();
                
            // Use default behavior if there is no Profile request
            if (profileRequestContext == null)
            {
                return base.ResolveContract(type);
            }

            if (typeFullName.TryTrimPrefix("EdFi.Ods.Api.Models.Resources.", out var remainingText))
            {
                var nameParts = remainingText.Split('.');
                
                // SPIKE NOTE: Need to convert the ProperCaseName to the physical schema
                var resourceClassFullName = new FullName(nameParts[1], nameParts[0]);
                
                // SPIKE NOTE: Reusing synchronization key. Rename to 'MappingContractKey'?
                var synchronizationContextKey = new SynchronizationContextKey(
                    resourceClassFullName,
                    profileRequestContext.ProfileName,
                    profileRequestContext.ResourceName,
                    profileRequestContext.ContentTypeUsage);

                var contract = _contractByKey.GetOrAdd(synchronizationContextKey, 
                    k => CreateContract(type));
            }
            
            return base.ResolveContract(type);
        }
        
        protected override List<MemberInfo> GetSerializableMembers(Type objectType)
        {
            var serializableMembers = base.GetSerializableMembers(objectType);

            // Use default behavior for everything but custom classes
            string typeFullName = objectType.FullName;

            if (!typeFullName.StartsWith("EdFi"))
            {
                return serializableMembers;
            }

            var profileRequestContext = _profileRequestContextProvider.GetProfileRequestContext();

            if (profileRequestContext == null)
            {
                return serializableMembers;
            }

            if (typeFullName.TryTrimPrefix("EdFi.Ods.Api.Models.Resources.", out var remainingText))
            {
                var nameParts = remainingText.Split('.');

                // SPIKE NOTE: Need to convert the ProperCaseName to the physical schema
                var resourceClassFullName = new FullName(nameParts[1], nameParts[0]);

                var profileResourceModel = _profileResourceModelProvider.GetProfileResourceModel(profileRequestContext.ProfileName);
                var profileResource = profileResourceModel.GetResourceByName(profileRequestContext.ResourceName);

                if (profileResource == null)
                {
                    throw new Exception($"Resource '{profileRequestContext.ResourceName}' not found in API Profile '{profileRequestContext.ProfileName}'");
                }
                
                var supportedMemberNames = profileResource
                    .AllContainedItemTypesOrSelf
                    .SingleOrDefault(x => x.FullName == resourceClassFullName)
                    ?.MemberByName
                    .Keys
                    .ToArray();

                var profileConstrainedMembers = serializableMembers
                    .Where(mi => supportedMemberNames?.Contains(mi.Name) != false)
                    .ToList();

                // var synchronizationContext = _synchronizationContextProvider.GetSynchronizationContext(resourceClassFullName);                
                //
                // var profileConstrainedMembers = serializableMembers
                //     .Where(mi =>
                //     {
                //         if (mi.Name.EqualsIgnoreCase("Id"))
                //             return true;
                //         
                //         return synchronizationContext.IsMemberSupported(mi.Name);
                //     })
                //     .ToList();
                //
                return profileConstrainedMembers;
            }

            return serializableMembers;
        }
    }
}
