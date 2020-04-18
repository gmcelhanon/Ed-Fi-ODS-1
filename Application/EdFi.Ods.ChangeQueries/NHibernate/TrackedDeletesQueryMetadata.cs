namespace EdFi.Ods.ChangeQueries.NHibernate
{
    public class TrackedDeletesQueryMetadata
    {
        public TrackedDeletesQueryMetadata(
            string changeTableSchema,
            string changeTableName,
            string sourceTableSchema,
            string sourceTableName,
            string selectClause,
            string deletesOnlyWhereClause,
            string discriminatorCriteria,
            string sourceTableJoinCriteria,
            string sourceBaseTableJoin,
            string sourceChangeVersionTableAlias,
            string sourceTableExclusionCriteria,
            ProjectionMetadata[] identifierProjections)
        {
            ChangeTableSchema = changeTableSchema;
            ChangeTableName = changeTableName;
            SourceTableSchema = sourceTableSchema;
            SourceTableName = sourceTableName;
            SelectColumnsListSql = selectClause;
            DeletesOnlyWhereClause = deletesOnlyWhereClause;
            DiscriminatorCriteria = discriminatorCriteria;
            SourceTableJoinCriteria = sourceTableJoinCriteria;
            SourceBaseTableJoin = sourceBaseTableJoin;
            SourceChangeVersionTableAlias = sourceChangeVersionTableAlias;
            SourceTableExclusionCriteria = sourceTableExclusionCriteria;
            IdentifierProjections = identifierProjections;
        }

        public string ChangeTableSchema { get; }

        public string ChangeTableName { get; }

        public string SourceTableSchema { get; }

        public string SourceTableName { get; }

        public string SelectColumnsListSql { get; }

        public string DeletesOnlyWhereClause { get; }

        public string DiscriminatorCriteria { get; }

        public string SourceTableJoinCriteria { get; }

        public string SourceBaseTableJoin { get; }

        public string SourceChangeVersionTableAlias { get; }

        public string SourceTableExclusionCriteria { get; }

        public ProjectionMetadata[] IdentifierProjections { get; }
    }
}
