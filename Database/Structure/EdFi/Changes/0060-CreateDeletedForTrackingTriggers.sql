DROP TRIGGER IF EXISTS [edfi].[edfi_AbsenceEventCategoryDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_AbsenceEventCategoryDescriptor_TR_DeleteTracking] ON [edfi].[AbsenceEventCategoryDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_AbsenceEventCategoryDescriptor_TrackedChange](OldAbsenceEventCategoryDescriptorId, Id, ChangeVersion)
    SELECT  d.AbsenceEventCategoryDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.AbsenceEventCategoryDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[AbsenceEventCategoryDescriptor] ENABLE TRIGGER [edfi_AbsenceEventCategoryDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_AcademicHonorCategoryDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_AcademicHonorCategoryDescriptor_TR_DeleteTracking] ON [edfi].[AcademicHonorCategoryDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_AcademicHonorCategoryDescriptor_TrackedChange](OldAcademicHonorCategoryDescriptorId, Id, ChangeVersion)
    SELECT  d.AcademicHonorCategoryDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.AcademicHonorCategoryDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[AcademicHonorCategoryDescriptor] ENABLE TRIGGER [edfi_AcademicHonorCategoryDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_AcademicSubjectDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_AcademicSubjectDescriptor_TR_DeleteTracking] ON [edfi].[AcademicSubjectDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_AcademicSubjectDescriptor_TrackedChange](OldAcademicSubjectDescriptorId, Id, ChangeVersion)
    SELECT  d.AcademicSubjectDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.AcademicSubjectDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[AcademicSubjectDescriptor] ENABLE TRIGGER [edfi_AcademicSubjectDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_AcademicWeek_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_AcademicWeek_TR_DeleteTracking] ON [edfi].[AcademicWeek] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_AcademicWeek_TrackedChange](OldSchoolId, OldWeekIdentifier, Id, Discriminator, ChangeVersion)
    SELECT  d.SchoolId, d.WeekIdentifier, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[AcademicWeek] ENABLE TRIGGER [edfi_AcademicWeek_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_AccommodationDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_AccommodationDescriptor_TR_DeleteTracking] ON [edfi].[AccommodationDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_AccommodationDescriptor_TrackedChange](OldAccommodationDescriptorId, Id, ChangeVersion)
    SELECT  d.AccommodationDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.AccommodationDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[AccommodationDescriptor] ENABLE TRIGGER [edfi_AccommodationDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_AccountClassificationDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_AccountClassificationDescriptor_TR_DeleteTracking] ON [edfi].[AccountClassificationDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_AccountClassificationDescriptor_TrackedChange](OldAccountClassificationDescriptorId, Id, ChangeVersion)
    SELECT  d.AccountClassificationDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.AccountClassificationDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[AccountClassificationDescriptor] ENABLE TRIGGER [edfi_AccountClassificationDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_AccountCode_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_AccountCode_TR_DeleteTracking] ON [edfi].[AccountCode] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_AccountCode_TrackedChange](OldAccountClassificationDescriptorId, OldAccountClassificationDescriptorNamespace, OldAccountClassificationDescriptorCodeValue, OldAccountCodeNumber, OldEducationOrganizationId, OldFiscalYear, Id, Discriminator, ChangeVersion)
    SELECT  d.AccountClassificationDescriptorId, j0.Namespace, j0.CodeValue, d.AccountCodeNumber, d.EducationOrganizationId, d.FiscalYear, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Descriptor j0
            ON d.AccountClassificationDescriptorId = j0.DescriptorId 
END
GO

ALTER TABLE [edfi].[AccountCode] ENABLE TRIGGER [edfi_AccountCode_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_Account_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_Account_TR_DeleteTracking] ON [edfi].[Account] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_Account_TrackedChange](OldAccountIdentifier, OldEducationOrganizationId, OldFiscalYear, Id, Discriminator, ChangeVersion)
    SELECT  d.AccountIdentifier, d.EducationOrganizationId, d.FiscalYear, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[Account] ENABLE TRIGGER [edfi_Account_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_AccountabilityRating_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_AccountabilityRating_TR_DeleteTracking] ON [edfi].[AccountabilityRating] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_AccountabilityRating_TrackedChange](OldEducationOrganizationId, OldRatingTitle, OldSchoolYear, Id, Discriminator, ChangeVersion)
    SELECT  d.EducationOrganizationId, d.RatingTitle, d.SchoolYear, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[AccountabilityRating] ENABLE TRIGGER [edfi_AccountabilityRating_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_AchievementCategoryDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_AchievementCategoryDescriptor_TR_DeleteTracking] ON [edfi].[AchievementCategoryDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_AchievementCategoryDescriptor_TrackedChange](OldAchievementCategoryDescriptorId, Id, ChangeVersion)
    SELECT  d.AchievementCategoryDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.AchievementCategoryDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[AchievementCategoryDescriptor] ENABLE TRIGGER [edfi_AchievementCategoryDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_Actual_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_Actual_TR_DeleteTracking] ON [edfi].[Actual] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_Actual_TrackedChange](OldAccountIdentifier, OldAsOfDate, OldEducationOrganizationId, OldFiscalYear, Id, Discriminator, ChangeVersion)
    SELECT  d.AccountIdentifier, d.AsOfDate, d.EducationOrganizationId, d.FiscalYear, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[Actual] ENABLE TRIGGER [edfi_Actual_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_AdditionalCreditTypeDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_AdditionalCreditTypeDescriptor_TR_DeleteTracking] ON [edfi].[AdditionalCreditTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_AdditionalCreditTypeDescriptor_TrackedChange](OldAdditionalCreditTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.AdditionalCreditTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.AdditionalCreditTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[AdditionalCreditTypeDescriptor] ENABLE TRIGGER [edfi_AdditionalCreditTypeDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_AddressTypeDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_AddressTypeDescriptor_TR_DeleteTracking] ON [edfi].[AddressTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_AddressTypeDescriptor_TrackedChange](OldAddressTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.AddressTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.AddressTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[AddressTypeDescriptor] ENABLE TRIGGER [edfi_AddressTypeDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_AdministrationEnvironmentDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_AdministrationEnvironmentDescriptor_TR_DeleteTracking] ON [edfi].[AdministrationEnvironmentDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_AdministrationEnvironmentDescriptor_TrackedChange](OldAdministrationEnvironmentDescriptorId, Id, ChangeVersion)
    SELECT  d.AdministrationEnvironmentDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.AdministrationEnvironmentDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[AdministrationEnvironmentDescriptor] ENABLE TRIGGER [edfi_AdministrationEnvironmentDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_AdministrativeFundingControlDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_AdministrativeFundingControlDescriptor_TR_DeleteTracking] ON [edfi].[AdministrativeFundingControlDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_AdministrativeFundingControlDescriptor_TrackedChange](OldAdministrativeFundingControlDescriptorId, Id, ChangeVersion)
    SELECT  d.AdministrativeFundingControlDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.AdministrativeFundingControlDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[AdministrativeFundingControlDescriptor] ENABLE TRIGGER [edfi_AdministrativeFundingControlDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_AssessmentCategoryDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_AssessmentCategoryDescriptor_TR_DeleteTracking] ON [edfi].[AssessmentCategoryDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_AssessmentCategoryDescriptor_TrackedChange](OldAssessmentCategoryDescriptorId, Id, ChangeVersion)
    SELECT  d.AssessmentCategoryDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.AssessmentCategoryDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[AssessmentCategoryDescriptor] ENABLE TRIGGER [edfi_AssessmentCategoryDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_AssessmentIdentificationSystemDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_AssessmentIdentificationSystemDescriptor_TR_DeleteTracking] ON [edfi].[AssessmentIdentificationSystemDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_AssessmentIdentificationSystemDescriptor_TrackedChange](OldAssessmentIdentificationSystemDescriptorId, Id, ChangeVersion)
    SELECT  d.AssessmentIdentificationSystemDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.AssessmentIdentificationSystemDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[AssessmentIdentificationSystemDescriptor] ENABLE TRIGGER [edfi_AssessmentIdentificationSystemDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_AssessmentItemCategoryDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_AssessmentItemCategoryDescriptor_TR_DeleteTracking] ON [edfi].[AssessmentItemCategoryDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_AssessmentItemCategoryDescriptor_TrackedChange](OldAssessmentItemCategoryDescriptorId, Id, ChangeVersion)
    SELECT  d.AssessmentItemCategoryDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.AssessmentItemCategoryDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[AssessmentItemCategoryDescriptor] ENABLE TRIGGER [edfi_AssessmentItemCategoryDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_AssessmentItemResultDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_AssessmentItemResultDescriptor_TR_DeleteTracking] ON [edfi].[AssessmentItemResultDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_AssessmentItemResultDescriptor_TrackedChange](OldAssessmentItemResultDescriptorId, Id, ChangeVersion)
    SELECT  d.AssessmentItemResultDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.AssessmentItemResultDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[AssessmentItemResultDescriptor] ENABLE TRIGGER [edfi_AssessmentItemResultDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_AssessmentItem_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_AssessmentItem_TR_DeleteTracking] ON [edfi].[AssessmentItem] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_AssessmentItem_TrackedChange](OldAssessmentIdentifier, OldIdentificationCode, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.AssessmentIdentifier, d.IdentificationCode, d.Namespace, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[AssessmentItem] ENABLE TRIGGER [edfi_AssessmentItem_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_AssessmentPeriodDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_AssessmentPeriodDescriptor_TR_DeleteTracking] ON [edfi].[AssessmentPeriodDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_AssessmentPeriodDescriptor_TrackedChange](OldAssessmentPeriodDescriptorId, Id, ChangeVersion)
    SELECT  d.AssessmentPeriodDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.AssessmentPeriodDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[AssessmentPeriodDescriptor] ENABLE TRIGGER [edfi_AssessmentPeriodDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_AssessmentReportingMethodDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_AssessmentReportingMethodDescriptor_TR_DeleteTracking] ON [edfi].[AssessmentReportingMethodDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_AssessmentReportingMethodDescriptor_TrackedChange](OldAssessmentReportingMethodDescriptorId, Id, ChangeVersion)
    SELECT  d.AssessmentReportingMethodDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.AssessmentReportingMethodDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[AssessmentReportingMethodDescriptor] ENABLE TRIGGER [edfi_AssessmentReportingMethodDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_Assessment_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_Assessment_TR_DeleteTracking] ON [edfi].[Assessment] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_Assessment_TrackedChange](OldAssessmentIdentifier, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.AssessmentIdentifier, d.Namespace, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[Assessment] ENABLE TRIGGER [edfi_Assessment_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_AttemptStatusDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_AttemptStatusDescriptor_TR_DeleteTracking] ON [edfi].[AttemptStatusDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_AttemptStatusDescriptor_TrackedChange](OldAttemptStatusDescriptorId, Id, ChangeVersion)
    SELECT  d.AttemptStatusDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.AttemptStatusDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[AttemptStatusDescriptor] ENABLE TRIGGER [edfi_AttemptStatusDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_AttendanceEventCategoryDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_AttendanceEventCategoryDescriptor_TR_DeleteTracking] ON [edfi].[AttendanceEventCategoryDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_AttendanceEventCategoryDescriptor_TrackedChange](OldAttendanceEventCategoryDescriptorId, Id, ChangeVersion)
    SELECT  d.AttendanceEventCategoryDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.AttendanceEventCategoryDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[AttendanceEventCategoryDescriptor] ENABLE TRIGGER [edfi_AttendanceEventCategoryDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_BehaviorDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_BehaviorDescriptor_TR_DeleteTracking] ON [edfi].[BehaviorDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_BehaviorDescriptor_TrackedChange](OldBehaviorDescriptorId, Id, ChangeVersion)
    SELECT  d.BehaviorDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.BehaviorDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[BehaviorDescriptor] ENABLE TRIGGER [edfi_BehaviorDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_BellSchedule_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_BellSchedule_TR_DeleteTracking] ON [edfi].[BellSchedule] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_BellSchedule_TrackedChange](OldBellScheduleName, OldSchoolId, Id, Discriminator, ChangeVersion)
    SELECT  d.BellScheduleName, d.SchoolId, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[BellSchedule] ENABLE TRIGGER [edfi_BellSchedule_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_Budget_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_Budget_TR_DeleteTracking] ON [edfi].[Budget] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_Budget_TrackedChange](OldAccountIdentifier, OldAsOfDate, OldEducationOrganizationId, OldFiscalYear, Id, Discriminator, ChangeVersion)
    SELECT  d.AccountIdentifier, d.AsOfDate, d.EducationOrganizationId, d.FiscalYear, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[Budget] ENABLE TRIGGER [edfi_Budget_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_CalendarDate_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_CalendarDate_TR_DeleteTracking] ON [edfi].[CalendarDate] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_CalendarDate_TrackedChange](OldCalendarCode, OldDate, OldSchoolId, OldSchoolYear, Id, Discriminator, ChangeVersion)
    SELECT  d.CalendarCode, d.Date, d.SchoolId, d.SchoolYear, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[CalendarDate] ENABLE TRIGGER [edfi_CalendarDate_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_CalendarEventDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_CalendarEventDescriptor_TR_DeleteTracking] ON [edfi].[CalendarEventDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_CalendarEventDescriptor_TrackedChange](OldCalendarEventDescriptorId, Id, ChangeVersion)
    SELECT  d.CalendarEventDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CalendarEventDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[CalendarEventDescriptor] ENABLE TRIGGER [edfi_CalendarEventDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_CalendarTypeDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_CalendarTypeDescriptor_TR_DeleteTracking] ON [edfi].[CalendarTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_CalendarTypeDescriptor_TrackedChange](OldCalendarTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.CalendarTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CalendarTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[CalendarTypeDescriptor] ENABLE TRIGGER [edfi_CalendarTypeDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_Calendar_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_Calendar_TR_DeleteTracking] ON [edfi].[Calendar] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_Calendar_TrackedChange](OldCalendarCode, OldSchoolId, OldSchoolYear, Id, Discriminator, ChangeVersion)
    SELECT  d.CalendarCode, d.SchoolId, d.SchoolYear, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[Calendar] ENABLE TRIGGER [edfi_Calendar_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_CareerPathwayDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_CareerPathwayDescriptor_TR_DeleteTracking] ON [edfi].[CareerPathwayDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_CareerPathwayDescriptor_TrackedChange](OldCareerPathwayDescriptorId, Id, ChangeVersion)
    SELECT  d.CareerPathwayDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CareerPathwayDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[CareerPathwayDescriptor] ENABLE TRIGGER [edfi_CareerPathwayDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_CharterApprovalAgencyTypeDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_CharterApprovalAgencyTypeDescriptor_TR_DeleteTracking] ON [edfi].[CharterApprovalAgencyTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_CharterApprovalAgencyTypeDescriptor_TrackedChange](OldCharterApprovalAgencyTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.CharterApprovalAgencyTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CharterApprovalAgencyTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[CharterApprovalAgencyTypeDescriptor] ENABLE TRIGGER [edfi_CharterApprovalAgencyTypeDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_CharterStatusDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_CharterStatusDescriptor_TR_DeleteTracking] ON [edfi].[CharterStatusDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_CharterStatusDescriptor_TrackedChange](OldCharterStatusDescriptorId, Id, ChangeVersion)
    SELECT  d.CharterStatusDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CharterStatusDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[CharterStatusDescriptor] ENABLE TRIGGER [edfi_CharterStatusDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_CitizenshipStatusDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_CitizenshipStatusDescriptor_TR_DeleteTracking] ON [edfi].[CitizenshipStatusDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_CitizenshipStatusDescriptor_TrackedChange](OldCitizenshipStatusDescriptorId, Id, ChangeVersion)
    SELECT  d.CitizenshipStatusDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CitizenshipStatusDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[CitizenshipStatusDescriptor] ENABLE TRIGGER [edfi_CitizenshipStatusDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_ClassPeriod_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_ClassPeriod_TR_DeleteTracking] ON [edfi].[ClassPeriod] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_ClassPeriod_TrackedChange](OldClassPeriodName, OldSchoolId, Id, Discriminator, ChangeVersion)
    SELECT  d.ClassPeriodName, d.SchoolId, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[ClassPeriod] ENABLE TRIGGER [edfi_ClassPeriod_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_ClassroomPositionDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_ClassroomPositionDescriptor_TR_DeleteTracking] ON [edfi].[ClassroomPositionDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_ClassroomPositionDescriptor_TrackedChange](OldClassroomPositionDescriptorId, Id, ChangeVersion)
    SELECT  d.ClassroomPositionDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ClassroomPositionDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[ClassroomPositionDescriptor] ENABLE TRIGGER [edfi_ClassroomPositionDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_CohortScopeDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_CohortScopeDescriptor_TR_DeleteTracking] ON [edfi].[CohortScopeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_CohortScopeDescriptor_TrackedChange](OldCohortScopeDescriptorId, Id, ChangeVersion)
    SELECT  d.CohortScopeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CohortScopeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[CohortScopeDescriptor] ENABLE TRIGGER [edfi_CohortScopeDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_CohortTypeDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_CohortTypeDescriptor_TR_DeleteTracking] ON [edfi].[CohortTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_CohortTypeDescriptor_TrackedChange](OldCohortTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.CohortTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CohortTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[CohortTypeDescriptor] ENABLE TRIGGER [edfi_CohortTypeDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_CohortYearTypeDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_CohortYearTypeDescriptor_TR_DeleteTracking] ON [edfi].[CohortYearTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_CohortYearTypeDescriptor_TrackedChange](OldCohortYearTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.CohortYearTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CohortYearTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[CohortYearTypeDescriptor] ENABLE TRIGGER [edfi_CohortYearTypeDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_Cohort_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_Cohort_TR_DeleteTracking] ON [edfi].[Cohort] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_Cohort_TrackedChange](OldCohortIdentifier, OldEducationOrganizationId, Id, Discriminator, ChangeVersion)
    SELECT  d.CohortIdentifier, d.EducationOrganizationId, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[Cohort] ENABLE TRIGGER [edfi_Cohort_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_CommunityOrganization_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_CommunityOrganization_TR_DeleteTracking] ON [edfi].[CommunityOrganization] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_CommunityOrganization_TrackedChange](OldCommunityOrganizationId, Id, ChangeVersion)
    SELECT  d.CommunityOrganizationId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.EducationOrganization b ON d.CommunityOrganizationId = b.EducationOrganizationId
