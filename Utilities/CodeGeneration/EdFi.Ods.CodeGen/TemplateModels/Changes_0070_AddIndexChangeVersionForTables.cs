using System;
using System.Linq;
using EdFi.Ods.Common.Models.Domain;

namespace EdFi.Ods.CodeGen.TemplateModels
{
    public class Changes_0070_AddIndexChangeVersionForTables : TemplateModelBase
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
                .Select(e => new
                {
                    Schema = e.Schema,
                    TableName = e.Name
                })
                .OrderBy(e => e.TableName, StringComparer.Ordinal);

            return new { NonDerivedAggregateRoots = nonDerivedAggregateRoots};
        }
    }
}
