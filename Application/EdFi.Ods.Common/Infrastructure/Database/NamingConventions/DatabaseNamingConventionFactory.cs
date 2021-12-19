using Autofac.Features.Indexed;

namespace EdFi.Ods.Common.Infrastructure.Database.NamingConventions
{
    public class DatabaseNamingConventionFactory : IDatabaseNamingConventionFactory
    {
        private readonly IIndex<string, IDatabaseNamingConvention> _conventionByDatabaseEngine;

        public DatabaseNamingConventionFactory(IIndex<string, IDatabaseNamingConvention> conventionByDatabaseEngine)
        {
            _conventionByDatabaseEngine = conventionByDatabaseEngine;
        }
        
        public IDatabaseNamingConvention CreateNamingConvention(string databaseEngine)
        {
            return _conventionByDatabaseEngine[databaseEngine];
        }
    }
}