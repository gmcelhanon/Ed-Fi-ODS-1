namespace EdFi.Ods.ChangeQueries.NHibernate
{
    public class ProjectionMetadata
    {
        public string JsonPropertyName { get; set; }

        public SelectColumn[] SelectColumns { get; set; }

        public string ChangeTableJoinColumnName { get; set; }

        public string SourceTableJoinColumnName { get; set; }

        public bool IsDescriptorProperty { get; set; }
    }

    public class SelectColumn
    {
        public string ColumnName { get; set; }
        
        public string ColumnAlias { get; set; }
    }
}
