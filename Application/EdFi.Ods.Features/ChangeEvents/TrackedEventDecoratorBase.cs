// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Linq.Expressions;
using EdFi.Ods.Common;
using EdFi.Ods.Common.Extensions;
using EdFi.Ods.Common.Infrastructure.Database.NamingConventions;
using EdFi.Ods.Common.Models;
using EdFi.Ods.Common.Models.Domain;
using EdFi.Ods.Common.Models.Dynamic;
using Stubble.Core.Builders;
using Stubble.Core.Settings;
// using FastExpressionCompiler.LightExpression;


namespace EdFi.Ods.Features.ChangeEvents
{
    public abstract class TrackedEventDecoratorBase<TEntity>
        where TEntity : IHasIdentifier, IDateVersionedEntity
    {
        protected static Lazy<string> _insertSql;
        protected static Lazy<Entity> _entityModel;

        protected static Lazy<Action<DbCommand, TEntity>> _assignParameters;

        private const string TrackedEventsSchemaPrefix = "tracked_events_";
        private const string ChangeVersionSequenceFullName = "changes.ChangeVersionSequence";

        protected TrackedEventDecoratorBase(
            IDomainModelProvider domainModelProvider,
            IDatabaseNamingConvention databaseNamingConvention)
        {
            _entityModel ??= new Lazy<Entity>(
                () =>
                {
                    // Capture update event
                    if (!domainModelProvider.GetDomainModel()
                        .EntityByFullName.TryGetValue(typeof(TEntity).GetFullName(), out var entity))
                    {
                        throw new Exception($"Unable to find entity '{typeof(TEntity).GetFullName()}' in the model.");
                    }

                    return entity;
                });

            _insertSql ??= new Lazy<string>(
                () =>
                {
                    dynamic codeGenModel = new DynamicModel();

                    codeGenModel.ChangeEventColumns = GetChangeEventColumns(databaseNamingConvention);
                    
                    var entityModel = _entityModel.Value;

                    codeGenModel.TrackedEventsSchema = databaseNamingConvention.IdentifierName($"{TrackedEventsSchemaPrefix}{databaseNamingConvention.Schema(entityModel)}");
                    codeGenModel.TableName = databaseNamingConvention.TableName(entityModel);
                    codeGenModel.HasDiscriminator = entityModel.IsBase && entityModel.HasDiscriminator();
                    codeGenModel.SequenceFullName = ChangeVersionSequenceFullName;

                    string sqlTemplate = TemplateSql;

                    string sql = RenderAsync(sqlTemplate, codeGenModel, new Dictionary<string, string>());

                    return sql;
                });

            _assignParameters ??= new Lazy<Action<DbCommand, TEntity>>(
                () => CreateAssignParametersExpression(databaseNamingConvention).Compile());
            // () => CreateAssignParametersExpression().CompileFast());
            
            string RenderAsync(string templateContent, object templateModel, IDictionary<string, string> partials)
            {
                var renderer = new StubbleBuilder()
                    .Configure(
                        settings =>
                        {
                            settings.SetMaxRecursionDepth(512);
                            settings.SetIgnoreCaseOnKeyLookup(true);
                        }
                    )
                    .Build();
                
                string renderedContent = renderer.Render(templateContent, templateModel, partials, new RenderSettings {SkipHtmlEncoding = true});

                return renderedContent;
            }
        }
        
        private Expression<Action<DbCommand, TEntity>> CreateAssignParametersExpression(
            IDatabaseNamingConvention databaseNamingConvention)
        {
            var command = Expression.Parameter(typeof(DbCommand), "command");
            var entity = Expression.Parameter(typeof(TEntity), "entity");

            var parameters = Expression.Variable(typeof(DbParameterCollection), "parameters");
            var parameter = Expression.Variable(typeof(DbParameter), "parameter");

            var getParameters = typeof(DbCommand).GetProperty("Parameters");
            var createParameter = typeof(DbCommand).GetMethod("CreateParameter");

            var addMethod = typeof(DbParameterCollection).GetMethod("Add", new[] { typeof(object) });

            var parameterNameProperty = typeof(DbParameter).GetProperty("ParameterName"); //, new[] { typeof(string) });
            var dbTypeProperty = typeof(DbParameter).GetProperty("DbType"); //, new[] { typeof(DbType) });
            var valueProperty = typeof(DbParameter).GetProperty("Value");

            var columns = GetChangeEventColumns(databaseNamingConvention);
            
            var mainBlock = Expression.Block(
                new[] { parameters, parameter },
                CreateBodyBlocks(columns));

            return Expression.Lambda<Action<DbCommand, TEntity>>(mainBlock, command, entity);

            IEnumerable<Expression> CreateBodyBlocks(ChangeEventColumn[] changeEventColumns)
            {
                yield return Expression.Assign(parameters, Expression.Property(command, getParameters));

                foreach (var column in columns)
                {
                    yield return CreateParameterBlock(column.PropertyName, column.DbType);
                }
            }

            Expression CreateParameterBlock(string propertyName, DbType dbType)
            {
                var property = typeof(TEntity).GetProperty(propertyName);
                
                var parameterBlock = Expression.Block(
                    // Create and add the parameter
                    Expression.Assign(parameter, Expression.Call(command, createParameter)),
                    Expression.Assign(Expression.Property(parameter, parameterNameProperty), Expression.Constant($"@{propertyName}", typeof(string))),
                    Expression.Assign(Expression.Property(parameter, dbTypeProperty), Expression.Constant(dbType, typeof(DbType))),
                    Expression.Assign(Expression.Property(parameter, valueProperty),  Expression.Convert(Expression.Property(entity, property), typeof(object))),
                    Expression.Call(parameters, addMethod, parameter)
                );

                return parameterBlock;
            }
        }
        
        private ChangeEventColumn[] GetChangeEventColumns(IDatabaseNamingConvention databaseNamingConvention)
        {
            var entityModel = _entityModel.Value;

            // Get Event Key Columns
            if (entityModel.IsDerived)
            {
                return entityModel.GetChangeDataProperties()
                    .SelectMany((p, i) => p.ExpandForApiResourceData(i, databaseNamingConvention))
                    .ToArray();
            }
            
            return entityModel.GetChangeDataProperties()
                .SelectMany((p, i) => p.ExpandForApiResourceData(i, databaseNamingConvention))
                .ToArray();
        }

        protected abstract string TemplateSql { get; }
    }
}
