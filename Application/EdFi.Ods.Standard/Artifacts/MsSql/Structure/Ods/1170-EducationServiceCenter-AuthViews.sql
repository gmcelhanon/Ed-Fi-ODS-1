CREATE VIEW [auth].[EducationServiceCenterIdToParentUSI]
    WITH SCHEMABINDING
AS
-- LEA to Parent USI
SELECT lea.EducationServiceCenterId, spa.ParentUSI, COUNT_BIG(*) AS Ignored
FROM edfi.LocalEducationAgency lea
		INNER JOIN edfi.School sch 
			ON lea.LocalEducationAgencyId = sch.LocalEducationAgencyId
        INNER JOIN edfi.StudentSchoolAssociation ssa 
			ON sch.SchoolId = ssa.SchoolId
        INNER JOIN edfi.Student s
			ON ssa.StudentUSI = s.StudentUSI
         INNER JOIN edfi.StudentParentAssociation spa 
			ON ssa.StudentUSI = spa.StudentUSI
GROUP BY spa.ParentUSI, EducationServiceCenterId;
GO

CREATE UNIQUE CLUSTERED INDEX UIX_EducationServiceCenterIdToParentUSI 
ON auth.EducationServiceCenterIdToParentUSI (EducationServiceCenterId, ParentUSI);
GO

---------------------------------------------------------------------------

CREATE VIEW [auth].[EducationServiceCenterIdToLocalEducationAgencyId]
AS
-- ESC to LEA
SELECT EducationServiceCenterId, LocalEducationAgencyId
FROM edfi.LocalEducationAgency lea;
GO

---------------------------------------------------------------------------

CREATE VIEW [auth].[EducationServiceCenterIdToSchoolId]
	WITH SCHEMABINDING
AS
-- LEA to School
SELECT EducationServiceCenterId, SchoolId
FROM edfi.LocalEducationAgency lea
	INNER JOIN edfi.School sch
		on lea.LocalEducationAgencyId = sch.LocalEducationAgencyId;
GO

CREATE UNIQUE CLUSTERED INDEX UIX_EducationServiceCenterIdToSchoolId
ON auth.EducationServiceCenterIdToSchoolId (EducationServiceCenterId, SchoolId);
GO

---------------------------------------------------------------------------

CREATE VIEW [auth].[EducationServiceCenterIdToStaffUSI]
AS
    -- ESC to Staff (through LEA employment)
    SELECT lea.EducationServiceCenterId
        ,emp.StaffUSI
    FROM edfi.LocalEducationAgency lea
        INNER JOIN auth.EducationOrganizationToStaffUSI_Employment emp
            ON lea.LocalEducationAgencyId = emp.EducationOrganizationId

    UNION

    -- ESC to Staff (through LEA assignment)
    SELECT lea.EducationServiceCenterId
         ,assgn.StaffUSI
    FROM edfi.LocalEducationAgency lea
        INNER JOIN auth.EducationOrganizationToStaffUSI_Assignment assgn
            ON lea.LocalEducationAgencyId = assgn.EducationOrganizationId

    UNION

    -- LEA to Staff (through School employment)
    SELECT lea.EducationServiceCenterId
         ,emp.StaffUSI
    FROM edfi.LocalEducationAgency lea
		INNER JOIN edfi.School sch
			ON lea.LocalEducationAgencyId = sch.LocalEducationAgencyId
        INNER JOIN auth.EducationOrganizationToStaffUSI_Employment emp
            ON sch.SchoolId = emp.EducationOrganizationId

    UNION

    -- LEA to Staff (through School assignment)
    SELECT lea.EducationServiceCenterId
         ,assgn.StaffUSI
    FROM edfi.LocalEducationAgency lea
		INNER JOIN edfi.School sch
			ON lea.LocalEducationAgencyId = sch.LocalEducationAgencyId
        INNER JOIN auth.EducationOrganizationToStaffUSI_Assignment assgn
            ON sch.SchoolId = assgn.EducationOrganizationId;
GO

--------------------------------------------------------------------------------------------------

CREATE VIEW [auth].[EducationServiceCenterIdToStudentUSI]
    WITH SCHEMABINDING
AS
-- LEA to Student GUID
SELECT lea.EducationServiceCenterId
     ,ssa.StudentUSI
     ,COUNT_BIG(*) AS Ignored
FROM edfi.LocalEducationAgency lea
		INNER JOIN edfi.School sch
			ON lea.LocalEducationAgencyId = sch.LocalEducationAgencyId
         INNER JOIN edfi.StudentSchoolAssociation ssa ON sch.SchoolId = ssa.SchoolId
GROUP BY lea.EducationServiceCenterId
       ,ssa.StudentUSI;
GO

CREATE UNIQUE CLUSTERED INDEX UIX_EducationServiceCenterIdToStudentUSI
ON auth.EducationServiceCenterIdToStudentUSI (EducationServiceCenterId, StudentUSI);
GO
--------------------------------------------------------------------------------------------------