END
GO

ALTER TABLE [edfi].[CommunityOrganization] ENABLE TRIGGER [edfi_CommunityOrganization_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_CommunityProviderLicense_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_CommunityProviderLicense_TR_DeleteTracking] ON [edfi].[CommunityProviderLicense] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_CommunityProviderLicense_TrackedChange](OldCommunityProviderId, OldLicenseIdentifier, OldLicensingOrganization, Id, Discriminator, ChangeVersion)
    SELECT  d.CommunityProviderId, d.LicenseIdentifier, d.LicensingOrganization, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[CommunityProviderLicense] ENABLE TRIGGER [edfi_CommunityProviderLicense_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_CommunityProvider_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_CommunityProvider_TR_DeleteTracking] ON [edfi].[CommunityProvider] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_CommunityProvider_TrackedChange](OldCommunityProviderId, Id, ChangeVersion)
    SELECT  d.CommunityProviderId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.EducationOrganization b ON d.CommunityProviderId = b.EducationOrganizationId
END
GO

ALTER TABLE [edfi].[CommunityProvider] ENABLE TRIGGER [edfi_CommunityProvider_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_CompetencyLevelDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_CompetencyLevelDescriptor_TR_DeleteTracking] ON [edfi].[CompetencyLevelDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_CompetencyLevelDescriptor_TrackedChange](OldCompetencyLevelDescriptorId, Id, ChangeVersion)
    SELECT  d.CompetencyLevelDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CompetencyLevelDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[CompetencyLevelDescriptor] ENABLE TRIGGER [edfi_CompetencyLevelDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_CompetencyObjective_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_CompetencyObjective_TR_DeleteTracking] ON [edfi].[CompetencyObjective] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_CompetencyObjective_TrackedChange](OldEducationOrganizationId, OldObjective, OldObjectiveGradeLevelDescriptorId, OldObjectiveGradeLevelDescriptorNamespace, OldObjectiveGradeLevelDescriptorCodeValue, Id, Discriminator, ChangeVersion)
    SELECT  d.EducationOrganizationId, d.Objective, d.ObjectiveGradeLevelDescriptorId, j2.Namespace, j2.CodeValue, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Descriptor j2
            ON d.ObjectiveGradeLevelDescriptorId = j2.DescriptorId 
END
GO

ALTER TABLE [edfi].[CompetencyObjective] ENABLE TRIGGER [edfi_CompetencyObjective_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_ContactTypeDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_ContactTypeDescriptor_TR_DeleteTracking] ON [edfi].[ContactTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_ContactTypeDescriptor_TrackedChange](OldContactTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.ContactTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ContactTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[ContactTypeDescriptor] ENABLE TRIGGER [edfi_ContactTypeDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_ContentClassDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_ContentClassDescriptor_TR_DeleteTracking] ON [edfi].[ContentClassDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_ContentClassDescriptor_TrackedChange](OldContentClassDescriptorId, Id, ChangeVersion)
    SELECT  d.ContentClassDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ContentClassDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[ContentClassDescriptor] ENABLE TRIGGER [edfi_ContentClassDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_ContinuationOfServicesReasonDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_ContinuationOfServicesReasonDescriptor_TR_DeleteTracking] ON [edfi].[ContinuationOfServicesReasonDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_ContinuationOfServicesReasonDescriptor_TrackedChange](OldContinuationOfServicesReasonDescriptorId, Id, ChangeVersion)
    SELECT  d.ContinuationOfServicesReasonDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ContinuationOfServicesReasonDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[ContinuationOfServicesReasonDescriptor] ENABLE TRIGGER [edfi_ContinuationOfServicesReasonDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_ContractedStaff_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_ContractedStaff_TR_DeleteTracking] ON [edfi].[ContractedStaff] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_ContractedStaff_TrackedChange](OldAccountIdentifier, OldAsOfDate, OldEducationOrganizationId, OldFiscalYear, OldStaffUSI, OldStaffUniqueId, Id, Discriminator, ChangeVersion)
    SELECT  d.AccountIdentifier, d.AsOfDate, d.EducationOrganizationId, d.FiscalYear, d.StaffUSI, j4.StaffUniqueId, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Staff j4
            ON d.StaffUSI = j4.StaffUSI 
END
GO

ALTER TABLE [edfi].[ContractedStaff] ENABLE TRIGGER [edfi_ContractedStaff_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_CostRateDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_CostRateDescriptor_TR_DeleteTracking] ON [edfi].[CostRateDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_CostRateDescriptor_TrackedChange](OldCostRateDescriptorId, Id, ChangeVersion)
    SELECT  d.CostRateDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CostRateDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[CostRateDescriptor] ENABLE TRIGGER [edfi_CostRateDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_CountryDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_CountryDescriptor_TR_DeleteTracking] ON [edfi].[CountryDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_CountryDescriptor_TrackedChange](OldCountryDescriptorId, Id, ChangeVersion)
    SELECT  d.CountryDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CountryDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[CountryDescriptor] ENABLE TRIGGER [edfi_CountryDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_CourseAttemptResultDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_CourseAttemptResultDescriptor_TR_DeleteTracking] ON [edfi].[CourseAttemptResultDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_CourseAttemptResultDescriptor_TrackedChange](OldCourseAttemptResultDescriptorId, Id, ChangeVersion)
    SELECT  d.CourseAttemptResultDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CourseAttemptResultDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[CourseAttemptResultDescriptor] ENABLE TRIGGER [edfi_CourseAttemptResultDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_CourseDefinedByDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_CourseDefinedByDescriptor_TR_DeleteTracking] ON [edfi].[CourseDefinedByDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_CourseDefinedByDescriptor_TrackedChange](OldCourseDefinedByDescriptorId, Id, ChangeVersion)
    SELECT  d.CourseDefinedByDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CourseDefinedByDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[CourseDefinedByDescriptor] ENABLE TRIGGER [edfi_CourseDefinedByDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_CourseGPAApplicabilityDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_CourseGPAApplicabilityDescriptor_TR_DeleteTracking] ON [edfi].[CourseGPAApplicabilityDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_CourseGPAApplicabilityDescriptor_TrackedChange](OldCourseGPAApplicabilityDescriptorId, Id, ChangeVersion)
    SELECT  d.CourseGPAApplicabilityDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CourseGPAApplicabilityDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[CourseGPAApplicabilityDescriptor] ENABLE TRIGGER [edfi_CourseGPAApplicabilityDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_CourseIdentificationSystemDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_CourseIdentificationSystemDescriptor_TR_DeleteTracking] ON [edfi].[CourseIdentificationSystemDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_CourseIdentificationSystemDescriptor_TrackedChange](OldCourseIdentificationSystemDescriptorId, Id, ChangeVersion)
    SELECT  d.CourseIdentificationSystemDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CourseIdentificationSystemDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[CourseIdentificationSystemDescriptor] ENABLE TRIGGER [edfi_CourseIdentificationSystemDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_CourseLevelCharacteristicDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_CourseLevelCharacteristicDescriptor_TR_DeleteTracking] ON [edfi].[CourseLevelCharacteristicDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_CourseLevelCharacteristicDescriptor_TrackedChange](OldCourseLevelCharacteristicDescriptorId, Id, ChangeVersion)
    SELECT  d.CourseLevelCharacteristicDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CourseLevelCharacteristicDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[CourseLevelCharacteristicDescriptor] ENABLE TRIGGER [edfi_CourseLevelCharacteristicDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_CourseOffering_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_CourseOffering_TR_DeleteTracking] ON [edfi].[CourseOffering] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_CourseOffering_TrackedChange](OldLocalCourseCode, OldSchoolId, OldSchoolYear, OldSessionName, Id, Discriminator, ChangeVersion)
    SELECT  d.LocalCourseCode, d.SchoolId, d.SchoolYear, d.SessionName, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[CourseOffering] ENABLE TRIGGER [edfi_CourseOffering_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_CourseRepeatCodeDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_CourseRepeatCodeDescriptor_TR_DeleteTracking] ON [edfi].[CourseRepeatCodeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_CourseRepeatCodeDescriptor_TrackedChange](OldCourseRepeatCodeDescriptorId, Id, ChangeVersion)
    SELECT  d.CourseRepeatCodeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CourseRepeatCodeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[CourseRepeatCodeDescriptor] ENABLE TRIGGER [edfi_CourseRepeatCodeDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_CourseTranscript_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_CourseTranscript_TR_DeleteTracking] ON [edfi].[CourseTranscript] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_CourseTranscript_TrackedChange](OldCourseAttemptResultDescriptorId, OldCourseAttemptResultDescriptorNamespace, OldCourseAttemptResultDescriptorCodeValue, OldCourseCode, OldCourseEducationOrganizationId, OldEducationOrganizationId, OldSchoolYear, OldStudentUSI, OldStudentUniqueId, OldTermDescriptorId, OldTermDescriptorNamespace, OldTermDescriptorCodeValue, Id, Discriminator, ChangeVersion)
    SELECT  d.CourseAttemptResultDescriptorId, j0.Namespace, j0.CodeValue, d.CourseCode, d.CourseEducationOrganizationId, d.EducationOrganizationId, d.SchoolYear, d.StudentUSI, j5.StudentUniqueId, d.TermDescriptorId, j6.Namespace, j6.CodeValue, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Descriptor j0
            ON d.CourseAttemptResultDescriptorId = j0.DescriptorId 
        INNER JOIN edfi.Student j5
            ON d.StudentUSI = j5.StudentUSI 
        INNER JOIN edfi.Descriptor j6
            ON d.TermDescriptorId = j6.DescriptorId 
END
GO

ALTER TABLE [edfi].[CourseTranscript] ENABLE TRIGGER [edfi_CourseTranscript_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_Course_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_Course_TR_DeleteTracking] ON [edfi].[Course] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_Course_TrackedChange](OldCourseCode, OldEducationOrganizationId, Id, Discriminator, ChangeVersion)
    SELECT  d.CourseCode, d.EducationOrganizationId, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[Course] ENABLE TRIGGER [edfi_Course_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_CredentialFieldDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_CredentialFieldDescriptor_TR_DeleteTracking] ON [edfi].[CredentialFieldDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_CredentialFieldDescriptor_TrackedChange](OldCredentialFieldDescriptorId, Id, ChangeVersion)
    SELECT  d.CredentialFieldDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CredentialFieldDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[CredentialFieldDescriptor] ENABLE TRIGGER [edfi_CredentialFieldDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_CredentialTypeDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_CredentialTypeDescriptor_TR_DeleteTracking] ON [edfi].[CredentialTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_CredentialTypeDescriptor_TrackedChange](OldCredentialTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.CredentialTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CredentialTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[CredentialTypeDescriptor] ENABLE TRIGGER [edfi_CredentialTypeDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_Credential_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_Credential_TR_DeleteTracking] ON [edfi].[Credential] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_Credential_TrackedChange](OldCredentialIdentifier, OldStateOfIssueStateAbbreviationDescriptorId, OldStateOfIssueStateAbbreviationDescriptorNamespace, OldStateOfIssueStateAbbreviationDescriptorCodeValue, Id, Discriminator, ChangeVersion)
    SELECT  d.CredentialIdentifier, d.StateOfIssueStateAbbreviationDescriptorId, j1.Namespace, j1.CodeValue, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Descriptor j1
            ON d.StateOfIssueStateAbbreviationDescriptorId = j1.DescriptorId 
END
GO

ALTER TABLE [edfi].[Credential] ENABLE TRIGGER [edfi_Credential_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_CreditTypeDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_CreditTypeDescriptor_TR_DeleteTracking] ON [edfi].[CreditTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_CreditTypeDescriptor_TrackedChange](OldCreditTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.CreditTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CreditTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[CreditTypeDescriptor] ENABLE TRIGGER [edfi_CreditTypeDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_CurriculumUsedDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_CurriculumUsedDescriptor_TR_DeleteTracking] ON [edfi].[CurriculumUsedDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_CurriculumUsedDescriptor_TrackedChange](OldCurriculumUsedDescriptorId, Id, ChangeVersion)
    SELECT  d.CurriculumUsedDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CurriculumUsedDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[CurriculumUsedDescriptor] ENABLE TRIGGER [edfi_CurriculumUsedDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_DeliveryMethodDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_DeliveryMethodDescriptor_TR_DeleteTracking] ON [edfi].[DeliveryMethodDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_DeliveryMethodDescriptor_TrackedChange](OldDeliveryMethodDescriptorId, Id, ChangeVersion)
    SELECT  d.DeliveryMethodDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.DeliveryMethodDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[DeliveryMethodDescriptor] ENABLE TRIGGER [edfi_DeliveryMethodDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_Descriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_Descriptor_TR_DeleteTracking] ON [edfi].[Descriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_Descriptor_TrackedChange](OldDescriptorId, OldCodeValue, OldNamespace, Id, ChangeVersion)
    SELECT  d.DescriptorId, d.CodeValue, d.Namespace, d.Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[Descriptor] ENABLE TRIGGER [edfi_Descriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_DiagnosisDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_DiagnosisDescriptor_TR_DeleteTracking] ON [edfi].[DiagnosisDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_DiagnosisDescriptor_TrackedChange](OldDiagnosisDescriptorId, Id, ChangeVersion)
    SELECT  d.DiagnosisDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.DiagnosisDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[DiagnosisDescriptor] ENABLE TRIGGER [edfi_DiagnosisDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_DiplomaLevelDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_DiplomaLevelDescriptor_TR_DeleteTracking] ON [edfi].[DiplomaLevelDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_DiplomaLevelDescriptor_TrackedChange](OldDiplomaLevelDescriptorId, Id, ChangeVersion)
    SELECT  d.DiplomaLevelDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.DiplomaLevelDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[DiplomaLevelDescriptor] ENABLE TRIGGER [edfi_DiplomaLevelDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_DiplomaTypeDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_DiplomaTypeDescriptor_TR_DeleteTracking] ON [edfi].[DiplomaTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_DiplomaTypeDescriptor_TrackedChange](OldDiplomaTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.DiplomaTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.DiplomaTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[DiplomaTypeDescriptor] ENABLE TRIGGER [edfi_DiplomaTypeDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_DisabilityDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_DisabilityDescriptor_TR_DeleteTracking] ON [edfi].[DisabilityDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_DisabilityDescriptor_TrackedChange](OldDisabilityDescriptorId, Id, ChangeVersion)
    SELECT  d.DisabilityDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.DisabilityDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[DisabilityDescriptor] ENABLE TRIGGER [edfi_DisabilityDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_DisabilityDesignationDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_DisabilityDesignationDescriptor_TR_DeleteTracking] ON [edfi].[DisabilityDesignationDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_DisabilityDesignationDescriptor_TrackedChange](OldDisabilityDesignationDescriptorId, Id, ChangeVersion)
    SELECT  d.DisabilityDesignationDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.DisabilityDesignationDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[DisabilityDesignationDescriptor] ENABLE TRIGGER [edfi_DisabilityDesignationDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_DisabilityDeterminationSourceTypeDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_DisabilityDeterminationSourceTypeDescriptor_TR_DeleteTracking] ON [edfi].[DisabilityDeterminationSourceTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_DisabilityDeterminationSourceTypeDescriptor_TrackedChange](OldDisabilityDeterminationSourceTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.DisabilityDeterminationSourceTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.DisabilityDeterminationSourceTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[DisabilityDeterminationSourceTypeDescriptor] ENABLE TRIGGER [edfi_DisabilityDeterminationSourceTypeDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_DisciplineActionLengthDifferenceReasonDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_DisciplineActionLengthDifferenceReasonDescriptor_TR_DeleteTracking] ON [edfi].[DisciplineActionLengthDifferenceReasonDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_DisciplineActionLengthDifferenceReasonDescriptor_TrackedChange](OldDisciplineActionLengthDifferenceReasonDescriptorId, Id, ChangeVersion)
    SELECT  d.DisciplineActionLengthDifferenceReasonDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.DisciplineActionLengthDifferenceReasonDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[DisciplineActionLengthDifferenceReasonDescriptor] ENABLE TRIGGER [edfi_DisciplineActionLengthDifferenceReasonDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_DisciplineAction_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_DisciplineAction_TR_DeleteTracking] ON [edfi].[DisciplineAction] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_DisciplineAction_TrackedChange](OldDisciplineActionIdentifier, OldDisciplineDate, OldStudentUSI, OldStudentUniqueId, Id, Discriminator, ChangeVersion)
    SELECT  d.DisciplineActionIdentifier, d.DisciplineDate, d.StudentUSI, j2.StudentUniqueId, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Student j2
            ON d.StudentUSI = j2.StudentUSI 
END
GO

ALTER TABLE [edfi].[DisciplineAction] ENABLE TRIGGER [edfi_DisciplineAction_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_DisciplineDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_DisciplineDescriptor_TR_DeleteTracking] ON [edfi].[DisciplineDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_DisciplineDescriptor_TrackedChange](OldDisciplineDescriptorId, Id, ChangeVersion)
    SELECT  d.DisciplineDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.DisciplineDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[DisciplineDescriptor] ENABLE TRIGGER [edfi_DisciplineDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_DisciplineIncident_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_DisciplineIncident_TR_DeleteTracking] ON [edfi].[DisciplineIncident] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_DisciplineIncident_TrackedChange](OldIncidentIdentifier, OldSchoolId, Id, Discriminator, ChangeVersion)
    SELECT  d.IncidentIdentifier, d.SchoolId, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[DisciplineIncident] ENABLE TRIGGER [edfi_DisciplineIncident_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_EducationContent_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_EducationContent_TR_DeleteTracking] ON [edfi].[EducationContent] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_EducationContent_TrackedChange](OldContentIdentifier, Id, Discriminator, ChangeVersion)
    SELECT  d.ContentIdentifier, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[EducationContent] ENABLE TRIGGER [edfi_EducationContent_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_EducationOrganizationCategoryDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_EducationOrganizationCategoryDescriptor_TR_DeleteTracking] ON [edfi].[EducationOrganizationCategoryDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_EducationOrganizationCategoryDescriptor_TrackedChange](OldEducationOrganizationCategoryDescriptorId, Id, ChangeVersion)
    SELECT  d.EducationOrganizationCategoryDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.EducationOrganizationCategoryDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[EducationOrganizationCategoryDescriptor] ENABLE TRIGGER [edfi_EducationOrganizationCategoryDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_EducationOrganizationIdentificationSystemDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_EducationOrganizationIdentificationSystemDescriptor_TR_DeleteTracking] ON [edfi].[EducationOrganizationIdentificationSystemDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_EducationOrganizationIdentificationSystemDescriptor_TrackedChange](OldEducationOrganizationIdentificationSystemDescriptorId, Id, ChangeVersion)
    SELECT  d.EducationOrganizationIdentificationSystemDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.EducationOrganizationIdentificationSystemDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[EducationOrganizationIdentificationSystemDescriptor] ENABLE TRIGGER [edfi_EducationOrganizationIdentificationSystemDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_EducationOrganizationInterventionPrescriptionAssociation_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_EducationOrganizationInterventionPrescriptionAssociation_TR_DeleteTracking] ON [edfi].[EducationOrganizationInterventionPrescriptionAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_EducationOrganizationInterventionPrescriptionAssociation_TrackedChange](OldEducationOrganizationId, OldInterventionPrescriptionEducationOrganizationId, OldInterventionPrescriptionIdentificationCode, Id, Discriminator, ChangeVersion)
    SELECT  d.EducationOrganizationId, d.InterventionPrescriptionEducationOrganizationId, d.InterventionPrescriptionIdentificationCode, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[EducationOrganizationInterventionPrescriptionAssociation] ENABLE TRIGGER [edfi_EducationOrganizationInterventionPrescriptionAssociation_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_EducationOrganizationNetworkAssociation_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_EducationOrganizationNetworkAssociation_TR_DeleteTracking] ON [edfi].[EducationOrganizationNetworkAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_EducationOrganizationNetworkAssociation_TrackedChange](OldEducationOrganizationNetworkId, OldMemberEducationOrganizationId, Id, Discriminator, ChangeVersion)
    SELECT  d.EducationOrganizationNetworkId, d.MemberEducationOrganizationId, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[EducationOrganizationNetworkAssociation] ENABLE TRIGGER [edfi_EducationOrganizationNetworkAssociation_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_EducationOrganizationNetwork_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_EducationOrganizationNetwork_TR_DeleteTracking] ON [edfi].[EducationOrganizationNetwork] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_EducationOrganizationNetwork_TrackedChange](OldEducationOrganizationNetworkId, Id, ChangeVersion)
    SELECT  d.EducationOrganizationNetworkId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.EducationOrganization b ON d.EducationOrganizationNetworkId = b.EducationOrganizationId
