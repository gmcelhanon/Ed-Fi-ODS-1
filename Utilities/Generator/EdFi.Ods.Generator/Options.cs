// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using CommandLine;
using EdFi.Ods.Generator.Database;

namespace EdFi.Ods.Generator
{
    public interface IGeneratorOptions
    {
        string OutputPath { get; set; }
        IEnumerable<string> Properties { get; set; }
        IEnumerable<string> Plugins { get; set; }
        IDictionary<string, string> PropertyByName { get; }
        string TemplatePath { get; set; }
    }

    public interface IModelOptions
    {
        IEnumerable<string> ModelPaths { get; set; }
        string CapabilityStatementPath { get; set; }
    }

    public interface IDatabaseOptions
    {
        string DatabaseEngine { get; set; }
        
        IEnumerable<string> Schemas { get; set; }
    }

    public interface IRenderingPropertiesEnhancer
    {
        void EnhanceProperties(IDictionary<string, string> properties);
    }
    
    public class Options : IGeneratorOptions, IModelOptions, IDatabaseOptions
    {
        private readonly Lazy<IDictionary<string, string>> _propertyByName;

        public Options()
        {
            _propertyByName = new Lazy<IDictionary<string, string>>(
                () =>
                {
                    return Properties.Select(p => p.Split('='))
                        .Where(x => x.Length == 2)
                        .ToDictionary(x => x[0], x => x[1], StringComparer.OrdinalIgnoreCase);
                });
        }
        
        [Option('o', "outputPath", Required = true, HelpText = "The base path for rendered output files.")]
        public string OutputPath { get; set; }
        
        [Option('p', "property", HelpText = "Provides a named value to a template for rendering.")]
        public IEnumerable<string> Properties { get; set; }

        [Option('g', "plugin")]
        public IEnumerable<string> Plugins { get; set; }

        [Option('f', "pluginFeed", HelpText = "The nuget feed for the plugin.")]
        public string PluginFeedUrl { get; set; }

        public IDictionary<string, string> PropertyByName
        {
            get => _propertyByName.Value;
        }
        
        // IDatabaseOptions
        [Option("databaseEngine", Required = false, HelpText = "The target database engine (e.g. SqlServer or PostgreSql).", Default = "SqlServer")]
        public string DatabaseEngine { get; set; }
        
        [Option('s', "schema", Required = false, HelpText = "The schema whose artifacts should be included in code generation.")]
        public IEnumerable<string> Schemas { get; set; }

        // IModelOptions
        [Option("model", HelpText = "The path to the API model file from MetaEd.")]
        public IEnumerable<string> ModelPaths { get; set; }

        [Option("capabilities", Required = false, HelpText = "Path to the capability statement to use for model-based generation.")]
        public string CapabilityStatementPath { get; set; }
        
        [Option('t', "templatePath", Required = false, HelpText = "A path to use as a name prefix to match the templates to be rendered.", Default = ".*")]
        public string TemplatePath { get; set; }
    }
}
