using System;
using System.Linq;
using EdFi.Ods.Common.Models.Domain;

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
                .Where(e => e.FullName != new FullName("edfi", "SchoolYearType"))
                .Where(e => _shouldRenderEntityForSchema(e))
                .Select(e => new
                {
                    Schema = e.Schema,
                    TableName = e.Name,
                    PrimaryKeyColumns = e.Identifier.Properties.Select(p => new
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
    }
}
