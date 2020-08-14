using System;
using EdFi.Ods.Common.Models.Domain;
using EdFi.Ods.Common.Utils.Profiles;

namespace EdFi.Ods.Common.Profiles
{
    public interface IProfileRequestContextProvider
    {
        ProfileRequestContext GetProfileRequestContext();

        void SetProfileRequestContext(ProfileRequestContext profileRequestContext);
    }

    public class ProfileRequestContext
    {
        public ProfileRequestContext(string profileName, FullName resourceName, ContentTypeUsage contentTypeUsage)
        {
            ProfileName = profileName;
            ResourceName = resourceName;
            ContentTypeUsage = contentTypeUsage;
        }

        public string ProfileName { get; }

        public FullName ResourceName { get; }

        public ContentTypeUsage ContentTypeUsage { get; }
    }
}
