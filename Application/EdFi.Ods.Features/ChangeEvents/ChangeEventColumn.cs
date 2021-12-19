using System.Data;

namespace EdFi.Ods.Features.ChangeEvents
{
    /// <summary>
    /// Represents a column with just a name.
    /// </summary>
    public class ChangeEventColumn
    {
        public ChangeEventColumn() { }
        
        public ChangeEventColumn(
            string propertyName,
            string columnName,
            DbType dbType,
            string selectExpression = null,
            bool? isFirst = null)
        {
            ColumnName = columnName;
            PropertyName = propertyName;
            DbType = dbType;
            SelectExpression = selectExpression;
            IsFirst = isFirst;
        }

        public string PropertyName { get; set; }

        public string ColumnName { get; set; }

        public DbType DbType { get; set; }
        
        /// <summary>
        /// Contains the SELECT expression for the column (when used in SQL DML generation).
        /// </summary>
        public string SelectExpression { get; set; }
        
        /// <summary>
        /// Indicates whether the column is the first columns in a set, or <b>null</b> if this is not known or relevant.
        /// </summary>
        public bool? IsFirst { get; set; }
    }
}