// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Data;
using EdFi.Ods.Common.Configuration;

namespace EdFi.Ods.CodeGen.Database.DatabaseSchema
{
    public static class DbTypeHelper
    {
        /// <summary>
        /// Gets the first supported translation to <see cref="DbType" /> of the supplied raw database data type
        /// by scanning all available database type translators.
        /// </summary>
        /// <param name="databaseTypeTranslatorFactory"></param>
        /// <param name="dbDataType"></param>
        /// <returns></returns>
        /// <exception cref="NotSupportedException"></exception>
        public static DbType GetDbType(IDatabaseTypeTranslatorFactory databaseTypeTranslatorFactory, string dbDataType)
        {
            foreach (var engine in DatabaseEngine.GetAll())
            {
                try
                {
                    var translator = databaseTypeTranslatorFactory.CreateTranslator(engine);
                    return translator.GetDbType(dbDataType);
                }
                catch (NotSupportedException) { }
            }
            
            throw new NotSupportedException($"Unable to find a DbType conversion for database data type '{dbDataType}'.");
        }

        /// <summary>
        /// Gets the first supported translation to string representation of the .NET system type of the
        /// supplied raw database data type by scanning all available database type translators.
        /// </summary>
        /// <param name="databaseTypeTranslatorFactory"></param>
        /// <param name="dbDataType"></param>
        /// <returns></returns>
        /// <exception cref="NotSupportedException"></exception>
        public static string GetSysType(IDatabaseTypeTranslatorFactory databaseTypeTranslatorFactory, string dbDataType)
        {
            foreach (var engine in DatabaseEngine.GetAll())
            {
                try
                {
                    var translator = databaseTypeTranslatorFactory.CreateTranslator(engine);
                    return translator.GetSysType(dbDataType);
                }
                catch (NotSupportedException) { }
            }
            
            throw new NotSupportedException($"Unable to find a .NET system type conversion for database data type '{dbDataType}'.");
        }

        public static string GetNHType(IDatabaseTypeTranslatorFactory databaseTypeTranslatorFactory, string dbDataType)
        {
            foreach (var engine in DatabaseEngine.GetAll())
            {
                try
                {
                    var translator = databaseTypeTranslatorFactory.CreateTranslator(engine);
                    return translator.GetNHType(dbDataType);
                }
                catch (NotSupportedException) { }
            }
            
            throw new NotSupportedException($"Unable to find an NHibernate type conversion for database data type '{dbDataType}'.");
        }
    }
}
