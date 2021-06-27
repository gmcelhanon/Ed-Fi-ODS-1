// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using EdFi.Ods.Common.Models;
using EdFi.Ods.Common.Models.Domain;
using NHibernate;
using NHibernate.SqlCommand;

namespace EdFi.Ods.Common.Infrastructure.Interceptors
{
    public class CreateDateBasedTransientInterceptor : EmptyInterceptor
    {
        private DomainModel _domainModel;

        public CreateDateBasedTransientInterceptor(IDomainModelProvider domainModelProvider)
        {
            _domainModel = domainModelProvider.GetDomainModel();
        }

        public override bool? IsTransient(object entity)
        {
            var property = entity.GetType()
                                 .GetProperty("CreateDate");

            if (property != null)
            {
                bool isTransient = Convert.ToDateTime(property.GetValue(entity)) == default(DateTime);

                return isTransient;
            }

            return base.IsTransient(entity);
        }

        public override SqlString OnPrepareStatement(SqlString sql)
        {
            if (sql.StartsWithCaseInsensitive("UPDATE"))
            {
                var setPos = sql.IndexOf(" SET ", 7, sql.Length, StringComparison.Ordinal);

                var entityFullName = sql.Substring(7, setPos - 7);

                var entityFullNameParts = entityFullName.ToString().Split(".");
                
                if (_domainModel.EntityByFullName.TryGetValue(new FullName(entityFullNameParts[0], entityFullNameParts[1]), out var entity))
                {
                    if (entity.IsAggregateRoot && !entity.IsDerived)
                    {
                        var wherePos = sql.IndexOf(" WHERE", 0, sql.Length, StringComparison.Ordinal);
                        var changeVersionSql = sql.Insert(wherePos, ", ChangeVersion = (NEXT VALUE FOR changes.ChangeVersionSequence)");

                        return changeVersionSql;
                    }
                }
            }
            else if (sql.StartsWithCaseInsensitive("INSERT INTO"))
            {
                var valuesPos = sql.IndexOf(" (", 12, sql.Length, StringComparison.Ordinal);
                
                var entityFullName = sql.Substring(12, valuesPos - 12);
                
                var entityFullNameParts = entityFullName.ToString().Split(".");
                
                if (_domainModel.EntityByFullName.TryGetValue(new FullName(entityFullNameParts[0], entityFullNameParts[1]), out var entity))
                {
                    if (entity.IsAggregateRoot && !entity.IsDerived)
                    {
                        var valuesPos2 = sql.IndexOf(") VALUES (", 0, sql.Length, StringComparison.Ordinal);
                        var changeVersionSql2 = sql.Insert(valuesPos2, ", ChangeVersion");

                        var closingParenthesisPos = changeVersionSql2.LastIndexOfCaseInsensitive(")");
                        
                        var changeVersionSql = changeVersionSql2.Insert(closingParenthesisPos, ", (NEXT VALUE FOR changes.ChangeVersionSequence)");

                        return changeVersionSql;
                    }
                }
            }

            return base.OnPrepareStatement(sql);
        }
    }
}
