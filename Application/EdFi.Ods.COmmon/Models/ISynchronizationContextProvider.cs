using System;
using System.Collections.Concurrent;
using System.Linq;
using EdFi.Ods.Common;
using EdFi.Ods.Common.Conventions;
using EdFi.Ods.Common.Extensions;
using EdFi.Ods.Common.Inflection;
using EdFi.Ods.Common.Metadata.Schemas;
using EdFi.Ods.Common.Models;
using EdFi.Ods.Common.Models.Domain;
using EdFi.Ods.Common.Profiles;
using EdFi.Ods.Common.Utils.Profiles;

namespace EdFi.Ods.Common.Models
{
    public interface ISynchronizationContextProvider
    {
        TSynchronizationContext GetSynchronizationContext<TSynchronizationContext>()
            where TSynchronizationContext : class; //, ISynchronizationContext;

        // ISynchronizationContext GetSynchronizationContext(SynchronizationContextKey synchronizationContextKey);
        
        ISynchronizationContext GetSynchronizationContext(FullName resourceClassName);
    }

    public interface ISynchronizationContext
    {
        bool IsMemberSupported(string memberName);
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
        
        private readonly ConcurrentDictionary<SynchronizationContextKey, ISynchronizationContext> _synchronizationContextByProfileRequestContext
            = new ConcurrentDictionary<SynchronizationContextKey, ISynchronizationContext>();

        public ISynchronizationContext GetSynchronizationContext(FullName resourceClassFullName)
        {
            // Is there a Profile in context?
            var profileRequestContext = _profileRequestContextProvider.GetProfileRequestContext();

            if (profileRequestContext == null)
                return null;
            
            var synchronizationContextKey = new SynchronizationContextKey(
                resourceClassFullName,
                profileRequestContext.ProfileName,
                profileRequestContext.ResourceName,
                profileRequestContext.ContentTypeUsage);

            return GetSynchronizationContext(synchronizationContextKey);            
        }

        public TSynchronizationContext GetSynchronizationContext<TSynchronizationContext>()
            where TSynchronizationContext : class //, ISynchronizationContext
        {
            // Is there a Profile in context?
            var profileRequestContext = _profileRequestContextProvider.GetProfileRequestContext();
            
            // No profile, no synchronization context is needed (synchronize and map everything)
            if (profileRequestContext == null)
                return null;

            // Extract the full name from the synchronization context
            var nameParts = typeof(TSynchronizationContext).FullName.TrimPrefix("EdFi.Ods.Entities.Common.")
                .Split('.');

            // SPIKE NOTE: Need to convert schema from ProperCaseName to PhysicalName here
            var fullName = new FullName(nameParts[0], nameParts[1]);
            
            var synchronizationContextKey = new SynchronizationContextKey(
                fullName,
                profileRequestContext.ProfileName,
                profileRequestContext.ResourceName,
                profileRequestContext.ContentTypeUsage);

            return (TSynchronizationContext) GetSynchronizationContext(synchronizationContextKey);

#region Original implementation (to be removed)

            // var synchronizationContext = _synchronizationContextByProfileRequestContext.GetOrAdd(profileRequestContext, ctx =>
            // {
            //     // Get the profile-constrained resource model
            //     var profileResourceModel = _profileResourceModelProvider.GetProfileResourceModel(ctx.ProfileName);
            //
            //     // If we couldn't find it, throw an error
            //     if (profileResourceModel == null)
            //     {
            //         throw new Exception($"Unable to get resource model for profile '{ctx.ProfileName}'.");
            //     }
            //
            //     // If we can't find the resource, throw an error
            //     if (!profileResourceModel.ResourceByName.TryGetValue(ctx.ResourceName, out var contentTypes))
            //     {
            //         throw new Exception($"Unable to locate resource '{ctx.ResourceName}' for profile '{ctx.ProfileName}'.");
            //     }
            //
            //     // Use the appropriate variant of the resource (readable or writable)
            //     var profileResource = ctx.ContentTypeUsage == ContentTypeUsage.Readable
            //         ? contentTypes.Readable
            //         : contentTypes.Writable;
            //
            //     if (profileResource == null)
            //     {
            //         throw new Exception($"Resource '{ctx.ResourceName}' for profile '{ctx.ProfileName}' does not have a {ctx.ContentTypeUsage.ToString().ToLower()} variant defined.");
            //     }
            //
            //     // Use reflection to get the constructor of the synchronization context
            //     var constructorInfo = typeof(TSynchronizationContext)
            //         .GetConstructors()
            //         .Single();
            //
            //     var arguments = constructorInfo
            //         .GetParameters()
            //         .Select(
            //             parameterInfo =>
            //             {
            //                 if (parameterInfo.Name == "supportedExtensions")
            //                 {
            //                     //string memberName = "SupportedExtensions";
            //
            //                     // SPIKE NOTE: Is this the correct name to use for the extension?
            //                     return profileResource.Extensions.Select(x => x.PropertyName).ToArray();
            //                 }
            //
            //                 if (!parameterInfo.Name.StartsWith("is"))
            //                 {
            //                     throw new Exception(
            //                         $"Constructor argument '{parameterInfo.Name}' of '{typeof(TSynchronizationContext).FullName}' did not conform to expected naming convention of isXxxxSupported or isXxxxIncluded.");
            //                 }
            //
            //                 if (parameterInfo.Name.EndsWith("Supported"))
            //                 {
            //                     string memberName = parameterInfo.Name.Substring(2, parameterInfo.Name.Length - "Supported".Length - 2);
            //
            //                     return (object) profileResource.FilterContext.MemberFilter.ShouldInclude(memberName);
            //                 }
            //
            //                 if (parameterInfo.Name.EndsWith("Included"))
            //                 {
            //                     string memberName = parameterInfo.Name.Substring(2, parameterInfo.Name.Length - "Included".Length - 2);
            //
            //                     string collectionName = CompositeTermInflector.MakePlural(memberName);
            //                     
            //                     if (profileResource.CollectionByName.TryGetValue(collectionName, out var collection))
            //                     {
            //                         Type itemType = parameterInfo.ParameterType.GenericTypeArguments[0];
            //
            //                         return ResourceItemPredicateBuilder.Build(itemType, collection.ValueFilters);
            //                     }
            //
            //                     // No predicate necessary because the collection itself is not included by this profile
            //                     return null;
            //                 }
            //
            //                 throw new Exception(
            //                     $"Constructor argument '{parameterInfo.Name}' of '{typeof(TSynchronizationContext).FullName}' did not conform to expected naming convention of isXxxxSupported or isXxxxIncluded.");
            //             })
            //         .ToArray();
            //
            //     // Create the synchronization context
            //     return constructorInfo.Invoke(arguments);
            // });
            //
            // return (TSynchronizationContext) synchronizationContext;
#endregion
        }

