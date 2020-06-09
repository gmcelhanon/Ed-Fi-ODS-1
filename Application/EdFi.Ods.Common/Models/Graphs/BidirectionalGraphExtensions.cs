// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.
 
using System;
using System.Collections.Generic;
using System.Linq;
using EdFi.Ods.Common.Extensions;
using log4net;
using QuickGraph;
using QuickGraph.Algorithms;

namespace EdFi.Ods.Common.Models.Graphs
{
    public static class BidirectionalGraphExtensions
    {
        private static readonly ILog _logger = LogManager.GetLogger(typeof(BidirectionalGraphExtensions));
        
        public static IReadOnlyList<Cycle<TVertex, TEdge>> GetCycles<TVertex, TEdge>(
            this BidirectionalGraph<TVertex, TEdge> graph)
            where TEdge : IEdge<TVertex>
        {
            // Initialize vertex, and current stack tracking 
            var visited = new HashSet<TVertex>(); 
            var stack = new List<TVertex>();
            var edgesStack = new List<TEdge>();
            var cycles = new List<Cycle<TVertex, TEdge>>();
            
            // Call the recursive helper function to detect cycle in different DFS trees
            foreach (var vertex in graph.Vertices)
            {
                _logger.Debug($"Probing node '{vertex}' for cyclical dependencies...");
                graph.FindCycles(vertex, visited, stack, edgesStack, cycles);
            }

            return cycles;
        }

        public static void ValidateGraph<TVertex, TEdge>(
            this BidirectionalGraph<TVertex, TEdge> graph)
            where TEdge : IEdge<TVertex>
        {
            var cycles = GetCycles(graph);
            
            if (cycles.Any())
            {
                string cycleExplanations = string.Join(
                    Environment.NewLine + Environment.NewLine,
                    cycles.Select(c => $"{string.Join(Environment.NewLine + "    is used by ", c.Path.Select(x => x.ToString()))}"));

                string dependencyPluralization = (cycles.Count == 1
                    ? "dependency"
                    : "dependencies");

                var exception = new NonAcyclicGraphException($@"Circular {dependencyPluralization} found:{Environment.NewLine}{cycleExplanations}");
                exception.Data["Cycles"] = cycles.ToArray();

                throw exception;
            }
        }

        private static void FindCycles<TVertex, TEdge>(
            this BidirectionalGraph<TVertex, TEdge> executionGraph,
            TVertex vertex, 
            HashSet<TVertex> visited, 
            List<TVertex> stack, 
            List<TEdge> edgesStack, 
            List<Cycle<TVertex, TEdge>> cycles)
            where TEdge : IEdge<TVertex>
        {
            // Do we have a circular dependency?
            if (stack.Contains(vertex))
            {
                var cycle = new Cycle<TVertex, TEdge>
                            {
                                Vertex = vertex.ToString(),
                                Path = stack.SkipWhile(x => !x.Equals(vertex))
                                            .Concat(new[] { vertex })
                                            .ToList(),
                                StartingVertex = vertex,
                                Edges = edgesStack.SkipWhile(e => !Equals(e.Source, vertex)).ToList(),
                            };

                if (_logger.IsDebugEnabled)
                {
                    _logger.Debug($"Cycle found for vertex '{cycle.Vertex}': {string.Join(" --> ", cycle.Path.Select(x => x.ToString()))}");
                }
                
                cycles.Add(cycle);
                visited.Add(vertex);
                return;
            }

            // If we've already evaluated this vertex, stop now.
            if (visited.Contains(vertex)) 
                return; 

            // Mark the current node as visited and part of recursion stack 
            visited.Add(vertex);
            stack.Add(vertex);

            try
            {
                var outEdges = executionGraph
                              .OutEdges(vertex)
                              // .Select(x => x.Target)
                              .ToList();

                if (_logger.IsDebugEnabled)
                {
                    if (outEdges.Any())
                    {
                        _logger.Debug($"Children of {vertex}: {string.Join(" => ", outEdges.Select(x => x.ToString()))}");
                    }
                }
                
                foreach (var outEdge in outEdges)
                {
                    edgesStack.Add(outEdge);

                    try
                    {
                        executionGraph.FindCycles(outEdge.Target, visited, stack, edgesStack, cycles);
                    }
                    finally
                    {
                        edgesStack.Remove(outEdge);
                    }
                }
            }
            finally
            {
                stack.Remove(vertex);
            }
        }

