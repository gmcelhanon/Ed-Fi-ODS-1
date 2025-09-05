// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Threading;
using FakeItEasy;
using NUnit.Framework;
using Shouldly;
using EdFi.Security.DataAccess.Utils;

namespace EdFi.Security.DataAccess.UnitTests.Utils;

[TestFixture]
public class ResettableLazyTests
{
    [Test]
    public void Value_Should_Initialize_Only_Once_When_Accessed()
    {
        // Arrange
        var valueFactory = A.Fake<Func<int>>();
        A.CallTo(() => valueFactory.Invoke()).Returns(42); // Fake the factory to return 42
        var resettableLazy = new ResettableLazy<int>(valueFactory);

        // Act
        var value1 = resettableLazy.Value;
        var value2 = resettableLazy.Value;

        // Assert
        value1.ShouldBe(42);
        value2.ShouldBe(42);
        A.CallTo(() => valueFactory.Invoke()).MustHaveHappenedOnceExactly(); // Ensure the factory was called only once
    }

    [Test]
    public void IsValueCreated_Should_Be_False_Until_Value_Accessed()
    {
        // Arrange
        var resettableLazy = new ResettableLazy<int>(() => 42);

        // Act & Assert
        resettableLazy.IsValueCreated.ShouldBeFalse();

        // Access the value
        var value = resettableLazy.Value;

        // Assert
        resettableLazy.IsValueCreated.ShouldBeTrue();
    }

    [Test]
    public void Reset_Should_Trigger_New_Initialization()
    {
        // Arrange
        var valueFactory = A.Fake<Func<int>>();
        A.CallTo(() => valueFactory.Invoke()).ReturnsNextFromSequence(42, 84); // Fake factory to return 42 first, then 84
        var resettableLazy = new ResettableLazy<int>(valueFactory);

        // Act
        var value1 = resettableLazy.Value;
        var value2 = resettableLazy.Value;
        resettableLazy.Reset();
        var value3 = resettableLazy.Value;

        // Assert
        value1.ShouldBe(42);
        value2.ShouldBe(42);
        value3.ShouldBe(84);
        A.CallTo(() => valueFactory.Invoke()).MustHaveHappenedTwiceExactly(); // Ensure the factory was called twice
    }

    [Test]
    public void Value_Should_Reinitialize_On_Exception()
    {
        // Arrange
        var valueFactory = A.Fake<Func<int>>();

        A.CallTo(() => valueFactory.Invoke())
            .Throws<InvalidOperationException>()
            .Once()
            .Then.Returns(42); // Fake factory throws once, then returns 42

        var resettableLazy = new ResettableLazy<int>(valueFactory);

        // Act & Assert
        Should.Throw<InvalidOperationException>(() => resettableLazy.Value);
        var value = resettableLazy.Value;

        // Assert
        value.ShouldBe(42);
        A.CallTo(() => valueFactory.Invoke()).MustHaveHappenedTwiceExactly(); // Ensure the factory was called twice
    }

    [Test]
    public void Constructor_Should_Throw_If_Null_Function_Passed()
    {
        // Act & Assert
        Should.Throw<ArgumentNullException>(() => new ResettableLazy<int>(null));
    }

    [Test]
    public void Value_Should_Initialize_Only_Once_Even_With_Multiple_Threads()
    {
        // Arrange
        var valueFactory = A.Fake<Func<int>>();
        A.CallTo(() => valueFactory.Invoke()).Returns(42); // Fake factory to return 42
        var resettableLazy = new ResettableLazy<int>(valueFactory);

        const int ThreadCount = 50;
        var threads = new Thread[ThreadCount];
        var results = new int[ThreadCount];

        // Act
        for (int i = 0; i < ThreadCount; i++)
        {
            int threadIndex = i; // Prevent closure issues
            threads[i] = new Thread(() => { results[threadIndex] = resettableLazy.Value; });
        }

        foreach (var thread in threads)
        {
            thread.Start();
        }

        foreach (var thread in threads)
        {
            thread.Join();
        }

        // Assert
        foreach (var result in results)
        {
            result.ShouldBe(42); // Every thread should see the initialized value
        }

        A.CallTo(() => valueFactory.Invoke()).MustHaveHappenedOnceExactly(); // Ensure the factory was called only once
    }
}
