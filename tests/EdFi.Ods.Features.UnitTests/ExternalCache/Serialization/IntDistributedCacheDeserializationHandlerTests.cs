// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using EdFi.Ods.Features.ExternalCache.Serialization;
using NUnit.Framework;
using Shouldly;

namespace EdFi.Ods.Features.UnitTests.ExternalCache.Serialization;

[TestFixture]
public class IntDistributedCacheDeserializationHandlerTests
{
    private IDistributedCacheDeserializationHandler _handler;

    [SetUp]
    public void Setup()
    {
        _handler = new IntDistributedCacheDeserializationHandler();
    }

    [Test]
    public void TryHandle_WithIntValue_ReturnsTrueAndValue()
    {
        // Arrange
        string key = "test_key";
        string cachedValue = $"{SerializationPrefixes.Int}123";
        object value;

        // Act
        bool result = _handler.TryHandle(key, cachedValue, out value);

        // Assert
        result.ShouldBeTrue();
        value.ShouldBe(123);
    }

    [Test]
    public void TryHandle_WithInvalidIntValue_ReturnsFalseAndNullValue()
    {
        // Arrange
        string key = "test_key";
        string cachedValue = $"{SerializationPrefixes.Int}999999999999999999999999999999999999";
        object value;

        // Act
        bool result = _handler.TryHandle(key, cachedValue, out value);

        // Assert
        result.ShouldBeFalse();
        value.ShouldBeNull();
    }

    [Test]
    public void TryHandle_WithNonIntValue_ReturnsFalseAndNullValue()
    {
        // Arrange
        string key = "test_key";
        string cachedValue = "non_int_value";
        object value;

        // Act
        bool result = _handler.TryHandle(key, cachedValue, out value);

        // Assert
        result.ShouldBeFalse();
        value.ShouldBeNull();
    }
    
    [Test]
    public void TryHandle_WithNullCachedValue_ReturnsFalseAndSetsOutValueToNull()
    {
        // Arrange
        var key = "test_key";
        string cachedValue = null;

        // Act
        var result = _handler.TryHandle(key, cachedValue, out var value);

        // Assert
        result.ShouldBeFalse();
        value.ShouldBeNull();
    }

    [Test]
    public void TryHandle_WithEmptyCachedValue_ReturnsFalseAndSetsOutValueToNull()
    {
        // Arrange
        var key = "test_key";
        var cachedValue = string.Empty;

        // Act
        var result = _handler.TryHandle(key, cachedValue, out var value);

        // Assert
        result.ShouldBeFalse();
        value.ShouldBeNull();
    }
}