END
GO

ALTER TABLE [edfi].[EducationOrganizationNetwork] ENABLE TRIGGER [edfi_EducationOrganizationNetwork_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_EducationOrganizationPeerAssociation_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_EducationOrganizationPeerAssociation_TR_DeleteTracking] ON [edfi].[EducationOrganizationPeerAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_EducationOrganizationPeerAssociation_TrackedChange](OldEducationOrganizationId, OldPeerEducationOrganizationId, Id, Discriminator, ChangeVersion)
    SELECT  d.EducationOrganizationId, d.PeerEducationOrganizationId, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[EducationOrganizationPeerAssociation] ENABLE TRIGGER [edfi_EducationOrganizationPeerAssociation_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_EducationOrganization_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_EducationOrganization_TR_DeleteTracking] ON [edfi].[EducationOrganization] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_EducationOrganization_TrackedChange](OldEducationOrganizationId, Id, Discriminator, ChangeVersion)
    SELECT  d.EducationOrganizationId, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[EducationOrganization] ENABLE TRIGGER [edfi_EducationOrganization_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_EducationPlanDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_EducationPlanDescriptor_TR_DeleteTracking] ON [edfi].[EducationPlanDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_EducationPlanDescriptor_TrackedChange](OldEducationPlanDescriptorId, Id, ChangeVersion)
    SELECT  d.EducationPlanDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.EducationPlanDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[EducationPlanDescriptor] ENABLE TRIGGER [edfi_EducationPlanDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_EducationServiceCenter_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_EducationServiceCenter_TR_DeleteTracking] ON [edfi].[EducationServiceCenter] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_EducationServiceCenter_TrackedChange](OldEducationServiceCenterId, Id, ChangeVersion)
    SELECT  d.EducationServiceCenterId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.EducationOrganization b ON d.EducationServiceCenterId = b.EducationOrganizationId
END
GO

ALTER TABLE [edfi].[EducationServiceCenter] ENABLE TRIGGER [edfi_EducationServiceCenter_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_EducationalEnvironmentDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_EducationalEnvironmentDescriptor_TR_DeleteTracking] ON [edfi].[EducationalEnvironmentDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_EducationalEnvironmentDescriptor_TrackedChange](OldEducationalEnvironmentDescriptorId, Id, ChangeVersion)
    SELECT  d.EducationalEnvironmentDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.EducationalEnvironmentDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[EducationalEnvironmentDescriptor] ENABLE TRIGGER [edfi_EducationalEnvironmentDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_ElectronicMailTypeDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_ElectronicMailTypeDescriptor_TR_DeleteTracking] ON [edfi].[ElectronicMailTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_ElectronicMailTypeDescriptor_TrackedChange](OldElectronicMailTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.ElectronicMailTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ElectronicMailTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[ElectronicMailTypeDescriptor] ENABLE TRIGGER [edfi_ElectronicMailTypeDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_EmploymentStatusDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_EmploymentStatusDescriptor_TR_DeleteTracking] ON [edfi].[EmploymentStatusDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_EmploymentStatusDescriptor_TrackedChange](OldEmploymentStatusDescriptorId, Id, ChangeVersion)
    SELECT  d.EmploymentStatusDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.EmploymentStatusDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[EmploymentStatusDescriptor] ENABLE TRIGGER [edfi_EmploymentStatusDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_EntryGradeLevelReasonDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_EntryGradeLevelReasonDescriptor_TR_DeleteTracking] ON [edfi].[EntryGradeLevelReasonDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_EntryGradeLevelReasonDescriptor_TrackedChange](OldEntryGradeLevelReasonDescriptorId, Id, ChangeVersion)
    SELECT  d.EntryGradeLevelReasonDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.EntryGradeLevelReasonDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[EntryGradeLevelReasonDescriptor] ENABLE TRIGGER [edfi_EntryGradeLevelReasonDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_EntryTypeDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_EntryTypeDescriptor_TR_DeleteTracking] ON [edfi].[EntryTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_EntryTypeDescriptor_TrackedChange](OldEntryTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.EntryTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.EntryTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[EntryTypeDescriptor] ENABLE TRIGGER [edfi_EntryTypeDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_EventCircumstanceDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_EventCircumstanceDescriptor_TR_DeleteTracking] ON [edfi].[EventCircumstanceDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_EventCircumstanceDescriptor_TrackedChange](OldEventCircumstanceDescriptorId, Id, ChangeVersion)
    SELECT  d.EventCircumstanceDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.EventCircumstanceDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[EventCircumstanceDescriptor] ENABLE TRIGGER [edfi_EventCircumstanceDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_ExitWithdrawTypeDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_ExitWithdrawTypeDescriptor_TR_DeleteTracking] ON [edfi].[ExitWithdrawTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_ExitWithdrawTypeDescriptor_TrackedChange](OldExitWithdrawTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.ExitWithdrawTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ExitWithdrawTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[ExitWithdrawTypeDescriptor] ENABLE TRIGGER [edfi_ExitWithdrawTypeDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_FeederSchoolAssociation_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_FeederSchoolAssociation_TR_DeleteTracking] ON [edfi].[FeederSchoolAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_FeederSchoolAssociation_TrackedChange](OldBeginDate, OldFeederSchoolId, OldSchoolId, Id, Discriminator, ChangeVersion)
    SELECT  d.BeginDate, d.FeederSchoolId, d.SchoolId, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[FeederSchoolAssociation] ENABLE TRIGGER [edfi_FeederSchoolAssociation_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_GeneralStudentProgramAssociation_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_GeneralStudentProgramAssociation_TR_DeleteTracking] ON [edfi].[GeneralStudentProgramAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_GeneralStudentProgramAssociation_TrackedChange](OldBeginDate, OldEducationOrganizationId, OldProgramEducationOrganizationId, OldProgramName, OldProgramTypeDescriptorId, OldProgramTypeDescriptorNamespace, OldProgramTypeDescriptorCodeValue, OldStudentUSI, OldStudentUniqueId, Id, Discriminator, ChangeVersion)
    SELECT  d.BeginDate, d.EducationOrganizationId, d.ProgramEducationOrganizationId, d.ProgramName, d.ProgramTypeDescriptorId, j4.Namespace, j4.CodeValue, d.StudentUSI, j5.StudentUniqueId, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Descriptor j4
            ON d.ProgramTypeDescriptorId = j4.DescriptorId 
        INNER JOIN edfi.Student j5
            ON d.StudentUSI = j5.StudentUSI 
END
GO

ALTER TABLE [edfi].[GeneralStudentProgramAssociation] ENABLE TRIGGER [edfi_GeneralStudentProgramAssociation_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_GradeLevelDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_GradeLevelDescriptor_TR_DeleteTracking] ON [edfi].[GradeLevelDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_GradeLevelDescriptor_TrackedChange](OldGradeLevelDescriptorId, Id, ChangeVersion)
    SELECT  d.GradeLevelDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.GradeLevelDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[GradeLevelDescriptor] ENABLE TRIGGER [edfi_GradeLevelDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_GradeTypeDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_GradeTypeDescriptor_TR_DeleteTracking] ON [edfi].[GradeTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_GradeTypeDescriptor_TrackedChange](OldGradeTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.GradeTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.GradeTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[GradeTypeDescriptor] ENABLE TRIGGER [edfi_GradeTypeDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_Grade_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_Grade_TR_DeleteTracking] ON [edfi].[Grade] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_Grade_TrackedChange](OldBeginDate, OldGradeTypeDescriptorId, OldGradeTypeDescriptorNamespace, OldGradeTypeDescriptorCodeValue, OldGradingPeriodDescriptorId, OldGradingPeriodDescriptorNamespace, OldGradingPeriodDescriptorCodeValue, OldGradingPeriodSchoolYear, OldGradingPeriodSequence, OldLocalCourseCode, OldSchoolId, OldSchoolYear, OldSectionIdentifier, OldSessionName, OldStudentUSI, OldStudentUniqueId, Id, Discriminator, ChangeVersion)
    SELECT  d.BeginDate, d.GradeTypeDescriptorId, j1.Namespace, j1.CodeValue, d.GradingPeriodDescriptorId, j2.Namespace, j2.CodeValue, d.GradingPeriodSchoolYear, d.GradingPeriodSequence, d.LocalCourseCode, d.SchoolId, d.SchoolYear, d.SectionIdentifier, d.SessionName, d.StudentUSI, j10.StudentUniqueId, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Descriptor j1
            ON d.GradeTypeDescriptorId = j1.DescriptorId 
        INNER JOIN edfi.Descriptor j2
            ON d.GradingPeriodDescriptorId = j2.DescriptorId 
        INNER JOIN edfi.Student j10
            ON d.StudentUSI = j10.StudentUSI 
END
GO

ALTER TABLE [edfi].[Grade] ENABLE TRIGGER [edfi_Grade_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_GradebookEntryTypeDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_GradebookEntryTypeDescriptor_TR_DeleteTracking] ON [edfi].[GradebookEntryTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_GradebookEntryTypeDescriptor_TrackedChange](OldGradebookEntryTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.GradebookEntryTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.GradebookEntryTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[GradebookEntryTypeDescriptor] ENABLE TRIGGER [edfi_GradebookEntryTypeDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_GradebookEntry_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_GradebookEntry_TR_DeleteTracking] ON [edfi].[GradebookEntry] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_GradebookEntry_TrackedChange](OldDateAssigned, OldGradebookEntryTitle, OldLocalCourseCode, OldSchoolId, OldSchoolYear, OldSectionIdentifier, OldSessionName, Id, Discriminator, ChangeVersion)
    SELECT  d.DateAssigned, d.GradebookEntryTitle, d.LocalCourseCode, d.SchoolId, d.SchoolYear, d.SectionIdentifier, d.SessionName, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[GradebookEntry] ENABLE TRIGGER [edfi_GradebookEntry_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_GradingPeriodDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_GradingPeriodDescriptor_TR_DeleteTracking] ON [edfi].[GradingPeriodDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_GradingPeriodDescriptor_TrackedChange](OldGradingPeriodDescriptorId, Id, ChangeVersion)
    SELECT  d.GradingPeriodDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.GradingPeriodDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[GradingPeriodDescriptor] ENABLE TRIGGER [edfi_GradingPeriodDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_GradingPeriod_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_GradingPeriod_TR_DeleteTracking] ON [edfi].[GradingPeriod] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_GradingPeriod_TrackedChange](OldGradingPeriodDescriptorId, OldGradingPeriodDescriptorNamespace, OldGradingPeriodDescriptorCodeValue, OldPeriodSequence, OldSchoolId, OldSchoolYear, Id, Discriminator, ChangeVersion)
    SELECT  d.GradingPeriodDescriptorId, j0.Namespace, j0.CodeValue, d.PeriodSequence, d.SchoolId, d.SchoolYear, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Descriptor j0
            ON d.GradingPeriodDescriptorId = j0.DescriptorId 
END
GO

ALTER TABLE [edfi].[GradingPeriod] ENABLE TRIGGER [edfi_GradingPeriod_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_GraduationPlanTypeDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_GraduationPlanTypeDescriptor_TR_DeleteTracking] ON [edfi].[GraduationPlanTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_GraduationPlanTypeDescriptor_TrackedChange](OldGraduationPlanTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.GraduationPlanTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.GraduationPlanTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[GraduationPlanTypeDescriptor] ENABLE TRIGGER [edfi_GraduationPlanTypeDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_GraduationPlan_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_GraduationPlan_TR_DeleteTracking] ON [edfi].[GraduationPlan] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_GraduationPlan_TrackedChange](OldEducationOrganizationId, OldGraduationPlanTypeDescriptorId, OldGraduationPlanTypeDescriptorNamespace, OldGraduationPlanTypeDescriptorCodeValue, OldGraduationSchoolYear, Id, Discriminator, ChangeVersion)
    SELECT  d.EducationOrganizationId, d.GraduationPlanTypeDescriptorId, j1.Namespace, j1.CodeValue, d.GraduationSchoolYear, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Descriptor j1
            ON d.GraduationPlanTypeDescriptorId = j1.DescriptorId 
END
GO

ALTER TABLE [edfi].[GraduationPlan] ENABLE TRIGGER [edfi_GraduationPlan_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_GunFreeSchoolsActReportingStatusDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_GunFreeSchoolsActReportingStatusDescriptor_TR_DeleteTracking] ON [edfi].[GunFreeSchoolsActReportingStatusDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_GunFreeSchoolsActReportingStatusDescriptor_TrackedChange](OldGunFreeSchoolsActReportingStatusDescriptorId, Id, ChangeVersion)
    SELECT  d.GunFreeSchoolsActReportingStatusDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.GunFreeSchoolsActReportingStatusDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[GunFreeSchoolsActReportingStatusDescriptor] ENABLE TRIGGER [edfi_GunFreeSchoolsActReportingStatusDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_HomelessPrimaryNighttimeResidenceDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_HomelessPrimaryNighttimeResidenceDescriptor_TR_DeleteTracking] ON [edfi].[HomelessPrimaryNighttimeResidenceDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_HomelessPrimaryNighttimeResidenceDescriptor_TrackedChange](OldHomelessPrimaryNighttimeResidenceDescriptorId, Id, ChangeVersion)
    SELECT  d.HomelessPrimaryNighttimeResidenceDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.HomelessPrimaryNighttimeResidenceDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[HomelessPrimaryNighttimeResidenceDescriptor] ENABLE TRIGGER [edfi_HomelessPrimaryNighttimeResidenceDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_HomelessProgramServiceDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_HomelessProgramServiceDescriptor_TR_DeleteTracking] ON [edfi].[HomelessProgramServiceDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_HomelessProgramServiceDescriptor_TrackedChange](OldHomelessProgramServiceDescriptorId, Id, ChangeVersion)
    SELECT  d.HomelessProgramServiceDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.HomelessProgramServiceDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[HomelessProgramServiceDescriptor] ENABLE TRIGGER [edfi_HomelessProgramServiceDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_IdentificationDocumentUseDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_IdentificationDocumentUseDescriptor_TR_DeleteTracking] ON [edfi].[IdentificationDocumentUseDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_IdentificationDocumentUseDescriptor_TrackedChange](OldIdentificationDocumentUseDescriptorId, Id, ChangeVersion)
    SELECT  d.IdentificationDocumentUseDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.IdentificationDocumentUseDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[IdentificationDocumentUseDescriptor] ENABLE TRIGGER [edfi_IdentificationDocumentUseDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_IncidentLocationDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_IncidentLocationDescriptor_TR_DeleteTracking] ON [edfi].[IncidentLocationDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_IncidentLocationDescriptor_TrackedChange](OldIncidentLocationDescriptorId, Id, ChangeVersion)
    SELECT  d.IncidentLocationDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.IncidentLocationDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[IncidentLocationDescriptor] ENABLE TRIGGER [edfi_IncidentLocationDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_InstitutionTelephoneNumberTypeDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_InstitutionTelephoneNumberTypeDescriptor_TR_DeleteTracking] ON [edfi].[InstitutionTelephoneNumberTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_InstitutionTelephoneNumberTypeDescriptor_TrackedChange](OldInstitutionTelephoneNumberTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.InstitutionTelephoneNumberTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.InstitutionTelephoneNumberTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[InstitutionTelephoneNumberTypeDescriptor] ENABLE TRIGGER [edfi_InstitutionTelephoneNumberTypeDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_InteractivityStyleDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_InteractivityStyleDescriptor_TR_DeleteTracking] ON [edfi].[InteractivityStyleDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_InteractivityStyleDescriptor_TrackedChange](OldInteractivityStyleDescriptorId, Id, ChangeVersion)
    SELECT  d.InteractivityStyleDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.InteractivityStyleDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[InteractivityStyleDescriptor] ENABLE TRIGGER [edfi_InteractivityStyleDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_InternetAccessDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_InternetAccessDescriptor_TR_DeleteTracking] ON [edfi].[InternetAccessDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_InternetAccessDescriptor_TrackedChange](OldInternetAccessDescriptorId, Id, ChangeVersion)
    SELECT  d.InternetAccessDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.InternetAccessDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[InternetAccessDescriptor] ENABLE TRIGGER [edfi_InternetAccessDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_InterventionClassDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_InterventionClassDescriptor_TR_DeleteTracking] ON [edfi].[InterventionClassDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_InterventionClassDescriptor_TrackedChange](OldInterventionClassDescriptorId, Id, ChangeVersion)
    SELECT  d.InterventionClassDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.InterventionClassDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[InterventionClassDescriptor] ENABLE TRIGGER [edfi_InterventionClassDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_InterventionEffectivenessRatingDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_InterventionEffectivenessRatingDescriptor_TR_DeleteTracking] ON [edfi].[InterventionEffectivenessRatingDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_InterventionEffectivenessRatingDescriptor_TrackedChange](OldInterventionEffectivenessRatingDescriptorId, Id, ChangeVersion)
    SELECT  d.InterventionEffectivenessRatingDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.InterventionEffectivenessRatingDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[InterventionEffectivenessRatingDescriptor] ENABLE TRIGGER [edfi_InterventionEffectivenessRatingDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_InterventionPrescription_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_InterventionPrescription_TR_DeleteTracking] ON [edfi].[InterventionPrescription] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_InterventionPrescription_TrackedChange](OldEducationOrganizationId, OldInterventionPrescriptionIdentificationCode, Id, Discriminator, ChangeVersion)
    SELECT  d.EducationOrganizationId, d.InterventionPrescriptionIdentificationCode, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[InterventionPrescription] ENABLE TRIGGER [edfi_InterventionPrescription_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_InterventionStudy_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_InterventionStudy_TR_DeleteTracking] ON [edfi].[InterventionStudy] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_InterventionStudy_TrackedChange](OldEducationOrganizationId, OldInterventionStudyIdentificationCode, Id, Discriminator, ChangeVersion)
    SELECT  d.EducationOrganizationId, d.InterventionStudyIdentificationCode, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[InterventionStudy] ENABLE TRIGGER [edfi_InterventionStudy_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_Intervention_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_Intervention_TR_DeleteTracking] ON [edfi].[Intervention] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_Intervention_TrackedChange](OldEducationOrganizationId, OldInterventionIdentificationCode, Id, Discriminator, ChangeVersion)
    SELECT  d.EducationOrganizationId, d.InterventionIdentificationCode, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[Intervention] ENABLE TRIGGER [edfi_Intervention_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_LanguageDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_LanguageDescriptor_TR_DeleteTracking] ON [edfi].[LanguageDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_LanguageDescriptor_TrackedChange](OldLanguageDescriptorId, Id, ChangeVersion)
    SELECT  d.LanguageDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.LanguageDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[LanguageDescriptor] ENABLE TRIGGER [edfi_LanguageDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_LanguageInstructionProgramServiceDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_LanguageInstructionProgramServiceDescriptor_TR_DeleteTracking] ON [edfi].[LanguageInstructionProgramServiceDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_LanguageInstructionProgramServiceDescriptor_TrackedChange](OldLanguageInstructionProgramServiceDescriptorId, Id, ChangeVersion)
    SELECT  d.LanguageInstructionProgramServiceDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.LanguageInstructionProgramServiceDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[LanguageInstructionProgramServiceDescriptor] ENABLE TRIGGER [edfi_LanguageInstructionProgramServiceDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_LanguageUseDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_LanguageUseDescriptor_TR_DeleteTracking] ON [edfi].[LanguageUseDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_LanguageUseDescriptor_TrackedChange](OldLanguageUseDescriptorId, Id, ChangeVersion)
    SELECT  d.LanguageUseDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.LanguageUseDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[LanguageUseDescriptor] ENABLE TRIGGER [edfi_LanguageUseDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_LearningObjective_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_LearningObjective_TR_DeleteTracking] ON [edfi].[LearningObjective] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_LearningObjective_TrackedChange](OldLearningObjectiveId, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.LearningObjectiveId, d.Namespace, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[LearningObjective] ENABLE TRIGGER [edfi_LearningObjective_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_LearningStandardCategoryDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_LearningStandardCategoryDescriptor_TR_DeleteTracking] ON [edfi].[LearningStandardCategoryDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_LearningStandardCategoryDescriptor_TrackedChange](OldLearningStandardCategoryDescriptorId, Id, ChangeVersion)
    SELECT  d.LearningStandardCategoryDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.LearningStandardCategoryDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[LearningStandardCategoryDescriptor] ENABLE TRIGGER [edfi_LearningStandardCategoryDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_LearningStandard_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_LearningStandard_TR_DeleteTracking] ON [edfi].[LearningStandard] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_LearningStandard_TrackedChange](OldLearningStandardId, Id, Discriminator, ChangeVersion)
    SELECT  d.LearningStandardId, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[LearningStandard] ENABLE TRIGGER [edfi_LearningStandard_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_LevelOfEducationDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_LevelOfEducationDescriptor_TR_DeleteTracking] ON [edfi].[LevelOfEducationDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_LevelOfEducationDescriptor_TrackedChange](OldLevelOfEducationDescriptorId, Id, ChangeVersion)
    SELECT  d.LevelOfEducationDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.LevelOfEducationDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[LevelOfEducationDescriptor] ENABLE TRIGGER [edfi_LevelOfEducationDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_LicenseStatusDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_LicenseStatusDescriptor_TR_DeleteTracking] ON [edfi].[LicenseStatusDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_LicenseStatusDescriptor_TrackedChange](OldLicenseStatusDescriptorId, Id, ChangeVersion)
    SELECT  d.LicenseStatusDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.LicenseStatusDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[LicenseStatusDescriptor] ENABLE TRIGGER [edfi_LicenseStatusDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_LicenseTypeDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_LicenseTypeDescriptor_TR_DeleteTracking] ON [edfi].[LicenseTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_LicenseTypeDescriptor_TrackedChange](OldLicenseTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.LicenseTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.LicenseTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[LicenseTypeDescriptor] ENABLE TRIGGER [edfi_LicenseTypeDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_LimitedEnglishProficiencyDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_LimitedEnglishProficiencyDescriptor_TR_DeleteTracking] ON [edfi].[LimitedEnglishProficiencyDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_LimitedEnglishProficiencyDescriptor_TrackedChange](OldLimitedEnglishProficiencyDescriptorId, Id, ChangeVersion)
    SELECT  d.LimitedEnglishProficiencyDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.LimitedEnglishProficiencyDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[LimitedEnglishProficiencyDescriptor] ENABLE TRIGGER [edfi_LimitedEnglishProficiencyDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_LocalEducationAgencyCategoryDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_LocalEducationAgencyCategoryDescriptor_TR_DeleteTracking] ON [edfi].[LocalEducationAgencyCategoryDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_LocalEducationAgencyCategoryDescriptor_TrackedChange](OldLocalEducationAgencyCategoryDescriptorId, Id, ChangeVersion)
    SELECT  d.LocalEducationAgencyCategoryDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.LocalEducationAgencyCategoryDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[LocalEducationAgencyCategoryDescriptor] ENABLE TRIGGER [edfi_LocalEducationAgencyCategoryDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_LocalEducationAgency_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_LocalEducationAgency_TR_DeleteTracking] ON [edfi].[LocalEducationAgency] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_LocalEducationAgency_TrackedChange](OldLocalEducationAgencyId, Id, ChangeVersion)
    SELECT  d.LocalEducationAgencyId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.EducationOrganization b ON d.LocalEducationAgencyId = b.EducationOrganizationId
