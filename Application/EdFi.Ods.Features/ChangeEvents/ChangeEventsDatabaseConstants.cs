namespace EdFi.Ods.Features.ChangeEvents
{
    public class ChangeEventsDatabaseConstants
    {
        /// <summary>
        /// Gets the database schema name for the Change Events table.
        /// </summary>
        public const string SchemaName = "changes";

        /// <summary>
        /// Gets the column name used for tracking changed records
        /// </summary>
        public const string ChangeVersionColumnName = "ChangeVersion";

        /// <summary>
        /// Gets the column name used for storing the JsonPatch.
        /// </summary>
        public const string JsonPatchColumnName = "Patch";

        /// <summary>
        /// Prefix applied to the schema name holding the tracked change tables for a data standard schema.
        /// </summary>
        public const string TrackedChangesSchemaPrefix = "tracked_events_";

        /// <summary>
        /// Prefix applied to the identifier column name containing the previous value.
        /// </summary>
        public const string OldKeyValueColumnPrefix = "Old";
        
        /// <summary>
        /// Prefix applied to the identifier column name containing the new value.
        /// </summary>
        public const string NewKeyValueColumnPrefix = "New";
        public const string TrackedChangesAlias = "c";
    }
}