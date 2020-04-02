using System;
using System.Linq;
using EdFi.Ods.Common.Models.Domain;
using log4net.DateFormatter;

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
                .Where(e => e.FullName != new FullName("edfi", "SchoolYearType"))
                .Where(e => _shouldRenderEntityForSchema(e))
                .ToList();

            var derivedAggregateRoots = allAggregateRootEntities
                .Where(e => e.IsDerived)
                .Select(
                    e => new
                    {
                        IsDerived = e.IsDerived,
                        Schema = e.Schema,
                        TableName = e.Name,
                        BaseTableSchema = e.BaseEntity.Schema,
                        BaseTableName = e.BaseEntity.Name,
                        PrimaryKeyColumns = e.BaseAssociation.PropertyMappings.Select(
                            (pm, i) => new
                            {
                                IsFirst = i == 0,
                                ColumnName = pm.ThisProperty.PropertyName,
                                BaseColumnName = pm.OtherProperty.PropertyName,
                            })
                    });

            var nonDerivedAggregateRoots = allAggregateRootEntities
                .Where(e => !e.IsDerived)
                .Select(
                    e => new
                    {
                        IsDerived = e.IsDerived,
                        Schema = e.Schema,
                        TableName = e.Name,
                        BaseTableSchema = null as string,
                        BaseTableName = null as string,
                        PrimaryKeyColumns = e.Identifier.Properties.Select(
                            (p, i) => new
                            {
                                IsFirst = i == 0,
                                ColumnName = p.PropertyName,
                                BaseColumnName = null as string,
                            })
                    });

            var aggregateRoots = 
                derivedAggregateRoots
                .Concat(nonDerivedAggregateRoots)
                .OrderBy(e => e.TableName + "_", StringComparer.Ordinal);

            return new { AggregateRoots = aggregateRoots};
        }
    }
}
