// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

namespace EdFi.Ods.CodeGen.Generators.Changes.Models
{
    public class ChangeDataColumn 
    {
        public bool IsFirst { get; set; }

        public string ColumnName { get; set; }

        public string BaseColumnName { get; set; }
        
        public string ColumnDataType { get; set; }

        public string SourceSelectExpression { get; set; }
    }
}