END
GO

ALTER TABLE [edfi].[LocalEducationAgency] ENABLE TRIGGER [edfi_LocalEducationAgency_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_LocaleDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_LocaleDescriptor_TR_DeleteTracking] ON [edfi].[LocaleDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_LocaleDescriptor_TrackedChange](OldLocaleDescriptorId, Id, ChangeVersion)
    SELECT  d.LocaleDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.LocaleDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[LocaleDescriptor] ENABLE TRIGGER [edfi_LocaleDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_Location_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_Location_TR_DeleteTracking] ON [edfi].[Location] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_Location_TrackedChange](OldClassroomIdentificationCode, OldSchoolId, Id, Discriminator, ChangeVersion)
    SELECT  d.ClassroomIdentificationCode, d.SchoolId, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[Location] ENABLE TRIGGER [edfi_Location_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_MagnetSpecialProgramEmphasisSchoolDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_MagnetSpecialProgramEmphasisSchoolDescriptor_TR_DeleteTracking] ON [edfi].[MagnetSpecialProgramEmphasisSchoolDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_MagnetSpecialProgramEmphasisSchoolDescriptor_TrackedChange](OldMagnetSpecialProgramEmphasisSchoolDescriptorId, Id, ChangeVersion)
    SELECT  d.MagnetSpecialProgramEmphasisSchoolDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.MagnetSpecialProgramEmphasisSchoolDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[MagnetSpecialProgramEmphasisSchoolDescriptor] ENABLE TRIGGER [edfi_MagnetSpecialProgramEmphasisSchoolDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_MediumOfInstructionDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_MediumOfInstructionDescriptor_TR_DeleteTracking] ON [edfi].[MediumOfInstructionDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_MediumOfInstructionDescriptor_TrackedChange](OldMediumOfInstructionDescriptorId, Id, ChangeVersion)
    SELECT  d.MediumOfInstructionDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.MediumOfInstructionDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[MediumOfInstructionDescriptor] ENABLE TRIGGER [edfi_MediumOfInstructionDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_MethodCreditEarnedDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_MethodCreditEarnedDescriptor_TR_DeleteTracking] ON [edfi].[MethodCreditEarnedDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_MethodCreditEarnedDescriptor_TrackedChange](OldMethodCreditEarnedDescriptorId, Id, ChangeVersion)
    SELECT  d.MethodCreditEarnedDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.MethodCreditEarnedDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[MethodCreditEarnedDescriptor] ENABLE TRIGGER [edfi_MethodCreditEarnedDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_MigrantEducationProgramServiceDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_MigrantEducationProgramServiceDescriptor_TR_DeleteTracking] ON [edfi].[MigrantEducationProgramServiceDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_MigrantEducationProgramServiceDescriptor_TrackedChange](OldMigrantEducationProgramServiceDescriptorId, Id, ChangeVersion)
    SELECT  d.MigrantEducationProgramServiceDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.MigrantEducationProgramServiceDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[MigrantEducationProgramServiceDescriptor] ENABLE TRIGGER [edfi_MigrantEducationProgramServiceDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_MonitoredDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_MonitoredDescriptor_TR_DeleteTracking] ON [edfi].[MonitoredDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_MonitoredDescriptor_TrackedChange](OldMonitoredDescriptorId, Id, ChangeVersion)
    SELECT  d.MonitoredDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.MonitoredDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[MonitoredDescriptor] ENABLE TRIGGER [edfi_MonitoredDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_NeglectedOrDelinquentProgramDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_NeglectedOrDelinquentProgramDescriptor_TR_DeleteTracking] ON [edfi].[NeglectedOrDelinquentProgramDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_NeglectedOrDelinquentProgramDescriptor_TrackedChange](OldNeglectedOrDelinquentProgramDescriptorId, Id, ChangeVersion)
    SELECT  d.NeglectedOrDelinquentProgramDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.NeglectedOrDelinquentProgramDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[NeglectedOrDelinquentProgramDescriptor] ENABLE TRIGGER [edfi_NeglectedOrDelinquentProgramDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_NeglectedOrDelinquentProgramServiceDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_NeglectedOrDelinquentProgramServiceDescriptor_TR_DeleteTracking] ON [edfi].[NeglectedOrDelinquentProgramServiceDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_NeglectedOrDelinquentProgramServiceDescriptor_TrackedChange](OldNeglectedOrDelinquentProgramServiceDescriptorId, Id, ChangeVersion)
    SELECT  d.NeglectedOrDelinquentProgramServiceDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.NeglectedOrDelinquentProgramServiceDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[NeglectedOrDelinquentProgramServiceDescriptor] ENABLE TRIGGER [edfi_NeglectedOrDelinquentProgramServiceDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_NetworkPurposeDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_NetworkPurposeDescriptor_TR_DeleteTracking] ON [edfi].[NetworkPurposeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_NetworkPurposeDescriptor_TrackedChange](OldNetworkPurposeDescriptorId, Id, ChangeVersion)
    SELECT  d.NetworkPurposeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.NetworkPurposeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[NetworkPurposeDescriptor] ENABLE TRIGGER [edfi_NetworkPurposeDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_ObjectiveAssessment_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_ObjectiveAssessment_TR_DeleteTracking] ON [edfi].[ObjectiveAssessment] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_ObjectiveAssessment_TrackedChange](OldAssessmentIdentifier, OldIdentificationCode, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.AssessmentIdentifier, d.IdentificationCode, d.Namespace, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[ObjectiveAssessment] ENABLE TRIGGER [edfi_ObjectiveAssessment_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_OldEthnicityDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_OldEthnicityDescriptor_TR_DeleteTracking] ON [edfi].[OldEthnicityDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_OldEthnicityDescriptor_TrackedChange](OldOldEthnicityDescriptorId, Id, ChangeVersion)
    SELECT  d.OldEthnicityDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.OldEthnicityDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[OldEthnicityDescriptor] ENABLE TRIGGER [edfi_OldEthnicityDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_OpenStaffPosition_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_OpenStaffPosition_TR_DeleteTracking] ON [edfi].[OpenStaffPosition] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_OpenStaffPosition_TrackedChange](OldEducationOrganizationId, OldRequisitionNumber, Id, Discriminator, ChangeVersion)
    SELECT  d.EducationOrganizationId, d.RequisitionNumber, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[OpenStaffPosition] ENABLE TRIGGER [edfi_OpenStaffPosition_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_OperationalStatusDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_OperationalStatusDescriptor_TR_DeleteTracking] ON [edfi].[OperationalStatusDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_OperationalStatusDescriptor_TrackedChange](OldOperationalStatusDescriptorId, Id, ChangeVersion)
    SELECT  d.OperationalStatusDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.OperationalStatusDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[OperationalStatusDescriptor] ENABLE TRIGGER [edfi_OperationalStatusDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_OtherNameTypeDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_OtherNameTypeDescriptor_TR_DeleteTracking] ON [edfi].[OtherNameTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_OtherNameTypeDescriptor_TrackedChange](OldOtherNameTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.OtherNameTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.OtherNameTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[OtherNameTypeDescriptor] ENABLE TRIGGER [edfi_OtherNameTypeDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_Parent_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_Parent_TR_DeleteTracking] ON [edfi].[Parent] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_Parent_TrackedChange](OldParentUSI, OldParentUniqueId, Id, Discriminator, ChangeVersion)
    SELECT  d.ParentUSI, d.ParentUniqueId, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[Parent] ENABLE TRIGGER [edfi_Parent_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_ParticipationDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_ParticipationDescriptor_TR_DeleteTracking] ON [edfi].[ParticipationDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_ParticipationDescriptor_TrackedChange](OldParticipationDescriptorId, Id, ChangeVersion)
    SELECT  d.ParticipationDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ParticipationDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[ParticipationDescriptor] ENABLE TRIGGER [edfi_ParticipationDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_Payroll_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_Payroll_TR_DeleteTracking] ON [edfi].[Payroll] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_Payroll_TrackedChange](OldAccountIdentifier, OldAsOfDate, OldEducationOrganizationId, OldFiscalYear, OldStaffUSI, OldStaffUniqueId, Id, Discriminator, ChangeVersion)
    SELECT  d.AccountIdentifier, d.AsOfDate, d.EducationOrganizationId, d.FiscalYear, d.StaffUSI, j4.StaffUniqueId, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Staff j4
            ON d.StaffUSI = j4.StaffUSI 
