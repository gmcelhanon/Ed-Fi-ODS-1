using System;
using System.Linq;
using EdFi.Ods.CodeGen.TemplateModels.Changes;
using EdFi.Ods.CodeGen.TemplateModels.Changes.Models;
using EdFi.Ods.Common.Models.Domain;

namespace EdFi.Ods.CodeGen.TemplateModels
{
    public class Changes_0060_CreateDeletedForTrackingTriggers : TemplateModelBase
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
                .ToList();

            var derivedAggregateRoots = allAggregateRootEntities
                .Where(e => e.IsDerived)
                .Select(e => 
                    new ChangeDataTable
                    {
                        IsDerived = e.IsDerived,
                        Schema = e.Schema,
                        TableName = e.Name,
                        HasDiscriminator = e.HasDiscriminator(),
                        BaseTableSchema = e.BaseEntity.Schema,
                        BaseTableName = e.BaseEntity.Name,
                        ChangeDataColumns = e.BaseAssociation.PropertyMappings
                            .Select((pm, i) => 
                                new ChangeDataColumn
                                {
                                    IsFirst = i == 0,
                                    ColumnName = pm.ThisProperty.PropertyName,
                                    BaseColumnName = pm.OtherProperty.PropertyName
                                })
                    });

            var nonDerivedAggregateRoots = allAggregateRootEntities
                .Where(e => !e.IsDerived)
                .Select(e => 
                    new ChangeDataTable
                    {
                        IsDerived = e.IsDerived,
                        Schema = e.Schema,
                        TableName = e.Name,
                        HasDiscriminator = e.HasDiscriminator(),
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
                    });

            var aggregateRoots = 
                derivedAggregateRoots
                .Concat(nonDerivedAggregateRoots)
                // Sort necessary only to achieve byte-level match with MetaEd plugin output
                .OrderBy(e => e.TableName + "_", StringComparer.Ordinal);

            return new { AggregateRoots = aggregateRoots};
        }
    }
}
