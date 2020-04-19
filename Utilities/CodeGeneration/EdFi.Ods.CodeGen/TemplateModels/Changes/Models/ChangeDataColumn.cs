namespace EdFi.Ods.CodeGen.TemplateModels.Changes.Models
{
    public class ChangeDataColumn 
    {
        public bool IsFirst { get; set; }

        public string ColumnName { get; set; }

        public string BaseColumnName { get; set; }
        
        public string ColumnDataType { get; set; }

        public string SourceSelectExpression { get; set; }
    }
}