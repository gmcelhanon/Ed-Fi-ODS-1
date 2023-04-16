// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System.Collections.Concurrent;
using EdFi.Ods.Api.Caching;
using EdFi.Ods.Features.ExternalCache.Serialization;
using Newtonsoft.Json;
using NUnit.Framework;
using Shouldly;

namespace EdFi.Ods.Features.UnitTests.ExternalCache.Serialization;

[TestFixture]
public class PersonIdentityValueMapDistributedCacheDeserializationHandlerTests
{
    [Test]
    public void TryHandle_WithMatchingCacheKey_ReturnsTrueAndDeserializedIdentityValueMaps()
    {
        // Arrange
        var handler = new PersonIdentityValueMapDistributedCacheDeserializationHandler();
        var cacheKey = $"{PersonUniqueIdToUsiCache.CacheKeyPrefix}-1";
        var usiByUniqueId = new ConcurrentDictionary<string, int>() { ["UniqueId1"] = 1, ["UniqueId2"] = 2 };
        var uniqueIdByUsi = new ConcurrentDictionary<int, string> { [1] = "UniqueId1", [2] = "UniqueId2" };

        var identityValueMaps = new PersonUniqueIdToUsiCache.IdentityValueMaps();
        identityValueMaps.SetMaps(usiByUniqueId, uniqueIdByUsi);
      
        var cachedValue = JsonConvert.SerializeObject(identityValueMaps);

        // Act
        bool result = handler.TryHandle(cacheKey, cachedValue, out object deserializedValue);

        // Assert
        result.ShouldBeTrue();
        deserializedValue.ShouldBeOfType<PersonUniqueIdToUsiCache.IdentityValueMaps>();
        var deserializedIdentityValueMaps = (PersonUniqueIdToUsiCache.IdentityValueMaps)deserializedValue;
        deserializedIdentityValueMaps.UsiByUniqueId.ShouldBe(usiByUniqueId);
        deserializedIdentityValueMaps.UniqueIdByUsi.ShouldBe(uniqueIdByUsi);
    }

    [Test]
    public void TryHandle_WithNonMatchingCacheKey_ReturnsFalseAndNullValue()
    {
        // Arrange
        var handler = new PersonIdentityValueMapDistributedCacheDeserializationHandler();
        var cacheKey = "NonMatchingCacheKey";
        var cachedValue = "SomeCachedValue";

        // Act
        bool result = handler.TryHandle(cacheKey, cachedValue, out object deserializedValue);

        // Assert
        result.ShouldBeFalse();
        deserializedValue.ShouldBeNull();
    }

    [Test]
    public void TryHandle_WithNullCacheValue_ReturnsTrueAndNullValue()
    {
        // Arrange
        var handler = new PersonIdentityValueMapDistributedCacheDeserializationHandler();
        var cacheKey = $"{PersonUniqueIdToUsiCache.CacheKeyPrefix}-1";
        string cachedValue = null;

        // Act
        bool result = handler.TryHandle(cacheKey, cachedValue, out object deserializedValue);

        // Assert
        result.ShouldBeTrue();
        deserializedValue.ShouldBeNull();
    }

    [Test]
    public void TryHandle_WithEmptyCacheValue_ReturnsTrueAndNullValue()
    {
        // Arrange
        var handler = new PersonIdentityValueMapDistributedCacheDeserializationHandler();
        var cacheKey = $"{PersonUniqueIdToUsiCache.CacheKeyPrefix}-1";
        var cachedValue = string.Empty;

        // Act
        bool result = handler.TryHandle(cacheKey, cachedValue, out object deserializedValue);

        // Assert
        result.ShouldBeTrue();
        deserializedValue.ShouldBeNull();
    }

    [Test]
    public void TryHandle_WithInitializedButNotSetIdentityValueMaps_ReturnsTrueAndNullValue()
    {
        // Arrange
        var handler = new PersonIdentityValueMapDistributedCacheDeserializationHandler();
        var cacheKey = $"{PersonUniqueIdToUsiCache.CacheKeyPrefix}-1";
        var identityValueMaps = new PersonUniqueIdToUsiCache.IdentityValueMaps();

        var cachedValue = JsonConvert.SerializeObject(identityValueMaps);

        // Act
        bool result = handler.TryHandle(cacheKey, cachedValue, out object deserializedValue);

        // Assert
        result.ShouldBeTrue();
        deserializedValue.ShouldBeNull();

    }
}
