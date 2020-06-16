using System.Collections.Generic;

namespace EdFi.Ods.Common.Security.Authorization
{
    public class AuthorizationFilterDetails
    {
        public string FilterName { get; set; }
        
        public string SubjectEndpointName { get; set; }

        public string ClaimEndpointName { get; set; }

        public object[] ClaimValues { get; set; }
    }
}