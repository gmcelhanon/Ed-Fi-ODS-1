// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System.Collections.Generic;
using System.Linq;
using EdFi.Common.Extensions;
using EdFi.Ods.Common.Infrastructure.Database.NamingConventions;
using EdFi.Ods.Common.Models.Domain;

namespace EdFi.Ods.Features.ChangeEvents
{
    // Move to Change Events feature

    public static class EntityPropertyExtensions
    {
        /// <summary>
        /// Indicates whether the entity property represent a <em>usage</em> of an USI (internal surrogate id for a person)
        /// rather than the definition of it (on a the associated Person entity).
        /// </summary>
        /// <param name="entityProperty">The entity property to be evaluated.</param>
        /// <returns><b>true</b> is the property is a usage (downstream foreign key of the USI definition); otherwise <b>false</b>.</returns>
        public static bool IsUSIUsage(this EntityProperty entityProperty)
        {
            return
                entityProperty.PropertyName.EndsWith("USI")
                && entityProperty.IncomingAssociations.Any()
                && entityProperty.Entity.Name != entityProperty.PropertyName.TrimSuffix("USI");
        }
        public static Entity PersonEntity(this EntityProperty entityProperty)
        {
            if (!IsUSIUsage(entityProperty))
                return null;
            var currentProperty = entityProperty;
            while (currentProperty.IncomingAssociations.Any())
            {
                currentProperty = currentProperty.IncomingAssociations.First()
                    .PropertyMappingByThisName[currentProperty.PropertyName]
                    .OtherProperty;
            }
            return currentProperty.Entity;
        }
        
        public static IEnumerable<SingleColumnJoin> JoinForApiResourceData(this EntityProperty property, int joinAliasIndex,
            IDatabaseNamingConvention databaseNamingConvention)
        {
            if (property.IsDescriptorUsage)
            {
                yield return new SingleColumnJoin(
                    property.DescriptorEntity.BaseEntity.Schema,
                    databaseNamingConvention.TableName(property.DescriptorEntity.BaseEntity),
                    $"j{joinAliasIndex}",
                    property.PropertyType.IsNullable,
                    databaseNamingConvention.ColumnName(property),
                    databaseNamingConvention.ColumnName(property.DescriptorEntity.BaseAssociation.PropertyMappings.Single().OtherProperty)
                );
            }
            else if (property.IsUSIUsage())
            {
                var personEntity = property.PersonEntity();
                
                yield return new SingleColumnJoin(
                    personEntity.Schema, 
                    databaseNamingConvention.TableName(personEntity),
                    $"j{joinAliasIndex}",
                    property.PropertyType.IsNullable,
                    databaseNamingConvention.ColumnName(property),
                    databaseNamingConvention.ColumnName(personEntity.Identifier.Properties.Single())
                );
            }
        }
    }    
}
