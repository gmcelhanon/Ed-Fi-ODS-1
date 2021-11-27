// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

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
        private readonly StringBuilder _patchContext = new StringBuilder("/");
        private readonly Stack<int> _patchContextLengthStack = new Stack<int>(5);

        private readonly Dictionary<string, Dictionary<string, object>> _parameters = new Dictionary<string, Dictionary<string, object>>();

        private int parameterIndex = 0;
        
        public void PushReferenceContext(string referenceName)
        {
            _patchContextLengthStack.Push(_patchContext.Length);
            
            _patchContext.Append(referenceName);
            _patchContext.Append('/');
        }

        public void PushCollectionContext(string collectionName)
        {
            _patchContextLengthStack.Push(_patchContext.Length);
            
            _patchContext.Append(collectionName);
            _patchContext.Append('/');
        }

        public void PushCollectionItemContext(Dictionary<string, object> properties) //, Action<StringBuilder> writeContextIdentityJson)
        {
            _patchContextLengthStack.Push(_patchContext.Length);

            //writeContextIdentityJson(_patchContext);

            _patchContext.Append('$');
            _patchContext.Append(parameterIndex);
            _patchContext.Append('/');
            
            AddParameter(parameterIndex++, properties);
        }

        public void PopContext()
        {
            //_patchContent.Length -= 1;

            if (_patchContextLengthStack.TryPop(out int trimLength))
            {
                _patchContext.Length = trimLength;

                return;
            }
            
            _patchContext.Length = 1;
        }
        
        public void PropertyChanged(string propertyName, DateTime oldValue, DateTime newValue)
        {
            PropertyChanged(propertyName, 
                oldValue.ToString("yyyy-MM-dd"), 
                newValue.ToString("yyyy-MM-dd"));
        }

        public void PropertyChanged(string propertyName, DateTime? oldValue, DateTime? newValue)
        {
            PropertyChanged(propertyName, 
                oldValue?.ToString("yyyy-MM-dd"), 
                newValue?.ToString("yyyy-MM-dd"));
        }

        public void PropertyChanged(string propertyName, string oldValue, string newValue)
        {
            if (newValue == null)
            {
                _patchContent.Append(OpRemovePathQuote);
                _patchContent.Append(_patchContext.ToString());
                _patchContent.Append(propertyName);
                _patchContent.Append(QuoteSpace);
                _patchContent.Append('}');
                _patchContent.Append(',');

                return;
            }

            _patchContent.Append(oldValue == null ? OpAddPathQuote : OpReplacePathQuote);
            _patchContent.Append(_patchContext.ToString());
            _patchContent.Append(propertyName);
            _patchContent.Append(QuoteComma);
            _patchContent.Append(ValueQuote);
            _patchContent.Append(newValue);
            _patchContent.Append(QuoteSpace);
            _patchContent.Append('}');
            _patchContent.Append(',');
        }

        public void PropertyChanged<T>(string propertyName, T oldValue, T newValue)
        {
            if (newValue == null)
            {
                _patchContent.Append(OpRemovePathQuote);
                _patchContent.Append(_patchContext.ToString());
                _patchContent.Append(propertyName);
                _patchContent.Append(QuoteSpace);
                _patchContent.Append('}');
                _patchContent.Append(',');

                return;
            }

            _patchContent.Append(oldValue == null ? OpAddPathQuote : OpReplacePathQuote);
            _patchContent.Append(_patchContext.ToString());
            _patchContent.Append(propertyName);
            _patchContent.Append(QuoteComma);
            _patchContent.Append(ValueNoQuote);
            _patchContent.Append(newValue);
            _patchContent.Append('}');
            _patchContent.Append(',');
        }
        
        public void ItemAdded(object item)
        {
            _patchContent.Append(OpAddPathQuote);
            _patchContent.Append(_patchContext.ToString());
            _patchContent.Append('-');
            _patchContent.Append(QuoteComma);
            _patchContent.Append(ValueNoQuote);
            _patchContent.Append(JsonConvert.SerializeObject(item));
            _patchContent.Append('}');
            _patchContent.Append(',');
        }
        
        public void ItemRemoved(Dictionary<string, object> properties)
        {
            // Inline push context
            //writeContextIdentityJson(_patchContext);

            _patchContent.Append(OpRemovePathQuote);
            _patchContent.Append(_patchContext.ToString());
            
            _patchContent.Append('$');
            _patchContent.Append(parameterIndex);
            AddParameter(parameterIndex++, properties);

            _patchContent.Append(QuoteSpace);
            _patchContent.Append('}');
            _patchContent.Append(',');
        }
        
        public string ToJson()
        {
            return $"{{ \"patch\": [{_patchContent.ToString(0, _patchContent.Length - 1)}], \"parameters\": {JsonConvert.SerializeObject(_parameters)} }}";
        }
        
        private void AddParameter(int parameterIndex, Dictionary<string, object> properties)
        {
            _parameters.Add($"${parameterIndex}", properties);
        }
    }
}
