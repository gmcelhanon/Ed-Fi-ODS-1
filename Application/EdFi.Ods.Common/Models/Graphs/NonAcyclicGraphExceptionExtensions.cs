// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using QuickGraph;

namespace EdFi.Ods.Common.Models.Graphs
{
    public static class NonAcyclicGraphExceptionExtensions
    {
        public static Cycle<TVertex, TEdge>[] GetCycles<TVertex, TEdge>(this NonAcyclicGraphException exception)
            where TEdge : IEdge<TVertex>
        {
            return (Cycle<TVertex, TEdge>[]) exception.Data["Cycles"];
        }
    }
}
