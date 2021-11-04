using System;
using System.IO;
using System.Reflection;
using System.Text.RegularExpressions;
using EdFi.Ods.Generator.Common.Rendering;
using EdFi.Ods.Generator.Logging;
using log4net;
using Weikio.NugetDownloader;
using Weikio.PluginFramework.Catalogs;
using Weikio.PluginFramework.Catalogs.NuGet;

namespace EdFi.Ods.Generator.Helpers
{
    public static class NugetPluginHelper
    {
        private static readonly ILog Logger = LogManager.GetLogger(typeof(NugetPluginHelper));
        
        public static NugetPackagePluginCatalog ProcessPluginsUsingNuget(string pluginFeedUrl, string pluginArgument)
        {
            Logger.Debug($"Nuget feed: {pluginFeedUrl}");
            Logger.Debug($"Nuget package: {pluginArgument}");

            var feed = pluginFeedUrl == null ? null : new NuGetFeed("SuppliedFeed", pluginFeedUrl);

            var options = new NugetPluginCatalogOptions
            {
                LoggerFactory = () => new Log4NetLogger(Logger),
                IncludeSystemFeedsAsSecondary = true,
            };

            var match = Regex.Match(pluginArgument, @"(?<PackageName>.*?)(\.(?<PackageVersion>[\d]+\.[\d]+\.[\d]+.*))?$");

            if (!match.Success)
            {
                throw new Exception("Package name was not in the expected format.");
            }

            string packageName = match.Groups["PackageName"].Value;
            string packageVersionText = match.Groups["PackageVersion"].Value;
            string packageVersion = string.IsNullOrWhiteSpace(packageVersionText) ? null : packageVersionText;

            string packagesFolder = Path.Combine(
                Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData),
                Path.GetFileNameWithoutExtension(Assembly.GetExecutingAssembly().CodeBase));

            Logger.Debug($"Nuget packages folder: {packagesFolder}");

            var catalog = new NugetPackagePluginCatalog(
                packageName,
                packageVersion,
                packagesFolder: packagesFolder,
                options: options,
                packageFeed: feed,
                configureFinder: type => type.Implements<IRenderingPlugin>());

            catalog.Initialize().ConfigureAwait(false).GetAwaiter().GetResult();

            return catalog;
        }
    }
}