        /// <summary>
        /// Attempts to break cycles in the graph by removing the deepest remove edge, as defined
        /// by the supplied predicate function.
        /// </summary>
        /// <param name="graph">The bidirectional graph to be processed.</param>
        /// <param name="isRemovable">A function indicating whether or not a particular edge can be removed (i.e. is a "soft" dependency).</param>
        /// <typeparam name="TVertex">The <see cref="Type" /> of the vertices of the graph.</typeparam>
        /// <typeparam name="TEdge">The <see cref="Type" /> of the edges of the graph.</typeparam>
        /// <returns>The list of edges that were removed to break the cycle(s).</returns>
        /// <exception cref="NonAcyclicGraphException">Occurs if one or more of the cycles present in the graph cannot be broken by removing one of its edges.</exception>
        public static IReadOnlyList<Cycle<TVertex, TEdge>> BreakCycles<TVertex, TEdge>(this BidirectionalGraph<TVertex, TEdge> graph, Func<TEdge, bool> isRemovable)
            where TEdge : IEdge<TVertex>
        {
            var removedEdges = new List<TEdge>();
            
            // Get cyclical dependencies found in the graph
            var cycles = graph.GetCycles();

            // Break circular dependencies
            foreach (var cycle in cycles)
            {
                // Last element of Path repeats first element (so ignore duplicate)
                var distinctPathVertices = cycle.Path.Take(cycle.Path.Count - 1).ToArray();
                
                var sacrificialDependency = distinctPathVertices  
                    .Select(
                        (e, i) =>
                        {
                            // Get the next entity in the path (circling around to the first entity on the last item)
                            var dependentVertex = distinctPathVertices[(i + 1) % distinctPathVertices.Length];
                            
                            return new
                            {
                                DependentVertex = dependentVertex,
                                CycleEdges = graph.InEdges(dependentVertex).Where(IsCycleEdge)
                            };
                        })
                    .Reverse()
                    .FirstOrDefault(x => x.CycleEdges.All(isRemovable));

                if (sacrificialDependency == null)
                {
                    graph.ValidateGraph();

                    // Should never get here in this situation, but throw an exception to satisfy code analysis warnings
                    throw new NonAcyclicGraphException();
                }

                // Remove the chosen graph edge(s) to break the cyclical dependency to allow processing to proceed
                foreach (TEdge edge in sacrificialDependency.CycleEdges.ToArray())
                {
                    if (_logger.IsDebugEnabled)
                    {
                        _logger.Debug($"Edge '{edge.ToString()}' removed to prevent the following cycle: {string.Join(" --> ", cycle.Path.Select(x => x.ToString()))}");
                    }
                        
                    graph.RemoveEdge(edge);
                    removedEdges.Add(edge);
                }

                bool IsCycleEdge(TEdge edge) => distinctPathVertices.Contains(edge.Source);
            }

            if (_logger.IsDebugEnabled)
            {
                _logger.Debug($@"The following edges were removed from the graph to prevent cycles:
{string.Join(Environment.NewLine, removedEdges.Select(x => x.ToString()))}");
            }
            
            return cycles;
        }
    }

    /// <summary>
    /// Represents a cycle in the graph.
    /// </summary>
    /// <typeparam name="TVertex">The <see cref="Type" /> of the vertices in the graph.</typeparam>
    /// <typeparam name="TEdge">The <see cref="Type" /> of the edge connecting the vertices in the graph.</typeparam>
    public class Cycle<TVertex, TEdge>
        where TEdge : IEdge<TVertex>
    {
        /// <summary>
        /// The string representation of the initial vertex being probed when the cycle was found.
        /// </summary>
        public string Vertex { get; set; }
            
        /// <summary>
        /// The list of vertices found that form the cycle, with the first vertex also appearing as the last vertex.
        /// </summary>
        public List<TVertex> Path { get; set; }

        /// <summary>
        /// The vertex being probed when the cycle was found.
        /// </summary>
        public TVertex StartingVertex { get; set; }
            
        /// <summary>
        /// Contains the edges that form the cycle back to the starting vertex.
        /// </summary>
        public List<TEdge> Edges { get; set; }
    }
}
