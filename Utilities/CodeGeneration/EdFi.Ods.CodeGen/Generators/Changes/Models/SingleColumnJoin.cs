// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

namespace EdFi.Ods.CodeGen.Generators.Changes.Models
{
    public class SingleColumnJoin
    {
        public SingleColumnJoin(string schema, string tableName, string joinAlias, bool isLeftJoin, string thisJoinColumnName, string otherJoinColumnName)
        {
            Schema = schema;
            TableName = tableName;
            JoinAlias = joinAlias;
            IsLeftJoin = isLeftJoin;
            ThisJoinColumnName = thisJoinColumnName;
            OtherJoinColumnName = otherJoinColumnName;
        }

        public string Schema { get; }

        public string TableName { get; }

        public string JoinAlias { get; }

        public bool IsLeftJoin { get; }

        public string ThisJoinColumnName { get; set; }

        public string OtherJoinColumnName { get; set; }
    }
}