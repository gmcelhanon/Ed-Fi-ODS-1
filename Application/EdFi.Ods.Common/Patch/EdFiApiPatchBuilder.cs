// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using EdFi.Ods.Common.Serialization;
using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;

namespace EdFi.Ods.Common.Patch
{
    public class EdFiApiPatchBuilder
    {
        private const string OpRemovePathQuote = "{ \"op\": \"remove\", \"path\": \"";
        private const string OpAddPathQuote = "{ \"op\": \"add\", \"path\": \"";
        private const string OpReplacePathQuote = "{ \"op\": \"replace\", \"path\": \"";
        private const string QuoteSpace = "\" ";
        private const string QuoteComma = "\", ";
        private const string ValueQuote = "\"value\": \"";
        
        private const string ValueNoQuote = "\"value\": ";

        private readonly StringBuilder _patchContent = new StringBuilder();
        private IDictionary<string, object> _resourceKeyValues;
        
        // Context fields
        private readonly StringBuilder _patchContextPath = new StringBuilder("/");
        private readonly Stack<PatchContextFrame> _patchContextStack = new Stack<PatchContextFrame>(5);
        private readonly Dictionary<string, IDictionary> _collectionKeys = new Dictionary<string, IDictionary>();
        
        private int _collectionKeyIndex = 0;
        
        public EdFiApiPatchBuilder()
        {
            _patchContextStack.Push(new PatchContextFrame(_patchContextPath.Length));
        }
        
        // Context methods
        public void PushNameContext(string name)
        {
            _patchContextStack.Push(new PatchContextFrame(_patchContextPath.Length));
            
            _patchContextPath.Append(name);
            _patchContextPath.Append('/');
        }

        public void PushItemKeyContext(IDictionary properties)
        {
            var newFrame = new PatchKeyContextFrame(_patchContextPath.Length, _collectionKeyIndex++, properties);
            _patchContextStack.Push(newFrame);

            _patchContextPath.Append('$');
            _patchContextPath.Append(newFrame.ContextKeyIndex);
            _patchContextPath.Append('/');
        }

        private string CurrentPath
        {
            get
            {
                // First "flush" the keys found in the current stack to the collection
                foreach (var frame in _patchContextStack.OfType<PatchKeyContextFrame>())
                {
                    if (frame.ContextKeyUsed)
                    {
                        break;
                    }
                    
                    _collectionKeys.Add(frame.ContextKey, frame.ContextKeyProperties);
                    
                    frame.ContextKeyUsed = true;
                }
                
                return _patchContextPath.ToString();
            }
        }
        // End Context methods
        
        private static readonly JsonSerializerSettings _serializerSettings = new JsonSerializerSettings
        {
            NullValueHandling = NullValueHandling.Ignore,
            ContractResolver = new CamelCasePropertyNamesContractResolver(),
            Converters = new JsonConverter[]
            {
                new Iso8601UtcDateOnlyConverter()
            }
        };
        
        public void SetResourceKey(IDictionary<string, object> keyValues)
        {
            _resourceKeyValues = keyValues;
        }

        public void PopContext()
        {
            if (_patchContextStack.TryPop(out PatchContextFrame frame))
            {
                _patchContextPath.Length = frame.PreviousPathLength;

                if (frame is PatchKeyContextFrame { ContextKeyUsed: false } contextFrame)
                {
                    // Reuse the index because the Path wasn't used
                    _collectionKeyIndex = contextFrame.ContextKeyIndex;
                }
                
                return;
            }
            
            throw new InvalidOperationException("All frames of context have already been popped.");
        }

        public void PropertyChanged<T>(string propertyName, T oldValue, T newValue)
        {
            if (newValue == null)
            {
                _patchContent.Append(OpRemovePathQuote);
                _patchContent.Append(CurrentPath);
                _patchContent.Append(propertyName);
                _patchContent.Append(QuoteSpace);
                _patchContent.Append('}');
                _patchContent.Append(',');
                
                return;
            }

            _patchContent.Append(oldValue == null ? OpAddPathQuote : OpReplacePathQuote);

            _patchContent.Append(CurrentPath);
            _patchContent.Append(propertyName);
            
            _patchContent.Append(QuoteComma);
            _patchContent.Append(ValueNoQuote);
            _patchContent.Append(JsonConvert.SerializeObject(newValue, _serializerSettings));
            _patchContent.Append('}');
            _patchContent.Append(',');
            
        }
        
        public void ItemAdded(object item)
        {
            _patchContent.Append(OpAddPathQuote);
            _patchContent.Append(CurrentPath);
            _patchContent.Append('-');
            _patchContent.Append(QuoteComma);
            _patchContent.Append(ValueNoQuote);
            _patchContent.Append(JsonConvert.SerializeObject(item, _serializerSettings));
            _patchContent.Append('}');
            _patchContent.Append(',');
        }
        
        public void ItemRemoved(IDictionary properties)
        {
            PushItemKeyContext(properties);

            _patchContent.Append(OpRemovePathQuote);
            _patchContent.Append(CurrentPath.TrimEnd('/'));

            _patchContent.Append(QuoteSpace);
            _patchContent.Append('}');
            _patchContent.Append(',');
            
            PopContext();
        }
        
        // public string ToJson()
        // {
        //     string keyValuesJson = JsonConvert.SerializeObject(_resourceKeyValues, _serializerSettings);
        //     
        //     return $"{{ \"resourceKey\": {keyValuesJson}, \"patch\": [{_patchContent.ToString(0, _patchContent.Length - 1)}], \"collectionKeys\": {JsonConvert.SerializeObject(_collectionKeys)} }}";
        // }
        
        public string ToJson()
        {
            string resourceKeysJson = _resourceKeyValues != null
                ? $"\"resourceKey\":{JsonConvert.SerializeObject(_resourceKeyValues, _serializerSettings)},"
                : null;

            string collectionKeysJson = _collectionKeys.Any()
                ? $", \"collectionKeys\":{JsonConvert.SerializeObject(_collectionKeys)}"
                : null;

            return $"{{{resourceKeysJson}\"patch\":[{_patchContent.ToString(0, _patchContent.Length - 1)}]{collectionKeysJson}}}";
        }
    }
}
