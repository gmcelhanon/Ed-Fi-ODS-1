using System;
using System.Linq;
using EdFi.Ods.CodeGen.TemplateModels.Changes;
using EdFi.Ods.CodeGen.TemplateModels.Changes.Models;
using EdFi.Ods.Common.Models.Domain;

namespace EdFi.Ods.CodeGen.TemplateModels
{
    public class Changes_0035_CreateTrackedChangeTables : TemplateModelBase
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
                .Select(e => 
                    new ChangeDataTable
                    {
                        Schema = e.Schema,
                        TableName = e.Name,
                        HasDiscriminator = e.HasDiscriminator(),
                        ChangeDataColumns = ChangesHelpers.GetChangeQueriesPropertiesForColumns(e)
                            .SelectMany((p, i) => p.ExpandForApiResourceData(i))
                            .Select(c => 
                                new ChangeDataColumn
                                {
                                    ColumnName = c.ColumnName,
                                    ColumnDataType = c.ColumnDataType,
                                    // To match MetaEd plugin character-for-character
                                    // ColumnDataType = "[" 
                                    //     + c.ColumnDataType.Replace("(", "](").ToUpper()
                                    //     + (c.ColumnDataType.Contains("(") ? string.Empty : "]")
                                })
                    })
                .OrderBy(e => e.TableName + "_", StringComparer.Ordinal);

            return new { AllAggregateRootEntities = allAggregateRootEntities };
        }
    }
}
