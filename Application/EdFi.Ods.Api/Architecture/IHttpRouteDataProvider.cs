using System.Net.Http;
using System.Web.Http.Routing;

namespace EdFi.Ods.Api.Architecture
{
    /// <summary>
    /// Introduces a seam for overriding the implementation for obtaining route data for an API request.
    /// </summary>
    public interface IHttpRouteDataProvider
    {
        /// <summary>
        /// Gets the <see cref="IHttpRouteData"/> for the specified request.
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        IHttpRouteData GetRouteData(HttpRequestMessage request);
    }
}
