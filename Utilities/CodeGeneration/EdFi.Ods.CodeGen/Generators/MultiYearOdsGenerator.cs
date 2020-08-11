// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Collections.Generic;
using System.Linq;
using EdFi.Ods.CodeGen.Database.DatabaseSchema;
using EdFi.Ods.Common;
using EdFi.Ods.Common.Models.Domain;
using Microsoft.VisualBasic.CompilerServices;

namespace EdFi.Ods.CodeGen.Generators
{
    public class MultiYear_0020_Tables : MultiYearOdsGeneratorBase
    {
        public MultiYear_0020_Tables(IDatabaseTypeTranslator databaseTypeTranslator)
            : base(databaseTypeTranslator) { }
    }

    public class MultiYear_0030_ForeignKeys : MultiYearOdsGeneratorBase
    {
        public MultiYear_0030_ForeignKeys(IDatabaseTypeTranslator databaseTypeTranslator)
            : base(databaseTypeTranslator) { }
    }

    public class MultiYear_0025_PopulateTables : MultiYearOdsGeneratorBase
    {
        public MultiYear_0025_PopulateTables(IDatabaseTypeTranslator databaseTypeTranslator)
            : base(databaseTypeTranslator) { }
    }

    public abstract class MultiYearOdsGeneratorBase : GeneratorBase
    {
        private readonly IDatabaseTypeTranslator _databaseTypeTranslator;
        private Func<Entity, bool> _shouldRenderEntityForSchema;

        protected MultiYearOdsGeneratorBase(IDatabaseTypeTranslator databaseTypeTranslator)
        {
            Preconditions.ThrowIfNull(databaseTypeTranslator, nameof(databaseTypeTranslator));

            _databaseTypeTranslator = databaseTypeTranslator;
        }

        protected override void Configure()
        {
            _shouldRenderEntityForSchema = TemplateContext.ShouldRenderEntity;
        }

        private class Table
        {
            public string Schema { get; set; }

            public string TableName { get; set; }

            public IEnumerable<Column> PrimaryKeyColumns { get; set; }

            public bool HasContextualPrimaryKeyColumns
            {
                get => ContextualPrimaryKeyColumns.Any();
            }

            public IEnumerable<Column> ContextualPrimaryKeyColumns { get; set; }

            public IEnumerable<Column> ParentPrimaryKeyColumns
            {
                get => PrimaryKeyColumns
                    .Where(pkc => !ContextualPrimaryKeyColumns.Any(c => c.ColumnName == pkc.ColumnName))
                    .Select((pkc, i) => new Column
                    {
                        ColumnName = pkc.ColumnName,
                        DataType = pkc.DataType,
                        IsNullable = pkc.IsNullable,
                        IsFirst = i == 0,
                    });
            }
            
            public bool IsAggregateRoot { get; set; }

            public bool HasNonKeyColumns
            {
                get => NonKeyColumns.Any();
            }

            public bool HasReferences
            {
                get => References.Any();
            }

            public bool HasNonKeyColumnsOrReferences
            {
                get => NonKeyColumns.Any() || References.Any();
            }

            public IEnumerable<Column> NonKeyColumns { get; set; }

            public bool HasBoilerplateColumns
            {
                get => BoilerplateColumns.Any();
            }
            
            public IEnumerable<Column> BoilerplateColumns { get; set; }

            public IEnumerable<HashReference> References { get; set; }

            public IEnumerable<HashReference> IdentifyingReferences { get; set; }
        }

        private class Column
        {
            public string ColumnName { get; set; }

            public string DataType { get; set; }

            public bool IsNullable { get; set; }

            public bool? IsFirst { get; set; }

            public bool IsString
            {
                get => DataType.StartsWith("nvarchar");
            }
            
            public bool IsGuid
            {
                get => DataType == "uniqueidentifier";
            }

            public bool IsNumber
            {
                get => DataType == "bit"
                    || DataType == "decimal"
                    || DataType == "int"
                    || DataType == "money"
                    || DataType == "smallint";
            }

            public bool IsDate
            {
                get => DataType == "datetime" || DataType == "datetime2" || DataType == "date";
            }
            
            public bool IsTime
            {
                get => DataType == "time";
            }
        }

        private class HashReference
        {
            public string ReferencedTableSchema { get; set; }

            public string ReferencedTableName { get; set; }

            public Column Column { get; set; }

            public string ConstraintName { get; set; }

            public string ReferenceMemberName { get; set; } // TODO: This needs to be processed for Postgres naming limitations

            // Used for constructing HashKeys for populating the template
            public IEnumerable<Column> ReferenceColumns { get; set; }

            public bool IsFirst { get; set; }
        }