        private ISynchronizationContext GetSynchronizationContext(SynchronizationContextKey synchronizationContextKey)
        {
            // No profile, no synchronization context is needed (synchronize and map everything)
            if (string.IsNullOrEmpty(synchronizationContextKey.ProfileName))
                return null;

            var synchronizationContext = _synchronizationContextByProfileRequestContext.GetOrAdd(synchronizationContextKey,
                key =>
            {
                // Get the profile-constrained resource model
                var profileResourceModel = _profileResourceModelProvider.GetProfileResourceModel(key.ProfileName);

                // If we couldn't find it, throw an error
                if (profileResourceModel == null)
                {
                    throw new Exception($"Unable to get resource model for API Profile '{key.ProfileName}'.");
                }
            
                // If we can't find the resource, throw an error
                if (!profileResourceModel.ResourceByName.TryGetValue(key.ProfileResourceName, out var contentTypes))
                {
                    throw new Exception($"Unable to locate resource '{key.ProfileResourceName}' for profile '{key.ProfileName}'.");
                }

                // Use the appropriate variant of the resource (readable or writable)
                var profileResource = key.ContentTypeUsage == ContentTypeUsage.Readable
                    ? contentTypes.Readable
                    : contentTypes.Writable;

                if (profileResource == null)
                {
                    throw new Exception($"Resource class '{key.ResourceClassName}' for profile '{key.ProfileName}' does not have a {key.ContentTypeUsage.ToString().ToLower()} variant defined.");
                }

                var profileResourceClass = profileResource.AllContainedItemTypesOrSelf
                    .SingleOrDefault(t => t.FullName == synchronizationContextKey.ResourceClassName);

                if (profileResourceClass == null)
                {
                    throw new Exception($"Unable to find resource class '{synchronizationContextKey.ResourceClassName}' in the {synchronizationContextKey.ContentTypeUsage} resource '{synchronizationContextKey.ProfileResourceName}' defined in Profile '{synchronizationContextKey.ProfileName}'");
                }
                
                // Find the synchronization context for the specific class
                // SPIKE NOTE: Really need to convert the physical schema name (which is what it should be) to ProperCaseName
                string typeName = $"EdFi.Ods.Entities.Common.{profileResourceClass.FullName.Schema}.{profileResourceClass.FullName.Name}SynchronizationContext";

                string assemblyName = key.ResourceClassName.Schema.EqualsIgnoreCase(EdFiConventions.PhysicalSchemaName)
                    ? "EdFi.Ods.Standard"
                    : $"EdFi.Ods.Extensions.{profileResourceClass.FullName.Schema}";

                var synchronizationContextType = Type.GetType($"{typeName}, {assemblyName}", throwOnError: true, ignoreCase: true);
                
                // Use reflection to get the constructor of the synchronization context
                var constructorInfo = synchronizationContextType
                    .GetConstructors()
                    .Single();

                var arguments = constructorInfo
                    .GetParameters()
                    .Select(
                        parameterInfo =>
                        {
                            if (parameterInfo.Name == "supportedExtensions")
                            {
                                //string memberName = "SupportedExtensions";

                                // SPIKE NOTE: Is this the correct name to use for the extension?
                                return profileResource.Extensions.Select(x => x.PropertyName).ToArray();
                            }

                            if (!parameterInfo.Name.StartsWith("is"))
                            {
                                throw new Exception(
                                    $"Constructor argument '{parameterInfo.Name}' of '{synchronizationContextType.FullName}' did not conform to expected naming convention of isXxxxSupported or isXxxxIncluded.");
                            }

                            if (parameterInfo.Name.EndsWith("Supported"))
                            {
                                string memberName = parameterInfo.Name.Substring(2, parameterInfo.Name.Length - "Supported".Length - 2);

                                return (object) profileResource.FilterContext.MemberFilter.ShouldInclude(memberName);
                            }

                            if (parameterInfo.Name.EndsWith("Included"))
                            {
                                string memberName = parameterInfo.Name.Substring(2, parameterInfo.Name.Length - "Included".Length - 2);

                                string collectionName = CompositeTermInflector.MakePlural(memberName);
                                
                                if (profileResource.CollectionByName.TryGetValue(collectionName, out var collection))
                                {
                                    Type itemType = parameterInfo.ParameterType.GenericTypeArguments[0];

                                    return ResourceItemPredicateBuilder.Build(itemType, collection.ValueFilters);
                                }

                                // No predicate necessary because the collection itself is not included by this profile
                                return null;
                            }

                            throw new Exception(
                                $"Constructor argument '{parameterInfo.Name}' of '{synchronizationContextType.FullName}' did not conform to expected naming convention of isXxxxSupported or isXxxxIncluded.");
                        })
                    .ToArray();

                // Create the synchronization context
                return (ISynchronizationContext) constructorInfo.Invoke(arguments);
            });

            return synchronizationContext;
        }
    }
    
