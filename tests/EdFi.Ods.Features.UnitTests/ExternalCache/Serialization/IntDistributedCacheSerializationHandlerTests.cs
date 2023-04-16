// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System.Globalization;
using EdFi.Ods.Features.ExternalCache.Serialization;
using NUnit.Framework;
using Shouldly;

namespace EdFi.Ods.Features.UnitTests.ExternalCache.Serialization;

[TestFixture]
public class IntDistributedCacheSerializationHandlerTests
{
    [Test]
    public void TryHandle_WithIntValue_ReturnsTrueAndSerializesValue()
    {
        // Arrange
        var handler = new IntDistributedCacheSerializationHandler();
        int value = 42;

        // Act
        bool result = handler.TryHandle(value, out string serializedValue);

        // Assert
        result.ShouldBeTrue();
        serializedValue.ShouldBe($"{SerializationPrefixes.Int}{value.ToString()}");
    }

    [Test]
    public void TryHandle_WithNonIntValue_ReturnsFalseAndDoesNotSerializeValue()
    {
        // Arrange
        var handler = new IntDistributedCacheSerializationHandler();
        object value = "not an int";

        // Act
        bool result = handler.TryHandle(value, out string serializedValue);

        // Assert
        result.ShouldBeFalse();
        serializedValue.ShouldBeNull();
    }
}
