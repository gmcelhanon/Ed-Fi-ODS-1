using System;
using System.Collections;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;
using EdFi.Ods.Api.ChangeQueries;
using EdFi.Ods.Api.NHibernate.Architecture;
using EdFi.Ods.ChangeQueries.SqlServer;
using EdFi.Ods.Common;
using EdFi.Ods.Common.Extensions;
using EdFi.Ods.Common.Models;
using EdFi.Ods.Common.Models.Domain;
using EdFi.Ods.Common.Models.Resource;
using NHibernate;
using NHibernate.Transform;

namespace EdFi.Ods.ChangeQueries.NHibernate
{
    public class GetDeletedResources : NHibernateRepositoryOperationBase, IGetDeletedResources
    {
        private const string TrackedChangesAlias = "c";
        private const string SourceTableAlias = "src";
        
        private readonly ISessionFactory _sessionFactory;
        private readonly IDomainModelProvider _domainModelProvider;
        
        private readonly ConcurrentDictionary<FullName, TrackedDeletesQueryMetadata> _deletesQueryMetadataByResourceName =
            new ConcurrentDictionary<FullName, TrackedDeletesQueryMetadata>();

        public GetDeletedResources(ISessionFactory sessionFactory, IDomainModelProvider domainModelProvider)
            : base(sessionFactory)
        {
            _sessionFactory = sessionFactory;
            _domainModelProvider = domainModelProvider;
        }

        public DeletedResourcesResponse Execute(string schemaUriSegment, string urlResourcePluralName, IQueryParameters queryParameters)
        {
            var resource = _domainModelProvider
                .GetDomainModel()
                .ResourceModel
                .GetResourceByApiCollectionName(schemaUriSegment, urlResourcePluralName);

            if (resource == null)
            {
                throw new Exception($"Unable to find resource for provided schema uri segment '{schemaUriSegment}' and url resource '{urlResourcePluralName}'.");
            }

            if ((queryParameters.MinChangeVersion ?? 0) > (queryParameters.MaxChangeVersion ?? long.MaxValue))
            {
                throw new ArgumentException("Minimum change version cannot be greater than maximum change version.");
            }

            var queryMetadata = _deletesQueryMetadataByResourceName.GetOrAdd(resource.FullName, 
                fn => GetTrackedDeletesQueryMetadata(resource));

            return GetDeletedItemsResponse(queryMetadata, queryParameters);
        }

        private DeletedResourcesResponse GetDeletedItemsResponse(
            TrackedDeletesQueryMetadata queryMetadata,
            IQueryParameters queryParameters)
        {
            string deletesSql = GetDeletesSql(queryMetadata, queryParameters);

            var deletesResponse = new DeletedResourcesResponse();

            using (var sessionScope = new SessionScope(_sessionFactory))
            {
                var query = sessionScope.Session.CreateSQLQuery(deletesSql)
                    .SetFirstResult(queryParameters.Offset ?? 0)
                    .SetMaxResults(queryParameters.Limit ?? 25)
                    .SetResultTransformer(Transformers.AliasToEntityMap);

                var deletedItems = query.List();

                var deletedResources = deletedItems
                    .Cast<Hashtable>()
                    .Select(
                        deletedItem => new DeletedResource
                        {
                            Id = (Guid) deletedItem["Id"],
                            ChangeVersion = (long) deletedItem[ChangeQueriesDatabaseConstants.ChangeVersionColumnName],
                            KeyValues = GetIdentifierKeyValues(queryMetadata.IdentifierProjections, deletedItem),
                        })
                    .ToList();

                deletesResponse.DeletedResources = deletedResources;

                if (queryParameters.TotalCount)
                {
                    string cmdCountSql = GetDeletesCountSql(queryMetadata, queryParameters);

                    var count = sessionScope.Session.CreateSQLQuery(cmdCountSql)
                        .UniqueResult<long>();

                    deletesResponse.Count = count;
                }
            }

            return deletesResponse;
        }

