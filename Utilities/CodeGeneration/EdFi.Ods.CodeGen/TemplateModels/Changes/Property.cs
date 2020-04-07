using EdFi.Ods.Common.Models.Domain;

namespace EdFi.Ods.CodeGen.TemplateModels.Changes 
{
    public class Property
    {
        public Property(EntityProperty property)
        {
            PropertyName = property.PropertyName;
            PropertyType = property.PropertyType;
        }

        public Property(string propertyName, PropertyType propertyType, string sourceSelectExpression = null)
        {
            PropertyName = propertyName;
            PropertyType = propertyType;
            SourceSelectExpression = sourceSelectExpression;
        }
            
        public string PropertyName { get; }
        public PropertyType PropertyType { get; }
        public string SourceSelectExpression { get; }
    }
}