using System;
using System.Collections.Concurrent;
using System.Linq;
using EdFi.Ods.Common;
using EdFi.Ods.Common.Inflection;
using EdFi.Ods.Common.Models;
using EdFi.Ods.Common.Profiles;
using EdFi.Ods.Common.Utils.Profiles;

namespace EdFi.Ods.Api.Models
{
    public interface ISynchronizationContextProvider
    {
        TSynchronizationContext GetSynchronizationContext<TSynchronizationContext>()
            where TSynchronizationContext : class;
    }

    public class SynchronizationContextProvider : ISynchronizationContextProvider
    {
        private readonly IProfileResourceModelProvider _profileResourceModelProvider;
        private readonly IProfileRequestContextProvider _profileRequestContextProvider;

        public SynchronizationContextProvider(
            IProfileRequestContextProvider profileRequestContextProvider,
            IProfileResourceModelProvider profileResourceModelProvider)
        {
            _profileRequestContextProvider = Preconditions.ThrowIfNull(profileRequestContextProvider, nameof(profileRequestContextProvider));
            _profileResourceModelProvider = Preconditions.ThrowIfNull(profileResourceModelProvider, nameof(profileResourceModelProvider));
        }
        
        private readonly ConcurrentDictionary<ProfileRequestContext, object> _synchronizationContextByProfileRequestContext
            = new ConcurrentDictionary<ProfileRequestContext, object>();

        public TSynchronizationContext GetSynchronizationContext<TSynchronizationContext>()
            where TSynchronizationContext : class
        {
            // Is there a Profile in context?
            var profileRequestContext = _profileRequestContextProvider.GetProfileRequestContext();
            
            // No profile, no synchronization context is needed (synchronize and map everything)
            if (profileRequestContext == null)
                return null;

            var synchronizationContext = _synchronizationContextByProfileRequestContext.GetOrAdd(profileRequestContext, ctx =>
            {
                // Get the profile-constrained resource model
                var profileResourceModel = _profileResourceModelProvider.GetProfileResourceModel(ctx.ProfileName);

                // If we couldn't find it, throw an error
                if (profileResourceModel == null)
                {
                    throw new Exception($"Unable to get resource model for profile '{ctx.ProfileName}'.");
                }
            
                // If we can't find the resource, throw an error
                if (!profileResourceModel.ResourceByName.TryGetValue(ctx.ResourceName, out var contentTypes))
                {
                    throw new Exception($"Unable to locate resource '{ctx.ResourceName}' for profile '{ctx.ProfileName}'.");
                }

                // Use the appropriate variant of the resource (readable or writable)
                var profileResource = ctx.ContentTypeUsage == ContentTypeUsage.Readable
                    ? contentTypes.Readable
                    : contentTypes.Writable;

                if (profileResource == null)
                {
                    throw new Exception($"Resource '{ctx.ResourceName}' for profile '{ctx.ProfileName}' does not have a {ctx.ContentTypeUsage.ToString().ToLower()} variant defined.");
                }
            
                // Use reflection to get the constructor of the synchronization context
                var constructorInfo = typeof(TSynchronizationContext)
                    .GetConstructors()
                    .Single();

                var arguments = constructorInfo
                    .GetParameters()
                    .Select(
                        p =>
                        {
                            if (!p.Name.StartsWith("is"))
                            {
                                throw new Exception(
                                    $"Constructor argument '{p.Name}' of '{typeof(TSynchronizationContext).FullName}' did not conform to expected naming convention of isXxxxSupported or isXxxxIncluded.");
                            }

                            if (p.Name == "supportedExtensions")
                            {
                                //string memberName = "SupportedExtensions";

                                // SPIKE NOTE: Is this the correct name to use for the extension?
                                return profileResource.Extensions.Select(x => x.PropertyName).ToArray();
                            }
                            
                            if (p.Name.EndsWith("Supported"))
                            {
                                string memberName = p.Name.Substring(2, p.Name.Length - "Supported".Length - 2);

                                return (object) profileResource.FilterContext.MemberFilter.ShouldInclude(memberName);
                            }

                            if (p.Name.EndsWith("Included"))
                            {
                                string memberName = p.Name.Substring(2, p.Name.Length - "Included".Length - 2);

                                string collectionName = CompositeTermInflector.MakePlural(memberName);
                                Type itemType = p.ParameterType.GenericTypeArguments[0];

                                return ResourceItemPredicateBuilder.Build(
                                    itemType,
                                    profileResource.CollectionByName[collectionName].ValueFilters);
                            }

                            throw new Exception(
                                $"Constructor argument '{p.Name}' of '{typeof(TSynchronizationContext).FullName}' did not conform to expected naming convention of isXxxxSupported or isXxxxIncluded.");
                        })
                    .ToArray();

                // Create the synchronization context
                return constructorInfo.Invoke(arguments);
            });

            return (TSynchronizationContext) synchronizationContext;
        }
    }
}