END
GO

ALTER TABLE [edfi].[Payroll] ENABLE TRIGGER [edfi_Payroll_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_PerformanceBaseConversionDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_PerformanceBaseConversionDescriptor_TR_DeleteTracking] ON [edfi].[PerformanceBaseConversionDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_PerformanceBaseConversionDescriptor_TrackedChange](OldPerformanceBaseConversionDescriptorId, Id, ChangeVersion)
    SELECT  d.PerformanceBaseConversionDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.PerformanceBaseConversionDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[PerformanceBaseConversionDescriptor] ENABLE TRIGGER [edfi_PerformanceBaseConversionDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_PerformanceLevelDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_PerformanceLevelDescriptor_TR_DeleteTracking] ON [edfi].[PerformanceLevelDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_PerformanceLevelDescriptor_TrackedChange](OldPerformanceLevelDescriptorId, Id, ChangeVersion)
    SELECT  d.PerformanceLevelDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.PerformanceLevelDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[PerformanceLevelDescriptor] ENABLE TRIGGER [edfi_PerformanceLevelDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_PersonalInformationVerificationDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_PersonalInformationVerificationDescriptor_TR_DeleteTracking] ON [edfi].[PersonalInformationVerificationDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_PersonalInformationVerificationDescriptor_TrackedChange](OldPersonalInformationVerificationDescriptorId, Id, ChangeVersion)
    SELECT  d.PersonalInformationVerificationDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.PersonalInformationVerificationDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[PersonalInformationVerificationDescriptor] ENABLE TRIGGER [edfi_PersonalInformationVerificationDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_PopulationServedDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_PopulationServedDescriptor_TR_DeleteTracking] ON [edfi].[PopulationServedDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_PopulationServedDescriptor_TrackedChange](OldPopulationServedDescriptorId, Id, ChangeVersion)
    SELECT  d.PopulationServedDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.PopulationServedDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[PopulationServedDescriptor] ENABLE TRIGGER [edfi_PopulationServedDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_PostSecondaryEventCategoryDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_PostSecondaryEventCategoryDescriptor_TR_DeleteTracking] ON [edfi].[PostSecondaryEventCategoryDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_PostSecondaryEventCategoryDescriptor_TrackedChange](OldPostSecondaryEventCategoryDescriptorId, Id, ChangeVersion)
    SELECT  d.PostSecondaryEventCategoryDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.PostSecondaryEventCategoryDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[PostSecondaryEventCategoryDescriptor] ENABLE TRIGGER [edfi_PostSecondaryEventCategoryDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_PostSecondaryEvent_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_PostSecondaryEvent_TR_DeleteTracking] ON [edfi].[PostSecondaryEvent] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_PostSecondaryEvent_TrackedChange](OldEventDate, OldPostSecondaryEventCategoryDescriptorId, OldPostSecondaryEventCategoryDescriptorNamespace, OldPostSecondaryEventCategoryDescriptorCodeValue, OldStudentUSI, OldStudentUniqueId, Id, Discriminator, ChangeVersion)
    SELECT  d.EventDate, d.PostSecondaryEventCategoryDescriptorId, j1.Namespace, j1.CodeValue, d.StudentUSI, j2.StudentUniqueId, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Descriptor j1
            ON d.PostSecondaryEventCategoryDescriptorId = j1.DescriptorId 
        INNER JOIN edfi.Student j2
            ON d.StudentUSI = j2.StudentUSI 
END
GO

ALTER TABLE [edfi].[PostSecondaryEvent] ENABLE TRIGGER [edfi_PostSecondaryEvent_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_PostSecondaryInstitutionLevelDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_PostSecondaryInstitutionLevelDescriptor_TR_DeleteTracking] ON [edfi].[PostSecondaryInstitutionLevelDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_PostSecondaryInstitutionLevelDescriptor_TrackedChange](OldPostSecondaryInstitutionLevelDescriptorId, Id, ChangeVersion)
    SELECT  d.PostSecondaryInstitutionLevelDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.PostSecondaryInstitutionLevelDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[PostSecondaryInstitutionLevelDescriptor] ENABLE TRIGGER [edfi_PostSecondaryInstitutionLevelDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_PostSecondaryInstitution_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_PostSecondaryInstitution_TR_DeleteTracking] ON [edfi].[PostSecondaryInstitution] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_PostSecondaryInstitution_TrackedChange](OldPostSecondaryInstitutionId, Id, ChangeVersion)
    SELECT  d.PostSecondaryInstitutionId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.EducationOrganization b ON d.PostSecondaryInstitutionId = b.EducationOrganizationId
END
GO

ALTER TABLE [edfi].[PostSecondaryInstitution] ENABLE TRIGGER [edfi_PostSecondaryInstitution_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_PostingResultDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_PostingResultDescriptor_TR_DeleteTracking] ON [edfi].[PostingResultDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_PostingResultDescriptor_TrackedChange](OldPostingResultDescriptorId, Id, ChangeVersion)
    SELECT  d.PostingResultDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.PostingResultDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[PostingResultDescriptor] ENABLE TRIGGER [edfi_PostingResultDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_ProficiencyDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_ProficiencyDescriptor_TR_DeleteTracking] ON [edfi].[ProficiencyDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_ProficiencyDescriptor_TrackedChange](OldProficiencyDescriptorId, Id, ChangeVersion)
    SELECT  d.ProficiencyDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ProficiencyDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[ProficiencyDescriptor] ENABLE TRIGGER [edfi_ProficiencyDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_ProgramAssignmentDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_ProgramAssignmentDescriptor_TR_DeleteTracking] ON [edfi].[ProgramAssignmentDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_ProgramAssignmentDescriptor_TrackedChange](OldProgramAssignmentDescriptorId, Id, ChangeVersion)
    SELECT  d.ProgramAssignmentDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ProgramAssignmentDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[ProgramAssignmentDescriptor] ENABLE TRIGGER [edfi_ProgramAssignmentDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_ProgramCharacteristicDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_ProgramCharacteristicDescriptor_TR_DeleteTracking] ON [edfi].[ProgramCharacteristicDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_ProgramCharacteristicDescriptor_TrackedChange](OldProgramCharacteristicDescriptorId, Id, ChangeVersion)
    SELECT  d.ProgramCharacteristicDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ProgramCharacteristicDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[ProgramCharacteristicDescriptor] ENABLE TRIGGER [edfi_ProgramCharacteristicDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_ProgramSponsorDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_ProgramSponsorDescriptor_TR_DeleteTracking] ON [edfi].[ProgramSponsorDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_ProgramSponsorDescriptor_TrackedChange](OldProgramSponsorDescriptorId, Id, ChangeVersion)
    SELECT  d.ProgramSponsorDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ProgramSponsorDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[ProgramSponsorDescriptor] ENABLE TRIGGER [edfi_ProgramSponsorDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_ProgramTypeDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_ProgramTypeDescriptor_TR_DeleteTracking] ON [edfi].[ProgramTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_ProgramTypeDescriptor_TrackedChange](OldProgramTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.ProgramTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ProgramTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[ProgramTypeDescriptor] ENABLE TRIGGER [edfi_ProgramTypeDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_Program_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_Program_TR_DeleteTracking] ON [edfi].[Program] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_Program_TrackedChange](OldEducationOrganizationId, OldProgramName, OldProgramTypeDescriptorId, OldProgramTypeDescriptorNamespace, OldProgramTypeDescriptorCodeValue, Id, Discriminator, ChangeVersion)
    SELECT  d.EducationOrganizationId, d.ProgramName, d.ProgramTypeDescriptorId, j2.Namespace, j2.CodeValue, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Descriptor j2
            ON d.ProgramTypeDescriptorId = j2.DescriptorId 
END
GO

ALTER TABLE [edfi].[Program] ENABLE TRIGGER [edfi_Program_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_ProgressDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_ProgressDescriptor_TR_DeleteTracking] ON [edfi].[ProgressDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_ProgressDescriptor_TrackedChange](OldProgressDescriptorId, Id, ChangeVersion)
    SELECT  d.ProgressDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ProgressDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[ProgressDescriptor] ENABLE TRIGGER [edfi_ProgressDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_ProgressLevelDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_ProgressLevelDescriptor_TR_DeleteTracking] ON [edfi].[ProgressLevelDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_ProgressLevelDescriptor_TrackedChange](OldProgressLevelDescriptorId, Id, ChangeVersion)
    SELECT  d.ProgressLevelDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ProgressLevelDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[ProgressLevelDescriptor] ENABLE TRIGGER [edfi_ProgressLevelDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_ProviderCategoryDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_ProviderCategoryDescriptor_TR_DeleteTracking] ON [edfi].[ProviderCategoryDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_ProviderCategoryDescriptor_TrackedChange](OldProviderCategoryDescriptorId, Id, ChangeVersion)
    SELECT  d.ProviderCategoryDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ProviderCategoryDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[ProviderCategoryDescriptor] ENABLE TRIGGER [edfi_ProviderCategoryDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_ProviderProfitabilityDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_ProviderProfitabilityDescriptor_TR_DeleteTracking] ON [edfi].[ProviderProfitabilityDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_ProviderProfitabilityDescriptor_TrackedChange](OldProviderProfitabilityDescriptorId, Id, ChangeVersion)
    SELECT  d.ProviderProfitabilityDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ProviderProfitabilityDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[ProviderProfitabilityDescriptor] ENABLE TRIGGER [edfi_ProviderProfitabilityDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_ProviderStatusDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_ProviderStatusDescriptor_TR_DeleteTracking] ON [edfi].[ProviderStatusDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_ProviderStatusDescriptor_TrackedChange](OldProviderStatusDescriptorId, Id, ChangeVersion)
    SELECT  d.ProviderStatusDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ProviderStatusDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[ProviderStatusDescriptor] ENABLE TRIGGER [edfi_ProviderStatusDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_PublicationStatusDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_PublicationStatusDescriptor_TR_DeleteTracking] ON [edfi].[PublicationStatusDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_PublicationStatusDescriptor_TrackedChange](OldPublicationStatusDescriptorId, Id, ChangeVersion)
    SELECT  d.PublicationStatusDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.PublicationStatusDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[PublicationStatusDescriptor] ENABLE TRIGGER [edfi_PublicationStatusDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_RaceDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_RaceDescriptor_TR_DeleteTracking] ON [edfi].[RaceDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_RaceDescriptor_TrackedChange](OldRaceDescriptorId, Id, ChangeVersion)
    SELECT  d.RaceDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.RaceDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[RaceDescriptor] ENABLE TRIGGER [edfi_RaceDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_ReasonExitedDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_ReasonExitedDescriptor_TR_DeleteTracking] ON [edfi].[ReasonExitedDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_ReasonExitedDescriptor_TrackedChange](OldReasonExitedDescriptorId, Id, ChangeVersion)
    SELECT  d.ReasonExitedDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ReasonExitedDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[ReasonExitedDescriptor] ENABLE TRIGGER [edfi_ReasonExitedDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_ReasonNotTestedDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_ReasonNotTestedDescriptor_TR_DeleteTracking] ON [edfi].[ReasonNotTestedDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_ReasonNotTestedDescriptor_TrackedChange](OldReasonNotTestedDescriptorId, Id, ChangeVersion)
    SELECT  d.ReasonNotTestedDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ReasonNotTestedDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[ReasonNotTestedDescriptor] ENABLE TRIGGER [edfi_ReasonNotTestedDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_RecognitionTypeDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_RecognitionTypeDescriptor_TR_DeleteTracking] ON [edfi].[RecognitionTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_RecognitionTypeDescriptor_TrackedChange](OldRecognitionTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.RecognitionTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.RecognitionTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[RecognitionTypeDescriptor] ENABLE TRIGGER [edfi_RecognitionTypeDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_RelationDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_RelationDescriptor_TR_DeleteTracking] ON [edfi].[RelationDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_RelationDescriptor_TrackedChange](OldRelationDescriptorId, Id, ChangeVersion)
    SELECT  d.RelationDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.RelationDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[RelationDescriptor] ENABLE TRIGGER [edfi_RelationDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_RepeatIdentifierDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_RepeatIdentifierDescriptor_TR_DeleteTracking] ON [edfi].[RepeatIdentifierDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_RepeatIdentifierDescriptor_TrackedChange](OldRepeatIdentifierDescriptorId, Id, ChangeVersion)
    SELECT  d.RepeatIdentifierDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.RepeatIdentifierDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[RepeatIdentifierDescriptor] ENABLE TRIGGER [edfi_RepeatIdentifierDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_ReportCard_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_ReportCard_TR_DeleteTracking] ON [edfi].[ReportCard] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_ReportCard_TrackedChange](OldEducationOrganizationId, OldGradingPeriodDescriptorId, OldGradingPeriodDescriptorNamespace, OldGradingPeriodDescriptorCodeValue, OldGradingPeriodSchoolId, OldGradingPeriodSchoolYear, OldGradingPeriodSequence, OldStudentUSI, OldStudentUniqueId, Id, Discriminator, ChangeVersion)
    SELECT  d.EducationOrganizationId, d.GradingPeriodDescriptorId, j1.Namespace, j1.CodeValue, d.GradingPeriodSchoolId, d.GradingPeriodSchoolYear, d.GradingPeriodSequence, d.StudentUSI, j5.StudentUniqueId, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Descriptor j1
            ON d.GradingPeriodDescriptorId = j1.DescriptorId 
        INNER JOIN edfi.Student j5
            ON d.StudentUSI = j5.StudentUSI 
END
GO

ALTER TABLE [edfi].[ReportCard] ENABLE TRIGGER [edfi_ReportCard_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_ReporterDescriptionDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_ReporterDescriptionDescriptor_TR_DeleteTracking] ON [edfi].[ReporterDescriptionDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_ReporterDescriptionDescriptor_TrackedChange](OldReporterDescriptionDescriptorId, Id, ChangeVersion)
    SELECT  d.ReporterDescriptionDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ReporterDescriptionDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[ReporterDescriptionDescriptor] ENABLE TRIGGER [edfi_ReporterDescriptionDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_ResidencyStatusDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_ResidencyStatusDescriptor_TR_DeleteTracking] ON [edfi].[ResidencyStatusDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_ResidencyStatusDescriptor_TrackedChange](OldResidencyStatusDescriptorId, Id, ChangeVersion)
    SELECT  d.ResidencyStatusDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ResidencyStatusDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[ResidencyStatusDescriptor] ENABLE TRIGGER [edfi_ResidencyStatusDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_ResponseIndicatorDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_ResponseIndicatorDescriptor_TR_DeleteTracking] ON [edfi].[ResponseIndicatorDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_ResponseIndicatorDescriptor_TrackedChange](OldResponseIndicatorDescriptorId, Id, ChangeVersion)
    SELECT  d.ResponseIndicatorDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ResponseIndicatorDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[ResponseIndicatorDescriptor] ENABLE TRIGGER [edfi_ResponseIndicatorDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_ResponsibilityDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_ResponsibilityDescriptor_TR_DeleteTracking] ON [edfi].[ResponsibilityDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_ResponsibilityDescriptor_TrackedChange](OldResponsibilityDescriptorId, Id, ChangeVersion)
    SELECT  d.ResponsibilityDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ResponsibilityDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[ResponsibilityDescriptor] ENABLE TRIGGER [edfi_ResponsibilityDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_RestraintEventReasonDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_RestraintEventReasonDescriptor_TR_DeleteTracking] ON [edfi].[RestraintEventReasonDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_RestraintEventReasonDescriptor_TrackedChange](OldRestraintEventReasonDescriptorId, Id, ChangeVersion)
    SELECT  d.RestraintEventReasonDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.RestraintEventReasonDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[RestraintEventReasonDescriptor] ENABLE TRIGGER [edfi_RestraintEventReasonDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_RestraintEvent_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_RestraintEvent_TR_DeleteTracking] ON [edfi].[RestraintEvent] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_RestraintEvent_TrackedChange](OldRestraintEventIdentifier, OldSchoolId, OldStudentUSI, OldStudentUniqueId, Id, Discriminator, ChangeVersion)
    SELECT  d.RestraintEventIdentifier, d.SchoolId, d.StudentUSI, j2.StudentUniqueId, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Student j2
            ON d.StudentUSI = j2.StudentUSI 