        private TrackedDeletesQueryMetadata GetTrackedDeletesQueryMetadata(Resource resource)
        {
            var identifierProjections = resource
                .IdentifyingProperties
                .Select(
                    p => new ProjectionMetadata
                    {
                        JsonPropertyName = p.JsonPropertyName,
                        SelectColumns = GetSelectColumns(p).ToArray(),
                        ChangeTableJoinColumnName = $"Old{p.EntityProperty.PropertyName}",
                        SourceTableJoinColumnName = p.EntityProperty.PropertyName,
                        IsDescriptorProperty = p.IsLookup,
                    })
                .ToArray();

            string selectColumnsSql = string.Join(
                ", ",
                identifierProjections
                    .SelectMany(x => x.SelectColumns)
                    .Select(
                        x =>
                            x.ColumnAlias == null
                                ? $"{TrackedChangesAlias}.{x.ColumnName}"
                                : $"{TrackedChangesAlias}.{x.ColumnName} AS {x.ColumnAlias}"));

            string deletesOnlyCriteria = $" AND {TrackedChangesAlias}.New{resource.Entity.Identifier.Properties.First().PropertyName} IS NULL";

            string sourceTableJoinCriteria = string.Join(
                " AND ",
                identifierProjections.Select(x => $"{TrackedChangesAlias}.{x.ChangeTableJoinColumnName} = {SourceTableAlias}.{x.SourceTableJoinColumnName}"));

            string sourceTableExclusionCriteria = $"{SourceTableAlias}.{identifierProjections.Select(x => x.SourceTableJoinColumnName).First()} IS NULL";

            var queryMetadata = new TrackedDeletesQueryMetadata(
                resource.Entity.Schema,
                resource.Entity.Name,
                selectColumnsSql,
                deletesOnlyCriteria,
                sourceTableJoinCriteria,
                sourceTableExclusionCriteria,
                identifierProjections);

            return queryMetadata;
        }

        private IEnumerable<SelectColumn> GetSelectColumns(ResourceProperty resourceProperty)
        {
            if (resourceProperty.IsLookup)
            {
                yield return new SelectColumn
                {
                    ColumnName = $"Old{resourceProperty.EntityProperty.PropertyName.ReplaceSuffix("Id", "Namespace")}",
                    ColumnAlias = null,
                };

                yield return new SelectColumn
                {
                    ColumnName = $"Old{resourceProperty.EntityProperty.PropertyName.ReplaceSuffix("Id", "CodeValue")}",
                    ColumnAlias = null,
                };
            }
            else // if (PersonEntitySpecification.IsPersonIdentifier(resourceProperty.PropertyName))
            {
                yield return new SelectColumn
                {
                    ColumnName = $"Old{resourceProperty.PropertyName}",
                    ColumnAlias = resourceProperty.JsonPropertyName
                };
            }
        }

        private static Dictionary<string, object> GetIdentifierKeyValues(
            ProjectionMetadata[] identifierProjections, 
            Hashtable deletedItem)
        {
            var keyValues = new Dictionary<string, object>();

            foreach (var identifierMetadata in identifierProjections)
            {
                if (identifierMetadata.IsDescriptorProperty)
                {
                    string namespaceColumn = identifierMetadata.SelectColumns[0].ColumnName;
                    string codeValueColumn = identifierMetadata.SelectColumns[1].ColumnName;

                    keyValues[identifierMetadata.JsonPropertyName] =
                        $"{deletedItem[namespaceColumn]}#{deletedItem[codeValueColumn]}";
                }
                else
                {
                    // Copy the value without transformation
                    var selectColumn = identifierMetadata.SelectColumns.First();

                    keyValues[selectColumn.ColumnAlias] =
                        deletedItem[selectColumn.ColumnAlias ?? selectColumn.ColumnName];
                }
            }

            return keyValues;
        }

