using System;
using System.Collections.Generic;

namespace EdFi.Ods.Generator.Common.Extensions
{
    public static class IEnumerableExtensions
    {
        public static IEnumerable<T> ForEach<T>(this IEnumerable<T> enumerable, Action<T, int> action)
        {
            var items = new List<T>();
            
            int i = 0;

            foreach (T obj in enumerable)
            {
                action(obj, i++);

                items.Add(obj);
            }

            return items;
        }

        public static IEnumerable<T> ForEach<T>(this IEnumerable<T> enumerable, Action<T> action)
        {
            var items = new List<T>();

            foreach (T obj in enumerable)
            {
                action(obj);
                items.Add(obj);
            }

            return items;
        }
    }
}