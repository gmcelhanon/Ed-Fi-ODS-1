namespace EdFi.Ods.ChangeQueries.NHibernate
{
    public class TrackedDeletesQueryMetadata
    {
        public TrackedDeletesQueryMetadata(
            string sourceTableSchema,
            string sourceTableName,
            string selectClause,
            string deletesOnlyWhereClause,
            string sourceTableJoinCriteria,
            string sourceTableExclusionCriteria,
            ProjectionMetadata[] identifierProjections)
        {
            SourceTableSchema = sourceTableSchema;
            SourceTableName = sourceTableName;
            SelectColumnsListSql = selectClause;
            DeletesOnlyWhereClause = deletesOnlyWhereClause;
            SourceTableJoinCriteria = sourceTableJoinCriteria;
            SourceTableExclusionCriteria = sourceTableExclusionCriteria;
            IdentifierProjections = identifierProjections;
        }

        public string SourceTableSchema { get; }

        public string SourceTableName { get; }

        public string SelectColumnsListSql { get; }

        public string DeletesOnlyWhereClause { get; }

        public string SourceTableJoinCriteria { get; }

        public string SourceTableExclusionCriteria { get; }

        public ProjectionMetadata[] IdentifierProjections { get; }
    }
}
