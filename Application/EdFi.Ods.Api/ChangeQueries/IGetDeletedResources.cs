using System.Collections.Generic;
using EdFi.Ods.Common;

namespace EdFi.Ods.Api.ChangeQueries
{
    public interface IGetDeletedResources
    {
        DeletedResourcesResponse Execute(string schema, string resource, IQueryParameters queryParameters);
    }
    
    public class DeletedResourcesResponse
    {
        public IReadOnlyList<DeletedResource> DeletedResources { get; set; }
            
        public long? Count { get; set; }
    }
}