END
GO

ALTER TABLE [edfi].[RestraintEvent] ENABLE TRIGGER [edfi_RestraintEvent_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_ResultDatatypeTypeDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_ResultDatatypeTypeDescriptor_TR_DeleteTracking] ON [edfi].[ResultDatatypeTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_ResultDatatypeTypeDescriptor_TrackedChange](OldResultDatatypeTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.ResultDatatypeTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ResultDatatypeTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[ResultDatatypeTypeDescriptor] ENABLE TRIGGER [edfi_ResultDatatypeTypeDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_RetestIndicatorDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_RetestIndicatorDescriptor_TR_DeleteTracking] ON [edfi].[RetestIndicatorDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_RetestIndicatorDescriptor_TrackedChange](OldRetestIndicatorDescriptorId, Id, ChangeVersion)
    SELECT  d.RetestIndicatorDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.RetestIndicatorDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[RetestIndicatorDescriptor] ENABLE TRIGGER [edfi_RetestIndicatorDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_SchoolCategoryDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_SchoolCategoryDescriptor_TR_DeleteTracking] ON [edfi].[SchoolCategoryDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_SchoolCategoryDescriptor_TrackedChange](OldSchoolCategoryDescriptorId, Id, ChangeVersion)
    SELECT  d.SchoolCategoryDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.SchoolCategoryDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[SchoolCategoryDescriptor] ENABLE TRIGGER [edfi_SchoolCategoryDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_SchoolChoiceImplementStatusDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_SchoolChoiceImplementStatusDescriptor_TR_DeleteTracking] ON [edfi].[SchoolChoiceImplementStatusDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_SchoolChoiceImplementStatusDescriptor_TrackedChange](OldSchoolChoiceImplementStatusDescriptorId, Id, ChangeVersion)
    SELECT  d.SchoolChoiceImplementStatusDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.SchoolChoiceImplementStatusDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[SchoolChoiceImplementStatusDescriptor] ENABLE TRIGGER [edfi_SchoolChoiceImplementStatusDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_SchoolFoodServiceProgramServiceDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_SchoolFoodServiceProgramServiceDescriptor_TR_DeleteTracking] ON [edfi].[SchoolFoodServiceProgramServiceDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_SchoolFoodServiceProgramServiceDescriptor_TrackedChange](OldSchoolFoodServiceProgramServiceDescriptorId, Id, ChangeVersion)
    SELECT  d.SchoolFoodServiceProgramServiceDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.SchoolFoodServiceProgramServiceDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[SchoolFoodServiceProgramServiceDescriptor] ENABLE TRIGGER [edfi_SchoolFoodServiceProgramServiceDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_SchoolTypeDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_SchoolTypeDescriptor_TR_DeleteTracking] ON [edfi].[SchoolTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_SchoolTypeDescriptor_TrackedChange](OldSchoolTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.SchoolTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.SchoolTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[SchoolTypeDescriptor] ENABLE TRIGGER [edfi_SchoolTypeDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_School_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_School_TR_DeleteTracking] ON [edfi].[School] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_School_TrackedChange](OldSchoolId, Id, ChangeVersion)
    SELECT  d.SchoolId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.EducationOrganization b ON d.SchoolId = b.EducationOrganizationId
END
GO

ALTER TABLE [edfi].[School] ENABLE TRIGGER [edfi_School_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_SectionAttendanceTakenEvent_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_SectionAttendanceTakenEvent_TR_DeleteTracking] ON [edfi].[SectionAttendanceTakenEvent] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_SectionAttendanceTakenEvent_TrackedChange](OldCalendarCode, OldDate, OldLocalCourseCode, OldSchoolId, OldSchoolYear, OldSectionIdentifier, OldSessionName, Id, Discriminator, ChangeVersion)
    SELECT  d.CalendarCode, d.Date, d.LocalCourseCode, d.SchoolId, d.SchoolYear, d.SectionIdentifier, d.SessionName, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[SectionAttendanceTakenEvent] ENABLE TRIGGER [edfi_SectionAttendanceTakenEvent_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_SectionCharacteristicDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_SectionCharacteristicDescriptor_TR_DeleteTracking] ON [edfi].[SectionCharacteristicDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_SectionCharacteristicDescriptor_TrackedChange](OldSectionCharacteristicDescriptorId, Id, ChangeVersion)
    SELECT  d.SectionCharacteristicDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.SectionCharacteristicDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[SectionCharacteristicDescriptor] ENABLE TRIGGER [edfi_SectionCharacteristicDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_Section_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_Section_TR_DeleteTracking] ON [edfi].[Section] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_Section_TrackedChange](OldLocalCourseCode, OldSchoolId, OldSchoolYear, OldSectionIdentifier, OldSessionName, Id, Discriminator, ChangeVersion)
    SELECT  d.LocalCourseCode, d.SchoolId, d.SchoolYear, d.SectionIdentifier, d.SessionName, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[Section] ENABLE TRIGGER [edfi_Section_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_SeparationDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_SeparationDescriptor_TR_DeleteTracking] ON [edfi].[SeparationDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_SeparationDescriptor_TrackedChange](OldSeparationDescriptorId, Id, ChangeVersion)
    SELECT  d.SeparationDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.SeparationDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[SeparationDescriptor] ENABLE TRIGGER [edfi_SeparationDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_SeparationReasonDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_SeparationReasonDescriptor_TR_DeleteTracking] ON [edfi].[SeparationReasonDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_SeparationReasonDescriptor_TrackedChange](OldSeparationReasonDescriptorId, Id, ChangeVersion)
    SELECT  d.SeparationReasonDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.SeparationReasonDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[SeparationReasonDescriptor] ENABLE TRIGGER [edfi_SeparationReasonDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_ServiceDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_ServiceDescriptor_TR_DeleteTracking] ON [edfi].[ServiceDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_ServiceDescriptor_TrackedChange](OldServiceDescriptorId, Id, ChangeVersion)
    SELECT  d.ServiceDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ServiceDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[ServiceDescriptor] ENABLE TRIGGER [edfi_ServiceDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_Session_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_Session_TR_DeleteTracking] ON [edfi].[Session] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_Session_TrackedChange](OldSchoolId, OldSchoolYear, OldSessionName, Id, Discriminator, ChangeVersion)
    SELECT  d.SchoolId, d.SchoolYear, d.SessionName, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[Session] ENABLE TRIGGER [edfi_Session_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_SexDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_SexDescriptor_TR_DeleteTracking] ON [edfi].[SexDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_SexDescriptor_TrackedChange](OldSexDescriptorId, Id, ChangeVersion)
    SELECT  d.SexDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.SexDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[SexDescriptor] ENABLE TRIGGER [edfi_SexDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_SpecialEducationProgramServiceDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_SpecialEducationProgramServiceDescriptor_TR_DeleteTracking] ON [edfi].[SpecialEducationProgramServiceDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_SpecialEducationProgramServiceDescriptor_TrackedChange](OldSpecialEducationProgramServiceDescriptorId, Id, ChangeVersion)
    SELECT  d.SpecialEducationProgramServiceDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.SpecialEducationProgramServiceDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[SpecialEducationProgramServiceDescriptor] ENABLE TRIGGER [edfi_SpecialEducationProgramServiceDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_SpecialEducationSettingDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_SpecialEducationSettingDescriptor_TR_DeleteTracking] ON [edfi].[SpecialEducationSettingDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_SpecialEducationSettingDescriptor_TrackedChange](OldSpecialEducationSettingDescriptorId, Id, ChangeVersion)
    SELECT  d.SpecialEducationSettingDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.SpecialEducationSettingDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[SpecialEducationSettingDescriptor] ENABLE TRIGGER [edfi_SpecialEducationSettingDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_StaffAbsenceEvent_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_StaffAbsenceEvent_TR_DeleteTracking] ON [edfi].[StaffAbsenceEvent] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StaffAbsenceEvent_TrackedChange](OldAbsenceEventCategoryDescriptorId, OldAbsenceEventCategoryDescriptorNamespace, OldAbsenceEventCategoryDescriptorCodeValue, OldEventDate, OldStaffUSI, OldStaffUniqueId, Id, Discriminator, ChangeVersion)
    SELECT  d.AbsenceEventCategoryDescriptorId, j0.Namespace, j0.CodeValue, d.EventDate, d.StaffUSI, j2.StaffUniqueId, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Descriptor j0
            ON d.AbsenceEventCategoryDescriptorId = j0.DescriptorId 
        INNER JOIN edfi.Staff j2
            ON d.StaffUSI = j2.StaffUSI 
END
GO

ALTER TABLE [edfi].[StaffAbsenceEvent] ENABLE TRIGGER [edfi_StaffAbsenceEvent_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_StaffClassificationDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_StaffClassificationDescriptor_TR_DeleteTracking] ON [edfi].[StaffClassificationDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StaffClassificationDescriptor_TrackedChange](OldStaffClassificationDescriptorId, Id, ChangeVersion)
    SELECT  d.StaffClassificationDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.StaffClassificationDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[StaffClassificationDescriptor] ENABLE TRIGGER [edfi_StaffClassificationDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_StaffCohortAssociation_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_StaffCohortAssociation_TR_DeleteTracking] ON [edfi].[StaffCohortAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StaffCohortAssociation_TrackedChange](OldBeginDate, OldCohortIdentifier, OldEducationOrganizationId, OldStaffUSI, OldStaffUniqueId, Id, Discriminator, ChangeVersion)
    SELECT  d.BeginDate, d.CohortIdentifier, d.EducationOrganizationId, d.StaffUSI, j3.StaffUniqueId, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Staff j3
            ON d.StaffUSI = j3.StaffUSI 
END
GO

ALTER TABLE [edfi].[StaffCohortAssociation] ENABLE TRIGGER [edfi_StaffCohortAssociation_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_StaffEducationOrganizationAssignmentAssociation_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_StaffEducationOrganizationAssignmentAssociation_TR_DeleteTracking] ON [edfi].[StaffEducationOrganizationAssignmentAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StaffEducationOrganizationAssignmentAssociation_TrackedChange](OldBeginDate, OldEducationOrganizationId, OldStaffClassificationDescriptorId, OldStaffClassificationDescriptorNamespace, OldStaffClassificationDescriptorCodeValue, OldStaffUSI, OldStaffUniqueId, Id, Discriminator, ChangeVersion)
    SELECT  d.BeginDate, d.EducationOrganizationId, d.StaffClassificationDescriptorId, j2.Namespace, j2.CodeValue, d.StaffUSI, j3.StaffUniqueId, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Descriptor j2
            ON d.StaffClassificationDescriptorId = j2.DescriptorId 
        INNER JOIN edfi.Staff j3
            ON d.StaffUSI = j3.StaffUSI 
END
GO

ALTER TABLE [edfi].[StaffEducationOrganizationAssignmentAssociation] ENABLE TRIGGER [edfi_StaffEducationOrganizationAssignmentAssociation_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_StaffEducationOrganizationContactAssociation_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_StaffEducationOrganizationContactAssociation_TR_DeleteTracking] ON [edfi].[StaffEducationOrganizationContactAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StaffEducationOrganizationContactAssociation_TrackedChange](OldContactTitle, OldEducationOrganizationId, OldStaffUSI, OldStaffUniqueId, Id, Discriminator, ChangeVersion)
    SELECT  d.ContactTitle, d.EducationOrganizationId, d.StaffUSI, j2.StaffUniqueId, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Staff j2
            ON d.StaffUSI = j2.StaffUSI 
END
GO

ALTER TABLE [edfi].[StaffEducationOrganizationContactAssociation] ENABLE TRIGGER [edfi_StaffEducationOrganizationContactAssociation_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_StaffEducationOrganizationEmploymentAssociation_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_StaffEducationOrganizationEmploymentAssociation_TR_DeleteTracking] ON [edfi].[StaffEducationOrganizationEmploymentAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StaffEducationOrganizationEmploymentAssociation_TrackedChange](OldEducationOrganizationId, OldEmploymentStatusDescriptorId, OldEmploymentStatusDescriptorNamespace, OldEmploymentStatusDescriptorCodeValue, OldHireDate, OldStaffUSI, OldStaffUniqueId, Id, Discriminator, ChangeVersion)
    SELECT  d.EducationOrganizationId, d.EmploymentStatusDescriptorId, j1.Namespace, j1.CodeValue, d.HireDate, d.StaffUSI, j3.StaffUniqueId, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Descriptor j1
            ON d.EmploymentStatusDescriptorId = j1.DescriptorId 
        INNER JOIN edfi.Staff j3
            ON d.StaffUSI = j3.StaffUSI 
END
GO

ALTER TABLE [edfi].[StaffEducationOrganizationEmploymentAssociation] ENABLE TRIGGER [edfi_StaffEducationOrganizationEmploymentAssociation_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_StaffIdentificationSystemDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_StaffIdentificationSystemDescriptor_TR_DeleteTracking] ON [edfi].[StaffIdentificationSystemDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StaffIdentificationSystemDescriptor_TrackedChange](OldStaffIdentificationSystemDescriptorId, Id, ChangeVersion)
    SELECT  d.StaffIdentificationSystemDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.StaffIdentificationSystemDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[StaffIdentificationSystemDescriptor] ENABLE TRIGGER [edfi_StaffIdentificationSystemDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_StaffLeaveEventCategoryDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_StaffLeaveEventCategoryDescriptor_TR_DeleteTracking] ON [edfi].[StaffLeaveEventCategoryDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StaffLeaveEventCategoryDescriptor_TrackedChange](OldStaffLeaveEventCategoryDescriptorId, Id, ChangeVersion)
    SELECT  d.StaffLeaveEventCategoryDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.StaffLeaveEventCategoryDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[StaffLeaveEventCategoryDescriptor] ENABLE TRIGGER [edfi_StaffLeaveEventCategoryDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_StaffLeave_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_StaffLeave_TR_DeleteTracking] ON [edfi].[StaffLeave] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StaffLeave_TrackedChange](OldBeginDate, OldStaffLeaveEventCategoryDescriptorId, OldStaffLeaveEventCategoryDescriptorNamespace, OldStaffLeaveEventCategoryDescriptorCodeValue, OldStaffUSI, OldStaffUniqueId, Id, Discriminator, ChangeVersion)
    SELECT  d.BeginDate, d.StaffLeaveEventCategoryDescriptorId, j1.Namespace, j1.CodeValue, d.StaffUSI, j2.StaffUniqueId, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Descriptor j1
            ON d.StaffLeaveEventCategoryDescriptorId = j1.DescriptorId 
        INNER JOIN edfi.Staff j2
            ON d.StaffUSI = j2.StaffUSI 
END
GO

ALTER TABLE [edfi].[StaffLeave] ENABLE TRIGGER [edfi_StaffLeave_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_StaffProgramAssociation_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_StaffProgramAssociation_TR_DeleteTracking] ON [edfi].[StaffProgramAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StaffProgramAssociation_TrackedChange](OldBeginDate, OldProgramEducationOrganizationId, OldProgramName, OldProgramTypeDescriptorId, OldProgramTypeDescriptorNamespace, OldProgramTypeDescriptorCodeValue, OldStaffUSI, OldStaffUniqueId, Id, Discriminator, ChangeVersion)
    SELECT  d.BeginDate, d.ProgramEducationOrganizationId, d.ProgramName, d.ProgramTypeDescriptorId, j3.Namespace, j3.CodeValue, d.StaffUSI, j4.StaffUniqueId, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Descriptor j3
            ON d.ProgramTypeDescriptorId = j3.DescriptorId 
        INNER JOIN edfi.Staff j4
            ON d.StaffUSI = j4.StaffUSI 
END
GO

ALTER TABLE [edfi].[StaffProgramAssociation] ENABLE TRIGGER [edfi_StaffProgramAssociation_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_StaffSchoolAssociation_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_StaffSchoolAssociation_TR_DeleteTracking] ON [edfi].[StaffSchoolAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StaffSchoolAssociation_TrackedChange](OldProgramAssignmentDescriptorId, OldProgramAssignmentDescriptorNamespace, OldProgramAssignmentDescriptorCodeValue, OldSchoolId, OldStaffUSI, OldStaffUniqueId, Id, Discriminator, ChangeVersion)
    SELECT  d.ProgramAssignmentDescriptorId, j0.Namespace, j0.CodeValue, d.SchoolId, d.StaffUSI, j2.StaffUniqueId, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Descriptor j0
            ON d.ProgramAssignmentDescriptorId = j0.DescriptorId 
        INNER JOIN edfi.Staff j2
            ON d.StaffUSI = j2.StaffUSI 
END
GO

ALTER TABLE [edfi].[StaffSchoolAssociation] ENABLE TRIGGER [edfi_StaffSchoolAssociation_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_StaffSectionAssociation_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_StaffSectionAssociation_TR_DeleteTracking] ON [edfi].[StaffSectionAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StaffSectionAssociation_TrackedChange](OldLocalCourseCode, OldSchoolId, OldSchoolYear, OldSectionIdentifier, OldSessionName, OldStaffUSI, OldStaffUniqueId, Id, Discriminator, ChangeVersion)
    SELECT  d.LocalCourseCode, d.SchoolId, d.SchoolYear, d.SectionIdentifier, d.SessionName, d.StaffUSI, j5.StaffUniqueId, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Staff j5
            ON d.StaffUSI = j5.StaffUSI 
