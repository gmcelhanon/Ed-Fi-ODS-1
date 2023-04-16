// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using EdFi.Ods.Features.ExternalCache.Serialization;
using NUnit.Framework;
using Shouldly;

namespace EdFi.Ods.Features.UnitTests.ExternalCache.Serialization;

public class GuidDistributedCacheSerializationHandlerTests
{
    [Test]
    public void TryHandle_GivenGuidValue_ShouldReturnTrueAndSerializedValue()
    {
        // Arrange
        var guid = Guid.NewGuid();
        var handler = new GuidDistributedCacheSerializationHandler();

        // Act
        var result = handler.TryHandle(guid, out var serializedValue);

        // Assert
        result.ShouldBeTrue();
        serializedValue.ShouldNotBeNullOrEmpty();
        serializedValue.ShouldStartWith(SerializationPrefixes.Guid);
        serializedValue.ShouldEndWith(guid.ToString("N"));
    }

    [Test]
    public void TryHandle_GivenNonGuidValue_ShouldReturnFalseAndNullSerializedValue()
    {
        // Arrange
        var value = "not a guid";
        var handler = new GuidDistributedCacheSerializationHandler();

        // Act
        var result = handler.TryHandle(value, out var serializedValue);

        // Assert
        result.ShouldBeFalse();
        serializedValue.ShouldBeNull();
    }
}
