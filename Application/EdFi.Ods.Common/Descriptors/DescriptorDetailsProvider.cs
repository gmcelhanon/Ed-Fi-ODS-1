// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Collections.Generic;
using System.Linq;
using EdFi.Ods.Common.Context;
using EdFi.Ods.Common.Infrastructure.Configuration;
using EdFi.Ods.Common.Models;
using EdFi.Ods.Common.Models.Domain;
using log4net;
using NHibernate;
using NHibernate.Criterion;
using NHibernate.Transform;

namespace EdFi.Ods.Common.Descriptors;

/// <summary>
/// Loads descriptor details using NHibernate queries against the ODS.
/// </summary>
public class DescriptorDetailsProvider : IDescriptorDetailsProvider
{
    private readonly IContextStorage _contextStorage;
    private readonly ISessionFactory _sessionFactory;
    
    private readonly Lazy<Dictionary<string, string>> _descriptorTypeNameByEntityName;

    private readonly ILog _logger = LogManager.GetLogger(typeof(DescriptorDetailsProvider));
    
    public DescriptorDetailsProvider(
        ISessionFactory sessionFactory,
        IDomainModelProvider domainModelProvider,
        IContextStorage contextStorage)
    {
        _contextStorage = contextStorage;
        _sessionFactory = sessionFactory;
        
        _descriptorTypeNameByEntityName = new Lazy<Dictionary<string, string>>(
            () => domainModelProvider.GetDomainModel()
                .Entities.Where(e => e.IsDescriptorEntity)
                .ToDictionary(
                    e => e.Name, 
                    e => e.EntityTypeFullName(e.SchemaProperCaseName())));
    }

    /// <inheritdoc cref="IDescriptorDetailsProvider.GetAllDescriptorDetails" />
    public (IList<DescriptorDetails> details, Exception ex) GetAllDescriptorDetails()
    {
        try
        {
            _contextStorage.SetValue(NHibernateOdsConnectionProvider.UseReadWriteConnectionCacheKey, true);

            using (var session = _sessionFactory.OpenSession())
            {
                var queries = GetQueries(session).ToList();

                if (queries.TryGetFailedResults(out (IList<DescriptorDetails> details, Exception ex) failedResult))
                {
                    return failedResult;
                }
                
                var results = queries.SelectMany(x => x.details.ToList())
                    .ToList();

                return results.AsSuccess();
            }

            IEnumerable<(IEnumerable<DescriptorDetails> details, Exception ex)> GetQueries(ISession session)
            {
                foreach (string descriptorName in _descriptorTypeNameByEntityName.Value.Keys)
                {
                    var criteriaResult = GetDescriptorCriteria(descriptorName, session);

                    if (criteriaResult.IsSuccess())
                    {
                        var query = criteriaResult.criteria.Future<DescriptorDetails>();

                        yield return query.AsSuccess();
                    }
                }
            }
        }
        catch (Exception ex)
        {
            _logger.Error("Error retrieving all Ed-Fi Descriptor data.", ex);

            throw;
        }
        finally
        {
            _contextStorage.SetValue(NHibernateOdsConnectionProvider.UseReadWriteConnectionCacheKey, null);
        }
    }

    /// <inheritdoc cref="IDescriptorDetailsProvider.GetDescriptorDetails(string,int)" />
    public (DescriptorDetails details, Exception ex) GetDescriptorDetails(string descriptorName, int descriptorId)
    {
        using var session = _sessionFactory.OpenSession();
        
        var result = GetDescriptorCriteria(descriptorName, session, descriptorId);

        if (result.IsSuccess())
        {
            return result.criteria.UniqueResult<DescriptorDetails>().AsSuccess();
        }

        return result.ex.AsFailed<DescriptorDetails>();
    }

    /// <inheritdoc cref="IDescriptorDetailsProvider.GetDescriptorDetails(string,string)" />
    public (DescriptorDetails details, Exception ex) GetDescriptorDetails(string descriptorName, string uri)
    {
        using var session = _sessionFactory.OpenSession();
        
        var result = GetDescriptorCriteria(descriptorName, session, uri: uri);

        if (result.IsSuccess())
        {
            return result.criteria.UniqueResult<DescriptorDetails>().AsSuccess(); 
        }

        return result.ex.AsFailed<DescriptorDetails>();
    }

    private (ICriteria criteria, Exception ex) GetDescriptorCriteria(
        string descriptorName,
        ISession session,
        int? descriptorId = null,
        string uri = null)
    {
        if (!_descriptorTypeNameByEntityName.Value.TryGetValue(descriptorName, out string descriptorTypeName))
        {
            return (default, new ArgumentException($"Descriptor '{descriptorName}' is not a known descriptor entity name."));
        }

        var descriptorIdColumnName = descriptorName + "Id";

        var criteria = session.CreateCriteria(descriptorTypeName)
            .SetProjection(
                Projections.ProjectionList()
                    .Add(Projections.Property(descriptorIdColumnName), "DescriptorId")
                    .Add(Projections.Property("Namespace"), "Namespace")
                    .Add(Projections.Property("CodeValue"), "CodeValue"));

        if (descriptorId.HasValue)
        {
            criteria.Add(Restrictions.Eq(descriptorIdColumnName, descriptorId.Value));
        }

        if (uri != null)
        {
            int pos = uri.IndexOf('#');

            if (pos < 0)
            {
                return new FormatException($"{descriptorName} value '{uri}' is not a valid descriptor value.")
                    .AsFailed<ICriteria>();
            }

            criteria.Add(Restrictions.Eq("Namespace", uri.Substring(0, pos)));
            criteria.Add(Restrictions.Eq("CodeValue", uri.Substring(pos + 1)));
        }

        criteria.SetResultTransformer(Transformers.AliasToBean<DescriptorDetails>());

        return criteria.AsSuccess();
    }
}
