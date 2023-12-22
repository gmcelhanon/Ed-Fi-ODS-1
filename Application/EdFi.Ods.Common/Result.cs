// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Collections.Generic;
using System.Linq;

namespace EdFi.Ods.Common;

public class Result<T>
{
    private Result(T value, string errorMessage)
    {
        Value = value;
        ErrorMessage = errorMessage;
    }
    
    public T Value { get; set; }

    public string ErrorMessage { get; set; }

    public bool IsSuccess => ErrorMessage == null;

    public static Result<T> Success(T value) => new(value, null);
    public static Result<T> Failure(string errorMessage) => new(default, errorMessage);
}

public static class ValueTupleExtensions
{
    public static bool IsSuccess<TResult>(this (TResult result, Exception ex) tuple)
    {
        return tuple.ex == null;
    }

    public static (TResult result, Exception ex) AsSuccess<TResult>(this TResult result)
    {
        return (result, default);
    }
    
    public static (TResult result, Exception ex) AsResult<TResult>(this TResult result)
    {
        return (result, default);
    }

    public static (TResult result, Exception ex) AsFailed<TResult>(this Exception ex)
    {
        return (default, ex);
    }

    public static bool TryGetFailedResults<TOther, TResult>(
        this IList<ValueTuple<TOther, Exception>> results,
        out (TResult result, Exception ex) failedResult)
    {
        if (results.Any(r => !r.IsSuccess()))
        {
            failedResult = (default, new AggregateException(results.Select(r => r.Item2)));
            return true;
        }

        failedResult = default;
        return false;
    }
}
