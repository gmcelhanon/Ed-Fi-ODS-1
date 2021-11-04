using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading;
using System.Threading.Tasks;
using System.Xml.Linq;
using Autofac;
using CommandLine;
using EdFi.Ods.Generator.Common.Modules;
using EdFi.Ods.Generator.Common.Rendering;
using EdFi.Ods.Generator.Helpers;
using log4net;
using log4net.Config;
using Microsoft.CodeAnalysis;
using Weikio.NugetDownloader;
using Weikio.PluginFramework.Abstractions;
using Weikio.PluginFramework.Catalogs;
using Weikio.PluginFramework.Catalogs.NuGet;

namespace EdFi.Ods.Generator
{
    public static class ReturnCodes
    {
        public const int Success = 0;
        public const int Failure = 1;
    }

    internal class Program
    {
        private static ILog _logger;

        private static readonly CancellationTokenSource CancellationTokenSource = new CancellationTokenSource();

        private static async Task<int> Main(string[] args)
        {
            int result = 0;
            
            Options options = null;

            new Parser(
                    config =>
                    {
                        config.CaseInsensitiveEnumValues = true;
                        config.CaseSensitive = false;
                    }).ParseArguments<Options>(args)
                .WithParsed(opts => options = opts)
                .WithNotParsed(
                    errs =>
                    {
                        Console.WriteLine("Invalid options were entered.");
                        Console.WriteLine(errs.ToString());
                        result = -1;
                    });

            if (result != ReturnCodes.Success)
            {
                return result;
            }

            ConfigureLogging(options.LogLevel);
            _logger = LogManager.GetLogger(typeof(Program));

            var container = InitializeContainer(options);
            
            Console.CancelKeyPress += (o, e) =>
            {
                _logger.Warn("Ctrl-C Pressed. Stopping all threads.");
                CancellationTokenSource.Cancel();
                e.Cancel = true;
            };
            
            var stopwatch = new Stopwatch();
            
            try
            {
                stopwatch.Start();

                _logger.Info("Starting generation.");

                var cancellationToken = CancellationTokenSource.Token;

                await container.Resolve<IRenderingManager>()
                    .RenderAllAsync(cancellationToken)
                    .ConfigureAwait(false);

                stopwatch.Stop();

                _logger.Info($"Completed generation in {stopwatch.Elapsed.ToString()}.");

                return ReturnCodes.Success;
            }
            catch (Exception e)
            {
                _logger.Error(e.ToString());

                return ReturnCodes.Failure;
            }
            finally
            {
                container?.Dispose();
            }
        }

        private static void ConfigureLogging(string logLevel)
        {
            var assembly = typeof(Program).GetTypeInfo().Assembly;

            string configPath = Path.Combine(Path.GetDirectoryName(assembly.Location), "log4net.config");

            var doc = XDocument.Parse(File.ReadAllText(configPath));
            var logLevelAttribute = doc.Element("log4net").Element("root").Element("level").Attribute("value");
            logLevelAttribute?.SetValue(logLevel);
            
            // XmlConfigurator.Configure(LogManager.GetRepository(assembly), new FileInfo(configPath));
            XmlConfigurator.Configure(LogManager.GetRepository(assembly), new MemoryStream(Encoding.UTF8.GetBytes(doc.ToString())));
        }

        private static IContainer InitializeContainer(Options options)
        {
            // Register components with Autofac
            var containerBuilder = new ContainerBuilder();
            containerBuilder.RegisterInstance(options).AsImplementedInterfaces();
            containerBuilder.RegisterModule(new GeneratorModule());

            // Add the Configuration to the container
            var configuration = ConfigurationHelper.BuildConfiguration();
            containerBuilder.RegisterInstance(configuration);
            
            // Handle plugins with paths through Options / command-line parameter
            var pluginCatalogs = GetPluginCatalogs(options.Plugins, options.PluginFeedUrl).ToArray();
            var compositePluginCatalog = new CompositePluginCatalog(pluginCatalogs);
            compositePluginCatalog.Initialize();

            var plugins = compositePluginCatalog.GetPlugins();

            var pluginTypes = new HashSet<Type>();
            
            foreach (var plugin in plugins)
            {
                if (pluginTypes.Add(plugin.Type))
                {
                    var pluginInstance = (IRenderingPlugin) Activator.CreateInstance(plugin.Type);
                    pluginInstance?.Initialize(containerBuilder);

                    containerBuilder.RegisterInstance(plugin);
                }
            }

            return containerBuilder.Build();
        }

        private static IEnumerable<IPluginCatalog> GetPluginCatalogs(IEnumerable<string> pluginsArgument, string pluginFeedUrl)
        {
            // Start with the current assembly's built-in plugins
            var builtinAssemblyPluginCatalog = new AssemblyPluginCatalog(typeof(GeneratorModule).Assembly,type => type.Implements<IRenderingPlugin>());
            yield return builtinAssemblyPluginCatalog;
            
            // Get the base path for any relative paths supplied
            string relativePathBase = Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location);

            foreach (string pluginArgument in pluginsArgument)
            {
                string testPath = !Path.IsPathFullyQualified(pluginArgument) && !Path.IsPathRooted(pluginArgument) && relativePathBase != null
                    ? Path.Combine(relativePathBase, pluginArgument)
                    : pluginArgument;

                if (File.Exists(testPath))
                {
                    yield return new AssemblyPluginCatalog(testPath, type => type.Implements<IRenderingPlugin>());
                }
                else if (Directory.Exists(testPath))
                {
                    yield return new FolderPluginCatalog(testPath, type => type.Implements<IRenderingPlugin>(),
                        new FolderPluginCatalogOptions { IncludeSubfolders = false });

                    string binSubfolder = Path.Combine(testPath, "bin");

                    if (Directory.Exists(binSubfolder))
                    {
                        yield return new FolderPluginCatalog(binSubfolder, type => type.Implements<IRenderingPlugin>(),
                            new FolderPluginCatalogOptions { IncludeSubfolders = true });
                    }
                }
                else
                {
                    _logger.Info($"Processing plugin '{pluginArgument}' using nuget...");
                    var catalog = NugetPluginHelper.ProcessPluginsUsingNuget(pluginFeedUrl, pluginArgument);
                    _logger.Info($"Nuget processing for plugin '{pluginArgument}' complete.");
                    
                    yield return catalog;

                    // throw new ArgumentException(
                    //     $"Plugin '{pluginArgument}' could not be resolved as a relative or full path to an assembly or plugins folder.");
                }
            }
        }
    }
}
