// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System.Net;
using System.Net.Http;
using System.Threading;
using System.Web.Http;
using System.Web.Http.Controllers;
using System.Web.Http.Filters;
using EdFi.Ods.Api.ExceptionHandling;
using EdFi.Ods.Api.Services.ActionFilters;
using EdFi.Ods.Common.Exceptions;
using EdFi.TestFixture;
using FakeItEasy;
using Microsoft.Owin.Testing;
using Newtonsoft.Json.Linq;
using NUnit.Framework;
using Owin;
using Shouldly;
using Test.Common;

namespace EdFi.Ods.Tests.EdFi.Ods.WebApi
{
    public class FakeRestErrorProvider : IRESTErrorProvider
    {
        internal const HttpStatusCode FakeStatusCode = HttpStatusCode.RequestEntityTooLarge;
        internal const string FakeMessage = "Fake Message";

        public RESTError GetRestErrorFromException(Exception exception)
        {
            return new RESTError()
            {
                Code = (int) FakeStatusCode,
                Message = FakeMessage
            };
        }
    }
    
    public class ExceptionHandlingFilterTests
    {
        [TestFixture]
        public class When_uncaught_error_is_handled_by_error_filter_with_custom_errors
            : TestFixtureBase
        {
            private class TestController : ApiController { }

            private HttpResponseMessage response;

            private const string ExpectedErrorMessage = @"{""Message"":""An error has occurred.""}";

            [OneTimeSetUp]
            public void OneTimeSetUp()
            {
                var httpControllerContext = new HttpControllerContext(
                    new HttpRequestContext(),
                    new HttpRequestMessage(),
                    new HttpControllerDescriptor(),
                    new TestController());

                var httpActionContext = new HttpActionContext(httpControllerContext, new ReflectedHttpActionDescriptor());
                var actionExecutedContext = new HttpActionExecutedContext(httpActionContext, new BadRequestException());

                var exceptionHandlingFilter = new ExceptionHandlingFilter(
                    new FakeRestErrorProvider(),
                    isCustomErrorEnabled: true);

                exceptionHandlingFilter.ExecuteExceptionFilterAsync(actionExecutedContext, new CancellationToken())
                                       .Wait();

                response = actionExecutedContext.Response;
            }

            [Test]
            public void Should_create_response_with_message_returned_from_the_REST_error_provider()
            {
                var result = response.Content.ReadAsStringAsync().Result;

                var resultObject = JObject.Parse(result);
                var resultMessage = resultObject["Message"].Value<string>();
                
                resultMessage.ShouldBe(FakeRestErrorProvider.FakeMessage);
            }

            [Test]
            public void Should_create_response_with_status_code_returned_from_the_REST_error_provider()
            {
                response.ShouldNotBeNull();
                response.StatusCode.ShouldBe(FakeRestErrorProvider.FakeStatusCode);
            }
        }
    }

#region exception handling tests using Owin Test libraries

    public class UncaughtErrorTestController : ApiController
    {
        public IHttpActionResult Get()
        {
            throw new BadRequestException("Custom Message");
        }
    }

    public class OwinTests
    {
        private const string GeneralErrorMessage = "An error has occurred.";

        [TestFixture]
        public class When_test_controller_throws_uncaught_error_and_custom_errors_is_on
        {
            public class Startup
            {
                public void Configuration(IAppBuilder appBuilder)
                {
                    var config = new HttpConfiguration();

                    config.Routes.MapHttpRoute(
                        "Default",
                        "api/UncaughtErrorTest",
                        new
                        {
                            controller = "UncaughtErrorTest", action = "Get"
                        });

                    config.Filters.Add(
                        new ExceptionHandlingFilter(
                            new FakeRestErrorProvider(), 
                            isCustomErrorEnabled: true));
                    
                    appBuilder.UseWebApi(config);
                }
            }

            private HttpResponseMessage result;

            [OneTimeSetUp]
            public void OneTimeSetUp()
            {
                using (var testServer = TestServer.Create<Startup>())
                {
                    var response = testServer.HttpClient.GetAsync("api/UncaughtErrorTest");
                    response.Wait();
                    result = response.Result;
                    testServer.Dispose();
                }
            }

            [Test]
            public void Should_create_response_with_message_returned_from_the_REST_error_provider()
            {
                var resultObject = JObject.Parse(result.Content.ReadAsStringAsync().Result);
                
                string resultMessage = resultObject["Message"].Value<string>();

                resultMessage.ShouldBe(FakeRestErrorProvider.FakeMessage);
            }

            [Test]
            public void Should_create_response_with_status_code_returned_from_the_REST_error_provider()
            {
                result.ShouldNotBeNull();
                result.StatusCode.ShouldBe(FakeRestErrorProvider.FakeStatusCode);
            }
        }

        [TestFixture]
        public class When_test_controller_throws_uncaught_error_and_custom_errors_is_off
        {
            public class Startup
            {
                public void Configuration(IAppBuilder appBuilder)
                {
                    var config = new HttpConfiguration();

                    config.Routes.MapHttpRoute(
                        "Default",
                        "api/UncaughtErrorTest",
                        new
                        {
                            controller = "UncaughtErrorTest", action = "Get"
                        });

                    config.Filters.Add(new ExceptionHandlingFilter(new FakeRestErrorProvider(), false));
                    config.IncludeErrorDetailPolicy = IncludeErrorDetailPolicy.Always;
                    appBuilder.UseWebApi(config);
                }
            }

            private HttpResponseMessage result;

            [OneTimeSetUp]
            public void OneTimeSetUp()
            {
                using (var testServer = TestServer.Create<Startup>())
                {
                    var response = testServer.HttpClient.GetAsync("api/UncaughtErrorTest");
                    response.Wait();
                    result = response.Result;
                    testServer.Dispose();
                }
            }

            [Test]
            public void Should_return_the_InternalServerError_status_code()
            {
                result.StatusCode.ShouldBe(HttpStatusCode.InternalServerError);
            }

            [Test]
            public void Should_return_the_general_error_message()
            {
                var resultObject = JObject.Parse(result.Content.ReadAsStringAsync().Result);
                var resultMessage = resultObject["Message"].Value<string>();

                resultMessage.ShouldBe(GeneralErrorMessage);
            }
        }
    }

#endregion exception handling tests using Owin Test libraries
}
