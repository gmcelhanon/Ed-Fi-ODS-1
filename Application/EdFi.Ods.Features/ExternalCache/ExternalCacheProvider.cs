// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using EdFi.Ods.Common.Exceptions;
using log4net;
using Microsoft.Extensions.Caching.Distributed;
using Newtonsoft.Json;
using System;
using EdFi.Ods.Features.ExternalCache.Serialization;

namespace EdFi.Ods.Features.ExternalCache
{
    public class ExternalCacheProvider<TKey> : IExternalCacheProvider<TKey>
    {
        private const string DefaultExceptionMessage = "Unable to access distributed cache.";

        private readonly IDistributedCache _distributedCache;
        private readonly IDistributedCacheSerializationHandler[] _serializationHandlers;
        private readonly IDistributedCacheDeserializationHandler[] _deserializationHandlers;
        private readonly TimeSpan _absoluteExpiration;
        private readonly TimeSpan _slidingExpiration;
        private readonly ILog _logger = LogManager.GetLogger(typeof(ExternalCacheProvider<TKey>));

        // TypeNameHandling.None for https://docs.microsoft.com/en-us/dotnet/fundamentals/code-analysis/quality-rules/ca2326
        private static readonly JsonSerializerSettings _defaultSerializerSettings = new()
        {
            TypeNameHandling = TypeNameHandling.None,
            ReferenceLoopHandling = ReferenceLoopHandling.Ignore
        };

        public ExternalCacheProvider(
            IDistributedCache distributedCache,
            IDistributedCacheSerializationHandler[] serializationHandlers,
            IDistributedCacheDeserializationHandler[] deserializationHandlers,
            TimeSpan slidingExpiration,
            TimeSpan absoluteExpiration)
        {
            _distributedCache = distributedCache;
            _serializationHandlers = serializationHandlers;
            _deserializationHandlers = deserializationHandlers;
            _slidingExpiration = slidingExpiration;
            _absoluteExpiration = absoluteExpiration;
        }
        
        public bool TryGetCachedObject(TKey key, out object value)
        {
            try
            {
                var keyAsString = key.ToString();
                
                var cachedValue = _distributedCache.GetString(keyAsString);

                if (!string.IsNullOrEmpty(cachedValue))
                {
                    value = Deserialize(keyAsString, cachedValue);
                    return true;
                }

                value = null;
                return false;
            }
            catch (Exception ex)
            {
                _logger.Error(ex);
                throw new DistributedCacheException(DefaultExceptionMessage, ex);
            }
        }

        public void SetCachedObject(TKey key, object obj)
        {
            try
            {
                _distributedCache.SetString(key.ToString(), Serialize(obj), new DistributedCacheEntryOptions()
                {
                    AbsoluteExpirationRelativeToNow = _absoluteExpiration.TotalSeconds > 0 ? _absoluteExpiration : null,
                    SlidingExpiration = _slidingExpiration.TotalSeconds > 0 ? _slidingExpiration : null
                });
            }
            catch (Exception ex)
            {
                _logger.Error(ex);
                throw new DistributedCacheException(DefaultExceptionMessage, ex);
            }
        }

        public void Insert(TKey key, object value, DateTime absoluteExpiration, TimeSpan slidingExpiration)
        {
            try
            {
                _distributedCache.SetString(key.ToString(), Serialize(value), new DistributedCacheEntryOptions()
                {
                    AbsoluteExpiration = absoluteExpiration < DateTime.MaxValue ? absoluteExpiration : null,
                    SlidingExpiration = slidingExpiration.TotalSeconds > 0 ? slidingExpiration : null
                });
            }
            catch (Exception ex)
            {
                _logger.Error(ex);
                throw new DistributedCacheException(DefaultExceptionMessage, ex);
            }
        }

        private string Serialize(object value)
        {
            foreach (var serializationHandler in _serializationHandlers)
            {
                if (serializationHandler.TryHandle(value, out string serializedValue))
                {
                    return serializedValue;
                }
            }
            
            return JsonConvert.SerializeObject(value, _defaultSerializerSettings);
        }

        private object Deserialize(string key, string cachedValue)
        {
            // Try to deserialize cached value using a special handler
            foreach (var deserializationHandler in _deserializationHandlers)
            {
                if (deserializationHandler.TryHandle(key, cachedValue, out object value))
                {
                    return value;
                }
            }

            try
            {
                // Simple cache like descriptors can be deserialized without explicit type names
                return JsonConvert.DeserializeObject(cachedValue, _defaultSerializerSettings);
            }
            catch (JsonException e)
            {
                _logger.Warn($"Exception during deserialization of the string \"{cachedValue}\". Message: \"{e.Message}\"");
                return null;
            }
        }
    }
}