END
GO

ALTER TABLE [edfi].[StaffSectionAssociation] ENABLE TRIGGER [edfi_StaffSectionAssociation_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_Staff_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_Staff_TR_DeleteTracking] ON [edfi].[Staff] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_Staff_TrackedChange](OldStaffUSI, OldStaffUniqueId, Id, Discriminator, ChangeVersion)
    SELECT  d.StaffUSI, d.StaffUniqueId, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[Staff] ENABLE TRIGGER [edfi_Staff_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_StateAbbreviationDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_StateAbbreviationDescriptor_TR_DeleteTracking] ON [edfi].[StateAbbreviationDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StateAbbreviationDescriptor_TrackedChange](OldStateAbbreviationDescriptorId, Id, ChangeVersion)
    SELECT  d.StateAbbreviationDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.StateAbbreviationDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[StateAbbreviationDescriptor] ENABLE TRIGGER [edfi_StateAbbreviationDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_StateEducationAgency_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_StateEducationAgency_TR_DeleteTracking] ON [edfi].[StateEducationAgency] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StateEducationAgency_TrackedChange](OldStateEducationAgencyId, Id, ChangeVersion)
    SELECT  d.StateEducationAgencyId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.EducationOrganization b ON d.StateEducationAgencyId = b.EducationOrganizationId
END
GO

ALTER TABLE [edfi].[StateEducationAgency] ENABLE TRIGGER [edfi_StateEducationAgency_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_StudentAcademicRecord_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_StudentAcademicRecord_TR_DeleteTracking] ON [edfi].[StudentAcademicRecord] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StudentAcademicRecord_TrackedChange](OldEducationOrganizationId, OldSchoolYear, OldStudentUSI, OldStudentUniqueId, OldTermDescriptorId, OldTermDescriptorNamespace, OldTermDescriptorCodeValue, Id, Discriminator, ChangeVersion)
    SELECT  d.EducationOrganizationId, d.SchoolYear, d.StudentUSI, j2.StudentUniqueId, d.TermDescriptorId, j3.Namespace, j3.CodeValue, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Student j2
            ON d.StudentUSI = j2.StudentUSI 
        INNER JOIN edfi.Descriptor j3
            ON d.TermDescriptorId = j3.DescriptorId 
END
GO

ALTER TABLE [edfi].[StudentAcademicRecord] ENABLE TRIGGER [edfi_StudentAcademicRecord_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_StudentAssessment_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_StudentAssessment_TR_DeleteTracking] ON [edfi].[StudentAssessment] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StudentAssessment_TrackedChange](OldAssessmentIdentifier, OldNamespace, OldStudentAssessmentIdentifier, OldStudentUSI, OldStudentUniqueId, Id, Discriminator, ChangeVersion)
    SELECT  d.AssessmentIdentifier, d.Namespace, d.StudentAssessmentIdentifier, d.StudentUSI, j3.StudentUniqueId, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Student j3
            ON d.StudentUSI = j3.StudentUSI 
END
GO

ALTER TABLE [edfi].[StudentAssessment] ENABLE TRIGGER [edfi_StudentAssessment_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_StudentCTEProgramAssociation_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_StudentCTEProgramAssociation_TR_DeleteTracking] ON [edfi].[StudentCTEProgramAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StudentCTEProgramAssociation_TrackedChange](OldBeginDate, OldEducationOrganizationId, OldProgramEducationOrganizationId, OldProgramName, OldProgramTypeDescriptorId, OldStudentUSI, Id, ChangeVersion)
    SELECT  d.BeginDate, d.EducationOrganizationId, d.ProgramEducationOrganizationId, d.ProgramName, d.ProgramTypeDescriptorId, d.StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.GeneralStudentProgramAssociation b ON d.BeginDate = b.BeginDate AND d.EducationOrganizationId = b.EducationOrganizationId AND d.ProgramEducationOrganizationId = b.ProgramEducationOrganizationId AND d.ProgramName = b.ProgramName AND d.ProgramTypeDescriptorId = b.ProgramTypeDescriptorId AND d.StudentUSI = b.StudentUSI
END
GO

ALTER TABLE [edfi].[StudentCTEProgramAssociation] ENABLE TRIGGER [edfi_StudentCTEProgramAssociation_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_StudentCharacteristicDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_StudentCharacteristicDescriptor_TR_DeleteTracking] ON [edfi].[StudentCharacteristicDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StudentCharacteristicDescriptor_TrackedChange](OldStudentCharacteristicDescriptorId, Id, ChangeVersion)
    SELECT  d.StudentCharacteristicDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.StudentCharacteristicDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[StudentCharacteristicDescriptor] ENABLE TRIGGER [edfi_StudentCharacteristicDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_StudentCohortAssociation_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_StudentCohortAssociation_TR_DeleteTracking] ON [edfi].[StudentCohortAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StudentCohortAssociation_TrackedChange](OldBeginDate, OldCohortIdentifier, OldEducationOrganizationId, OldStudentUSI, OldStudentUniqueId, Id, Discriminator, ChangeVersion)
    SELECT  d.BeginDate, d.CohortIdentifier, d.EducationOrganizationId, d.StudentUSI, j3.StudentUniqueId, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Student j3
            ON d.StudentUSI = j3.StudentUSI 
END
GO

ALTER TABLE [edfi].[StudentCohortAssociation] ENABLE TRIGGER [edfi_StudentCohortAssociation_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_StudentCompetencyObjective_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_StudentCompetencyObjective_TR_DeleteTracking] ON [edfi].[StudentCompetencyObjective] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StudentCompetencyObjective_TrackedChange](OldGradingPeriodDescriptorId, OldGradingPeriodDescriptorNamespace, OldGradingPeriodDescriptorCodeValue, OldGradingPeriodSchoolId, OldGradingPeriodSchoolYear, OldGradingPeriodSequence, OldObjective, OldObjectiveEducationOrganizationId, OldObjectiveGradeLevelDescriptorId, OldObjectiveGradeLevelDescriptorNamespace, OldObjectiveGradeLevelDescriptorCodeValue, OldStudentUSI, OldStudentUniqueId, Id, Discriminator, ChangeVersion)
    SELECT  d.GradingPeriodDescriptorId, j0.Namespace, j0.CodeValue, d.GradingPeriodSchoolId, d.GradingPeriodSchoolYear, d.GradingPeriodSequence, d.Objective, d.ObjectiveEducationOrganizationId, d.ObjectiveGradeLevelDescriptorId, j6.Namespace, j6.CodeValue, d.StudentUSI, j7.StudentUniqueId, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Descriptor j0
            ON d.GradingPeriodDescriptorId = j0.DescriptorId 
        INNER JOIN edfi.Descriptor j6
            ON d.ObjectiveGradeLevelDescriptorId = j6.DescriptorId 
        INNER JOIN edfi.Student j7
            ON d.StudentUSI = j7.StudentUSI 
END
GO

ALTER TABLE [edfi].[StudentCompetencyObjective] ENABLE TRIGGER [edfi_StudentCompetencyObjective_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_StudentDisciplineIncidentAssociation_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_StudentDisciplineIncidentAssociation_TR_DeleteTracking] ON [edfi].[StudentDisciplineIncidentAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StudentDisciplineIncidentAssociation_TrackedChange](OldIncidentIdentifier, OldSchoolId, OldStudentUSI, OldStudentUniqueId, Id, Discriminator, ChangeVersion)
    SELECT  d.IncidentIdentifier, d.SchoolId, d.StudentUSI, j2.StudentUniqueId, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Student j2
            ON d.StudentUSI = j2.StudentUSI 
END
GO

ALTER TABLE [edfi].[StudentDisciplineIncidentAssociation] ENABLE TRIGGER [edfi_StudentDisciplineIncidentAssociation_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_StudentEducationOrganizationAssociation_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_StudentEducationOrganizationAssociation_TR_DeleteTracking] ON [edfi].[StudentEducationOrganizationAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StudentEducationOrganizationAssociation_TrackedChange](OldEducationOrganizationId, OldStudentUSI, OldStudentUniqueId, Id, Discriminator, ChangeVersion)
    SELECT  d.EducationOrganizationId, d.StudentUSI, j1.StudentUniqueId, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Student j1
            ON d.StudentUSI = j1.StudentUSI 
END
GO

ALTER TABLE [edfi].[StudentEducationOrganizationAssociation] ENABLE TRIGGER [edfi_StudentEducationOrganizationAssociation_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_StudentEducationOrganizationResponsibilityAssociation_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_StudentEducationOrganizationResponsibilityAssociation_TR_DeleteTracking] ON [edfi].[StudentEducationOrganizationResponsibilityAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StudentEducationOrganizationResponsibilityAssociation_TrackedChange](OldBeginDate, OldEducationOrganizationId, OldResponsibilityDescriptorId, OldResponsibilityDescriptorNamespace, OldResponsibilityDescriptorCodeValue, OldStudentUSI, OldStudentUniqueId, Id, Discriminator, ChangeVersion)
    SELECT  d.BeginDate, d.EducationOrganizationId, d.ResponsibilityDescriptorId, j2.Namespace, j2.CodeValue, d.StudentUSI, j3.StudentUniqueId, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Descriptor j2
            ON d.ResponsibilityDescriptorId = j2.DescriptorId 
        INNER JOIN edfi.Student j3
            ON d.StudentUSI = j3.StudentUSI 
END
GO

ALTER TABLE [edfi].[StudentEducationOrganizationResponsibilityAssociation] ENABLE TRIGGER [edfi_StudentEducationOrganizationResponsibilityAssociation_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_StudentGradebookEntry_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_StudentGradebookEntry_TR_DeleteTracking] ON [edfi].[StudentGradebookEntry] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StudentGradebookEntry_TrackedChange](OldBeginDate, OldDateAssigned, OldGradebookEntryTitle, OldLocalCourseCode, OldSchoolId, OldSchoolYear, OldSectionIdentifier, OldSessionName, OldStudentUSI, OldStudentUniqueId, Id, Discriminator, ChangeVersion)
    SELECT  d.BeginDate, d.DateAssigned, d.GradebookEntryTitle, d.LocalCourseCode, d.SchoolId, d.SchoolYear, d.SectionIdentifier, d.SessionName, d.StudentUSI, j8.StudentUniqueId, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Student j8
            ON d.StudentUSI = j8.StudentUSI 
END
GO

ALTER TABLE [edfi].[StudentGradebookEntry] ENABLE TRIGGER [edfi_StudentGradebookEntry_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_StudentHomelessProgramAssociation_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_StudentHomelessProgramAssociation_TR_DeleteTracking] ON [edfi].[StudentHomelessProgramAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StudentHomelessProgramAssociation_TrackedChange](OldBeginDate, OldEducationOrganizationId, OldProgramEducationOrganizationId, OldProgramName, OldProgramTypeDescriptorId, OldStudentUSI, Id, ChangeVersion)
    SELECT  d.BeginDate, d.EducationOrganizationId, d.ProgramEducationOrganizationId, d.ProgramName, d.ProgramTypeDescriptorId, d.StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.GeneralStudentProgramAssociation b ON d.BeginDate = b.BeginDate AND d.EducationOrganizationId = b.EducationOrganizationId AND d.ProgramEducationOrganizationId = b.ProgramEducationOrganizationId AND d.ProgramName = b.ProgramName AND d.ProgramTypeDescriptorId = b.ProgramTypeDescriptorId AND d.StudentUSI = b.StudentUSI
END
GO

ALTER TABLE [edfi].[StudentHomelessProgramAssociation] ENABLE TRIGGER [edfi_StudentHomelessProgramAssociation_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_StudentIdentificationSystemDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_StudentIdentificationSystemDescriptor_TR_DeleteTracking] ON [edfi].[StudentIdentificationSystemDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StudentIdentificationSystemDescriptor_TrackedChange](OldStudentIdentificationSystemDescriptorId, Id, ChangeVersion)
    SELECT  d.StudentIdentificationSystemDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.StudentIdentificationSystemDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[StudentIdentificationSystemDescriptor] ENABLE TRIGGER [edfi_StudentIdentificationSystemDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_StudentInterventionAssociation_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_StudentInterventionAssociation_TR_DeleteTracking] ON [edfi].[StudentInterventionAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StudentInterventionAssociation_TrackedChange](OldEducationOrganizationId, OldInterventionIdentificationCode, OldStudentUSI, OldStudentUniqueId, Id, Discriminator, ChangeVersion)
    SELECT  d.EducationOrganizationId, d.InterventionIdentificationCode, d.StudentUSI, j2.StudentUniqueId, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Student j2
            ON d.StudentUSI = j2.StudentUSI 
END
GO

ALTER TABLE [edfi].[StudentInterventionAssociation] ENABLE TRIGGER [edfi_StudentInterventionAssociation_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_StudentInterventionAttendanceEvent_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_StudentInterventionAttendanceEvent_TR_DeleteTracking] ON [edfi].[StudentInterventionAttendanceEvent] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StudentInterventionAttendanceEvent_TrackedChange](OldAttendanceEventCategoryDescriptorId, OldAttendanceEventCategoryDescriptorNamespace, OldAttendanceEventCategoryDescriptorCodeValue, OldEducationOrganizationId, OldEventDate, OldInterventionIdentificationCode, OldStudentUSI, OldStudentUniqueId, Id, Discriminator, ChangeVersion)
    SELECT  d.AttendanceEventCategoryDescriptorId, j0.Namespace, j0.CodeValue, d.EducationOrganizationId, d.EventDate, d.InterventionIdentificationCode, d.StudentUSI, j4.StudentUniqueId, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Descriptor j0
            ON d.AttendanceEventCategoryDescriptorId = j0.DescriptorId 
        INNER JOIN edfi.Student j4
            ON d.StudentUSI = j4.StudentUSI 
END
GO

ALTER TABLE [edfi].[StudentInterventionAttendanceEvent] ENABLE TRIGGER [edfi_StudentInterventionAttendanceEvent_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_StudentLanguageInstructionProgramAssociation_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_StudentLanguageInstructionProgramAssociation_TR_DeleteTracking] ON [edfi].[StudentLanguageInstructionProgramAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StudentLanguageInstructionProgramAssociation_TrackedChange](OldBeginDate, OldEducationOrganizationId, OldProgramEducationOrganizationId, OldProgramName, OldProgramTypeDescriptorId, OldStudentUSI, Id, ChangeVersion)
    SELECT  d.BeginDate, d.EducationOrganizationId, d.ProgramEducationOrganizationId, d.ProgramName, d.ProgramTypeDescriptorId, d.StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.GeneralStudentProgramAssociation b ON d.BeginDate = b.BeginDate AND d.EducationOrganizationId = b.EducationOrganizationId AND d.ProgramEducationOrganizationId = b.ProgramEducationOrganizationId AND d.ProgramName = b.ProgramName AND d.ProgramTypeDescriptorId = b.ProgramTypeDescriptorId AND d.StudentUSI = b.StudentUSI
END
GO

ALTER TABLE [edfi].[StudentLanguageInstructionProgramAssociation] ENABLE TRIGGER [edfi_StudentLanguageInstructionProgramAssociation_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_StudentLearningObjective_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_StudentLearningObjective_TR_DeleteTracking] ON [edfi].[StudentLearningObjective] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StudentLearningObjective_TrackedChange](OldGradingPeriodDescriptorId, OldGradingPeriodDescriptorNamespace, OldGradingPeriodDescriptorCodeValue, OldGradingPeriodSchoolId, OldGradingPeriodSchoolYear, OldGradingPeriodSequence, OldLearningObjectiveId, OldNamespace, OldStudentUSI, OldStudentUniqueId, Id, Discriminator, ChangeVersion)
    SELECT  d.GradingPeriodDescriptorId, j0.Namespace, j0.CodeValue, d.GradingPeriodSchoolId, d.GradingPeriodSchoolYear, d.GradingPeriodSequence, d.LearningObjectiveId, d.Namespace, d.StudentUSI, j6.StudentUniqueId, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Descriptor j0
            ON d.GradingPeriodDescriptorId = j0.DescriptorId 
        INNER JOIN edfi.Student j6
            ON d.StudentUSI = j6.StudentUSI 
END
GO

ALTER TABLE [edfi].[StudentLearningObjective] ENABLE TRIGGER [edfi_StudentLearningObjective_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_StudentMigrantEducationProgramAssociation_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_StudentMigrantEducationProgramAssociation_TR_DeleteTracking] ON [edfi].[StudentMigrantEducationProgramAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StudentMigrantEducationProgramAssociation_TrackedChange](OldBeginDate, OldEducationOrganizationId, OldProgramEducationOrganizationId, OldProgramName, OldProgramTypeDescriptorId, OldStudentUSI, Id, ChangeVersion)
    SELECT  d.BeginDate, d.EducationOrganizationId, d.ProgramEducationOrganizationId, d.ProgramName, d.ProgramTypeDescriptorId, d.StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.GeneralStudentProgramAssociation b ON d.BeginDate = b.BeginDate AND d.EducationOrganizationId = b.EducationOrganizationId AND d.ProgramEducationOrganizationId = b.ProgramEducationOrganizationId AND d.ProgramName = b.ProgramName AND d.ProgramTypeDescriptorId = b.ProgramTypeDescriptorId AND d.StudentUSI = b.StudentUSI
END
GO

