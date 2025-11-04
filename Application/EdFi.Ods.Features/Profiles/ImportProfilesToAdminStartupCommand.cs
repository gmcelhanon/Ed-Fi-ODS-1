// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using System.Xml;
using EdFi.Admin.DataAccess.Models;
using EdFi.Admin.DataAccess.Repositories;
using EdFi.Ods.Api.Middleware;
using EdFi.Ods.Api.Startup;
using EdFi.Ods.Common.Configuration;
using EdFi.Ods.Common.Context;
using log4net;

namespace EdFi.Ods.Features.Profiles;

public class MultitenantImportProfilesToAdminStartupCommand(
    ITenantConfigurationMapProvider _tenantConfigurationMapProvider,
    IClientAppRepo _clientAppRepo,
    IContextProvider<TenantConfiguration> _tenantConfigurationContextProvider) : IStartupCommand
{
    private readonly ILog _logger = LogManager.GetLogger(typeof(MultitenantImportProfilesToAdminStartupCommand));

    public Task ExecuteAsync()
    {
        var tenantConfigurationMap = _tenantConfigurationMapProvider.GetMap();

        if (tenantConfigurationMap.Any())
        {
            foreach (var kvp in tenantConfigurationMap)
            {
                // Set the tenant configuration context to the current tenant's configuration.
                _tenantConfigurationContextProvider.Set(kvp.Value);

                var profileDefinitionByName = ProfilesImportHelper.LoadProfiles(kvp.Key);

                if (profileDefinitionByName.Count > 0)
                {
                    _logger.Debug($"Importing Profiles into Admin Database for tenant '{kvp.Key}'...");
                    ProfilesImportHelper.ImportProfiles(_clientAppRepo, profileDefinitionByName);
                }

                // Clear the tenant configuration context.
                _tenantConfigurationContextProvider.Set(null);
            }
        }

        return Task.CompletedTask;
    }
}

public static class ProfilesImportHelper
{
    public static Dictionary<string, XmlNode> LoadProfiles(string? tenantIdentifier = null)
    {
        // Add Profiles
        string[] profileFilenames = Directory.GetFiles(Directory.GetParent(AppContext.BaseDirectory)!.FullName, $"*Profiles.xml");

        if (!string.IsNullOrEmpty(tenantIdentifier))
        {
            profileFilenames = profileFilenames.Union(
                    Directory.GetFiles(
                        Directory.GetParent(AppContext.BaseDirectory)!.FullName,
                        $"*Profiles{tenantIdentifier}.xml"))
                .ToArray();
        }

        var profileDefinitionByName = new Dictionary<string, XmlNode>(StringComparer.OrdinalIgnoreCase);

        foreach (var profileFilename in profileFilenames)
        {
            var doc = new XmlDocument();
            doc.Load(profileFilename);

            var profileDefinitions = doc.SelectNodes("/Profiles/Profile");

            foreach (XmlNode profileDefinition in profileDefinitions)
            {
                string profileName = profileDefinition.Attributes["name"].Value;

                profileDefinitionByName.Add(profileName, profileDefinition);
            }
        }

        return profileDefinitionByName;
    }

    public static void ImportProfiles(IClientAppRepo clientAppRepo, Dictionary<string, XmlNode> profileDefinitionByName)
    {
        var profiles = new List<Profile>();

        foreach (var kvp in profileDefinitionByName)
        {
            profiles.Add(
                new Profile()
                {
                    ProfileDefinition = kvp.Value.OuterXml,
                    ProfileName = kvp.Key
                });
        }

        clientAppRepo.CreateProfilesWithProfileDefinition(profiles);
    }
}

public class ImportProfilesToAdminStartupCommand(IClientAppRepo _clientAppRepo) : IStartupCommand
{
    private readonly ILog _logger = LogManager.GetLogger(typeof(ImportProfilesToAdminStartupCommand));

    public Task ExecuteAsync()
    {
        var profileDefinitionByName = ProfilesImportHelper.LoadProfiles();

        if (profileDefinitionByName.Count > 0)
        {
            _logger.Debug($"Loading Profiles into the Ed-Fi Admin Database ...");
            ProfilesImportHelper.ImportProfiles(_clientAppRepo, profileDefinitionByName);
        }

        return Task.CompletedTask;
    }
}
