// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System.Collections.Generic;

namespace EdFi.Ods.CodeGen.Generators.Changes.Models
{
    /// <summary>
    /// Contains information necessary for rendering SQL artifacts based on 
    /// </summary>
    public class ChangeDataTable
    {
        public bool IsDerived { get; set; }

        public string Schema { get; set; }

        public string TableName { get; set; }

        public string BaseTableSchema { get; set; }

        public string BaseTableName { get; set; }

        public IEnumerable<ChangeDataColumn> ChangeDataColumns { get; set; }

        public IEnumerable<SingleColumnJoin> Joins { get; set; }

        public bool HasDiscriminator { get; set; }

        /// <summary>
        /// Gets the columns that effectively identify the record which may be primary key columns, or alternate key columns
        /// if the table's primary key is a surrogate key (identity column in SQL Server).
        /// </summary>
        public IEnumerable<Column> IdentifyingColumns { get; set; }

        /// <summary>
        /// Indicates whether the primary key values can change by either being updated on the current resource, or is downstream
        /// of a resource that does allow key updates. 
        /// </summary>
        public bool KeyValuesCanChange { get; set; }
    }
}