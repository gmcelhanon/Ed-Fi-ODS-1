using System;
using System.Linq;
using EdFi.Ods.CodeGen.Models;
using EdFi.Ods.Common.Configuration;
using EdFi.Ods.Common.Extensions;
using EdFi.Ods.Common.Models.Domain;

namespace EdFi.Ods.CodeGen.Extensions
{
    public static class EntityPropertyExtensions
    {
        public static string ColumnNameForContext(this EntityProperty property, TemplateContext context)
        {
            return property.ColumnNameByDatabaseEngine[context.TemplateSet.DatabaseEngine];
        }
        
        public static string ColumnNameForContext(this string propertyName, TemplateContext context)
        {
            var databaseEngine = context.TemplateSet.DatabaseEngine;
            
            if (databaseEngine == DatabaseEngine.SqlServer)
            {
                return propertyName;
            }

            if (databaseEngine == DatabaseEngine.Postgres)
            {
                if (propertyName.Length > 65)
                {
                    throw new NotSupportedException("Long property names are not yet supported for Postgres.");
                }
                
                return propertyName.ToLower();
            }
            
            throw new NotSupportedException($"Column name translation for database engine '{databaseEngine}' is not yet supported.");
        }

        public static string DataTypeForContext(this EntityProperty property, TemplateContext context)
        {
            return DataTypeForContext(property.PropertyType, context);
        }

        public static string DataTypeForContext(this PropertyType propertyType, TemplateContext context)
        {
            if (context.TemplateSet.DatabaseEngine == DatabaseEngine.SqlServer)
            {
                return propertyType.ToSql();
            }
            
            throw new NotSupportedException($"Data type definitions not yet supported for '{context.TemplateSet.DatabaseEngine}'.");
        }

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

        /// <summary>
        /// 
        /// </summary>
        /// <param name="entityProperty"></param>
        /// <returns></returns>
        // public static Entity PersonEntity(this EntityProperty entityProperty)
        // {
        //     if (!IsUSIUsage(entityProperty))
        //         return null;
        //
        //     var currentProperty = entityProperty;
        //
        //     while (currentProperty.IncomingAssociations.Any())
        //     {
        //         currentProperty = currentProperty.IncomingAssociations.First()
        //             .PropertyMappingByThisName[currentProperty.PropertyName]
        //             .OtherProperty;
        //     }
        //
        //     return currentProperty.Entity;
        // }
    }
}