ALTER TABLE [edfi].[StudentMigrantEducationProgramAssociation] ENABLE TRIGGER [edfi_StudentMigrantEducationProgramAssociation_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_StudentNeglectedOrDelinquentProgramAssociation_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_StudentNeglectedOrDelinquentProgramAssociation_TR_DeleteTracking] ON [edfi].[StudentNeglectedOrDelinquentProgramAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StudentNeglectedOrDelinquentProgramAssociation_TrackedChange](OldBeginDate, OldEducationOrganizationId, OldProgramEducationOrganizationId, OldProgramName, OldProgramTypeDescriptorId, OldStudentUSI, Id, ChangeVersion)
    SELECT  d.BeginDate, d.EducationOrganizationId, d.ProgramEducationOrganizationId, d.ProgramName, d.ProgramTypeDescriptorId, d.StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.GeneralStudentProgramAssociation b ON d.BeginDate = b.BeginDate AND d.EducationOrganizationId = b.EducationOrganizationId AND d.ProgramEducationOrganizationId = b.ProgramEducationOrganizationId AND d.ProgramName = b.ProgramName AND d.ProgramTypeDescriptorId = b.ProgramTypeDescriptorId AND d.StudentUSI = b.StudentUSI
END
GO

ALTER TABLE [edfi].[StudentNeglectedOrDelinquentProgramAssociation] ENABLE TRIGGER [edfi_StudentNeglectedOrDelinquentProgramAssociation_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_StudentParentAssociation_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_StudentParentAssociation_TR_DeleteTracking] ON [edfi].[StudentParentAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StudentParentAssociation_TrackedChange](OldParentUSI, OldParentUniqueId, OldStudentUSI, OldStudentUniqueId, Id, Discriminator, ChangeVersion)
    SELECT  d.ParentUSI, j0.ParentUniqueId, d.StudentUSI, j1.StudentUniqueId, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Parent j0
            ON d.ParentUSI = j0.ParentUSI 
        INNER JOIN edfi.Student j1
            ON d.StudentUSI = j1.StudentUSI 
END
GO

ALTER TABLE [edfi].[StudentParentAssociation] ENABLE TRIGGER [edfi_StudentParentAssociation_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_StudentParticipationCodeDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_StudentParticipationCodeDescriptor_TR_DeleteTracking] ON [edfi].[StudentParticipationCodeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StudentParticipationCodeDescriptor_TrackedChange](OldStudentParticipationCodeDescriptorId, Id, ChangeVersion)
    SELECT  d.StudentParticipationCodeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.StudentParticipationCodeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[StudentParticipationCodeDescriptor] ENABLE TRIGGER [edfi_StudentParticipationCodeDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_StudentProgramAssociation_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_StudentProgramAssociation_TR_DeleteTracking] ON [edfi].[StudentProgramAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StudentProgramAssociation_TrackedChange](OldBeginDate, OldEducationOrganizationId, OldProgramEducationOrganizationId, OldProgramName, OldProgramTypeDescriptorId, OldStudentUSI, Id, ChangeVersion)
    SELECT  d.BeginDate, d.EducationOrganizationId, d.ProgramEducationOrganizationId, d.ProgramName, d.ProgramTypeDescriptorId, d.StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.GeneralStudentProgramAssociation b ON d.BeginDate = b.BeginDate AND d.EducationOrganizationId = b.EducationOrganizationId AND d.ProgramEducationOrganizationId = b.ProgramEducationOrganizationId AND d.ProgramName = b.ProgramName AND d.ProgramTypeDescriptorId = b.ProgramTypeDescriptorId AND d.StudentUSI = b.StudentUSI
END
GO

ALTER TABLE [edfi].[StudentProgramAssociation] ENABLE TRIGGER [edfi_StudentProgramAssociation_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_StudentProgramAttendanceEvent_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_StudentProgramAttendanceEvent_TR_DeleteTracking] ON [edfi].[StudentProgramAttendanceEvent] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StudentProgramAttendanceEvent_TrackedChange](OldAttendanceEventCategoryDescriptorId, OldAttendanceEventCategoryDescriptorNamespace, OldAttendanceEventCategoryDescriptorCodeValue, OldEducationOrganizationId, OldEventDate, OldProgramEducationOrganizationId, OldProgramName, OldProgramTypeDescriptorId, OldProgramTypeDescriptorNamespace, OldProgramTypeDescriptorCodeValue, OldStudentUSI, OldStudentUniqueId, Id, Discriminator, ChangeVersion)
    SELECT  d.AttendanceEventCategoryDescriptorId, j0.Namespace, j0.CodeValue, d.EducationOrganizationId, d.EventDate, d.ProgramEducationOrganizationId, d.ProgramName, d.ProgramTypeDescriptorId, j5.Namespace, j5.CodeValue, d.StudentUSI, j6.StudentUniqueId, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Descriptor j0
            ON d.AttendanceEventCategoryDescriptorId = j0.DescriptorId 
        INNER JOIN edfi.Descriptor j5
            ON d.ProgramTypeDescriptorId = j5.DescriptorId 
        INNER JOIN edfi.Student j6
            ON d.StudentUSI = j6.StudentUSI 
END
GO

ALTER TABLE [edfi].[StudentProgramAttendanceEvent] ENABLE TRIGGER [edfi_StudentProgramAttendanceEvent_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_StudentSchoolAssociation_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_StudentSchoolAssociation_TR_DeleteTracking] ON [edfi].[StudentSchoolAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StudentSchoolAssociation_TrackedChange](OldEntryDate, OldSchoolId, OldStudentUSI, OldStudentUniqueId, Id, Discriminator, ChangeVersion)
    SELECT  d.EntryDate, d.SchoolId, d.StudentUSI, j2.StudentUniqueId, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Student j2
            ON d.StudentUSI = j2.StudentUSI 
END
GO

ALTER TABLE [edfi].[StudentSchoolAssociation] ENABLE TRIGGER [edfi_StudentSchoolAssociation_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_StudentSchoolAttendanceEvent_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_StudentSchoolAttendanceEvent_TR_DeleteTracking] ON [edfi].[StudentSchoolAttendanceEvent] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StudentSchoolAttendanceEvent_TrackedChange](OldAttendanceEventCategoryDescriptorId, OldAttendanceEventCategoryDescriptorNamespace, OldAttendanceEventCategoryDescriptorCodeValue, OldEventDate, OldSchoolId, OldSchoolYear, OldSessionName, OldStudentUSI, OldStudentUniqueId, Id, Discriminator, ChangeVersion)
    SELECT  d.AttendanceEventCategoryDescriptorId, j0.Namespace, j0.CodeValue, d.EventDate, d.SchoolId, d.SchoolYear, d.SessionName, d.StudentUSI, j5.StudentUniqueId, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Descriptor j0
            ON d.AttendanceEventCategoryDescriptorId = j0.DescriptorId 
        INNER JOIN edfi.Student j5
            ON d.StudentUSI = j5.StudentUSI 
END
GO

ALTER TABLE [edfi].[StudentSchoolAttendanceEvent] ENABLE TRIGGER [edfi_StudentSchoolAttendanceEvent_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_StudentSchoolFoodServiceProgramAssociation_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_StudentSchoolFoodServiceProgramAssociation_TR_DeleteTracking] ON [edfi].[StudentSchoolFoodServiceProgramAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StudentSchoolFoodServiceProgramAssociation_TrackedChange](OldBeginDate, OldEducationOrganizationId, OldProgramEducationOrganizationId, OldProgramName, OldProgramTypeDescriptorId, OldStudentUSI, Id, ChangeVersion)
    SELECT  d.BeginDate, d.EducationOrganizationId, d.ProgramEducationOrganizationId, d.ProgramName, d.ProgramTypeDescriptorId, d.StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.GeneralStudentProgramAssociation b ON d.BeginDate = b.BeginDate AND d.EducationOrganizationId = b.EducationOrganizationId AND d.ProgramEducationOrganizationId = b.ProgramEducationOrganizationId AND d.ProgramName = b.ProgramName AND d.ProgramTypeDescriptorId = b.ProgramTypeDescriptorId AND d.StudentUSI = b.StudentUSI
END
GO

ALTER TABLE [edfi].[StudentSchoolFoodServiceProgramAssociation] ENABLE TRIGGER [edfi_StudentSchoolFoodServiceProgramAssociation_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_StudentSectionAssociation_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_StudentSectionAssociation_TR_DeleteTracking] ON [edfi].[StudentSectionAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StudentSectionAssociation_TrackedChange](OldBeginDate, OldLocalCourseCode, OldSchoolId, OldSchoolYear, OldSectionIdentifier, OldSessionName, OldStudentUSI, OldStudentUniqueId, Id, Discriminator, ChangeVersion)
    SELECT  d.BeginDate, d.LocalCourseCode, d.SchoolId, d.SchoolYear, d.SectionIdentifier, d.SessionName, d.StudentUSI, j6.StudentUniqueId, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Student j6
            ON d.StudentUSI = j6.StudentUSI 
END
GO

ALTER TABLE [edfi].[StudentSectionAssociation] ENABLE TRIGGER [edfi_StudentSectionAssociation_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_StudentSectionAttendanceEvent_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_StudentSectionAttendanceEvent_TR_DeleteTracking] ON [edfi].[StudentSectionAttendanceEvent] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StudentSectionAttendanceEvent_TrackedChange](OldAttendanceEventCategoryDescriptorId, OldAttendanceEventCategoryDescriptorNamespace, OldAttendanceEventCategoryDescriptorCodeValue, OldEventDate, OldLocalCourseCode, OldSchoolId, OldSchoolYear, OldSectionIdentifier, OldSessionName, OldStudentUSI, OldStudentUniqueId, Id, Discriminator, ChangeVersion)
    SELECT  d.AttendanceEventCategoryDescriptorId, j0.Namespace, j0.CodeValue, d.EventDate, d.LocalCourseCode, d.SchoolId, d.SchoolYear, d.SectionIdentifier, d.SessionName, d.StudentUSI, j7.StudentUniqueId, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Descriptor j0
            ON d.AttendanceEventCategoryDescriptorId = j0.DescriptorId 
        INNER JOIN edfi.Student j7
            ON d.StudentUSI = j7.StudentUSI 
END
GO

ALTER TABLE [edfi].[StudentSectionAttendanceEvent] ENABLE TRIGGER [edfi_StudentSectionAttendanceEvent_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_StudentSpecialEducationProgramAssociation_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_StudentSpecialEducationProgramAssociation_TR_DeleteTracking] ON [edfi].[StudentSpecialEducationProgramAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StudentSpecialEducationProgramAssociation_TrackedChange](OldBeginDate, OldEducationOrganizationId, OldProgramEducationOrganizationId, OldProgramName, OldProgramTypeDescriptorId, OldStudentUSI, Id, ChangeVersion)
    SELECT  d.BeginDate, d.EducationOrganizationId, d.ProgramEducationOrganizationId, d.ProgramName, d.ProgramTypeDescriptorId, d.StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.GeneralStudentProgramAssociation b ON d.BeginDate = b.BeginDate AND d.EducationOrganizationId = b.EducationOrganizationId AND d.ProgramEducationOrganizationId = b.ProgramEducationOrganizationId AND d.ProgramName = b.ProgramName AND d.ProgramTypeDescriptorId = b.ProgramTypeDescriptorId AND d.StudentUSI = b.StudentUSI
END
GO

ALTER TABLE [edfi].[StudentSpecialEducationProgramAssociation] ENABLE TRIGGER [edfi_StudentSpecialEducationProgramAssociation_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_StudentTitleIPartAProgramAssociation_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_StudentTitleIPartAProgramAssociation_TR_DeleteTracking] ON [edfi].[StudentTitleIPartAProgramAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_StudentTitleIPartAProgramAssociation_TrackedChange](OldBeginDate, OldEducationOrganizationId, OldProgramEducationOrganizationId, OldProgramName, OldProgramTypeDescriptorId, OldStudentUSI, Id, ChangeVersion)
    SELECT  d.BeginDate, d.EducationOrganizationId, d.ProgramEducationOrganizationId, d.ProgramName, d.ProgramTypeDescriptorId, d.StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.GeneralStudentProgramAssociation b ON d.BeginDate = b.BeginDate AND d.EducationOrganizationId = b.EducationOrganizationId AND d.ProgramEducationOrganizationId = b.ProgramEducationOrganizationId AND d.ProgramName = b.ProgramName AND d.ProgramTypeDescriptorId = b.ProgramTypeDescriptorId AND d.StudentUSI = b.StudentUSI
END
GO

ALTER TABLE [edfi].[StudentTitleIPartAProgramAssociation] ENABLE TRIGGER [edfi_StudentTitleIPartAProgramAssociation_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_Student_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_Student_TR_DeleteTracking] ON [edfi].[Student] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_Student_TrackedChange](OldStudentUSI, OldStudentUniqueId, Id, Discriminator, ChangeVersion)
    SELECT  d.StudentUSI, d.StudentUniqueId, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfi].[Student] ENABLE TRIGGER [edfi_Student_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_TeachingCredentialBasisDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_TeachingCredentialBasisDescriptor_TR_DeleteTracking] ON [edfi].[TeachingCredentialBasisDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_TeachingCredentialBasisDescriptor_TrackedChange](OldTeachingCredentialBasisDescriptorId, Id, ChangeVersion)
    SELECT  d.TeachingCredentialBasisDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.TeachingCredentialBasisDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[TeachingCredentialBasisDescriptor] ENABLE TRIGGER [edfi_TeachingCredentialBasisDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_TeachingCredentialDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_TeachingCredentialDescriptor_TR_DeleteTracking] ON [edfi].[TeachingCredentialDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_TeachingCredentialDescriptor_TrackedChange](OldTeachingCredentialDescriptorId, Id, ChangeVersion)
    SELECT  d.TeachingCredentialDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.TeachingCredentialDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[TeachingCredentialDescriptor] ENABLE TRIGGER [edfi_TeachingCredentialDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_TechnicalSkillsAssessmentDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_TechnicalSkillsAssessmentDescriptor_TR_DeleteTracking] ON [edfi].[TechnicalSkillsAssessmentDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_TechnicalSkillsAssessmentDescriptor_TrackedChange](OldTechnicalSkillsAssessmentDescriptorId, Id, ChangeVersion)
    SELECT  d.TechnicalSkillsAssessmentDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.TechnicalSkillsAssessmentDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[TechnicalSkillsAssessmentDescriptor] ENABLE TRIGGER [edfi_TechnicalSkillsAssessmentDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_TelephoneNumberTypeDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_TelephoneNumberTypeDescriptor_TR_DeleteTracking] ON [edfi].[TelephoneNumberTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_TelephoneNumberTypeDescriptor_TrackedChange](OldTelephoneNumberTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.TelephoneNumberTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.TelephoneNumberTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[TelephoneNumberTypeDescriptor] ENABLE TRIGGER [edfi_TelephoneNumberTypeDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_TermDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_TermDescriptor_TR_DeleteTracking] ON [edfi].[TermDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_TermDescriptor_TrackedChange](OldTermDescriptorId, Id, ChangeVersion)
    SELECT  d.TermDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.TermDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[TermDescriptor] ENABLE TRIGGER [edfi_TermDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_TitleIPartAParticipantDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_TitleIPartAParticipantDescriptor_TR_DeleteTracking] ON [edfi].[TitleIPartAParticipantDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_TitleIPartAParticipantDescriptor_TrackedChange](OldTitleIPartAParticipantDescriptorId, Id, ChangeVersion)
    SELECT  d.TitleIPartAParticipantDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.TitleIPartAParticipantDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[TitleIPartAParticipantDescriptor] ENABLE TRIGGER [edfi_TitleIPartAParticipantDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_TitleIPartASchoolDesignationDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_TitleIPartASchoolDesignationDescriptor_TR_DeleteTracking] ON [edfi].[TitleIPartASchoolDesignationDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_TitleIPartASchoolDesignationDescriptor_TrackedChange](OldTitleIPartASchoolDesignationDescriptorId, Id, ChangeVersion)
    SELECT  d.TitleIPartASchoolDesignationDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.TitleIPartASchoolDesignationDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[TitleIPartASchoolDesignationDescriptor] ENABLE TRIGGER [edfi_TitleIPartASchoolDesignationDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_TribalAffiliationDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_TribalAffiliationDescriptor_TR_DeleteTracking] ON [edfi].[TribalAffiliationDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_TribalAffiliationDescriptor_TrackedChange](OldTribalAffiliationDescriptorId, Id, ChangeVersion)
    SELECT  d.TribalAffiliationDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.TribalAffiliationDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[TribalAffiliationDescriptor] ENABLE TRIGGER [edfi_TribalAffiliationDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_VisaDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_VisaDescriptor_TR_DeleteTracking] ON [edfi].[VisaDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_VisaDescriptor_TrackedChange](OldVisaDescriptorId, Id, ChangeVersion)
    SELECT  d.VisaDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.VisaDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[VisaDescriptor] ENABLE TRIGGER [edfi_VisaDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [edfi].[edfi_WeaponDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [edfi].[edfi_WeaponDescriptor_TR_DeleteTracking] ON [edfi].[WeaponDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfi_WeaponDescriptor_TrackedChange](OldWeaponDescriptorId, Id, ChangeVersion)
    SELECT  d.WeaponDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.WeaponDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfi].[WeaponDescriptor] ENABLE TRIGGER [edfi_WeaponDescriptor_TR_DeleteTracking]
GO


