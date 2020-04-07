using System;
using System.Collections.Generic;
using System.Linq;
using EdFi.Ods.CodeGen.Extensions;
using EdFi.Ods.CodeGen.TemplateModels.Changes;
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
                .Where(e => !e.IsSchoolYearTypeEntity())
                .Where(e => _shouldRenderEntityForSchema(e))
                .ToList();

            var derivedAggregateRoots = allAggregateRootEntities
                .Where(e => e.IsDerived)
                .Select(
                    e => new ChangeDataTable
                    {
                        IsDerived = e.IsDerived,
                        Schema = e.Schema,
                        TableName = e.Name,
                        HasDiscriminator = e.HasDiscriminator(),
                        BaseTableSchema = e.BaseEntity.Schema,
                        BaseTableName = e.BaseEntity.Name,
                        ChangeDataColumns = e.BaseAssociation.PropertyMappings.Select(
                            (pm, i) => new ChangeDataColumn
                            {
                                IsFirst = i == 0,
                                ColumnName = pm.ThisProperty.PropertyName,
                                BaseColumnName = pm.OtherProperty.PropertyName
                            })
                    });

            var nonDerivedAggregateRoots = allAggregateRootEntities
                .Where(e => !e.IsDerived)
                .Select(
                    e => new ChangeDataTable
                    {
                        IsDerived = e.IsDerived,
                        Schema = e.Schema,
                        TableName = e.Name,
                        HasDiscriminator = e.HasDiscriminator(),
                        ChangeDataColumns = ChangesHelpers.GetChangeQueriesPropertiesForColumns(e)
                            .SelectMany((p, i) => p.ExpandForApiResourceData(i))
                            .Select(
                                (p, i) => new ChangeDataColumn
                                {
                                    IsFirst = i == 0,
                                    ColumnName = p.PropertyName,
                                    SourceSelectExpression = p.SourceSelectExpression,
                                    BaseColumnName = null as string
                                }),
                        Joins = ChangesHelpers.GetChangeQueriesPropertiesForColumns(e)
                            .SelectMany((p, i) => p.JoinForApiResourceData(i))
                    });

            var aggregateRoots = 
                derivedAggregateRoots
                .Concat(nonDerivedAggregateRoots)
                .OrderBy(e => e.TableName + "_", StringComparer.Ordinal);

            return new { AggregateRoots = aggregateRoots};
        }

        public class ChangeDataTable
        {
            public bool IsDerived { get; set; }

            public string Schema { get; set; }

            public string TableName { get; set; }

            public string BaseTableSchema { get; set; }

            public string BaseTableName { get; set; }

            public IEnumerable<ChangeDataColumn> ChangeDataColumns { get; set; }

            public IEnumerable<PropertyExtensions.Join> Joins { get; set; }

            public bool HasDiscriminator { get; set; }

            public bool KeyIsUpdatable { get; set; }
        }

        public class ChangeDataColumn 
        {
            public bool IsFirst { get; set; }

            public string ColumnName { get; set; }

            public string BaseColumnName { get; set; }

            public string SourceSelectExpression { get; set; }
        }
    }
}
