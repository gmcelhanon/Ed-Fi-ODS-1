// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Linq;
using EdFi.Ods.CodeGen.Generators.Changes.Models;
using EdFi.Ods.Common.Models.Domain;

namespace EdFi.Ods.CodeGen.Generators.Changes
{
    public class Changes_0070_CreateDeletedForTrackingTriggers : GeneratorBase
    {
        private Func<Entity, bool> _shouldRenderEntityForSchema;

        protected override void Configure()
        {
            _shouldRenderEntityForSchema = TemplateContext.ShouldRenderEntity;
        }

        protected override object Build()
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
                    });

            var trackedTables = 
                derivedAggregateRoots
                .Concat(nonDerivedAggregateRoots)
                // Sort necessary only to achieve byte-level match with MetaEd plugin output
                .OrderBy(e => e.TableName + "_", StringComparer.Ordinal);

            return new { TrackedTables = trackedTables};
        }
    }
}
