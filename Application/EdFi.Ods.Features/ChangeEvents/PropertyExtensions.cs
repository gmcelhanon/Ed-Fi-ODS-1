using System.Collections.Generic;
using System.Data;
using EdFi.Common.Extensions;
using EdFi.Ods.Common.Infrastructure.Database.NamingConventions;
using EdFi.Ods.Common.Models.Domain;

namespace EdFi.Ods.Features.ChangeEvents
{
    public static class PropertyExtensions
    {
        public static IEnumerable<ChangeEventColumn> ExpandForApiResourceData(this EntityProperty property, int joinAliasIndex, 
            IDatabaseNamingConvention databaseNamingConvention)
        {
            yield return new ChangeEventColumn(property.PropertyName, databaseNamingConvention.ColumnName(property.PropertyName), property.PropertyType.DbType);
            
            if (property.IsDescriptorUsage)
            {
                string namespacePropertyName = property.PropertyName.ReplaceSuffix("Id", "Namespace");

                yield return new ChangeEventColumn(
                    namespacePropertyName,
                    databaseNamingConvention.ColumnName(namespacePropertyName),
                    DbType.String,
                    $"j{joinAliasIndex}.{databaseNamingConvention.ColumnName(property.DescriptorEntity.BaseEntity.PropertyByName["Namespace"].PropertyName)}");

                string codeValuePropertyName = property.PropertyName.ReplaceSuffix("Id", "CodeValue");

                yield return new ChangeEventColumn(
                    codeValuePropertyName,
                    databaseNamingConvention.ColumnName(codeValuePropertyName),
                    DbType.String,
                    $"j{joinAliasIndex}.{databaseNamingConvention.ColumnName(property.DescriptorEntity.BaseEntity.PropertyByName["CodeValue"].PropertyName)}");
            }
            else if (property.IsUSIUsage())
            {
                var personEntity = property.PersonEntity();

                string uniqueIdPropertyName = property.PropertyName.ReplaceSuffix("USI", "UniqueId");

                yield return new ChangeEventColumn(
                    uniqueIdPropertyName,
                    databaseNamingConvention.ColumnName(uniqueIdPropertyName),
                    DbType.String,
                    $"j{joinAliasIndex}.{databaseNamingConvention.ColumnName(personEntity.PropertyByName[personEntity.Name + "UniqueId"].PropertyName)}");
            }
        }
    }
}