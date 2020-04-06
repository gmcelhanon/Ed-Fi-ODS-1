using System;
using System.Collections.Generic;
using System.Linq;
using EdFi.Ods.CodeGen.Extensions;
using EdFi.Ods.Common.Extensions;
using EdFi.Ods.Common.Models.Domain;
using EdFi.Ods.Common.Specifications;

namespace EdFi.Ods.CodeGen.TemplateModels
{
    public class Changes_0050_CreateTrackedDeleteTables : TemplateModelBase
    {
        private Func<Entity, bool> _shouldRenderEntityForSchema;

        protected override void Configure()
        {
            _shouldRenderEntityForSchema = TemplateContext.ShouldRenderEntity;
        }

        protected override object BuildTemplateModel()
        {
            var domainModel = TemplateContext.DomainModelProvider.GetDomainModel();

            var allAggregateRootEntities = domainModel.Aggregates
                .Select(a => a.AggregateRoot)
                .Where(e => !e.IsSchoolYearType())
                .Where(e => _shouldRenderEntityForSchema(e))
                .Select(e => new
                {
                    Schema = e.Schema,
                    TableName = e.Name,
                    PrimaryKeyColumns = e.Identifier.Properties
                        .Union(e.AlternateIdentifiers.SelectMany(i => i.Properties.Where(p => p.PropertyName != "Id")))
                        .Union(e.BaseEntity?.AlternateIdentifiers.SelectMany(i => i.Properties.Where(p => p.PropertyName != "Id")) ?? Enumerable.Empty<EntityProperty>())
                        .SelectMany(p => p.ExpandForApiResourceData())
                        .Select(p => new
                    {
                        ColumnName = p.PropertyName,
                        DataType = "[" 
                            + p.PropertyType.ToSql().Replace("(", "](").ToUpper()
                            + (p.PropertyType.ToSql().Contains("(") ? string.Empty : "]")
                    })
                })
                .OrderBy(e => e.TableName + "_", StringComparer.Ordinal);

            return new { AllAggregateRootEntities = allAggregateRootEntities};
        }

        public class Property
        {
            public Property(EntityProperty property)
            {
                PropertyName = property.PropertyName;
                PropertyType = property.PropertyType;
            }

            public Property(string propertyName, PropertyType propertyType)
            {
                PropertyName = propertyName;
                PropertyType = propertyType;
            }
            
            public string PropertyName { get; }
            public PropertyType PropertyType { get; }
        }
    }
    
    public static class PropertyExtensions
    {
        public static IEnumerable<Changes_0050_CreateTrackedDeleteTables.Property> ExpandForApiResourceData(this EntityProperty property)
        {
            yield return new Changes_0050_CreateTrackedDeleteTables.Property(property);

            if (property.IsLookup)
            {
                yield return new Changes_0050_CreateTrackedDeleteTables.Property(
                    property.PropertyName.ReplaceSuffix("Id", "Namespace"),
                    property.LookupEntity.BaseEntity.PropertyByName["Namespace"].PropertyType);

                yield return new Changes_0050_CreateTrackedDeleteTables.Property(
                    property.PropertyName.ReplaceSuffix("Id", "CodeValue"),
                    property.LookupEntity.BaseEntity.PropertyByName["CodeValue"].PropertyType);
            }
            else if (property.IsUSIUsage())
            {
                var personEntity = property.PersonEntity();

                yield return new Changes_0050_CreateTrackedDeleteTables.Property(
                    property.PropertyName.ReplaceSuffix("USI", "UniqueId"),
                    personEntity.PropertyByName[personEntity + "UniqueId"].PropertyType);
            }
        } 
    }
}
