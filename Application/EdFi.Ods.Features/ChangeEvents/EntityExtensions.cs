using System.Collections.Generic;
using System.Linq;
using EdFi.Ods.Common.Models.Domain;

namespace EdFi.Ods.Features.ChangeEvents
{
    public static class EntityExtensions
    {
        public static IEnumerable<EntityProperty> GetChangeDataProperties(this Entity e)
        {
            return e.Identifier.Properties
                .Union(e.AlternateIdentifiers.SelectMany(i => i.Properties.Where(p => !IsResourceIdentifier(p))))
                .Union(e.BaseEntity?.AlternateIdentifiers.SelectMany(i => i.Properties.Where(p => !IsResourceIdentifier(p))) 
                    ?? Enumerable.Empty<EntityProperty>());
    
            bool IsResourceIdentifier(EntityProperty property) => property.PropertyName == "Id";
        }
    }
}