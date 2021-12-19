// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Data;

namespace EdFi.Ods.Common.Models.Domain
{
    public static class DbTypeExtensions
    {
        public static Type ToSystemType(this DbType dbType)
        {
            // Note: Comments with corresponding .NET types are left inline for possible future implementation.
            Type systemType = null;

            switch (dbType)
            {
                case DbType.Int64: // bigint
                    systemType = typeof(long);
                    break;

                case DbType.Byte: // tinyint
                    systemType = typeof(byte);
                    break;

                case DbType.Int16: // smallint
                    systemType = typeof(short);
                    break;

                case DbType.Int32: // int
                    systemType = typeof(int);
                    break;

                case DbType.Guid: // uniqueidentifier
                    systemType = typeof(Guid);
                    break;

                case DbType.Date: // date
                case DbType.DateTime: // smalldatetime, datetime
                case DbType.DateTime2:
                    systemType = typeof(DateTime);
                    break;

                case DbType.Double: //float
                    systemType = typeof(double);
                    break;

                case DbType.Single: // real
                    systemType = typeof(float);
                    break;

                case DbType.Currency: // smallmoney, money
                case DbType.Decimal: // numeric, decimal
                    systemType = typeof(decimal);
                    break;

                case DbType.Boolean:
                    systemType = typeof(bool);
                    break;

                case DbType.Binary: // image, binary, varbinary, rowversion, timestamp
                    systemType = typeof(byte[]);
                    break;

                case DbType.Time: // time
                    systemType = typeof(TimeSpan);
                    break;

                case DbType.AnsiString: // varchar
                case DbType.String: // char, nvarchar, ntext, text
                case DbType.AnsiStringFixedLength: // char
                case DbType.StringFixedLength: // nchar
                    systemType = typeof(string);
                    break;

                case DbType.DateTimeOffset:
                    systemType = typeof(DateTimeOffset);
                    break;

                default:

                    throw new NotSupportedException(
                        string.Format(
                            "System type mapping from 'DbType.{0}' is not supported.",
                            dbType));
            }

            return systemType;
        }
    }
}