    public class SynchronizationContextKey : IEquatable<SynchronizationContextKey>
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="SynchronizationContextKey" /> class for a non-profile constrained synchronization context.
        /// </summary>
        /// <param name="resourceClassName">The <see cref="FullName" /> of the resource class.</param>
        public SynchronizationContextKey(FullName resourceClassName)
        {
            ResourceClassName = resourceClassName;
        }
        
        /// <summary>
        /// Initializes a new instance of the <see cref="SynchronizationContextKey" /> class for a profile-specific synchronization context.
        /// </summary>
        /// <param name="resourceClassName">The name of the resource class (resource root or child item within the resource).</param>
        /// <param name="profileName">The name of the profile.</param>
        /// <param name="profileResourceName">The <see cref="FullName" /> of the resource in context (e.g. the School or LocalEducationAgency for a resource class of EducationOrganizationAddress).</param>
        /// <param name="contentTypeUsage">The usage of the profile (readable or writable).</param>
        public SynchronizationContextKey(FullName resourceClassName, string profileName, FullName profileResourceName, ContentTypeUsage contentTypeUsage)
        {
            ResourceClassName = resourceClassName;

            ProfileName = Preconditions.ThrowIfNull(profileName, nameof(profileName));
            
            ProfileResourceName = profileResourceName;
            
            if (contentTypeUsage == default(ContentTypeUsage))
                throw new ArgumentException("Content type usage was not specified.");
            
            ContentTypeUsage = contentTypeUsage;
        }

        public FullName ResourceClassName { get; }

        public string ProfileName { get; }

        public FullName ProfileResourceName { get; }

        public ContentTypeUsage ContentTypeUsage { get; }

        public bool Equals(SynchronizationContextKey other)
        {
            if (ReferenceEquals(null, other))
            {
                return false;
            }

            if (ReferenceEquals(this, other))
            {
                return true;
            }

            return ResourceClassName.Equals(other.ResourceClassName) && string.Equals(ProfileName, other.ProfileName) && ProfileResourceName.Equals(other.ProfileResourceName) && ContentTypeUsage == other.ContentTypeUsage;
        }

        public override bool Equals(object obj)
        {
            if (ReferenceEquals(null, obj))
            {
                return false;
            }

            if (ReferenceEquals(this, obj))
            {
                return true;
            }

            if (obj.GetType() != this.GetType())
            {
                return false;
            }

            return Equals((SynchronizationContextKey) obj);
        }

        public override int GetHashCode()
        {
            unchecked
            {
                int hashCode = ResourceClassName.GetHashCode();

                hashCode = (hashCode * 397) ^ (ProfileName != null
                    ? ProfileName.GetHashCode()
                    : 0);

                hashCode = (hashCode * 397) ^ ProfileResourceName.GetHashCode();
                hashCode = (hashCode * 397) ^ (int) ContentTypeUsage;
                return hashCode;
            }
        }
    }
}
