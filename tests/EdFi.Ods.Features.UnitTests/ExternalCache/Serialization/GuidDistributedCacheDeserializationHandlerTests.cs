// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using EdFi.Ods.Features.ExternalCache.Serialization;
using NUnit.Framework;
using Shouldly;

namespace EdFi.Ods.Features.UnitTests.ExternalCache.Serialization;

public class GuidDistributedCacheDeserializationHandlerTests
{
    private GuidDistributedCacheDeserializationHandler _handler;

    [SetUp]
    public void SetUp()
    {
        _handler = new GuidDistributedCacheDeserializationHandler();
    }

    [Test]
    public void TryHandle_WithValidGuidValue_ReturnsTrueAndSetsOutValue()
    {
        // Arrange
        var key = "key";
        var cachedValue = $"{SerializationPrefixes.Guid}bd5d5e5c-7b38-43eb-8e45-946d481cf707";

        // Act
        var result = _handler.TryHandle(key, cachedValue, out var value);

        // Assert
        result.ShouldBeTrue();
        value.ShouldBeOfType<Guid>().ShouldBe(new Guid("bd5d5e5c-7b38-43eb-8e45-946d481cf707"));
    }

    [Test]
    public void TryHandle_WithInvalidGuidValue_ReturnsFalseAndSetsOutValueToNull()
    {
        // Arrange
        var key = "key";
        var cachedValue = $"{SerializationPrefixes.Guid}invalid-guid-value";

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
        var key = "key";
        var cachedValue = string.Empty;

        // Act
        var result = _handler.TryHandle(key, cachedValue, out var value);

        // Assert
        result.ShouldBeFalse();
        value.ShouldBeNull();
    }
}
