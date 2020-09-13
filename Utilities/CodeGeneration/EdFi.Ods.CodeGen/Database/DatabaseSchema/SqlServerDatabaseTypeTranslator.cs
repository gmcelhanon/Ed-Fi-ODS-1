// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Data;
using EdFi.Ods.Common;

namespace EdFi.Ods.CodeGen.Database.DatabaseSchema
{
    public class SqlServerDatabaseTypeTranslator : IDatabaseTypeTranslator
    {
        public string GetSysType(string sqlType)
        {
            switch (sqlType)
            {
                case "tinyint":
                case "smallint":
                    return "short";

                case "int":
                    return "int";

                case "bigint":
                    return "long";

                case "uniqueidentifier":
                    return "Guid";

                case "smalldatetime":
                case "datetime":
                case "date":
                case "datetime2":
                    return "DateTime";

                case "float":
                    return "double";

                case "real":
                case "numeric":
                case "smallmoney":
                case "decimal":
                case "money":
                    return "decimal";

                case "bit":
                    return "bool";

                case "image":
                case "binary":
                case "varbinary":
                    return "byte[]";

                case "time":
                    return "TimeSpan";

                case "text":
                case "ntext":
                case "varchar":
                case "nvarchar":
                    return "string";

                default:
                    throw new NotSupportedException($".NET system type mapping from SQL Server type '{sqlType}' is not supported.");
            }
        }

        public string GetNHType(string sqlType)
        {
            switch (sqlType)
            {
                case "bigint":
                    return "long";

                case "tinyint":
                case "smallint":
                    return "short";

                case "int":
                    return "int";

                case "uniqueidentifier":
                    return "Guid";

                case "datetimeoffset":
                    return "datetimeoffset";

                case "smalldatetime":
                case "datetime":
                    return "timestamp"; //"datetime";

                case "datetime2":
                    return "UtcDateTime";

                case "date":
                    return "date";

                case "float":
                    return "double";

                case "real":
                case "numeric":
                case "smallmoney":
                case "decimal":
                case "money":
                    return "decimal";

                case "bit":
                    return "bool";

                case "image":
                case "binary":
                case "varbinary":
                    return "byte[]"; // Should this really be "BinaryBlob"?

                case "time":
                    return "TimeAsTimeSpan";

                case "text":
                case "varchar":
                    return "AnsiString";

                case "ntext":
                case "nvarchar":
                    return "string";

                default:
                    throw new NotSupportedException($"NHibernate type mapping from SQL Server type '{sqlType}' is not supported.");
            }
        }

        public DbType GetDbType(string sqlType)
        {
            switch (sqlType)
            {
                case "varchar":
                    return DbType.AnsiString;

                case "nvarchar":
                    return DbType.String;

                case "int":
                    return DbType.Int32;

                case "uniqueidentifier":
                    return DbType.Guid;

                case "datetime":
                    return DbType.DateTime;

                case "datetime2":
                    return DbType.DateTime2;

                case "time":
                    return DbType.Time;

                case "date":
                    return DbType.Date;

                case "bigint":
                    return DbType.Int64;

                case "binary":
                    return DbType.Binary;

                case "bit":
                    return DbType.Boolean;

                case "char":
                    return DbType.AnsiStringFixedLength;

                case "decimal":
                    return DbType.Decimal;

                case "float":
                    return DbType.Double;

                case "image":
                    return DbType.Binary;

                case "money":
                    return DbType.Currency;

                case "nchar":
                    return DbType.String;

                case "ntext":
                    return DbType.String;

                case "numeric":
                    return DbType.Decimal;

                case "real":
                    return DbType.Single;

                case "smalldatetime":
                    return DbType.DateTime;

                case "smallint":
                    return DbType.Int16;

                case "smallmoney":
                    return DbType.Currency;

                case "sql_variant":
                    return DbType.String;

                case "sysname":
                    return DbType.String;

                case "text":
                    return DbType.AnsiString;

                case "timestamp":
                    return DbType.Binary;

                case "tinyint":
                    return DbType.Byte;

                case "varbinary":
                    return DbType.Binary;

                case "xml":
                    return DbType.Xml;

                default:
                    throw new NotSupportedException($"DbType mapping from SQL Server type '{sqlType}' is not supported.");
            }
        }
    }
}
