// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.
 
using System;
using System.Collections.Generic;
using System.Linq;
using EdFi.Ods.Common;
using EdFi.Ods.Common.Conventions;
using NHibernate;
using NHibernate.Criterion;
using NHibernate.SqlCommand;

public static class ICriteriaExtensions
{
    /// <summary>
    /// Applies a join-based filter to the criteria for the specified authorization view.
    /// </summary>
    /// <param name="criteria">The criteria to which filters should be applied.</param>
    /// <param name="whereJunction">The <see cref="ICriterion" /> container for adding WHERE clause criterion.</param>
    /// <param name="parameters">The named parameters to be used to satisfy additional filtering requirements.</param>
    /// <param name="viewName">The name of the view to be filtered.</param>
    /// <param name="joinPropertyName">The name of the property to be joined between the entity being queried and the authorization view.</param>
    /// <param name="filterPropertyName">The name of the property to be used for applying filter values.</param>
    /// <param name="joinType">The <see cref="JoinType" /> to be used.</param>
    public static void ApplyJoinFilter(
        this ICriteria criteria,
        Junction whereJunction,
        IDictionary<string, object> parameters,
        string viewName,
        string joinPropertyName,
        string filterPropertyName,
        JoinType joinType)
    {
        string authViewAlias = $"authView{viewName}";

        // Apply authorization join using ICriteria
        criteria.CreateEntityAlias(
            authViewAlias,
            Restrictions.EqProperty($"aggregateRoot.{joinPropertyName}", $"{authViewAlias}.{joinPropertyName}"),
            joinType,
            $"{viewName.GetAuthorizationViewClassName()}".GetFullNameForView());

        object value;

        // Defensive check to ensure required parameter is present
        if (!parameters.TryGetValue(filterPropertyName, out value))
            throw new Exception($"Unable to find parameter for filtering '{filterPropertyName}' on view '{viewName}'.");

        var arrayOfValues = value as object[];

        if (arrayOfValues != null)
        {
            if (joinType == JoinType.InnerJoin)
            {
                whereJunction.Add(Restrictions.In($"{authViewAlias}.{filterPropertyName}", arrayOfValues));
            }
            else
            {
                var and = new AndExpression(
                    Restrictions.In($"{authViewAlias}.{filterPropertyName}", arrayOfValues),
                    Restrictions.IsNotNull($"{authViewAlias}.{joinPropertyName}"));
                
                whereJunction.Add(and);
            }
        }
        else
        {
            if (joinType == JoinType.InnerJoin)
            {
                whereJunction.Add(Restrictions.Eq($"{authViewAlias}.{filterPropertyName}", value));
            }
            else
            {
                var and = new AndExpression(
                    Restrictions.Eq($"{authViewAlias}.{filterPropertyName}", value),
                    Restrictions.IsNotNull($"{authViewAlias}.{joinPropertyName}"));
                
                whereJunction.Add(and);
            }
        }
    }

#region To Be Deleted

