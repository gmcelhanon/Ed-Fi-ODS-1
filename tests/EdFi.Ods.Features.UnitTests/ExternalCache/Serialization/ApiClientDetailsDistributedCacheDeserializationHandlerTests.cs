// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using EdFi.Common.Security;
using EdFi.Ods.Api.Authentication;
using EdFi.Ods.Features.ExternalCache.Serialization;
using FakeItEasy;
using Newtonsoft.Json;
using NUnit.Framework;
using Shouldly;

namespace EdFi.Ods.Features.UnitTests.ExternalCache.Serialization;

public class ApiClientDetailsDistributedCacheDeserializationHandlerTests
{
    [Test]
    public void TryHandle_WithValidCacheKeyPrefix_ReturnsTrueAndDeserializedObject()
    {
        // Arrange
        var cacheKey = ApiClientDetailsCacheKeyProvider.CacheKeyPrefix + "myKey";
        var cachedValue = JsonConvert.SerializeObject(new ApiClientDetails() { ApiClientId = 1});
        var handler = new ApiClientDetailsDistributedCacheDeserializationHandler();

        // Act
        var result = handler.TryHandle(cacheKey, cachedValue, out var value);

        // Assert
        result.ShouldBeTrue();
        value.ShouldBeOfType<ApiClientDetails>();
        (value as ApiClientDetails).ApiClientId.ShouldBe(1);
    }

    [Test]
    public void TryHandle_WithNullCachedValue_ReturnsFalseAndNullValue()
    {
        // Arrange
        var cacheKey = ApiClientDetailsCacheKeyProvider.CacheKeyPrefix + "myKey";
        string cachedValue = null;
        var handler = new ApiClientDetailsDistributedCacheDeserializationHandler();

        // Act
        var result = handler.TryHandle(cacheKey, cachedValue, out var value);

        // Assert
        result.ShouldBeTrue();
        value.ShouldBeNull();
    }
    
    [Test]
    public void TryHandle_WithEmptyCachedValue_ReturnsTrueAndNullValue()
    {
        // Arrange
        var cacheKey = ApiClientDetailsCacheKeyProvider.CacheKeyPrefix + "myKey";
        string cachedValue = string.Empty;
        var handler = new ApiClientDetailsDistributedCacheDeserializationHandler();

        // Act
        var result = handler.TryHandle(cacheKey, cachedValue, out var value);

        // Assert
        result.ShouldBeTrue();
        value.ShouldBeNull();
    }

    [Test]
    public void TryHandle_WithNonMatchingCacheKeyPrefix_ReturnsFalseAndNullValue()
    {
        // Arrange
        var cacheKey = "myKey";
        var cachedValue = JsonConvert.SerializeObject(new ApiClientDetails());
        var handler = new ApiClientDetailsDistributedCacheDeserializationHandler();

        // Act
        var result = handler.TryHandle(cacheKey, cachedValue, out var value);

        // Assert
        result.ShouldBeFalse();
        value.ShouldBeNull();
    }

    [Test]
    public void TryHandle_WithInvalidCachedValue_ReturnsFalseAndNullValue()
    {
        // Arrange
        var cacheKey = ApiClientDetailsCacheKeyProvider.CacheKeyPrefix + "myKey";
        var cachedValue = "invalid value";
        var handler = new ApiClientDetailsDistributedCacheDeserializationHandler();

        // Act
        Should.Throw<JsonReaderException>(() => handler.TryHandle(cacheKey, cachedValue, out var value));
    }
}
