using System.Collections.Generic;
using System.Linq;
using EdFi.Ods.CodeGen.Extensions;
using EdFi.Ods.Common.Extensions;
using EdFi.Ods.Common.Models.Domain;

namespace EdFi.Ods.CodeGen.TemplateModels.Changes 
{
    public static class PropertyExtensions
    {
        public static IEnumerable<Property> ExpandForApiResourceData(this EntityProperty property, int joinAliasIndex)
        {
            yield return new Property(property);

            if (property.IsLookup)
            {
                yield return new Property(
                    property.PropertyName.ReplaceSuffix("Id", "Namespace"),
                    property.LookupEntity.BaseEntity.PropertyByName["Namespace"].PropertyType,
                    $"j{joinAliasIndex}.{property.LookupEntity.BaseEntity.PropertyByName["Namespace"].PropertyName}");

                yield return new Property(
                    property.PropertyName.ReplaceSuffix("Id", "CodeValue"),
                    property.LookupEntity.BaseEntity.PropertyByName["CodeValue"].PropertyType,
                    $"j{joinAliasIndex}.{property.LookupEntity.BaseEntity.PropertyByName["CodeValue"].PropertyName}");
            }
            else if (property.IsUSIUsage())
            {
                var personEntity = property.PersonEntity();

                yield return new Property(
                    property.PropertyName.ReplaceSuffix("USI", "UniqueId"),
                    personEntity.PropertyByName[personEntity + "UniqueId"].PropertyType, 
                    $"j{joinAliasIndex}.{personEntity.PropertyByName[personEntity + "UniqueId"].PropertyName}");
            }
        }

        public static IEnumerable<Join> JoinForApiResourceData(this EntityProperty property, int joinAliasIndex)
        {
            if (property.IsLookup)
            {
                yield return new Join(
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
                var personEntity = property.PersonEntity();

                yield return new Join(
                    personEntity.Schema, 
                    personEntity.Name,
                    $"j{joinAliasIndex}",
                    property.PropertyType.IsNullable,
                    property.PropertyName,
                    personEntity.Identifier.Properties.Single().PropertyName
                );
            }
        }

        public class Join
        {
            public Join(string schema, string tableName, string joinAlias, bool isLeftJoin, string thisJoinColumnName, string otherJoinColumnName)
            {
                Schema = schema;
                TableName = tableName;
                JoinAlias = joinAlias;
                IsLeftJoin = isLeftJoin;
                ThisJoinColumnName = thisJoinColumnName;
                OtherJoinColumnName = otherJoinColumnName;
            }

            public string Schema { get; }

            public string TableName { get; }

            public string JoinAlias { get; }

            public bool IsLeftJoin { get; }

            public string ThisJoinColumnName { get; set; }

            public string OtherJoinColumnName { get; set; }
        }
    }
}