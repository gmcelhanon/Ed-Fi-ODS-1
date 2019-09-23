using EdFi.Ods.Common.Extensions;

namespace EdFi.Ods.Common.Models
{
    /// <summary>
    /// Defines a property that exposes the current synchronization context for mapping data
    /// between model classes for persistence.
    /// </summary>
    /// <typeparam name="TSynchronizationContext">The resource's synchronization context.</typeparam>
    public interface IHasSynchronizationContext<TSynchronizationContext>
    {
        /// <summary>
        /// Gets the current synchronization context.
        /// </summary>
        TSynchronizationContext SynchronizationContext { get; set; }
    }
    
    public interface IHasExtensionsSynchronizationContext
    {
        IExtensionsSynchronizationContext SynchronizationContext { get; }
    }
}
