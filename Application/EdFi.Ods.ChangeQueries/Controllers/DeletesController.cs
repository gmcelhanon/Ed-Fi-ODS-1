// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System.Net.Http;
using System.Web.Http;
using EdFi.Ods.Api.ChangeQueries;
using EdFi.Ods.Api.Services.Authentication;
using EdFi.Ods.Api.Services.Queries;

namespace EdFi.Ods.ChangeQueries.Controllers
{
    [Authenticate]
    public class DeletesController : ApiController
    {
        private readonly IGetDeletedResources _getDeletedResourcesRepository;

        public DeletesController(IGetDeletedResources getDeletedResources)
        {
            _getDeletedResourcesRepository = getDeletedResources;
        }

        [HttpGet]
        public IHttpActionResult Get(string schema, string resource, [FromUri] UrlQueryParametersRequest urlQueryParametersRequest)
        {
            var queryParameter = new QueryParameters(urlQueryParametersRequest);

            var deletedItemsResponse = _getDeletedResourcesRepository.Execute(schema, resource, queryParameter);

            var response = Request.CreateResponse(HttpStatusCode.OK, deletedItemsResponse.DeletedResources);

            // Add the count header, if requested
            if (urlQueryParametersRequest.TotalCount)
            {
                response.Headers.Add("Total-Count", deletedItemsResponse.Count.ToString());
            }

            return ResponseMessage(response);
        }
    }
}
