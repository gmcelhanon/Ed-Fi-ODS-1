using EdFi.Ods.Common.Context;

namespace EdFi.Ods.Common.Profiles
{
    public class ProfileRequestContextProvider : IProfileRequestContextProvider
    {
        private const string ProfileRequestContextKeyName = "ProfileRequestContextProvider.ProfileRequestContext";
        private readonly IContextStorage _contextStorage;

        public ProfileRequestContextProvider(IContextStorage contextStorage)
        {
            _contextStorage = contextStorage;
        }

        public ProfileRequestContext GetProfileRequestContext()
        {
            return _contextStorage.GetValue<ProfileRequestContext>(ProfileRequestContextKeyName);
        }

        public void SetProfileRequestContext(ProfileRequestContext profileRequestContext)
        {
            _contextStorage.SetValue(ProfileRequestContextKeyName, profileRequestContext);
        }
    }
}

