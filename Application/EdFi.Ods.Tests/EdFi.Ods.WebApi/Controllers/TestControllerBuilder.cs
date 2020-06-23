// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.
 
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Web.Http;
using Castle.MicroKernel.Registration;
using EdFi.Ods.Api.ExceptionHandling;
using EdFi.Ods.Api.ExceptionHandling.Translators;
using EdFi.Ods.Api.ExceptionHandling.Translators.SqlServer;
using EdFi.Ods.Api.Pipelines.Get;
using EdFi.Ods.Api.Pipelines.GetMany;
using EdFi.Ods.Api.Pipelines.Put;
using EdFi.Ods.Common;
using EdFi.Ods.Common.Context;
using EdFi.Ods.Common.InversionOfControl;
using EdFi.Ods.Pipelines.Common;
using EdFi.Ods.Pipelines.Delete;
using EdFi.Ods.Pipelines.Factories;
using EdFi.Ods.Pipelines.Get;
using EdFi.Ods.Pipelines.GetMany;
using EdFi.Ods.Pipelines.Put;
using Rhino.Mocks;

namespace EdFi.Ods.Tests.EdFi.Ods.WebApi.Controllers
{
    public class StubEtagProviderSinceWeReallyDontCareWhatTheValueIs : IETagProvider
    {
        public string GetETag(object value)
        {
            return "new" + value;
        }

        public DateTime GetDateTime(string etag)
        {
            return new DateTime(2000, 1, 1);
        }
    }

    public class StubCurrentSchoolYearContextProvider : ISchoolYearContextProvider
    {
        public int GetSchoolYear()
        {
            return DateTime.Now.Year;
        }

        public void SetSchoolYear(int schoolYear)
        {
            throw new NotImplementedException();
        }
    }

    internal class StubDatabaseMetadataProvider : IDatabaseMetadataProvider
    {
        public IndexDetails GetIndexDetails(string indexName)
        {
            return new IndexDetails
                   {
                       IndexName = "FK_TableName_IndexId", TableName = "TableName", ColumnNames = new List<string>
                                                                                                  {
                                                                                                      "TableNameId"
                                                                                                  }
                   };
        }
    }

    public static class TestControllerBuilder
    {
        private static readonly IExceptionTranslator[] _translators;

        static TestControllerBuilder()
        {
            _translators = new IExceptionTranslator[]
            {
                new TypeBasedBadRequestExceptionTranslator(),
                new SqlServerConstraintExceptionTranslator(),
                new SqlServerUniqueIndexExceptionTranslator(new StubDatabaseMetadataProvider()),
                new EdFiSecurityExceptionTranslator(),
                new NotFoundExceptionTranslator(),
                new NotModifiedExceptionTranslator(),
                new ConcurencyExceptionTranslator(),
                new DuplicateNaturalKeyCreateExceptionTranslator(new StubDatabaseMetadataProvider())
            };
        }

        public static T GetController<T>(IPipelineFactory factory, string id = null)
            where T : ApiController
        {
            var schoolYearContextProvider = MockRepository.GenerateStub<ISchoolYearContextProvider>();

            schoolYearContextProvider.Stub(x => x.GetSchoolYear())
                                     .Return(DateTime.Now.Year);

            var controller =
                (T)
                Activator.CreateInstance(
                    typeof(T),
                    factory,
                    new StubCurrentSchoolYearContextProvider(),
                    new RESTErrorProvider(_translators));

            controller.Configuration = new HttpConfiguration();
            var uri = $@"http://localhost/api/ods/v3/ed-fi/Students/{id}";

            controller.Request = new HttpRequestMessage
                                 {
                                     RequestUri = new Uri(uri)
                                 };

            return controller;
        }

        public static WindsorContainerEx GetWindsorContainer()
        {
            var container = new WindsorContainerEx();
            container.AddSupportForEmptyCollections();

            container.Register(
                Component
                   .For<ISchoolYearContextProvider>()
                   .ImplementedBy<StubCurrentSchoolYearContextProvider>());

            container.Register(
                Component
                   .For<IETagProvider>()
                   .ImplementedBy<StubEtagProviderSinceWeReallyDontCareWhatTheValueIs>());

            container.Register(
                Classes.FromThisAssembly()
                       .BasedOn(typeof(IStep<,>)));

            container.Register(
                Component.For<IExceptionTranslationProvider>()
                    .Instance(new ExceptionTranslationProvider(_translators)),

                // Get pipeline
                Component
                    .For<IGetPipelineStepsProvider>()
                    .ImplementedBy<GetPipelineStepsProvider>()
                    .DependsOn(new {serviceLocator = container}),
                Component
                    .For(typeof(IGetPipeline<,>))
                    .ImplementedBy(typeof(GetPipeline<,>)),

                // GetMany pipeline
                Component
                    .For<IGetManyPipelineStepsProvider>()
                    .ImplementedBy<GetManyPipelineStepsProvider>()
                    .DependsOn(new {serviceLocator = container}),
                Component
                    .For(typeof(IGetManyPipeline<,>))
                    .ImplementedBy(typeof(GetManyPipeline<,>)),

                // Put pipeline
                Component
                    .For<IPutPipelineStepsProvider>()
                    .ImplementedBy<PutPipelineStepsProvider>()
                    .DependsOn(new {serviceLocator = container}),
                Component
                    .For(typeof(IPutPipeline<,>))
                    .ImplementedBy(typeof(PutPipeline<,>)),

                // Delete pipeline
                Component
                    .For<IDeletePipelineStepsProvider>()
                    .ImplementedBy<DeletePipelineStepsProvider>()
                    .DependsOn(new {serviceLocator = container}),
                Component
                    .For(typeof(IDeletePipeline<,>))
                    .ImplementedBy(typeof(DeletePipeline<,>))
            );

            return container;
        }
    }
}
