// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using EdFi.Ods.CodeGen.Extensions;
using EdFi.Ods.CodeGen.Models;
using EdFi.Ods.Common.Models.Domain;

namespace EdFi.Ods.CodeGen.Generators.Changes.Models
{
    /// <summary>
    /// Represents a column with just a name and SQL data type.
    /// </summary>
    public class Column
    {
        public Column() { }
        
        public Column(TemplateContext context, string propertyName, PropertyType propertyType, string sourceSelectExpression = null)
        {
            ColumnName = propertyName.ColumnNameForContext(context);
            ColumnDataType = propertyType.DataTypeForContext(context);
            SourceSelectExpression = sourceSelectExpression;
        }

        public Column(TemplateContext context, EntityProperty property)
        {
            ColumnName = property.ColumnNameForContext(context);
            ColumnDataType = property.DataTypeForContext(context);
        }
        
        /// <summary>
        /// Gets or sets the name of the column.
        /// </summary>
        public string ColumnName { get; set; }

        /// <summary>
        /// Gets or sets the fully defined SQL data type definition for the target database (used in SQL DDL generation).
        /// </summary>
        public string ColumnDataType { get; set; }
        
        /// <summary>
        /// Contains the SELECT expression for the column (when used in SQL DML generation).
        /// </summary>
        public string SourceSelectExpression { get; set; }
        
        /// <summary>
        /// Indicates whether the column is the first columns in the containing set, or <b>null</b> if order is not specified.
        /// </summary>
        public bool? IsFirst { get; set; }
    }
}