using System;
using System.Threading;

namespace EdFi.Security.DataAccess.Utils
{
    public class ResettableLazy<T>
    {
        private readonly Func<T> _valueFactory;
        private volatile Lazy<T> _lazy;  // volatile adds visibility across threads

        public ResettableLazy(Func<T> valueFactory)
        {
            _valueFactory = valueFactory ?? throw new ArgumentNullException(nameof(valueFactory));
            _lazy = NewLazy();
        }

        // Only allow one initializer to run at a time by using ExecutionAndPublication -- we don't want multiple threads racing to get the same answer from the database
        private Lazy<T> NewLazy() => new(_valueFactory, LazyThreadSafetyMode.ExecutionAndPublication);

        public bool IsValueCreated => _lazy.IsValueCreated;

        public T Value
        {
            get
            {
                var lazy = _lazy;

                try
                {
                    return lazy.Value;
                }
                catch
                {
                    // Don't "poison" on transient failures -- allow initialization to run the next time
                    if (ReferenceEquals(lazy, _lazy))
                        Interlocked.Exchange(ref _lazy, NewLazy());

                    throw;
                }
            }
        }

        public void Reset()
        {
            // Swap the references atomically
            Interlocked.Exchange(ref _lazy, NewLazy()); 
        }
    }
}
