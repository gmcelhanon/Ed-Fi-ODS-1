using System.Collections.Generic;
using System.Linq;
using EdFi.Ods.CodeGen.Extensions;
using EdFi.Ods.CodeGen.Generators.Changes.Models;
using EdFi.Ods.CodeGen.Models;
using EdFi.Ods.Common.Extensions;
using EdFi.Ods.Common.Models.Domain;

namespace EdFi.Ods.CodeGen.Generators.Changes 
{
    public static class PropertyExtensions
    {
        public static IEnumerable<SingleColumnJoin> JoinForApiResourceData(this EntityProperty property, int joinAliasIndex)
        {
            if (property.IsLookup)
            {
                yield return new SingleColumnJoin(
                    property.LookupEntity.BaseEntity.Schema,
                    property.LookupEntity.BaseEntity.Name,
                    $"j{joinAliasIndex}",
                    property.PropertyType.IsNullable,
                    property.PropertyName,
                    property.LookupEntity.BaseAssociation.PropertyMappings.Single().OtherProperty.PropertyName
                );
            }
            else if (property.IsUSIUsage())
            {
                var personEntity = property.DefiningEntity;

                yield return new SingleColumnJoin(
                    personEntity.Schema, 
                    personEntity.Name,
                    $"j{joinAliasIndex}",
                    property.PropertyType.IsNullable,
                    property.PropertyName,
                    personEntity.Identifier.Properties.Single().PropertyName
                );
            }
        }
    }
}