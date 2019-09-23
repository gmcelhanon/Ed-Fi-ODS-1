using System.Net.Http;
using System.Web.Http.Routing;

namespace EdFi.Ods.Api.Architecture
{
    /// <summary>
    /// Provides an implementation of the IHttpRouteDataProvider interface that uses the ASP.NET
    /// extension method to satisfy the request for route data.
    /// </summary>
    public class HttpRouteDataProvider : IHttpRouteDataProvider
    {
        /// <summary>
        /// Gets the <see cref="IHttpRouteData"/> for the specified request using the ASP.NET extension method.
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        public IHttpRouteData GetRouteData(HttpRequestMessage request)
        {
            return request.GetRouteData();
        }
    }
}
