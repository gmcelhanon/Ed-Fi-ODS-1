using System;
using System.Linq;
using EdFi.Ods.CodeGen.TemplateModels.Changes;
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
                .Select(e => new Changes_0060_CreateDeletedForTrackingTriggers.ChangeDataTable
                {
                    Schema = e.Schema,
                    TableName = e.Name,
                    HasDiscriminator = e.HasDiscriminator(),
                    KeyIsUpdatable = e.Identifier.IsUpdatable,
                    ChangeDataColumns = ChangesHelpers.GetChangeQueriesPropertiesForColumns(e)
                        .SelectMany((p, i) => p.ExpandForApiResourceData(i))
                        .Select(
                            (p, i) => new Changes_0060_CreateDeletedForTrackingTriggers.ChangeDataColumn
                            {
                                IsFirst = i == 0,
                                ColumnName = p.PropertyName,
                                SourceSelectExpression = p.SourceSelectExpression,
                                BaseColumnName = null as string
                            }),
                    Joins = ChangesHelpers.GetChangeQueriesPropertiesForColumns(e)
                        .SelectMany((p, i) => p.JoinForApiResourceData(i))
                })
                .OrderBy(e => e.TableName, StringComparer.Ordinal);

            return new { NonDerivedAggregateRoots = nonDerivedAggregateRoots};
        }
    }
}
