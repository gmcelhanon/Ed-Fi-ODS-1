using EdFi.Ods.Common.Models.Domain;

namespace EdFi.Ods.CodeGen.Extensions
{
    public static class EntityExtensions
    {
        public static bool IsSchoolYearType(this Entity e) => e.FullName == new FullName("edfi", "SchoolYearType");
    }
}