        private string GetDeletesSql(TrackedDeletesQueryMetadata queryMetadata, IQueryParameters queryParameters)
        {
            string selectClauseFormat = $"SELECT {TrackedChangesAlias}.Id, {TrackedChangesAlias}.{ChangeQueriesDatabaseConstants.ChangeVersionColumnName}, {{0}}";
            string orderByClause = $"ORDER BY {TrackedChangesAlias}.{ChangeQueriesDatabaseConstants.ChangeVersionColumnName}";
            
            return BuildCompleteDeletesSql(queryMetadata, queryParameters, selectClauseFormat, orderByClause);
        }

        private string GetDeletesCountSql(TrackedDeletesQueryMetadata queryMetadata, IQueryParameters queryParameters)
        {
            string selectClauseFormat = $"SELECT Count(1)";

            return BuildCompleteDeletesSql(queryMetadata, queryParameters, selectClauseFormat);
        }
        
        private string BuildCompleteDeletesSql(
            TrackedDeletesQueryMetadata queryMetadata,
            IQueryParameters queryParameters,
            string selectClauseFormat,
            string orderByClause = null)
        {
            string sourceTableChangeVersionCriteria = null;
            string deletedChangeVersionCriteria = null;

            if (queryParameters.MinChangeVersion.HasValue)
            {
                deletedChangeVersionCriteria +=
                    $" {TrackedChangesAlias}.{ChangeQueriesDatabaseConstants.ChangeVersionColumnName} >= {queryParameters.MinChangeVersion.Value}";

                sourceTableChangeVersionCriteria +=
                    $" {SourceTableAlias}.{ChangeQueriesDatabaseConstants.ChangeVersionColumnName} >= {queryParameters.MinChangeVersion.Value}";
            }

            if (queryParameters.MaxChangeVersion.HasValue)
            {
                deletedChangeVersionCriteria +=
                    $" {AndIfNeeded(deletedChangeVersionCriteria)}{TrackedChangesAlias}.{ChangeQueriesDatabaseConstants.ChangeVersionColumnName} <= {queryParameters.MaxChangeVersion.Value}";

                sourceTableChangeVersionCriteria +=
                    $" {AndIfNeeded(sourceTableChangeVersionCriteria)}{SourceTableAlias}.{ChangeQueriesDatabaseConstants.ChangeVersionColumnName} <= {queryParameters.MaxChangeVersion.Value}";
            }

            if (!string.IsNullOrEmpty(deletedChangeVersionCriteria))
            {
                deletedChangeVersionCriteria = $" AND {deletedChangeVersionCriteria}";
            }

            if (!string.IsNullOrEmpty(sourceTableChangeVersionCriteria))
            {
                sourceTableChangeVersionCriteria =
                    $" AND (({sourceTableChangeVersionCriteria}) OR {SourceTableAlias}.{ChangeQueriesDatabaseConstants.ChangeVersionColumnName} IS NULL)";
            }

            string selectClause = string.Format(selectClauseFormat, queryMetadata.SelectColumnsListSql);

            var cmdSql = $@"
{selectClause}
FROM [{ChangeQueriesDatabaseConstants.SchemaName}].{queryMetadata.SourceTableSchema}_{queryMetadata.SourceTableName}{ChangeQueriesDatabaseConstants.TrackedChangeTableNameSuffix} AS d
LEFT JOIN {queryMetadata.SourceTableSchema}.{queryMetadata.SourceTableName} src 
    ON {queryMetadata.SourceTableJoinCriteria}
    {sourceTableChangeVersionCriteria}
WHERE {queryMetadata.SourceTableExclusionCriteria}
    {queryMetadata.DeletesOnlyWhereClause}
    {deletedChangeVersionCriteria}
{orderByClause}";

            return cmdSql;
        }

        private string AndIfNeeded(string criteria)
        {
            return string.IsNullOrEmpty(criteria) ? string.Empty : " AND ";
        }
    }
}
