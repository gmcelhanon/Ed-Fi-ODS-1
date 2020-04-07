using System;
using System.Linq;
using EdFi.Ods.CodeGen.Extensions;
using EdFi.Ods.CodeGen.TemplateModels.Changes;
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
                .Where(e => !e.IsSchoolYearTypeEntity())
                .Where(e => _shouldRenderEntityForSchema(e))
                .Select(e => new
                {
                    Schema = e.Schema,
                    TableName = e.Name,
                    HasDiscriminator = e.HasDiscriminator(),
                    ChangeDataColumns = ChangesHelpers.GetChangeQueriesPropertiesForColumns(e)
                        .SelectMany((p, i) => p.ExpandForApiResourceData(i))
                        .Select(p => new
                    {
                        ColumnName = p. PropertyName,
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
