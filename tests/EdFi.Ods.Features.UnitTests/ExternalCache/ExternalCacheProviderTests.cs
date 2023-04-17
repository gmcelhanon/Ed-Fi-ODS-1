// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Text;
using EdFi.Ods.Features.ExternalCache;
using EdFi.Ods.Features.ExternalCache.Serialization;
using FakeItEasy;
using Microsoft.Extensions.Caching.Distributed;
using Newtonsoft.Json;
using NUnit.Framework;
using Shouldly;

namespace EdFi.Ods.Features.UnitTests.ExternalCache;

[TestFixture]
public class ExternalCacheProviderTests
{
    private IDistributedCache _distributedCache;
    private IDistributedCacheSerializationHandler[] _serializationHandlers;
    private IDistributedCacheDeserializationHandler[] _deserializationHandlers;
    private TimeSpan _slidingExpiration;
    private TimeSpan _absoluteExpiration;

    [SetUp]
    public void SetUp()
    {
        _distributedCache = A.Fake<IDistributedCache>();
        _serializationHandlers = new IDistributedCacheSerializationHandler[] { new GuidDistributedCacheSerializationHandler(), new IntDistributedCacheSerializationHandler() };
        _deserializationHandlers = new IDistributedCacheDeserializationHandler[] { new GuidDistributedCacheDeserializationHandler(), new IntDistributedCacheDeserializationHandler() };
        _slidingExpiration = TimeSpan.FromMinutes(10);
        _absoluteExpiration = TimeSpan.FromHours(1);
    }

    [Test]
    public void TryGetCachedObject_KeyNotFound_ReturnsFalseAndNull()
    {
        // Arrange
        var key = "test-key";
        A.CallTo(() => _distributedCache.Get(key)).Returns(null);

        var cacheProvider = new ExternalCacheProvider<string>(_distributedCache, _serializationHandlers, _deserializationHandlers, _slidingExpiration, _absoluteExpiration);

        // Act
        var result = cacheProvider.TryGetCachedObject(key, out var value);

        // Assert
        result.ShouldBeFalse();
        value.ShouldBeNull();
    }

    [Test]
    public void TryGetCachedObject_KeyFoundAndDeserializationSucceeds_ReturnsTrueAndValue()
    {
        // Arrange
        var key = "test-key";
        var expectedValue = new Guid("b6a354d6-79cf-4ef9-ba5e-4e4bb4d4e2f2");
        var serializedValue = $"{SerializationPrefixes.Guid}{expectedValue:N}";

        A.CallTo(() => _distributedCache.Get(key)).Returns(Encoding.UTF8.GetBytes(serializedValue));

        var cacheProvider = new ExternalCacheProvider<string>(_distributedCache, _serializationHandlers, _deserializationHandlers, _slidingExpiration, _absoluteExpiration);

        // Act
        var result = cacheProvider.TryGetCachedObject(key, out var value);

        // Assert
        result.ShouldBeTrue();
        value.ShouldBe(expectedValue);
    }

    [Test]
    public void SetCachedObject_SerializationSucceeds_CallsDistributedCacheSetString()
    {
        // Arrange
        var key = "test-key";
        var expectedValue = new Guid("b6a354d6-79cf-4ef9-ba5e-4e4bb4d4e2f2");
        var serializedValue = $"{SerializationPrefixes.Guid}{expectedValue:N}";
        var serializedValueBytes = Encoding.UTF8.GetBytes(serializedValue);

        var cacheProvider = new ExternalCacheProvider<string>(_distributedCache, _serializationHandlers, _deserializationHandlers, _slidingExpiration, _absoluteExpiration);

        // Act
        cacheProvider.SetCachedObject(key, expectedValue);

        // Assert
        A.CallTo(() => _distributedCache.Set(key, A<byte[]>.That.Matches(actualBytes => actualBytes.Select((b, i) => b == serializedValueBytes[i]).All(x => x == true)), A<DistributedCacheEntryOptions>._))
            .MustHaveHappenedOnceExactly();
    }

    [Test]
    public void Insert_SerializationSucceeds_CallsDistributedCacheSetString()
    {
        // Arrange
        var key = "test-key";
        var expectedValue = new Guid("b6a354d6-79cf-4ef9-ba5e-4e4bb4d4e2f2");
        var serializedValue = $"{SerializationPrefixes.Guid}{expectedValue:N}";
        var serializedValueBytes = Encoding.UTF8.GetBytes(serializedValue);

        var cacheProvider = new ExternalCacheProvider<string>(_distributedCache, _serializationHandlers, _deserializationHandlers, _slidingExpiration, _absoluteExpiration);

        // Act
        cacheProvider.Insert(key, expectedValue, DateTime.Today.AddDays(1), TimeSpan.FromHours(1));

        // Assert
        A.CallTo(() => _distributedCache.Set(key, 
                A<byte[]>.That.Matches(actualBytes => 
                    actualBytes.Select((b, i) => b == serializedValueBytes[i]).All(x => x == true)), 
                A<DistributedCacheEntryOptions>.That.Matches(actualOptions => 
                    actualOptions.AbsoluteExpiration == DateTime.Today.AddDays(1)
                    && actualOptions.SlidingExpiration == TimeSpan.FromHours(1))))
            .MustHaveHappenedOnceExactly();
    }
}