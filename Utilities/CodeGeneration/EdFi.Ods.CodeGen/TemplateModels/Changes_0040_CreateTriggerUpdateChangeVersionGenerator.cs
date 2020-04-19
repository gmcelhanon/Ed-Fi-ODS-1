using System;
using System.Linq;
using EdFi.Ods.CodeGen.TemplateModels.Changes;
using EdFi.Ods.CodeGen.TemplateModels.Changes.Models;
using EdFi.Ods.Common.Models.Domain;

namespace EdFi.Ods.CodeGen.TemplateModels
{
    public class Changes_0040_CreateTriggerUpdateChangeVersionGenerator : TemplateModelBase
    {
        private Func<Entity, bool> _shouldRenderEntityForSchema;

        protected override void Configure()
        {
            _shouldRenderEntityForSchema = TemplateContext.ShouldRenderEntity;
        }

        protected override object BuildTemplateModel()
        {
            var domainModel = TemplateContext.DomainModelProvider.GetDomainModel();

            var nonDerivedAggregateRoots = domainModel.Aggregates
                .Select(a => a.AggregateRoot)
                .Where(e => !e.IsDerived)
                .Where(e => _shouldRenderEntityForSchema(e))
                .Select(e => new ChangeDataTable
                {
                    Schema = e.Schema,
                    TableName = e.Name,
                    HasDiscriminator = e.HasDiscriminator(),
                    KeyValuesCanChange = false, // Key Changes and resulting cascading changes not yet supported.
                    IdentifyingColumns = (e.Identifier.Properties.Any(p => p.IsServerAssigned) && e.AlternateIdentifiers.Any() 
                            ? e.AlternateIdentifiers.First() 
                            : e.Identifier)
                                .Properties.Select((p, i) => 
                                    new SimpleColumn
                                    {
                                        IsFirst = i == 0,
                                        ColumnName = p.PropertyName
                                    }),
                    ChangeDataColumns = ChangesHelpers.GetChangeQueriesPropertiesForColumns(e)
                        .SelectMany((p, i) => p.ExpandForApiResourceData(i))
                        .Select((c, i) => 
                                new ChangeDataColumn
                                {
                                    IsFirst = i == 0,
                                    ColumnName = c.ColumnName,
                                    SourceSelectExpression = c.SelectExpression,
                                }),
                    Joins = ChangesHelpers.GetChangeQueriesPropertiesForColumns(e)
                        .SelectMany((p, i) => p.JoinForApiResourceData(i))
                })
                .OrderBy(e => e.TableName, StringComparer.Ordinal);

            return new { NonDerivedAggregateRoots = nonDerivedAggregateRoots};
        }
    }
}
