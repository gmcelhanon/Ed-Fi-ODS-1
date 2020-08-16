using System;
using System.Linq;
using EdFi.Ods.CodeGen.Extensions;
using EdFi.Ods.CodeGen.Generators.Changes;
using EdFi.Ods.CodeGen.Generators.Changes.Models;
using EdFi.Ods.Common.Models.Domain;

namespace EdFi.Ods.CodeGen.Generators
{
    public class Changes_0040_CreateTriggerUpdateChangeVersionGenerator : GeneratorBase
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
                .Where(e => !e.IsDerived)
                .Where(e => _shouldRenderEntityForSchema(e))
                .Select(e => 
                    new ChangeDataTable
                    {
                        Schema = e.Schema,
                        TableName = e.Name,
                        HasDiscriminator = e.HasDiscriminator(),
                        KeyValuesCanChange = false, // Key Changes and resulting cascading changes are not yet supported.
                        IdentifyingColumns = e.GetNaturalIdentifierOrDefault().Properties
                            .Select((p, i) => 
                                new Column
                                {
                                    IsFirst = i == 0,
                                    ColumnName = p.PropertyName
                                }),
                        ChangeDataColumns = ChangesHelpers.GetIdentifyingPropertiesForChangeTracking(e)
                            .SelectMany((p, i) => ChangesHelpers.CreateChangeTrackingDataColumns(p, i, TemplateContext))
                            .Select((c, i) => 
                                    new ChangeDataColumn
                                    {
                                        IsFirst = i == 0,
                                        ColumnName = c.ColumnName,
                                        SourceSelectExpression = c.SourceSelectExpression,
                                    }),
                        Joins = ChangesHelpers.GetIdentifyingPropertiesForChangeTracking(e)
                            .SelectMany((p, i) => p.JoinForApiResourceData(i))
                    })
                .OrderBy(e => e.TableName, StringComparer.Ordinal);

            return new { TrackedTables = trackedTables};
        }
    }
}
