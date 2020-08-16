using System;
using System.Linq;
using EdFi.Ods.CodeGen.Extensions;
using EdFi.Ods.CodeGen.Generators.Changes;
using EdFi.Ods.CodeGen.Generators.Changes.Models;
using EdFi.Ods.Common.Models.Domain;

namespace EdFi.Ods.CodeGen.Generators
{
    public class Changes_0035_CreateTrackedChangeTables : GeneratorBase
    {
        private Func<Entity, bool> _shouldRenderEntityForSchema;

        protected override void Configure()
        {
            _shouldRenderEntityForSchema = TemplateContext.ShouldRenderEntity;
        }

        protected override object Build()
        {
            var domainModel = TemplateContext.DomainModelProvider.GetDomainModel();

            var trackedTables = domainModel.Aggregates
                .Select(a => a.AggregateRoot)
                .Where(e => !e.IsSchoolYearTypeEntity())
                .Where(e => _shouldRenderEntityForSchema(e))
                .Select(e => 
                    new ChangeDataTable
                    {
                        Schema = e.Schema,
                        TableName = e.TableNameForContext(TemplateContext),
                        HasDiscriminator = e.HasDiscriminator(),
                        ChangeDataColumns = ChangesHelpers.GetIdentifyingPropertiesForChangeTracking(e)
                            .SelectMany((p, i) => ChangesHelpers.CreateChangeTrackingDataColumns(p, i, TemplateContext))
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
                // For matching MetaEd Change Queries sort order
                .OrderBy(e => e.TableName + "_", StringComparer.Ordinal);

            return new { TrackedTables = trackedTables };
        }
    }
}
