using System.Collections.Generic;
using System.Linq;
using EdFi.Ods.Common.Models.Domain;

namespace EdFi.Ods.CodeGen.TemplateModels.Changes 
{
    public class ChangesHelpers
    {
        public static IEnumerable<EntityProperty> GetChangeQueriesPropertiesForColumns(Entity e)
        {
            return e.Identifier.Properties
                .Union(e.AlternateIdentifiers.SelectMany(i => i.Properties.Where(p => p.PropertyName != "Id")))
                .Union(e.BaseEntity?.AlternateIdentifiers.SelectMany(i => i.Properties.Where(p => p.PropertyName != "Id")) ?? Enumerable.Empty<EntityProperty>());
        }
    }
}