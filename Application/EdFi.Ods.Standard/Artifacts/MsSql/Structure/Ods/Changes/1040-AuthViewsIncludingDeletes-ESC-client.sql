CREATE VIEW [auth].[EducationServiceCenterIdToParentUSIIncludingDeletes] AS
    -- Intact StudentSchoolAssociation and intact StudentParentAssociation
    SELECT lea.EducationServiceCenterId, spa.ParentUSI
    FROM edfi.LocalEducationAgency lea 
        JOIN edfi.School sch ON lea.LocalEducationAgencyId = sch.LocalEducationAgencyId
        JOIN edfi.StudentSchoolAssociation ssa ON sch.SchoolId = ssa.SchoolId
        JOIN edfi.Student s ON ssa.StudentUSI = s.StudentUSI
        JOIN edfi.StudentParentAssociation spa ON ssa.StudentUSI = spa.StudentUSI

    UNION

    -- Intact StudentSchoolAssociation and deleted StudentParentAssociation
    SELECT lea.EducationServiceCenterId, spa_tc.OldParentUSI as ParentUSI
    FROM edfi.LocalEducationAgency lea 
        JOIN edfi.School sch ON lea.LocalEducationAgencyId = sch.LocalEducationAgencyId
        JOIN edfi.StudentSchoolAssociation ssa ON sch.SchoolId = ssa.SchoolId
        JOIN tracked_changes_edfi.StudentParentAssociation spa_tc ON ssa.StudentUSI = spa_tc.OldStudentUSI

    UNION

    -- Deleted StudentSchoolAssociation and intact StudentParentAssociation
    SELECT lea.EducationServiceCenterId, spa.ParentUSI
    FROM edfi.LocalEducationAgency lea 
        JOIN edfi.School sch ON lea.LocalEducationAgencyId = sch.LocalEducationAgencyId
        JOIN tracked_changes_edfi.StudentSchoolAssociation ssa_tc ON sch.SchoolId = ssa_tc.OldSchoolId
        JOIN edfi.StudentParentAssociation spa ON ssa_tc.OldStudentUSI = spa.StudentUSI

    UNION

    -- Deleted StudentSchoolAssociation and StudentParentAssociation
    SELECT lea.EducationServiceCenterId, spa_tc.OldParentUSI as ParentUSI
    FROM edfi.LocalEducationAgency lea 
        JOIN edfi.School sch ON lea.LocalEducationAgencyId = sch.LocalEducationAgencyId
        JOIN tracked_changes_edfi.StudentSchoolAssociation ssa_tc ON sch.SchoolId = ssa_tc.OldSchoolId
        JOIN tracked_changes_edfi.StudentParentAssociation spa_tc ON ssa_tc.OldStudentUSI = spa_tc.OldStudentUSI;
GO

CREATE VIEW [auth].[EducationServiceCenterIdToStaffUSIIncludingDeletes] AS
    -- LEA employment
    SELECT lea.EducationServiceCenterId, emp.StaffUSI
    FROM edfi.LocalEducationAgency lea
        JOIN edfi.StaffEducationOrganizationEmploymentAssociation emp
            ON lea.LocalEducationAgencyId = emp.EducationOrganizationId

    UNION

    -- LEA employment (deleted employment)
    SELECT lea.EducationServiceCenterId, emp_tc.OldStaffUSI as StaffUSI
    FROM edfi.LocalEducationAgency lea
        JOIN tracked_changes_edfi.StaffEducationOrganizationEmploymentAssociation emp_tc
            ON lea.LocalEducationAgencyId = emp_tc.OldEducationOrganizationId

    UNION

    -- LEA assignment
    SELECT lea.EducationServiceCenterId, assgn.StaffUSI
    FROM edfi.LocalEducationAgency lea
        JOIN edfi.StaffEducationOrganizationAssignmentAssociation assgn
            ON lea.LocalEducationAgencyId = assgn.EducationOrganizationId

    UNION

    -- LEA assignment (deleted assignment)
    SELECT lea.EducationServiceCenterId, assgn_tc.OldStaffUSI as StaffUSI
    FROM edfi.LocalEducationAgency lea
        JOIN tracked_changes_edfi.StaffEducationOrganizationAssignmentAssociation assgn_tc
            ON lea.LocalEducationAgencyId = assgn_tc.OldEducationOrganizationId

    UNION

    -- School employment
    SELECT lea.EducationServiceCenterId, emp.StaffUSI
    FROM edfi.LocalEducationAgency lea
        JOIN edfi.School sch ON lea.LocalEducationAgencyId = sch.LocalEducationAgencyId
        JOIN edfi.StaffEducationOrganizationEmploymentAssociation emp
            ON sch.SchoolId = emp.EducationOrganizationId

    UNION

    -- School employment (deleted employment)
    SELECT lea.EducationServiceCenterId, emp_tc.OldStaffUSI as StaffUSI
    FROM edfi.LocalEducationAgency lea
        JOIN edfi.School sch ON lea.LocalEducationAgencyId = sch.LocalEducationAgencyId
        JOIN tracked_changes_edfi.StaffEducationOrganizationEmploymentAssociation emp_tc
            ON sch.SchoolId = emp_tc.OldEducationOrganizationId

    UNION

    -- School assignment
    SELECT lea.EducationServiceCenterId, assgn.StaffUSI
    FROM edfi.LocalEducationAgency lea
        JOIN edfi.School sch ON lea.LocalEducationAgencyId = sch.LocalEducationAgencyId
        JOIN edfi.StaffEducationOrganizationAssignmentAssociation assgn
            ON sch.SchoolId = assgn.EducationOrganizationId

    UNION

    -- School assignment (deleted assignment)
    SELECT lea.EducationServiceCenterId, assgn_tc.OldStaffUSI as StaffUSI
    FROM edfi.LocalEducationAgency lea
        JOIN edfi.School sch ON lea.LocalEducationAgencyId = sch.LocalEducationAgencyId
        JOIN tracked_changes_edfi.StaffEducationOrganizationAssignmentAssociation assgn_tc
            ON sch.SchoolId = assgn_tc.OldEducationOrganizationId;
GO

CREATE VIEW auth.EducationServiceCenterIdToStudentUSIIncludingDeletes AS
    SELECT lea.EducationServiceCenterId, ssa.StudentUSI
    FROM edfi.LocalEducationAgency lea
        JOIN edfi.School sch ON  lea.LocalEducationAgencyId = sch.LocalEducationAgencyId
        JOIN edfi.StudentSchoolAssociation ssa ON sch.SchoolId = ssa.SchoolId

    UNION

    SELECT lea.EducationServiceCenterId, ssa_tc.OldStudentUSI as StudentUSI
    FROM edfi.LocalEducationAgency lea
        JOIN edfi.School sch ON  lea.LocalEducationAgencyId = sch.LocalEducationAgencyId
        JOIN tracked_changes_edfi.StudentSchoolAssociation ssa_tc ON sch.SchoolId = ssa_tc.OldSchoolId;
GO
