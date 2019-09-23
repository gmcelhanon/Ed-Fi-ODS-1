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

    public class ProfileRequestContext : IEquatable<ProfileRequestContext>
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

        public bool Equals(ProfileRequestContext other)
        {
            if (ReferenceEquals(null, other))
            {
                return false;
            }

            if (ReferenceEquals(this, other))
            {
                return true;
            }

            return string.Equals(ProfileName, other.ProfileName) 
                && ResourceName.Equals(other.ResourceName) 
                && ContentTypeUsage == other.ContentTypeUsage;
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

            if (obj.GetType() != GetType())
            {
                return false;
            }

            return Equals((ProfileRequestContext) obj);
        }

        public override int GetHashCode()
        {
            unchecked
            {
                int hashCode = ProfileName != null
                    ? ProfileName.GetHashCode()
                    : 0;

                hashCode = (hashCode * 397) ^ ResourceName.GetHashCode();
                hashCode = (hashCode * 397) ^ (int) ContentTypeUsage;
                return hashCode;
            }
        }
    }
}
