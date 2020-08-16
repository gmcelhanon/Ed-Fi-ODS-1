// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Linq;
using EdFi.Ods.CodeGen.Generators.Changes.Models;
using EdFi.Ods.Common.Models.Domain;

namespace EdFi.Ods.CodeGen.Generators
{
    public class Changes_0030_AddColumnChangeVersionForTables : GeneratorBase
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
                    new Table
                    {
                        Schema = e.Schema,
                        TableName = e.Name
                    })
                .OrderBy(e => e.TableName, StringComparer.Ordinal);

            return new
            {
                TrackedTables = trackedTables
            };
        }
    }
}
