// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using Autofac.Features.Indexed;
using EdFi.Ods.Common.Configuration;

namespace EdFi.Ods.CodeGen.Database.DatabaseSchema
{
    public class DatabaseTypeTranslatorFactory : IDatabaseTypeTranslatorFactory
    {
        private readonly IIndex<DatabaseEngine, IDatabaseTypeTranslator> _translatorByDatabaseEngine;

        public DatabaseTypeTranslatorFactory(IIndex<DatabaseEngine, IDatabaseTypeTranslator> translatorByDatabaseEngine)
        {
            _translatorByDatabaseEngine = translatorByDatabaseEngine;
        }
        
        public IDatabaseTypeTranslator CreateTranslator(DatabaseEngine engine)
        {
            return _translatorByDatabaseEngine[engine];
        }
    }
}