        protected override object Build()
        {
            var databaseEngine = TemplateContext.TemplateSet.DatabaseEngine;

            var domainModel = TemplateContext.DomainModelProvider.GetDomainModel();
            
            var orderedAggregates = domainModel
                .Aggregates.Where(
                    a => a.Members.Any(
                        e => _shouldRenderEntityForSchema(e)
                            || e.Extensions.Any(ex => _shouldRenderEntityForSchema(ex))))
                .OrderBy(x => x.FullName.Name)
                .ToList();

            return new
            {
                Aggregates = orderedAggregates
                    .Select(a => new
                    {
                        AggregateRoot = CreateTable(a.AggregateRoot),
                        Members = a.Members.Where(m => !m.IsAggregateRoot)
                            .Select(CreateTable),
                    })
            };

            Table CreateTable(Entity entity)
            {
                return new Table
                {
                    IsAggregateRoot = entity.IsAggregateRoot,
                    Schema = entity.Schema,
                    TableName = entity.TableNameByDatabaseEngine[databaseEngine],
                    PrimaryKeyColumns = entity.Identifier.Properties.Select(
                        (p, i) => new Column
                        {
                            ColumnName = p.ColumnNameByDatabaseEngine[databaseEngine],
                            DataType = p.PropertyType.ToSql(),
                            IsNullable = p.PropertyType.IsNullable,
                            IsFirst = i == 0,
                        }),
                    ContextualPrimaryKeyColumns = entity.Identifier.Properties
                        .Where(p => !entity.IsAggregateRoot)
                        .Where(p => !p.IsFromParent)
                        .Where(p => !entity.Aggregate.AggregateRoot.Identifier.Properties.Any(p2 => p2.PropertyName == p.PropertyName))
                        .Where(p => !p.IncomingAssociations.Any())
                        .Select(
                            (p, i) => new Column
                            {
                                ColumnName = p.ColumnNameByDatabaseEngine[databaseEngine],
                                DataType = p.PropertyType.ToSql(),
                                IsNullable = p.PropertyType.IsNullable,
                                IsFirst = i == 0,
                            }),
                    IdentifyingReferences = entity.IncomingAssociations
                        .Where(a => a.IsIdentifying && a.OtherEntity != entity.Parent)
                        .Select(CreateHashReference),
                    References = entity.IncomingAssociations
                        .Where(a => !a.IsIdentifying)
                        .Select(CreateHashReference),
                    NonKeyColumns = entity.Properties
                        .Where(p => !p.IsIdentifying && !p.IncomingAssociations.Any())
                        .Where(p => !p.IsBoilerplate())
                        .Select( (p, i) => new Column
                        {
                            ColumnName = p.ColumnNameByDatabaseEngine[databaseEngine],
                            DataType = p.PropertyType.ToSql(),
                            IsNullable = p.PropertyType.IsNullable,
                            IsFirst = i == 0,
                        }),
                    BoilerplateColumns = entity.Properties
                        .Where(p => !p.IsIdentifying)
                        .Where(p => p.IsBoilerplate())
                        .Select( (p, i) => new Column
                        {
                            ColumnName = p.ColumnNameByDatabaseEngine[databaseEngine],
                            DataType = p.PropertyType.ToSql(),
                            IsNullable = p.PropertyType.IsNullable,
                            IsFirst = i == 0,
                        })
                };

                string GetConstraintName(string thisTableName, string otherTableName, string roleName = null)
                {
                    string constraintName = $"FK_{roleName}{thisTableName}_{otherTableName}";

                    if (constraintName.Length > 128)
                        return constraintName.Substring(0, 128);

                    return constraintName;
                }

                HashReference CreateHashReference(AssociationView association, int index)
                {
                    return new HashReference
                    {
                        ReferencedTableSchema = association.OtherEntity.Schema,
                        ReferencedTableName = association.OtherEntity.TableNameByDatabaseEngine[databaseEngine],
                        ReferenceMemberName = association.Name,
                        ConstraintName = GetConstraintName(entity.TableNameByDatabaseEngine[databaseEngine], association.OtherEntity.TableNameByDatabaseEngine[databaseEngine], association.RoleName),
                        Column = new Column
                        {
                            ColumnName = $"{association.Name}HashKey",
                            DataType = "uniqueIdentifier",
                            IsNullable = !association.IsRequired,
                        },
                        ReferenceColumns = association.ThisProperties
                            .Select((p, i) => new Column
                            {
                                ColumnName = p.PropertyName,
                                DataType = p.PropertyType.ToSql(),
                                IsNullable = !p.PropertyType.IsNullable,
                                IsFirst = i == 0,
                            }) ,
                        IsFirst = index == 0
                    };
                }
            }
        }
    }
    
    public static class IEnumerableExtensions
    {
        public static IEnumerable<T> Concat<T>(this T firstItem, IEnumerable<T> items)
        {
            yield return firstItem;

            foreach (T item in items)
            {
                yield return item;
            }
        }    
    }

    public static class ColumnConventions
    {
        public static bool IsBoilerplate(this EntityProperty property)
        {
            return IsBoilerplate(property.PropertyName);
        }
        
        public static bool IsBoilerplate(string propertyName)
        {
            switch (propertyName)
            {
                case "Id":
                case "CreateDate":
                case "LastModifiedDate":
                    return true;
                default:
                    return false;
            }
        }
    }
}
