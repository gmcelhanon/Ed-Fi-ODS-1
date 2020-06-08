// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.
 
using System;
using System.Collections.Generic;
using EdFi.Ods.Common.Extensions;
using EdFi.Ods.Common.Models.Domain;

namespace EdFi.Ods.Common.Models.Resource
{
    public class Extension : ResourceMemberBase
    {
        internal Extension(
            ResourceClassBase resourceClass,
            Entity entity,
            FilterContext childFilterContext,
            string schemaPhysicalName,
            IReadOnlyList<AssociationView> extensionCollections,
            IReadOnlyList<AssociationView> extensionOneToOnes,
            string displayName)
        : base(resourceClass, displayName, displayName.ToCamelCase())
        {
            ObjectType = new ResourceChildItem(
                resourceClass.ResourceModel,
                new FullName(schemaPhysicalName, $"{entity.Name}Extension"),
                childFilterContext,
                this,
                extensionCollections,
                extensionOneToOnes);

            if (resourceClass.Entity != null)
            {
                ParentFullName = resourceClass.Entity.FullName;
            }
        }
        
        internal Extension(
            ResourceClassBase resourceClass,
            AssociationView association,
            FilterContext childFilterContext,
            IReadOnlyList<AssociationView> collectionAssociations,
            IReadOnlyList<AssociationView> embeddedObjectAssociations)
            : base(resourceClass, association.Name)
        {
            ObjectType = new ResourceChildItem(
                resourceClass.ResourceModel,
                association.OtherEntity,
                childFilterContext,
                this,
                collectionAssociations,
                embeddedObjectAssociations);

            ParentFullName = association.ThisEntity.FullName;
        }

        // /// <summary>
        // /// Returns the AssociationView for the extension if it exists; otherwise (the Extension member has been implicitly added
        // /// for the sake of child collections and/or embedded objects) <b>null</b>.
        // /// </summary>
        // public AssociationView Association { get; }

        public ResourceChildItem ObjectType { get; }

        public override FullName ParentFullName { get; }
    }
}
