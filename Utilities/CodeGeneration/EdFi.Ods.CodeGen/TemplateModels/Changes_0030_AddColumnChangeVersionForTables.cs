using System;
using System.Linq;
using EdFi.Ods.CodeGen.TemplateModels.Changes.Models;
using EdFi.Ods.Common.Models.Domain;

namespace EdFi.Ods.CodeGen.TemplateModels
{
    public class Changes_0030_AddColumnChangeVersionForTables : TemplateModelBase
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
                .Select(e => 
                    new SimpleTable
                    {
                        Schema = e.Schema,
                        TableName = e.Name
                    })
                .OrderBy(e => e.TableName, StringComparer.Ordinal);

            return new { NonDerivedAggregateRoots = nonDerivedAggregateRoots};
        }
    }
}
