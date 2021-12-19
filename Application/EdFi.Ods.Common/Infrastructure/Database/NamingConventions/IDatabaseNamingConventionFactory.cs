namespace EdFi.Ods.Common.Infrastructure.Database.NamingConventions
{
    public interface IDatabaseNamingConventionFactory
    {
        IDatabaseNamingConvention CreateNamingConvention(string databaseEngine);
    }
}