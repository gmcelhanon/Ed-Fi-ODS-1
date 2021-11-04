using System.Collections.Generic;

namespace EdFi.Ods.Generator.Common.Options
{
    public interface IRenderingPropertiesEnhancer
    {
        void EnhanceProperties(IDictionary<string, string> properties);
    }
}