// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;

namespace EdFi.Ods.Common.Descriptors;

public class DescriptorResolver : IDescriptorResolver
{
    private readonly IDescriptorDetailsProvider _descriptorDetailsProvider;
    private readonly IDescriptorMapsProvider _descriptorMapsProvider;

    public DescriptorResolver(
        IDescriptorMapsProvider descriptorMapsProvider,
        IDescriptorDetailsProvider descriptorDetailsProvider)
    {
        _descriptorMapsProvider = descriptorMapsProvider;
        _descriptorDetailsProvider = descriptorDetailsProvider;
    }

    public (int descriptorId, Exception ex) GetDescriptorId(string descriptorName, string uri)
    {
        if (uri == null)
        {
            return default(int).AsSuccess();
        }
        
        var descriptorMapsResult = _descriptorMapsProvider.GetMaps();

        if (!descriptorMapsResult.IsSuccess())
        {
            return descriptorMapsResult.ex.AsFailed<int>();
        }

        var descriptorMaps = descriptorMapsResult.maps;

        if (!descriptorMaps.DescriptorIdByUri.TryGetValue(uri, out int descriptorId))
        {
            var result = _descriptorDetailsProvider.GetDescriptorDetails(descriptorName, uri);

            if (!result.IsSuccess())
            {
                return result.ex.AsFailed<int>();
            }
            
            if (result.details != null)
            {
                // Add the details to the existing descriptor maps
                descriptorMaps.DescriptorIdByUri.TryAdd(result.details.Uri, result.details.DescriptorId);
                descriptorMaps.UriByDescriptorId.TryAdd(result.details.DescriptorId, result.details.Uri);

                return result.details.DescriptorId.AsSuccess();
            }

            return default(int).AsSuccess();
        }

        return descriptorId.AsSuccess();
    }

    public (string uri, Exception ex) GetUri(string descriptorName, int descriptorId)
    {
        if (descriptorId == default)
        {
            return default(string).AsSuccess();
        }
        
        var descriptorMapsResult = _descriptorMapsProvider.GetMaps();

        if (!descriptorMapsResult.IsSuccess())
        {
            return descriptorMapsResult.ex.AsFailed<string>();
        }

        var descriptorMaps = descriptorMapsResult.maps;
        
        if (!descriptorMaps.UriByDescriptorId.TryGetValue(descriptorId, out string uri))
        {
            var result = _descriptorDetailsProvider.GetDescriptorDetails(descriptorName, descriptorId);

            if (!result.IsSuccess())
            {
                return result.ex.AsFailed<string>();
            }

            var descriptorDetails = result.details;
            
            if (descriptorDetails != null)
            {
                // Add the details to the existing descriptor maps
                descriptorMaps.DescriptorIdByUri.TryAdd(descriptorDetails.Uri, descriptorDetails.DescriptorId);
                descriptorMaps.UriByDescriptorId.TryAdd(descriptorDetails.DescriptorId, descriptorDetails.Uri);

                return descriptorDetails.Uri.AsSuccess();
            }

            return default(string).AsSuccess();
        }

        return uri.AsSuccess();
    }
}
