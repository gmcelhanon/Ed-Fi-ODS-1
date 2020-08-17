// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System.Collections.Generic;
using System.Linq;
using EdFi.Ods.CodeGen.Extensions;
using EdFi.Ods.CodeGen.Generators.Changes.Models;
using EdFi.Ods.CodeGen.Models;
using EdFi.Ods.Common.Extensions;
using EdFi.Ods.Common.Models.Domain;

namespace EdFi.Ods.CodeGen.Generators.Changes
{
    public class ChangesHelpers
    {
        public static IEnumerable<EntityProperty> GetIdentifyingPropertiesForChangeTracking(Entity e)
        {
            return e.Identifier.Properties
                .Union(e.AlternateIdentifiers.SelectMany(i => i.Properties.Where(p => !IsResourceIdentifier(p))))
                .Union(e.InheritedAlternateIdentifiers.SelectMany(i => i.Properties.Where(p => !IsResourceIdentifier(p))));

            bool IsResourceIdentifier(EntityProperty property) => property.PropertyName == "Id";
        }

        public static IEnumerable<Column> CreateChangeTrackingDataColumns(EntityProperty property, int joinAliasIndex, TemplateContext context)
        {
            yield return new Column(context, property);

            // Is this a descriptor?
            if (property.IsLookup)
            {
                // Add a Namespace column
                yield return new Column(
                    context,
                    property.PropertyName.ReplaceSuffix("Id", "Namespace"),
                    property.LookupEntity.BaseEntity.PropertyByName["Namespace"].PropertyType,
                    $"j{joinAliasIndex}.{property.LookupEntity.BaseEntity.PropertyByName["Namespace"].PropertyName}");

                // Add a CodeValue column
                yield return new Column(
                    context,
                    property.PropertyName.ReplaceSuffix("Id", "CodeValue"),
                    property.LookupEntity.BaseEntity.PropertyByName["CodeValue"].PropertyType,
                    $"j{joinAliasIndex}.{property.LookupEntity.BaseEntity.PropertyByName["CodeValue"].PropertyName}");
            }
            else if (property.IsUSIUsage())
            {
                var personEntity = property.DefiningEntity;

                // Add a UniqueId column
                yield return new Column(
                    context,
                    property.PropertyName.ReplaceSuffix("USI", "UniqueId"),
                    personEntity.PropertyByName[personEntity.Name + "UniqueId"].PropertyType, 
                    $"j{joinAliasIndex}.{personEntity.PropertyByName[personEntity + "UniqueId"].PropertyName}");
            }
        }
    }
}
