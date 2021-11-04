// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Linq;
using EdFi.Ods.Common.Caching;
using EdFi.Ods.Common.Models;
using EdFi.Ods.Common.Models.Domain;
using NHibernate;
using NHibernate.Criterion;
using NHibernate.Metadata;
using NHibernate.Persister.Entity;

namespace EdFi.Ods.Common.Providers.Criteria
{
    /// <summary>
    /// Builds a query that retrieves the total count of resource items available to the current caller.
    /// </summary>
    /// <typeparam name="TEntity">The type of the entity to which criteria is being applied.</typeparam>
    public class TotalCountCriteriaProvider<TEntity> : AggregateRootCriteriaProviderBase<TEntity>, ITotalCountCriteriaProvider<TEntity>
        where TEntity : class
    {
        // private readonly NHibernate.Cfg.Configuration _configuration;
        // private readonly IDomainModelProvider _domainModelProvider;

        private readonly Lazy<string[]> _primaryKeyPropertyNames;

        public TotalCountCriteriaProvider(ISessionFactory sessionFactory, IDescriptorsCache descriptorsCache) 
            //, NHibernate.Cfg.Configuration configuration, IDomainModelProvider domainModelProvider)
            : base(sessionFactory, descriptorsCache)
        {
            // _configuration = configuration;
            // _domainModelProvider = domainModelProvider;

            _primaryKeyPropertyNames = new Lazy<string[]>(
                () =>
                {
                    var persister = (AbstractEntityPersister) SessionFactory.GetClassMetadata(typeof(TEntity));

                    if (persister.IdentifierColumnNames != null && persister.IdentifierColumnNames.Length > 0)
                    {
                        return persister.IdentifierColumnNames;
                    }

                    return new[] { "Id" };

                    // var classMapping = _configuration.GetClassMapping(typeof(TEntity));
                    // var fullName = new FullName(classMapping.Table.Schema, classMapping.EntityName);
                    //
                    // if (!_domainModelProvider.GetDomainModel().EntityByFullName.TryGetValue(fullName, out var entity))
                    // {
                    //     throw new Exception();
                    // }
                    //
                    // var primaryKeyPropertyNames = entity.Identifier.Properties.Select(p => p.PropertyName).ToArray();
                    //
                    // return primaryKeyPropertyNames;
                });
        }

        /// <summary>
        /// Get a <see cref="NHibernate.ICriteria"/> query that retrieves the total count of resource items available to the current caller.
        /// </summary>
        /// <param name="specification">An instance of the entity containing parameters to be added to the query.</param>
        /// <param name="queryParameters">The query parameters to be applied to the filtering.</param>
        /// <returns>The NHibernate <see cref="NHibernate.ICriteria"/> instance representing the query.</returns>
        public DetachedCriteria GetCriteriaQuery(TEntity specification, IQueryParameters queryParameters)
        {
            var keyProjections = Projections.ProjectionList();

            foreach (string primaryKeyPropertyName in _primaryKeyPropertyNames.Value)
            {
                keyProjections.Add(Projections.Property(primaryKeyPropertyName));
            }

            // var countQueryCriteria = Session.CreateCriteria<TEntity>("aggregateRoot")
            var countQueryCriteria = DetachedCriteria.For<TEntity>("aggregateRoot")
                .SetProjection(Projections.Distinct(keyProjections));

            // Add specification-based criteria
            ProcessSpecification(countQueryCriteria, specification);

            // Add special query fields
            ProcessQueryParameters(countQueryCriteria, queryParameters);

            return countQueryCriteria;
        }
    }
}