// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System.Linq;
using EdFi.Ods.CodeGen.Models;
using EdFi.Ods.Common.Models.Domain;

namespace EdFi.Ods.CodeGen.Extensions
{
    public static class EntityExtensions
    {
        public static string TableNameForContext(this Entity entity, TemplateContext context)
        {
            return entity.TableNameByDatabaseEngine[context.TemplateSet.DatabaseEngine];
        }

        /// <summary>
        /// Gets the natural primary key or alternate key for the specified entity if one exists.
        /// </summary>
        /// <param name="entity">The entity whose natural key is sought.</param>
        /// <returns>The primary or alternate natural key identifier if it exists; otherwise the server-assigned primary key identifier.</returns>
        public static EntityIdentifier GetNaturalIdentifierOrDefault(this Entity entity)
        {
            return (entity.Identifier.IsServerAssigned() && entity.AlternateIdentifiers.Any()
                ? entity.AlternateIdentifiers.First()
                : entity.Identifier);
        }
    }
}