    /*
    public class AuthorizationViewJoin
    {
        /// <summary>
        /// Gets the name of the view to use for filtering results.
        /// </summary>
        public string ViewName { get; }

        /// <summary>
        /// Gets the name of the property to be joined between the entity being queried and the authorization view.
        /// </summary>
        public string JoinPropertyName { get; }

        /// <summary>
        /// Gets the name of the property for which specific values will be used for filtering.
        /// </summary>
        public string FilterPropertyName { get; }

        /// <summary>
        /// The complete set of named property values available for use in filtering, accessible by property name.
        /// </summary>
        public IDictionary<string, object> AvailableFilterValues { get; }
    }

    /// <summary>
    /// Applies a join-based filter to the criteria for the specified authorization view.
    /// </summary>
    /// <param name="criteria">The <see cref="ICriteria" /> instance to which filters should be applied.</param>
    /// <param name="authorizationViewJoins">An array of authorization joins to be added to the query.</param>
    public static void ApplyJoinFilter(this ICriteria criteria, AuthorizationViewJoin[] authorizationViewJoins)
    {
        if (authorizationViewJoins.Length == 1)
        {
            var authorizationViewJoin = authorizationViewJoins.Single();

            string authViewAlias = $"authView{authorizationViewJoin.ViewName}";

            // Apply authorization join using ICriteria
            criteria.CreateEntityAlias(
                authViewAlias,
                Restrictions.EqProperty(
                    $"aggregateRoot.{authorizationViewJoin.JoinPropertyName}",
                    $"{authViewAlias}.{authorizationViewJoin.JoinPropertyName}"),
                JoinType.InnerJoin,
                $"{authorizationViewJoin.ViewName.GetAuthorizationViewClassName()}".GetFullNameForView());

            var parameters = authorizationViewJoin.AvailableFilterValues;

            object value;

            // Defensive check to ensure required parameter is present
            if (!parameters.TryGetValue(authorizationViewJoin.FilterPropertyName, out value))
                throw new Exception(
                    $"Unable to find parameter for filtering '{authorizationViewJoin.FilterPropertyName}' on view '{authorizationViewJoin.ViewName}'.");

            var arrayOfValues = value as object[];

            if (arrayOfValues != null)
                criteria.Add(Restrictions.In($"{authViewAlias}.{authorizationViewJoin.FilterPropertyName}", arrayOfValues));
            else
                criteria.Add(Restrictions.Eq($"{authViewAlias}.{authorizationViewJoin.FilterPropertyName}", value));
        }

        var disjunctions = new Disjunction();

        foreach (var authorizationViewJoin in authorizationViewJoins)
        {
            string authViewAlias = $"authView{authorizationViewJoin.ViewName}";

            // Apply authorization join using ICriteria
            criteria.CreateEntityAlias(
                authViewAlias,
                Restrictions.And(
                    Restrictions.EqProperty(
                        $"aggregateRoot.{authorizationViewJoin.JoinPropertyName}",
                        $"{authViewAlias}.{authorizationViewJoin.JoinPropertyName}"),
                    Restrictions.IsNotNull($"{authViewAlias}.{authorizationViewJoin.JoinPropertyName}")),
                JoinType.LeftOuterJoin,
                $"{authorizationViewJoin.ViewName.GetAuthorizationViewClassName()}".GetFullNameForView());

            object value;

            // Defensive check to ensure required parameter is present
            if (!authorizationViewJoin.AvailableFilterValues.TryGetValue(authorizationViewJoin.FilterPropertyName, out value))
                throw new Exception($"Unable to find parameter for filtering '{authorizationViewJoin.FilterPropertyName}' on view '{authorizationViewJoin.ViewName}'.");

            var arrayOfValues = value as object[];

            if (arrayOfValues != null)
                criteria.Add(Restrictions.In($"{authViewAlias}.{authorizationViewJoin.FilterPropertyName}", arrayOfValues));
            else
                criteria.Add(Restrictions.Eq($"{authViewAlias}.{authorizationViewJoin.FilterPropertyName}", value));
        }
    }
    */

#endregion

    /// <summary>
    /// Applies property-level filter expressions to the criteria as either Equal or In expressions based on the supplied parameters.
    /// </summary>
    /// <param name="whereJunction">The <see cref="ICriterion" /> container for adding WHERE clause criterion.</param>
    /// <param name="parameters">The named parameters to be processed into the criteria query.</param>
    /// <param name="availableFilterProperties">The array of property names that can be used for filtering.</param>
    public static void ApplyPropertyFilters(this Junction whereJunction, IDictionary<string, object> parameters, params string[] availableFilterProperties)
    {
        foreach (var nameAndValue in parameters.Where(x => availableFilterProperties.Contains(x.Key, StringComparer.OrdinalIgnoreCase)))
        {
            var arrayOfValues = nameAndValue.Value as object[];

            if (arrayOfValues != null)
                whereJunction.Add(Restrictions.In($"{nameAndValue.Key}", arrayOfValues));
            else
                whereJunction.Add(Restrictions.Eq($"{nameAndValue.Key}", nameAndValue.Value));
        }
    }

    private static string GetFullNameForView(this string viewName)
    {
        return Namespaces.Entities.NHibernate.QueryModels.GetViewNamespace(viewName);
    }
}