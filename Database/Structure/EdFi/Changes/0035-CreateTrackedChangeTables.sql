CREATE TABLE [changes].[edfi_AbsenceEventCategoryDescriptor_TrackedChange]
(
       OldAbsenceEventCategoryDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewAbsenceEventCategoryDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_AbsenceEventCategoryDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_AcademicHonorCategoryDescriptor_TrackedChange]
(
       OldAcademicHonorCategoryDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewAcademicHonorCategoryDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_AcademicHonorCategoryDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_AcademicSubjectDescriptor_TrackedChange]
(
       OldAcademicSubjectDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewAcademicSubjectDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_AcademicSubjectDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_AcademicWeek_TrackedChange]
(
       OldSchoolId int NOT NULL,
       OldWeekIdentifier nvarchar(80) NOT NULL,
       NewSchoolId int NULL,
       NewWeekIdentifier nvarchar(80) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_AcademicWeek_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_AccommodationDescriptor_TrackedChange]
(
       OldAccommodationDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewAccommodationDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_AccommodationDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_AccountClassificationDescriptor_TrackedChange]
(
       OldAccountClassificationDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewAccountClassificationDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_AccountClassificationDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_AccountCode_TrackedChange]
(
       OldAccountClassificationDescriptorId int NOT NULL,
       OldAccountClassificationDescriptorNamespace nvarchar(255) NOT NULL,
       OldAccountClassificationDescriptorCodeValue nvarchar(50) NOT NULL,
       OldAccountCodeNumber nvarchar(50) NOT NULL,
       OldEducationOrganizationId int NOT NULL,
       OldFiscalYear int NOT NULL,
       NewAccountClassificationDescriptorId int NULL,
       NewAccountClassificationDescriptorNamespace nvarchar(255) NULL,
       NewAccountClassificationDescriptorCodeValue nvarchar(50) NULL,
       NewAccountCodeNumber nvarchar(50) NULL,
       NewEducationOrganizationId int NULL,
       NewFiscalYear int NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_AccountCode_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_Account_TrackedChange]
(
       OldAccountIdentifier nvarchar(50) NOT NULL,
       OldEducationOrganizationId int NOT NULL,
       OldFiscalYear int NOT NULL,
       NewAccountIdentifier nvarchar(50) NULL,
       NewEducationOrganizationId int NULL,
       NewFiscalYear int NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_Account_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_AccountabilityRating_TrackedChange]
(
       OldEducationOrganizationId int NOT NULL,
       OldRatingTitle nvarchar(60) NOT NULL,
       OldSchoolYear smallint NOT NULL,
       NewEducationOrganizationId int NULL,
       NewRatingTitle nvarchar(60) NULL,
       NewSchoolYear smallint NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_AccountabilityRating_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_AchievementCategoryDescriptor_TrackedChange]
(
       OldAchievementCategoryDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewAchievementCategoryDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_AchievementCategoryDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_Actual_TrackedChange]
(
       OldAccountIdentifier nvarchar(50) NOT NULL,
       OldAsOfDate date NOT NULL,
       OldEducationOrganizationId int NOT NULL,
       OldFiscalYear int NOT NULL,
       NewAccountIdentifier nvarchar(50) NULL,
       NewAsOfDate date NULL,
       NewEducationOrganizationId int NULL,
       NewFiscalYear int NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_Actual_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_AdditionalCreditTypeDescriptor_TrackedChange]
(
       OldAdditionalCreditTypeDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewAdditionalCreditTypeDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_AdditionalCreditTypeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_AddressTypeDescriptor_TrackedChange]
(
       OldAddressTypeDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewAddressTypeDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_AddressTypeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_AdministrationEnvironmentDescriptor_TrackedChange]
(
       OldAdministrationEnvironmentDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewAdministrationEnvironmentDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_AdministrationEnvironmentDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_AdministrativeFundingControlDescriptor_TrackedChange]
(
       OldAdministrativeFundingControlDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewAdministrativeFundingControlDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_AdministrativeFundingControlDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_AssessmentCategoryDescriptor_TrackedChange]
(
       OldAssessmentCategoryDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewAssessmentCategoryDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_AssessmentCategoryDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_AssessmentIdentificationSystemDescriptor_TrackedChange]
(
       OldAssessmentIdentificationSystemDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewAssessmentIdentificationSystemDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_AssessmentIdentificationSystemDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_AssessmentItemCategoryDescriptor_TrackedChange]
(
       OldAssessmentItemCategoryDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewAssessmentItemCategoryDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_AssessmentItemCategoryDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_AssessmentItemResultDescriptor_TrackedChange]
(
       OldAssessmentItemResultDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewAssessmentItemResultDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_AssessmentItemResultDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_AssessmentItem_TrackedChange]
(
       OldAssessmentIdentifier nvarchar(60) NOT NULL,
       OldIdentificationCode nvarchar(60) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewAssessmentIdentifier nvarchar(60) NULL,
       NewIdentificationCode nvarchar(60) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_AssessmentItem_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_AssessmentPeriodDescriptor_TrackedChange]
(
       OldAssessmentPeriodDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewAssessmentPeriodDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_AssessmentPeriodDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_AssessmentReportingMethodDescriptor_TrackedChange]
(
       OldAssessmentReportingMethodDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewAssessmentReportingMethodDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_AssessmentReportingMethodDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_Assessment_TrackedChange]
(
       OldAssessmentIdentifier nvarchar(60) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewAssessmentIdentifier nvarchar(60) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_Assessment_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_AttemptStatusDescriptor_TrackedChange]
(
       OldAttemptStatusDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewAttemptStatusDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_AttemptStatusDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_AttendanceEventCategoryDescriptor_TrackedChange]
(
       OldAttendanceEventCategoryDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewAttendanceEventCategoryDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_AttendanceEventCategoryDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_BehaviorDescriptor_TrackedChange]
(
       OldBehaviorDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewBehaviorDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_BehaviorDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_BellSchedule_TrackedChange]
(
       OldBellScheduleName nvarchar(60) NOT NULL,
       OldSchoolId int NOT NULL,
       NewBellScheduleName nvarchar(60) NULL,
       NewSchoolId int NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_BellSchedule_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_Budget_TrackedChange]
(
       OldAccountIdentifier nvarchar(50) NOT NULL,
       OldAsOfDate date NOT NULL,
       OldEducationOrganizationId int NOT NULL,
       OldFiscalYear int NOT NULL,
       NewAccountIdentifier nvarchar(50) NULL,
       NewAsOfDate date NULL,
       NewEducationOrganizationId int NULL,
       NewFiscalYear int NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_Budget_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_CalendarDate_TrackedChange]
(
       OldCalendarCode nvarchar(60) NOT NULL,
       OldDate date NOT NULL,
       OldSchoolId int NOT NULL,
       OldSchoolYear smallint NOT NULL,
       NewCalendarCode nvarchar(60) NULL,
       NewDate date NULL,
       NewSchoolId int NULL,
       NewSchoolYear smallint NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_CalendarDate_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_CalendarEventDescriptor_TrackedChange]
(
       OldCalendarEventDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewCalendarEventDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_CalendarEventDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_CalendarTypeDescriptor_TrackedChange]
(
       OldCalendarTypeDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewCalendarTypeDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_CalendarTypeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_Calendar_TrackedChange]
(
       OldCalendarCode nvarchar(60) NOT NULL,
       OldSchoolId int NOT NULL,
       OldSchoolYear smallint NOT NULL,
       NewCalendarCode nvarchar(60) NULL,
       NewSchoolId int NULL,
       NewSchoolYear smallint NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_Calendar_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_CareerPathwayDescriptor_TrackedChange]
(
       OldCareerPathwayDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewCareerPathwayDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_CareerPathwayDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_CharterApprovalAgencyTypeDescriptor_TrackedChange]
(
       OldCharterApprovalAgencyTypeDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewCharterApprovalAgencyTypeDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_CharterApprovalAgencyTypeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_CharterStatusDescriptor_TrackedChange]
(
       OldCharterStatusDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewCharterStatusDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_CharterStatusDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_CitizenshipStatusDescriptor_TrackedChange]
(
       OldCitizenshipStatusDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewCitizenshipStatusDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_CitizenshipStatusDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_ClassPeriod_TrackedChange]
(
       OldClassPeriodName nvarchar(60) NOT NULL,
       OldSchoolId int NOT NULL,
       NewClassPeriodName nvarchar(60) NULL,
       NewSchoolId int NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_ClassPeriod_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_ClassroomPositionDescriptor_TrackedChange]
(
       OldClassroomPositionDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewClassroomPositionDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_ClassroomPositionDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_CohortScopeDescriptor_TrackedChange]
(
       OldCohortScopeDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewCohortScopeDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_CohortScopeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_CohortTypeDescriptor_TrackedChange]
(
       OldCohortTypeDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewCohortTypeDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_CohortTypeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_CohortYearTypeDescriptor_TrackedChange]
(
       OldCohortYearTypeDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewCohortYearTypeDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_CohortYearTypeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_Cohort_TrackedChange]
(
       OldCohortIdentifier nvarchar(20) NOT NULL,
       OldEducationOrganizationId int NOT NULL,
       NewCohortIdentifier nvarchar(20) NULL,
       NewEducationOrganizationId int NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_Cohort_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_CommunityOrganization_TrackedChange]
(
       OldCommunityOrganizationId int NOT NULL,
       NewCommunityOrganizationId int NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_CommunityOrganization_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_CommunityProviderLicense_TrackedChange]
(
       OldCommunityProviderId int NOT NULL,
       OldLicenseIdentifier nvarchar(20) NOT NULL,
       OldLicensingOrganization nvarchar(75) NOT NULL,
       NewCommunityProviderId int NULL,
       NewLicenseIdentifier nvarchar(20) NULL,
       NewLicensingOrganization nvarchar(75) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_CommunityProviderLicense_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_CommunityProvider_TrackedChange]
(
       OldCommunityProviderId int NOT NULL,
       NewCommunityProviderId int NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_CommunityProvider_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_CompetencyLevelDescriptor_TrackedChange]
(
       OldCompetencyLevelDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewCompetencyLevelDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_CompetencyLevelDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_CompetencyObjective_TrackedChange]
(
       OldEducationOrganizationId int NOT NULL,
       OldObjective nvarchar(60) NOT NULL,
       OldObjectiveGradeLevelDescriptorId int NOT NULL,
       OldObjectiveGradeLevelDescriptorNamespace nvarchar(255) NOT NULL,
       OldObjectiveGradeLevelDescriptorCodeValue nvarchar(50) NOT NULL,
       NewEducationOrganizationId int NULL,
       NewObjective nvarchar(60) NULL,
       NewObjectiveGradeLevelDescriptorId int NULL,
       NewObjectiveGradeLevelDescriptorNamespace nvarchar(255) NULL,
       NewObjectiveGradeLevelDescriptorCodeValue nvarchar(50) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_CompetencyObjective_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_ContactTypeDescriptor_TrackedChange]
(
       OldContactTypeDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewContactTypeDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_ContactTypeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_ContentClassDescriptor_TrackedChange]
(
       OldContentClassDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewContentClassDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_ContentClassDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_ContinuationOfServicesReasonDescriptor_TrackedChange]
(
       OldContinuationOfServicesReasonDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewContinuationOfServicesReasonDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_ContinuationOfServicesReasonDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_ContractedStaff_TrackedChange]
(
       OldAccountIdentifier nvarchar(50) NOT NULL,
       OldAsOfDate date NOT NULL,
       OldEducationOrganizationId int NOT NULL,
       OldFiscalYear int NOT NULL,
       OldStaffUSI int NOT NULL,
       OldStaffUniqueId nvarchar(32) NOT NULL,
       NewAccountIdentifier nvarchar(50) NULL,
       NewAsOfDate date NULL,
       NewEducationOrganizationId int NULL,
       NewFiscalYear int NULL,
       NewStaffUSI int NULL,
       NewStaffUniqueId nvarchar(32) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_ContractedStaff_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_CostRateDescriptor_TrackedChange]
(
       OldCostRateDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewCostRateDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_CostRateDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_CountryDescriptor_TrackedChange]
(
       OldCountryDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewCountryDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_CountryDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_CourseAttemptResultDescriptor_TrackedChange]
(
       OldCourseAttemptResultDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewCourseAttemptResultDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_CourseAttemptResultDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_CourseDefinedByDescriptor_TrackedChange]
(
       OldCourseDefinedByDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewCourseDefinedByDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_CourseDefinedByDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_CourseGPAApplicabilityDescriptor_TrackedChange]
(
       OldCourseGPAApplicabilityDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewCourseGPAApplicabilityDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_CourseGPAApplicabilityDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_CourseIdentificationSystemDescriptor_TrackedChange]
(
       OldCourseIdentificationSystemDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewCourseIdentificationSystemDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_CourseIdentificationSystemDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_CourseLevelCharacteristicDescriptor_TrackedChange]
(
       OldCourseLevelCharacteristicDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewCourseLevelCharacteristicDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_CourseLevelCharacteristicDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_CourseOffering_TrackedChange]
(
       OldLocalCourseCode nvarchar(60) NOT NULL,
       OldSchoolId int NOT NULL,
       OldSchoolYear smallint NOT NULL,
       OldSessionName nvarchar(60) NOT NULL,
       NewLocalCourseCode nvarchar(60) NULL,
       NewSchoolId int NULL,
       NewSchoolYear smallint NULL,
       NewSessionName nvarchar(60) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_CourseOffering_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_CourseRepeatCodeDescriptor_TrackedChange]
(
       OldCourseRepeatCodeDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewCourseRepeatCodeDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_CourseRepeatCodeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_CourseTranscript_TrackedChange]
(
       OldCourseAttemptResultDescriptorId int NOT NULL,
       OldCourseAttemptResultDescriptorNamespace nvarchar(255) NOT NULL,
       OldCourseAttemptResultDescriptorCodeValue nvarchar(50) NOT NULL,
       OldCourseCode nvarchar(60) NOT NULL,
       OldCourseEducationOrganizationId int NOT NULL,
       OldEducationOrganizationId int NOT NULL,
       OldSchoolYear smallint NOT NULL,
       OldStudentUSI int NOT NULL,
       OldStudentUniqueId nvarchar(32) NOT NULL,
       OldTermDescriptorId int NOT NULL,
       OldTermDescriptorNamespace nvarchar(255) NOT NULL,
       OldTermDescriptorCodeValue nvarchar(50) NOT NULL,
       NewCourseAttemptResultDescriptorId int NULL,
       NewCourseAttemptResultDescriptorNamespace nvarchar(255) NULL,
       NewCourseAttemptResultDescriptorCodeValue nvarchar(50) NULL,
       NewCourseCode nvarchar(60) NULL,
       NewCourseEducationOrganizationId int NULL,
       NewEducationOrganizationId int NULL,
       NewSchoolYear smallint NULL,
       NewStudentUSI int NULL,
       NewStudentUniqueId nvarchar(32) NULL,
       NewTermDescriptorId int NULL,
       NewTermDescriptorNamespace nvarchar(255) NULL,
       NewTermDescriptorCodeValue nvarchar(50) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_CourseTranscript_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_Course_TrackedChange]
(
       OldCourseCode nvarchar(60) NOT NULL,
       OldEducationOrganizationId int NOT NULL,
       NewCourseCode nvarchar(60) NULL,
       NewEducationOrganizationId int NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_Course_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_CredentialFieldDescriptor_TrackedChange]
(
       OldCredentialFieldDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewCredentialFieldDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_CredentialFieldDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_CredentialTypeDescriptor_TrackedChange]
(
       OldCredentialTypeDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewCredentialTypeDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_CredentialTypeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_Credential_TrackedChange]
(
       OldCredentialIdentifier nvarchar(60) NOT NULL,
       OldStateOfIssueStateAbbreviationDescriptorId int NOT NULL,
       OldStateOfIssueStateAbbreviationDescriptorNamespace nvarchar(255) NOT NULL,
       OldStateOfIssueStateAbbreviationDescriptorCodeValue nvarchar(50) NOT NULL,
       NewCredentialIdentifier nvarchar(60) NULL,
       NewStateOfIssueStateAbbreviationDescriptorId int NULL,
       NewStateOfIssueStateAbbreviationDescriptorNamespace nvarchar(255) NULL,
       NewStateOfIssueStateAbbreviationDescriptorCodeValue nvarchar(50) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_Credential_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_CreditTypeDescriptor_TrackedChange]
(
       OldCreditTypeDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewCreditTypeDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_CreditTypeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_CurriculumUsedDescriptor_TrackedChange]
(
       OldCurriculumUsedDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewCurriculumUsedDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_CurriculumUsedDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_DeliveryMethodDescriptor_TrackedChange]
(
       OldDeliveryMethodDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewDeliveryMethodDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_DeliveryMethodDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_Descriptor_TrackedChange]
(
       OldDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_Descriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_DiagnosisDescriptor_TrackedChange]
(
       OldDiagnosisDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewDiagnosisDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_DiagnosisDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_DiplomaLevelDescriptor_TrackedChange]
(
       OldDiplomaLevelDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewDiplomaLevelDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_DiplomaLevelDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_DiplomaTypeDescriptor_TrackedChange]
(
       OldDiplomaTypeDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewDiplomaTypeDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_DiplomaTypeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_DisabilityDescriptor_TrackedChange]
(
       OldDisabilityDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewDisabilityDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_DisabilityDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_DisabilityDesignationDescriptor_TrackedChange]
(
       OldDisabilityDesignationDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewDisabilityDesignationDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_DisabilityDesignationDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_DisabilityDeterminationSourceTypeDescriptor_TrackedChange]
(
       OldDisabilityDeterminationSourceTypeDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewDisabilityDeterminationSourceTypeDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_DisabilityDeterminationSourceTypeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_DisciplineActionLengthDifferenceReasonDescriptor_TrackedChange]
(
       OldDisciplineActionLengthDifferenceReasonDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewDisciplineActionLengthDifferenceReasonDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_DisciplineActionLengthDifferenceReasonDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_DisciplineAction_TrackedChange]
(
       OldDisciplineActionIdentifier nvarchar(20) NOT NULL,
       OldDisciplineDate date NOT NULL,
       OldStudentUSI int NOT NULL,
       OldStudentUniqueId nvarchar(32) NOT NULL,
       NewDisciplineActionIdentifier nvarchar(20) NULL,
       NewDisciplineDate date NULL,
       NewStudentUSI int NULL,
       NewStudentUniqueId nvarchar(32) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_DisciplineAction_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_DisciplineDescriptor_TrackedChange]
(
       OldDisciplineDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewDisciplineDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_DisciplineDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_DisciplineIncident_TrackedChange]
(
       OldIncidentIdentifier nvarchar(20) NOT NULL,
       OldSchoolId int NOT NULL,
       NewIncidentIdentifier nvarchar(20) NULL,
       NewSchoolId int NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_DisciplineIncident_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_EducationContent_TrackedChange]
(
       OldContentIdentifier nvarchar(225) NOT NULL,
       NewContentIdentifier nvarchar(225) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_EducationContent_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_EducationOrganizationCategoryDescriptor_TrackedChange]
(
       OldEducationOrganizationCategoryDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewEducationOrganizationCategoryDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_EducationOrganizationCategoryDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_EducationOrganizationIdentificationSystemDescriptor_TrackedChange]
(
       OldEducationOrganizationIdentificationSystemDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewEducationOrganizationIdentificationSystemDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_EducationOrganizationIdentificationSystemDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_EducationOrganizationInterventionPrescriptionAssociation_TrackedChange]
(
       OldEducationOrganizationId int NOT NULL,
       OldInterventionPrescriptionEducationOrganizationId int NOT NULL,
       OldInterventionPrescriptionIdentificationCode nvarchar(60) NOT NULL,
       NewEducationOrganizationId int NULL,
       NewInterventionPrescriptionEducationOrganizationId int NULL,
       NewInterventionPrescriptionIdentificationCode nvarchar(60) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_EducationOrganizationInterventionPrescriptionAssociation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_EducationOrganizationNetworkAssociation_TrackedChange]
(
       OldEducationOrganizationNetworkId int NOT NULL,
       OldMemberEducationOrganizationId int NOT NULL,
       NewEducationOrganizationNetworkId int NULL,
       NewMemberEducationOrganizationId int NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_EducationOrganizationNetworkAssociation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_EducationOrganizationNetwork_TrackedChange]
(
       OldEducationOrganizationNetworkId int NOT NULL,
       NewEducationOrganizationNetworkId int NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_EducationOrganizationNetwork_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_EducationOrganizationPeerAssociation_TrackedChange]
(
       OldEducationOrganizationId int NOT NULL,
       OldPeerEducationOrganizationId int NOT NULL,
       NewEducationOrganizationId int NULL,
       NewPeerEducationOrganizationId int NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_EducationOrganizationPeerAssociation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_EducationOrganization_TrackedChange]
(
       OldEducationOrganizationId int NOT NULL,
       NewEducationOrganizationId int NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_EducationOrganization_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_EducationPlanDescriptor_TrackedChange]
(
       OldEducationPlanDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewEducationPlanDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_EducationPlanDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_EducationServiceCenter_TrackedChange]
(
       OldEducationServiceCenterId int NOT NULL,
       NewEducationServiceCenterId int NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_EducationServiceCenter_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_EducationalEnvironmentDescriptor_TrackedChange]
(
       OldEducationalEnvironmentDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewEducationalEnvironmentDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_EducationalEnvironmentDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_ElectronicMailTypeDescriptor_TrackedChange]
(
       OldElectronicMailTypeDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewElectronicMailTypeDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_ElectronicMailTypeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_EmploymentStatusDescriptor_TrackedChange]
(
       OldEmploymentStatusDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewEmploymentStatusDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_EmploymentStatusDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_EntryGradeLevelReasonDescriptor_TrackedChange]
(
       OldEntryGradeLevelReasonDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewEntryGradeLevelReasonDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_EntryGradeLevelReasonDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_EntryTypeDescriptor_TrackedChange]
(
       OldEntryTypeDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewEntryTypeDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_EntryTypeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_EventCircumstanceDescriptor_TrackedChange]
(
       OldEventCircumstanceDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewEventCircumstanceDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_EventCircumstanceDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_ExitWithdrawTypeDescriptor_TrackedChange]
(
       OldExitWithdrawTypeDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewExitWithdrawTypeDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_ExitWithdrawTypeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_FeederSchoolAssociation_TrackedChange]
(
       OldBeginDate date NOT NULL,
       OldFeederSchoolId int NOT NULL,
       OldSchoolId int NOT NULL,
       NewBeginDate date NULL,
       NewFeederSchoolId int NULL,
       NewSchoolId int NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_FeederSchoolAssociation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_GeneralStudentProgramAssociation_TrackedChange]
(
       OldBeginDate date NOT NULL,
       OldEducationOrganizationId int NOT NULL,
       OldProgramEducationOrganizationId int NOT NULL,
       OldProgramName nvarchar(60) NOT NULL,
       OldProgramTypeDescriptorId int NOT NULL,
       OldProgramTypeDescriptorNamespace nvarchar(255) NOT NULL,
       OldProgramTypeDescriptorCodeValue nvarchar(50) NOT NULL,
       OldStudentUSI int NOT NULL,
       OldStudentUniqueId nvarchar(32) NOT NULL,
       NewBeginDate date NULL,
       NewEducationOrganizationId int NULL,
       NewProgramEducationOrganizationId int NULL,
       NewProgramName nvarchar(60) NULL,
       NewProgramTypeDescriptorId int NULL,
       NewProgramTypeDescriptorNamespace nvarchar(255) NULL,
       NewProgramTypeDescriptorCodeValue nvarchar(50) NULL,
       NewStudentUSI int NULL,
       NewStudentUniqueId nvarchar(32) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_GeneralStudentProgramAssociation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_GradeLevelDescriptor_TrackedChange]
(
       OldGradeLevelDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewGradeLevelDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_GradeLevelDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_GradeTypeDescriptor_TrackedChange]
(
       OldGradeTypeDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewGradeTypeDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_GradeTypeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_Grade_TrackedChange]
(
       OldBeginDate date NOT NULL,
       OldGradeTypeDescriptorId int NOT NULL,
       OldGradeTypeDescriptorNamespace nvarchar(255) NOT NULL,
       OldGradeTypeDescriptorCodeValue nvarchar(50) NOT NULL,
       OldGradingPeriodDescriptorId int NOT NULL,
       OldGradingPeriodDescriptorNamespace nvarchar(255) NOT NULL,
       OldGradingPeriodDescriptorCodeValue nvarchar(50) NOT NULL,
       OldGradingPeriodSchoolYear smallint NOT NULL,
       OldGradingPeriodSequence int NOT NULL,
       OldLocalCourseCode nvarchar(60) NOT NULL,
       OldSchoolId int NOT NULL,
       OldSchoolYear smallint NOT NULL,
       OldSectionIdentifier nvarchar(255) NOT NULL,
       OldSessionName nvarchar(60) NOT NULL,
       OldStudentUSI int NOT NULL,
       OldStudentUniqueId nvarchar(32) NOT NULL,
       NewBeginDate date NULL,
       NewGradeTypeDescriptorId int NULL,
       NewGradeTypeDescriptorNamespace nvarchar(255) NULL,
       NewGradeTypeDescriptorCodeValue nvarchar(50) NULL,
       NewGradingPeriodDescriptorId int NULL,
       NewGradingPeriodDescriptorNamespace nvarchar(255) NULL,
       NewGradingPeriodDescriptorCodeValue nvarchar(50) NULL,
       NewGradingPeriodSchoolYear smallint NULL,
       NewGradingPeriodSequence int NULL,
       NewLocalCourseCode nvarchar(60) NULL,
       NewSchoolId int NULL,
       NewSchoolYear smallint NULL,
       NewSectionIdentifier nvarchar(255) NULL,
       NewSessionName nvarchar(60) NULL,
       NewStudentUSI int NULL,
       NewStudentUniqueId nvarchar(32) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_Grade_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_GradebookEntryTypeDescriptor_TrackedChange]
(
       OldGradebookEntryTypeDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewGradebookEntryTypeDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_GradebookEntryTypeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_GradebookEntry_TrackedChange]
(
       OldDateAssigned date NOT NULL,
       OldGradebookEntryTitle nvarchar(60) NOT NULL,
       OldLocalCourseCode nvarchar(60) NOT NULL,
       OldSchoolId int NOT NULL,
       OldSchoolYear smallint NOT NULL,
       OldSectionIdentifier nvarchar(255) NOT NULL,
       OldSessionName nvarchar(60) NOT NULL,
       NewDateAssigned date NULL,
       NewGradebookEntryTitle nvarchar(60) NULL,
       NewLocalCourseCode nvarchar(60) NULL,
       NewSchoolId int NULL,
       NewSchoolYear smallint NULL,
       NewSectionIdentifier nvarchar(255) NULL,
       NewSessionName nvarchar(60) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_GradebookEntry_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_GradingPeriodDescriptor_TrackedChange]
(
       OldGradingPeriodDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewGradingPeriodDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_GradingPeriodDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_GradingPeriod_TrackedChange]
(
       OldGradingPeriodDescriptorId int NOT NULL,
       OldGradingPeriodDescriptorNamespace nvarchar(255) NOT NULL,
       OldGradingPeriodDescriptorCodeValue nvarchar(50) NOT NULL,
       OldPeriodSequence int NOT NULL,
       OldSchoolId int NOT NULL,
       OldSchoolYear smallint NOT NULL,
       NewGradingPeriodDescriptorId int NULL,
       NewGradingPeriodDescriptorNamespace nvarchar(255) NULL,
       NewGradingPeriodDescriptorCodeValue nvarchar(50) NULL,
       NewPeriodSequence int NULL,
       NewSchoolId int NULL,
       NewSchoolYear smallint NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_GradingPeriod_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_GraduationPlanTypeDescriptor_TrackedChange]
(
       OldGraduationPlanTypeDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewGraduationPlanTypeDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_GraduationPlanTypeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_GraduationPlan_TrackedChange]
(
       OldEducationOrganizationId int NOT NULL,
       OldGraduationPlanTypeDescriptorId int NOT NULL,
       OldGraduationPlanTypeDescriptorNamespace nvarchar(255) NOT NULL,
       OldGraduationPlanTypeDescriptorCodeValue nvarchar(50) NOT NULL,
       OldGraduationSchoolYear smallint NOT NULL,
       NewEducationOrganizationId int NULL,
       NewGraduationPlanTypeDescriptorId int NULL,
       NewGraduationPlanTypeDescriptorNamespace nvarchar(255) NULL,
       NewGraduationPlanTypeDescriptorCodeValue nvarchar(50) NULL,
       NewGraduationSchoolYear smallint NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_GraduationPlan_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_GunFreeSchoolsActReportingStatusDescriptor_TrackedChange]
(
       OldGunFreeSchoolsActReportingStatusDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewGunFreeSchoolsActReportingStatusDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_GunFreeSchoolsActReportingStatusDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_HomelessPrimaryNighttimeResidenceDescriptor_TrackedChange]
(
       OldHomelessPrimaryNighttimeResidenceDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewHomelessPrimaryNighttimeResidenceDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_HomelessPrimaryNighttimeResidenceDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_HomelessProgramServiceDescriptor_TrackedChange]
(
       OldHomelessProgramServiceDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewHomelessProgramServiceDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_HomelessProgramServiceDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_IdentificationDocumentUseDescriptor_TrackedChange]
(
       OldIdentificationDocumentUseDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewIdentificationDocumentUseDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_IdentificationDocumentUseDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_IncidentLocationDescriptor_TrackedChange]
(
       OldIncidentLocationDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewIncidentLocationDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_IncidentLocationDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_InstitutionTelephoneNumberTypeDescriptor_TrackedChange]
(
       OldInstitutionTelephoneNumberTypeDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewInstitutionTelephoneNumberTypeDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_InstitutionTelephoneNumberTypeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_InteractivityStyleDescriptor_TrackedChange]
(
       OldInteractivityStyleDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewInteractivityStyleDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_InteractivityStyleDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_InternetAccessDescriptor_TrackedChange]
(
       OldInternetAccessDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewInternetAccessDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_InternetAccessDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_InterventionClassDescriptor_TrackedChange]
(
       OldInterventionClassDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewInterventionClassDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_InterventionClassDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_InterventionEffectivenessRatingDescriptor_TrackedChange]
(
       OldInterventionEffectivenessRatingDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewInterventionEffectivenessRatingDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_InterventionEffectivenessRatingDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_InterventionPrescription_TrackedChange]
(
       OldEducationOrganizationId int NOT NULL,
       OldInterventionPrescriptionIdentificationCode nvarchar(60) NOT NULL,
       NewEducationOrganizationId int NULL,
       NewInterventionPrescriptionIdentificationCode nvarchar(60) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_InterventionPrescription_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_InterventionStudy_TrackedChange]
(
       OldEducationOrganizationId int NOT NULL,
       OldInterventionStudyIdentificationCode nvarchar(60) NOT NULL,
       NewEducationOrganizationId int NULL,
       NewInterventionStudyIdentificationCode nvarchar(60) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_InterventionStudy_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_Intervention_TrackedChange]
(
       OldEducationOrganizationId int NOT NULL,
       OldInterventionIdentificationCode nvarchar(60) NOT NULL,
       NewEducationOrganizationId int NULL,
       NewInterventionIdentificationCode nvarchar(60) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_Intervention_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_LanguageDescriptor_TrackedChange]
(
       OldLanguageDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewLanguageDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_LanguageDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_LanguageInstructionProgramServiceDescriptor_TrackedChange]
(
       OldLanguageInstructionProgramServiceDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewLanguageInstructionProgramServiceDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_LanguageInstructionProgramServiceDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_LanguageUseDescriptor_TrackedChange]
(
       OldLanguageUseDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewLanguageUseDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_LanguageUseDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_LearningObjective_TrackedChange]
(
       OldLearningObjectiveId nvarchar(60) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewLearningObjectiveId nvarchar(60) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_LearningObjective_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_LearningStandardCategoryDescriptor_TrackedChange]
(
       OldLearningStandardCategoryDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewLearningStandardCategoryDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_LearningStandardCategoryDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_LearningStandard_TrackedChange]
(
       OldLearningStandardId nvarchar(60) NOT NULL,
       NewLearningStandardId nvarchar(60) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_LearningStandard_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_LevelOfEducationDescriptor_TrackedChange]
(
       OldLevelOfEducationDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewLevelOfEducationDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_LevelOfEducationDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_LicenseStatusDescriptor_TrackedChange]
(
       OldLicenseStatusDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewLicenseStatusDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_LicenseStatusDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_LicenseTypeDescriptor_TrackedChange]
(
       OldLicenseTypeDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewLicenseTypeDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_LicenseTypeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_LimitedEnglishProficiencyDescriptor_TrackedChange]
(
       OldLimitedEnglishProficiencyDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewLimitedEnglishProficiencyDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_LimitedEnglishProficiencyDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_LocalEducationAgencyCategoryDescriptor_TrackedChange]
(
       OldLocalEducationAgencyCategoryDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewLocalEducationAgencyCategoryDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_LocalEducationAgencyCategoryDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_LocalEducationAgency_TrackedChange]
(
       OldLocalEducationAgencyId int NOT NULL,
       NewLocalEducationAgencyId int NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_LocalEducationAgency_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_LocaleDescriptor_TrackedChange]
(
       OldLocaleDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewLocaleDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_LocaleDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_Location_TrackedChange]
(
       OldClassroomIdentificationCode nvarchar(60) NOT NULL,
       OldSchoolId int NOT NULL,
       NewClassroomIdentificationCode nvarchar(60) NULL,
       NewSchoolId int NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_Location_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_MagnetSpecialProgramEmphasisSchoolDescriptor_TrackedChange]
(
       OldMagnetSpecialProgramEmphasisSchoolDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewMagnetSpecialProgramEmphasisSchoolDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_MagnetSpecialProgramEmphasisSchoolDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_MediumOfInstructionDescriptor_TrackedChange]
(
       OldMediumOfInstructionDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewMediumOfInstructionDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_MediumOfInstructionDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_MethodCreditEarnedDescriptor_TrackedChange]
(
       OldMethodCreditEarnedDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewMethodCreditEarnedDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_MethodCreditEarnedDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_MigrantEducationProgramServiceDescriptor_TrackedChange]
(
       OldMigrantEducationProgramServiceDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewMigrantEducationProgramServiceDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_MigrantEducationProgramServiceDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_MonitoredDescriptor_TrackedChange]
(
       OldMonitoredDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewMonitoredDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_MonitoredDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_NeglectedOrDelinquentProgramDescriptor_TrackedChange]
(
       OldNeglectedOrDelinquentProgramDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewNeglectedOrDelinquentProgramDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_NeglectedOrDelinquentProgramDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_NeglectedOrDelinquentProgramServiceDescriptor_TrackedChange]
(
       OldNeglectedOrDelinquentProgramServiceDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewNeglectedOrDelinquentProgramServiceDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_NeglectedOrDelinquentProgramServiceDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_NetworkPurposeDescriptor_TrackedChange]
(
       OldNetworkPurposeDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewNetworkPurposeDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_NetworkPurposeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_ObjectiveAssessment_TrackedChange]
(
       OldAssessmentIdentifier nvarchar(60) NOT NULL,
       OldIdentificationCode nvarchar(60) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewAssessmentIdentifier nvarchar(60) NULL,
       NewIdentificationCode nvarchar(60) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_ObjectiveAssessment_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_OldEthnicityDescriptor_TrackedChange]
(
       OldOldEthnicityDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewOldEthnicityDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_OldEthnicityDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_OpenStaffPosition_TrackedChange]
(
       OldEducationOrganizationId int NOT NULL,
       OldRequisitionNumber nvarchar(20) NOT NULL,
       NewEducationOrganizationId int NULL,
       NewRequisitionNumber nvarchar(20) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_OpenStaffPosition_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_OperationalStatusDescriptor_TrackedChange]
(
       OldOperationalStatusDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewOperationalStatusDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_OperationalStatusDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_OtherNameTypeDescriptor_TrackedChange]
(
       OldOtherNameTypeDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewOtherNameTypeDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_OtherNameTypeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_Parent_TrackedChange]
(
       OldParentUSI int NOT NULL,
       OldParentUniqueId nvarchar(32) NOT NULL,
       NewParentUSI int NULL,
       NewParentUniqueId nvarchar(32) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_Parent_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_ParticipationDescriptor_TrackedChange]
(
       OldParticipationDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewParticipationDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_ParticipationDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_Payroll_TrackedChange]
(
       OldAccountIdentifier nvarchar(50) NOT NULL,
       OldAsOfDate date NOT NULL,
       OldEducationOrganizationId int NOT NULL,
       OldFiscalYear int NOT NULL,
       OldStaffUSI int NOT NULL,
       OldStaffUniqueId nvarchar(32) NOT NULL,
       NewAccountIdentifier nvarchar(50) NULL,
       NewAsOfDate date NULL,
       NewEducationOrganizationId int NULL,
       NewFiscalYear int NULL,
       NewStaffUSI int NULL,
       NewStaffUniqueId nvarchar(32) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_Payroll_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_PerformanceBaseConversionDescriptor_TrackedChange]
(
       OldPerformanceBaseConversionDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewPerformanceBaseConversionDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_PerformanceBaseConversionDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_PerformanceLevelDescriptor_TrackedChange]
(
       OldPerformanceLevelDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewPerformanceLevelDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_PerformanceLevelDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_PersonalInformationVerificationDescriptor_TrackedChange]
(
       OldPersonalInformationVerificationDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewPersonalInformationVerificationDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_PersonalInformationVerificationDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_PopulationServedDescriptor_TrackedChange]
(
       OldPopulationServedDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewPopulationServedDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_PopulationServedDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_PostSecondaryEventCategoryDescriptor_TrackedChange]
(
       OldPostSecondaryEventCategoryDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewPostSecondaryEventCategoryDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_PostSecondaryEventCategoryDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_PostSecondaryEvent_TrackedChange]
(
       OldEventDate date NOT NULL,
       OldPostSecondaryEventCategoryDescriptorId int NOT NULL,
       OldPostSecondaryEventCategoryDescriptorNamespace nvarchar(255) NOT NULL,
       OldPostSecondaryEventCategoryDescriptorCodeValue nvarchar(50) NOT NULL,
       OldStudentUSI int NOT NULL,
       OldStudentUniqueId nvarchar(32) NOT NULL,
       NewEventDate date NULL,
       NewPostSecondaryEventCategoryDescriptorId int NULL,
       NewPostSecondaryEventCategoryDescriptorNamespace nvarchar(255) NULL,
       NewPostSecondaryEventCategoryDescriptorCodeValue nvarchar(50) NULL,
       NewStudentUSI int NULL,
       NewStudentUniqueId nvarchar(32) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_PostSecondaryEvent_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_PostSecondaryInstitutionLevelDescriptor_TrackedChange]
(
       OldPostSecondaryInstitutionLevelDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewPostSecondaryInstitutionLevelDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_PostSecondaryInstitutionLevelDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_PostSecondaryInstitution_TrackedChange]
(
       OldPostSecondaryInstitutionId int NOT NULL,
       NewPostSecondaryInstitutionId int NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_PostSecondaryInstitution_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_PostingResultDescriptor_TrackedChange]
(
       OldPostingResultDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewPostingResultDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_PostingResultDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_ProficiencyDescriptor_TrackedChange]
(
       OldProficiencyDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewProficiencyDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_ProficiencyDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_ProgramAssignmentDescriptor_TrackedChange]
(
       OldProgramAssignmentDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewProgramAssignmentDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_ProgramAssignmentDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_ProgramCharacteristicDescriptor_TrackedChange]
(
       OldProgramCharacteristicDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewProgramCharacteristicDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_ProgramCharacteristicDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_ProgramSponsorDescriptor_TrackedChange]
(
       OldProgramSponsorDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewProgramSponsorDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_ProgramSponsorDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_ProgramTypeDescriptor_TrackedChange]
(
       OldProgramTypeDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewProgramTypeDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_ProgramTypeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_Program_TrackedChange]
(
       OldEducationOrganizationId int NOT NULL,
       OldProgramName nvarchar(60) NOT NULL,
       OldProgramTypeDescriptorId int NOT NULL,
       OldProgramTypeDescriptorNamespace nvarchar(255) NOT NULL,
       OldProgramTypeDescriptorCodeValue nvarchar(50) NOT NULL,
       NewEducationOrganizationId int NULL,
       NewProgramName nvarchar(60) NULL,
       NewProgramTypeDescriptorId int NULL,
       NewProgramTypeDescriptorNamespace nvarchar(255) NULL,
       NewProgramTypeDescriptorCodeValue nvarchar(50) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_Program_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_ProgressDescriptor_TrackedChange]
(
       OldProgressDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewProgressDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_ProgressDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_ProgressLevelDescriptor_TrackedChange]
(
       OldProgressLevelDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewProgressLevelDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_ProgressLevelDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_ProviderCategoryDescriptor_TrackedChange]
(
       OldProviderCategoryDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewProviderCategoryDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_ProviderCategoryDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_ProviderProfitabilityDescriptor_TrackedChange]
(
       OldProviderProfitabilityDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewProviderProfitabilityDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_ProviderProfitabilityDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_ProviderStatusDescriptor_TrackedChange]
(
       OldProviderStatusDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewProviderStatusDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_ProviderStatusDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_PublicationStatusDescriptor_TrackedChange]
(
       OldPublicationStatusDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewPublicationStatusDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_PublicationStatusDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_RaceDescriptor_TrackedChange]
(
       OldRaceDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewRaceDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_RaceDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_ReasonExitedDescriptor_TrackedChange]
(
       OldReasonExitedDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewReasonExitedDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_ReasonExitedDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_ReasonNotTestedDescriptor_TrackedChange]
(
       OldReasonNotTestedDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewReasonNotTestedDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_ReasonNotTestedDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_RecognitionTypeDescriptor_TrackedChange]
(
       OldRecognitionTypeDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewRecognitionTypeDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_RecognitionTypeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_RelationDescriptor_TrackedChange]
(
       OldRelationDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewRelationDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_RelationDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_RepeatIdentifierDescriptor_TrackedChange]
(
       OldRepeatIdentifierDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewRepeatIdentifierDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_RepeatIdentifierDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_ReportCard_TrackedChange]
(
       OldEducationOrganizationId int NOT NULL,
       OldGradingPeriodDescriptorId int NOT NULL,
       OldGradingPeriodDescriptorNamespace nvarchar(255) NOT NULL,
       OldGradingPeriodDescriptorCodeValue nvarchar(50) NOT NULL,
       OldGradingPeriodSchoolId int NOT NULL,
       OldGradingPeriodSchoolYear smallint NOT NULL,
       OldGradingPeriodSequence int NOT NULL,
       OldStudentUSI int NOT NULL,
       OldStudentUniqueId nvarchar(32) NOT NULL,
       NewEducationOrganizationId int NULL,
       NewGradingPeriodDescriptorId int NULL,
       NewGradingPeriodDescriptorNamespace nvarchar(255) NULL,
       NewGradingPeriodDescriptorCodeValue nvarchar(50) NULL,
       NewGradingPeriodSchoolId int NULL,
       NewGradingPeriodSchoolYear smallint NULL,
       NewGradingPeriodSequence int NULL,
       NewStudentUSI int NULL,
       NewStudentUniqueId nvarchar(32) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_ReportCard_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_ReporterDescriptionDescriptor_TrackedChange]
(
       OldReporterDescriptionDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewReporterDescriptionDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_ReporterDescriptionDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_ResidencyStatusDescriptor_TrackedChange]
(
       OldResidencyStatusDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewResidencyStatusDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_ResidencyStatusDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_ResponseIndicatorDescriptor_TrackedChange]
(
       OldResponseIndicatorDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewResponseIndicatorDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_ResponseIndicatorDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_ResponsibilityDescriptor_TrackedChange]
(
       OldResponsibilityDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewResponsibilityDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_ResponsibilityDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_RestraintEventReasonDescriptor_TrackedChange]
(
       OldRestraintEventReasonDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewRestraintEventReasonDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_RestraintEventReasonDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_RestraintEvent_TrackedChange]
(
       OldRestraintEventIdentifier nvarchar(20) NOT NULL,
       OldSchoolId int NOT NULL,
       OldStudentUSI int NOT NULL,
       OldStudentUniqueId nvarchar(32) NOT NULL,
       NewRestraintEventIdentifier nvarchar(20) NULL,
       NewSchoolId int NULL,
       NewStudentUSI int NULL,
       NewStudentUniqueId nvarchar(32) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_RestraintEvent_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_ResultDatatypeTypeDescriptor_TrackedChange]
(
       OldResultDatatypeTypeDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewResultDatatypeTypeDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_ResultDatatypeTypeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_RetestIndicatorDescriptor_TrackedChange]
(
       OldRetestIndicatorDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewRetestIndicatorDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_RetestIndicatorDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_SchoolCategoryDescriptor_TrackedChange]
(
       OldSchoolCategoryDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewSchoolCategoryDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_SchoolCategoryDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_SchoolChoiceImplementStatusDescriptor_TrackedChange]
(
       OldSchoolChoiceImplementStatusDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewSchoolChoiceImplementStatusDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_SchoolChoiceImplementStatusDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_SchoolFoodServiceProgramServiceDescriptor_TrackedChange]
(
       OldSchoolFoodServiceProgramServiceDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewSchoolFoodServiceProgramServiceDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_SchoolFoodServiceProgramServiceDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_SchoolTypeDescriptor_TrackedChange]
(
       OldSchoolTypeDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewSchoolTypeDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_SchoolTypeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_School_TrackedChange]
(
       OldSchoolId int NOT NULL,
       NewSchoolId int NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_School_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_SectionAttendanceTakenEvent_TrackedChange]
(
       OldCalendarCode nvarchar(60) NOT NULL,
       OldDate date NOT NULL,
       OldLocalCourseCode nvarchar(60) NOT NULL,
       OldSchoolId int NOT NULL,
       OldSchoolYear smallint NOT NULL,
       OldSectionIdentifier nvarchar(255) NOT NULL,
       OldSessionName nvarchar(60) NOT NULL,
       NewCalendarCode nvarchar(60) NULL,
       NewDate date NULL,
       NewLocalCourseCode nvarchar(60) NULL,
       NewSchoolId int NULL,
       NewSchoolYear smallint NULL,
       NewSectionIdentifier nvarchar(255) NULL,
       NewSessionName nvarchar(60) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_SectionAttendanceTakenEvent_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_SectionCharacteristicDescriptor_TrackedChange]
(
       OldSectionCharacteristicDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewSectionCharacteristicDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_SectionCharacteristicDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_Section_TrackedChange]
(
       OldLocalCourseCode nvarchar(60) NOT NULL,
       OldSchoolId int NOT NULL,
       OldSchoolYear smallint NOT NULL,
       OldSectionIdentifier nvarchar(255) NOT NULL,
       OldSessionName nvarchar(60) NOT NULL,
       NewLocalCourseCode nvarchar(60) NULL,
       NewSchoolId int NULL,
       NewSchoolYear smallint NULL,
       NewSectionIdentifier nvarchar(255) NULL,
       NewSessionName nvarchar(60) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_Section_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_SeparationDescriptor_TrackedChange]
(
       OldSeparationDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewSeparationDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_SeparationDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_SeparationReasonDescriptor_TrackedChange]
(
       OldSeparationReasonDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewSeparationReasonDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_SeparationReasonDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_ServiceDescriptor_TrackedChange]
(
       OldServiceDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewServiceDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_ServiceDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_Session_TrackedChange]
(
       OldSchoolId int NOT NULL,
       OldSchoolYear smallint NOT NULL,
       OldSessionName nvarchar(60) NOT NULL,
       NewSchoolId int NULL,
       NewSchoolYear smallint NULL,
       NewSessionName nvarchar(60) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_Session_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_SexDescriptor_TrackedChange]
(
       OldSexDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewSexDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_SexDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_SpecialEducationProgramServiceDescriptor_TrackedChange]
(
       OldSpecialEducationProgramServiceDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewSpecialEducationProgramServiceDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_SpecialEducationProgramServiceDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_SpecialEducationSettingDescriptor_TrackedChange]
(
       OldSpecialEducationSettingDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewSpecialEducationSettingDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_SpecialEducationSettingDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StaffAbsenceEvent_TrackedChange]
(
       OldAbsenceEventCategoryDescriptorId int NOT NULL,
       OldAbsenceEventCategoryDescriptorNamespace nvarchar(255) NOT NULL,
       OldAbsenceEventCategoryDescriptorCodeValue nvarchar(50) NOT NULL,
       OldEventDate date NOT NULL,
       OldStaffUSI int NOT NULL,
       OldStaffUniqueId nvarchar(32) NOT NULL,
       NewAbsenceEventCategoryDescriptorId int NULL,
       NewAbsenceEventCategoryDescriptorNamespace nvarchar(255) NULL,
       NewAbsenceEventCategoryDescriptorCodeValue nvarchar(50) NULL,
       NewEventDate date NULL,
       NewStaffUSI int NULL,
       NewStaffUniqueId nvarchar(32) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_StaffAbsenceEvent_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StaffClassificationDescriptor_TrackedChange]
(
       OldStaffClassificationDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewStaffClassificationDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_StaffClassificationDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StaffCohortAssociation_TrackedChange]
(
       OldBeginDate date NOT NULL,
       OldCohortIdentifier nvarchar(20) NOT NULL,
       OldEducationOrganizationId int NOT NULL,
       OldStaffUSI int NOT NULL,
       OldStaffUniqueId nvarchar(32) NOT NULL,
       NewBeginDate date NULL,
       NewCohortIdentifier nvarchar(20) NULL,
       NewEducationOrganizationId int NULL,
       NewStaffUSI int NULL,
       NewStaffUniqueId nvarchar(32) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_StaffCohortAssociation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StaffEducationOrganizationAssignmentAssociation_TrackedChange]
(
       OldBeginDate date NOT NULL,
       OldEducationOrganizationId int NOT NULL,
       OldStaffClassificationDescriptorId int NOT NULL,
       OldStaffClassificationDescriptorNamespace nvarchar(255) NOT NULL,
       OldStaffClassificationDescriptorCodeValue nvarchar(50) NOT NULL,
       OldStaffUSI int NOT NULL,
       OldStaffUniqueId nvarchar(32) NOT NULL,
       NewBeginDate date NULL,
       NewEducationOrganizationId int NULL,
       NewStaffClassificationDescriptorId int NULL,
       NewStaffClassificationDescriptorNamespace nvarchar(255) NULL,
       NewStaffClassificationDescriptorCodeValue nvarchar(50) NULL,
       NewStaffUSI int NULL,
       NewStaffUniqueId nvarchar(32) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_StaffEducationOrganizationAssignmentAssociation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StaffEducationOrganizationContactAssociation_TrackedChange]
(
       OldContactTitle nvarchar(75) NOT NULL,
       OldEducationOrganizationId int NOT NULL,
       OldStaffUSI int NOT NULL,
       OldStaffUniqueId nvarchar(32) NOT NULL,
       NewContactTitle nvarchar(75) NULL,
       NewEducationOrganizationId int NULL,
       NewStaffUSI int NULL,
       NewStaffUniqueId nvarchar(32) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_StaffEducationOrganizationContactAssociation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StaffEducationOrganizationEmploymentAssociation_TrackedChange]
(
       OldEducationOrganizationId int NOT NULL,
       OldEmploymentStatusDescriptorId int NOT NULL,
       OldEmploymentStatusDescriptorNamespace nvarchar(255) NOT NULL,
       OldEmploymentStatusDescriptorCodeValue nvarchar(50) NOT NULL,
       OldHireDate date NOT NULL,
       OldStaffUSI int NOT NULL,
       OldStaffUniqueId nvarchar(32) NOT NULL,
       NewEducationOrganizationId int NULL,
       NewEmploymentStatusDescriptorId int NULL,
       NewEmploymentStatusDescriptorNamespace nvarchar(255) NULL,
       NewEmploymentStatusDescriptorCodeValue nvarchar(50) NULL,
       NewHireDate date NULL,
       NewStaffUSI int NULL,
       NewStaffUniqueId nvarchar(32) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_StaffEducationOrganizationEmploymentAssociation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StaffIdentificationSystemDescriptor_TrackedChange]
(
       OldStaffIdentificationSystemDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewStaffIdentificationSystemDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_StaffIdentificationSystemDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StaffLeaveEventCategoryDescriptor_TrackedChange]
(
       OldStaffLeaveEventCategoryDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewStaffLeaveEventCategoryDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_StaffLeaveEventCategoryDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StaffLeave_TrackedChange]
(
       OldBeginDate date NOT NULL,
       OldStaffLeaveEventCategoryDescriptorId int NOT NULL,
       OldStaffLeaveEventCategoryDescriptorNamespace nvarchar(255) NOT NULL,
       OldStaffLeaveEventCategoryDescriptorCodeValue nvarchar(50) NOT NULL,
       OldStaffUSI int NOT NULL,
       OldStaffUniqueId nvarchar(32) NOT NULL,
       NewBeginDate date NULL,
       NewStaffLeaveEventCategoryDescriptorId int NULL,
       NewStaffLeaveEventCategoryDescriptorNamespace nvarchar(255) NULL,
       NewStaffLeaveEventCategoryDescriptorCodeValue nvarchar(50) NULL,
       NewStaffUSI int NULL,
       NewStaffUniqueId nvarchar(32) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_StaffLeave_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StaffProgramAssociation_TrackedChange]
(
       OldBeginDate date NOT NULL,
       OldProgramEducationOrganizationId int NOT NULL,
       OldProgramName nvarchar(60) NOT NULL,
       OldProgramTypeDescriptorId int NOT NULL,
       OldProgramTypeDescriptorNamespace nvarchar(255) NOT NULL,
       OldProgramTypeDescriptorCodeValue nvarchar(50) NOT NULL,
       OldStaffUSI int NOT NULL,
       OldStaffUniqueId nvarchar(32) NOT NULL,
       NewBeginDate date NULL,
       NewProgramEducationOrganizationId int NULL,
       NewProgramName nvarchar(60) NULL,
       NewProgramTypeDescriptorId int NULL,
       NewProgramTypeDescriptorNamespace nvarchar(255) NULL,
       NewProgramTypeDescriptorCodeValue nvarchar(50) NULL,
       NewStaffUSI int NULL,
       NewStaffUniqueId nvarchar(32) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_StaffProgramAssociation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StaffSchoolAssociation_TrackedChange]
(
       OldProgramAssignmentDescriptorId int NOT NULL,
       OldProgramAssignmentDescriptorNamespace nvarchar(255) NOT NULL,
       OldProgramAssignmentDescriptorCodeValue nvarchar(50) NOT NULL,
       OldSchoolId int NOT NULL,
       OldStaffUSI int NOT NULL,
       OldStaffUniqueId nvarchar(32) NOT NULL,
       NewProgramAssignmentDescriptorId int NULL,
       NewProgramAssignmentDescriptorNamespace nvarchar(255) NULL,
       NewProgramAssignmentDescriptorCodeValue nvarchar(50) NULL,
       NewSchoolId int NULL,
       NewStaffUSI int NULL,
       NewStaffUniqueId nvarchar(32) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_StaffSchoolAssociation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StaffSectionAssociation_TrackedChange]
(
       OldLocalCourseCode nvarchar(60) NOT NULL,
       OldSchoolId int NOT NULL,
       OldSchoolYear smallint NOT NULL,
       OldSectionIdentifier nvarchar(255) NOT NULL,
       OldSessionName nvarchar(60) NOT NULL,
       OldStaffUSI int NOT NULL,
       OldStaffUniqueId nvarchar(32) NOT NULL,
       NewLocalCourseCode nvarchar(60) NULL,
       NewSchoolId int NULL,
       NewSchoolYear smallint NULL,
       NewSectionIdentifier nvarchar(255) NULL,
       NewSessionName nvarchar(60) NULL,
       NewStaffUSI int NULL,
       NewStaffUniqueId nvarchar(32) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_StaffSectionAssociation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_Staff_TrackedChange]
(
       OldStaffUSI int NOT NULL,
       OldStaffUniqueId nvarchar(32) NOT NULL,
       NewStaffUSI int NULL,
       NewStaffUniqueId nvarchar(32) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_Staff_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StateAbbreviationDescriptor_TrackedChange]
(
       OldStateAbbreviationDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewStateAbbreviationDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_StateAbbreviationDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StateEducationAgency_TrackedChange]
(
       OldStateEducationAgencyId int NOT NULL,
       NewStateEducationAgencyId int NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_StateEducationAgency_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StudentAcademicRecord_TrackedChange]
(
       OldEducationOrganizationId int NOT NULL,
       OldSchoolYear smallint NOT NULL,
       OldStudentUSI int NOT NULL,
       OldStudentUniqueId nvarchar(32) NOT NULL,
       OldTermDescriptorId int NOT NULL,
       OldTermDescriptorNamespace nvarchar(255) NOT NULL,
       OldTermDescriptorCodeValue nvarchar(50) NOT NULL,
       NewEducationOrganizationId int NULL,
       NewSchoolYear smallint NULL,
       NewStudentUSI int NULL,
       NewStudentUniqueId nvarchar(32) NULL,
       NewTermDescriptorId int NULL,
       NewTermDescriptorNamespace nvarchar(255) NULL,
       NewTermDescriptorCodeValue nvarchar(50) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_StudentAcademicRecord_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StudentAssessment_TrackedChange]
(
       OldAssessmentIdentifier nvarchar(60) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       OldStudentAssessmentIdentifier nvarchar(60) NOT NULL,
       OldStudentUSI int NOT NULL,
       OldStudentUniqueId nvarchar(32) NOT NULL,
       NewAssessmentIdentifier nvarchar(60) NULL,
       NewNamespace nvarchar(255) NULL,
       NewStudentAssessmentIdentifier nvarchar(60) NULL,
       NewStudentUSI int NULL,
       NewStudentUniqueId nvarchar(32) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_StudentAssessment_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StudentCTEProgramAssociation_TrackedChange]
(
       OldBeginDate date NOT NULL,
       OldEducationOrganizationId int NOT NULL,
       OldProgramEducationOrganizationId int NOT NULL,
       OldProgramName nvarchar(60) NOT NULL,
       OldProgramTypeDescriptorId int NOT NULL,
       OldProgramTypeDescriptorNamespace nvarchar(255) NOT NULL,
       OldProgramTypeDescriptorCodeValue nvarchar(50) NOT NULL,
       OldStudentUSI int NOT NULL,
       OldStudentUniqueId nvarchar(32) NOT NULL,
       NewBeginDate date NULL,
       NewEducationOrganizationId int NULL,
       NewProgramEducationOrganizationId int NULL,
       NewProgramName nvarchar(60) NULL,
       NewProgramTypeDescriptorId int NULL,
       NewProgramTypeDescriptorNamespace nvarchar(255) NULL,
       NewProgramTypeDescriptorCodeValue nvarchar(50) NULL,
       NewStudentUSI int NULL,
       NewStudentUniqueId nvarchar(32) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_StudentCTEProgramAssociation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StudentCharacteristicDescriptor_TrackedChange]
(
       OldStudentCharacteristicDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewStudentCharacteristicDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_StudentCharacteristicDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StudentCohortAssociation_TrackedChange]
(
       OldBeginDate date NOT NULL,
       OldCohortIdentifier nvarchar(20) NOT NULL,
       OldEducationOrganizationId int NOT NULL,
       OldStudentUSI int NOT NULL,
       OldStudentUniqueId nvarchar(32) NOT NULL,
       NewBeginDate date NULL,
       NewCohortIdentifier nvarchar(20) NULL,
       NewEducationOrganizationId int NULL,
       NewStudentUSI int NULL,
       NewStudentUniqueId nvarchar(32) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_StudentCohortAssociation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StudentCompetencyObjective_TrackedChange]
(
       OldGradingPeriodDescriptorId int NOT NULL,
       OldGradingPeriodDescriptorNamespace nvarchar(255) NOT NULL,
       OldGradingPeriodDescriptorCodeValue nvarchar(50) NOT NULL,
       OldGradingPeriodSchoolId int NOT NULL,
       OldGradingPeriodSchoolYear smallint NOT NULL,
       OldGradingPeriodSequence int NOT NULL,
       OldObjective nvarchar(60) NOT NULL,
       OldObjectiveEducationOrganizationId int NOT NULL,
       OldObjectiveGradeLevelDescriptorId int NOT NULL,
       OldObjectiveGradeLevelDescriptorNamespace nvarchar(255) NOT NULL,
       OldObjectiveGradeLevelDescriptorCodeValue nvarchar(50) NOT NULL,
       OldStudentUSI int NOT NULL,
       OldStudentUniqueId nvarchar(32) NOT NULL,
       NewGradingPeriodDescriptorId int NULL,
       NewGradingPeriodDescriptorNamespace nvarchar(255) NULL,
       NewGradingPeriodDescriptorCodeValue nvarchar(50) NULL,
       NewGradingPeriodSchoolId int NULL,
       NewGradingPeriodSchoolYear smallint NULL,
       NewGradingPeriodSequence int NULL,
       NewObjective nvarchar(60) NULL,
       NewObjectiveEducationOrganizationId int NULL,
       NewObjectiveGradeLevelDescriptorId int NULL,
       NewObjectiveGradeLevelDescriptorNamespace nvarchar(255) NULL,
       NewObjectiveGradeLevelDescriptorCodeValue nvarchar(50) NULL,
       NewStudentUSI int NULL,
       NewStudentUniqueId nvarchar(32) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_StudentCompetencyObjective_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StudentDisciplineIncidentAssociation_TrackedChange]
(
       OldIncidentIdentifier nvarchar(20) NOT NULL,
       OldSchoolId int NOT NULL,
       OldStudentUSI int NOT NULL,
       OldStudentUniqueId nvarchar(32) NOT NULL,
       NewIncidentIdentifier nvarchar(20) NULL,
       NewSchoolId int NULL,
       NewStudentUSI int NULL,
       NewStudentUniqueId nvarchar(32) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_StudentDisciplineIncidentAssociation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StudentEducationOrganizationAssociation_TrackedChange]
(
       OldEducationOrganizationId int NOT NULL,
       OldStudentUSI int NOT NULL,
       OldStudentUniqueId nvarchar(32) NOT NULL,
       NewEducationOrganizationId int NULL,
       NewStudentUSI int NULL,
       NewStudentUniqueId nvarchar(32) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_StudentEducationOrganizationAssociation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StudentEducationOrganizationResponsibilityAssociation_TrackedChange]
(
       OldBeginDate date NOT NULL,
       OldEducationOrganizationId int NOT NULL,
       OldResponsibilityDescriptorId int NOT NULL,
       OldResponsibilityDescriptorNamespace nvarchar(255) NOT NULL,
       OldResponsibilityDescriptorCodeValue nvarchar(50) NOT NULL,
       OldStudentUSI int NOT NULL,
       OldStudentUniqueId nvarchar(32) NOT NULL,
       NewBeginDate date NULL,
       NewEducationOrganizationId int NULL,
       NewResponsibilityDescriptorId int NULL,
       NewResponsibilityDescriptorNamespace nvarchar(255) NULL,
       NewResponsibilityDescriptorCodeValue nvarchar(50) NULL,
       NewStudentUSI int NULL,
       NewStudentUniqueId nvarchar(32) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_StudentEducationOrganizationResponsibilityAssociation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StudentGradebookEntry_TrackedChange]
(
       OldBeginDate date NOT NULL,
       OldDateAssigned date NOT NULL,
       OldGradebookEntryTitle nvarchar(60) NOT NULL,
       OldLocalCourseCode nvarchar(60) NOT NULL,
       OldSchoolId int NOT NULL,
       OldSchoolYear smallint NOT NULL,
       OldSectionIdentifier nvarchar(255) NOT NULL,
       OldSessionName nvarchar(60) NOT NULL,
       OldStudentUSI int NOT NULL,
       OldStudentUniqueId nvarchar(32) NOT NULL,
       NewBeginDate date NULL,
       NewDateAssigned date NULL,
       NewGradebookEntryTitle nvarchar(60) NULL,
       NewLocalCourseCode nvarchar(60) NULL,
       NewSchoolId int NULL,
       NewSchoolYear smallint NULL,
       NewSectionIdentifier nvarchar(255) NULL,
       NewSessionName nvarchar(60) NULL,
       NewStudentUSI int NULL,
       NewStudentUniqueId nvarchar(32) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_StudentGradebookEntry_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StudentHomelessProgramAssociation_TrackedChange]
(
       OldBeginDate date NOT NULL,
       OldEducationOrganizationId int NOT NULL,
       OldProgramEducationOrganizationId int NOT NULL,
       OldProgramName nvarchar(60) NOT NULL,
       OldProgramTypeDescriptorId int NOT NULL,
       OldProgramTypeDescriptorNamespace nvarchar(255) NOT NULL,
       OldProgramTypeDescriptorCodeValue nvarchar(50) NOT NULL,
       OldStudentUSI int NOT NULL,
       OldStudentUniqueId nvarchar(32) NOT NULL,
       NewBeginDate date NULL,
       NewEducationOrganizationId int NULL,
       NewProgramEducationOrganizationId int NULL,
       NewProgramName nvarchar(60) NULL,
       NewProgramTypeDescriptorId int NULL,
       NewProgramTypeDescriptorNamespace nvarchar(255) NULL,
       NewProgramTypeDescriptorCodeValue nvarchar(50) NULL,
       NewStudentUSI int NULL,
       NewStudentUniqueId nvarchar(32) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_StudentHomelessProgramAssociation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StudentIdentificationSystemDescriptor_TrackedChange]
(
       OldStudentIdentificationSystemDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewStudentIdentificationSystemDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_StudentIdentificationSystemDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StudentInterventionAssociation_TrackedChange]
(
       OldEducationOrganizationId int NOT NULL,
       OldInterventionIdentificationCode nvarchar(60) NOT NULL,
       OldStudentUSI int NOT NULL,
       OldStudentUniqueId nvarchar(32) NOT NULL,
       NewEducationOrganizationId int NULL,
       NewInterventionIdentificationCode nvarchar(60) NULL,
       NewStudentUSI int NULL,
       NewStudentUniqueId nvarchar(32) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_StudentInterventionAssociation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StudentInterventionAttendanceEvent_TrackedChange]
(
       OldAttendanceEventCategoryDescriptorId int NOT NULL,
       OldAttendanceEventCategoryDescriptorNamespace nvarchar(255) NOT NULL,
       OldAttendanceEventCategoryDescriptorCodeValue nvarchar(50) NOT NULL,
       OldEducationOrganizationId int NOT NULL,
       OldEventDate date NOT NULL,
       OldInterventionIdentificationCode nvarchar(60) NOT NULL,
       OldStudentUSI int NOT NULL,
       OldStudentUniqueId nvarchar(32) NOT NULL,
       NewAttendanceEventCategoryDescriptorId int NULL,
       NewAttendanceEventCategoryDescriptorNamespace nvarchar(255) NULL,
       NewAttendanceEventCategoryDescriptorCodeValue nvarchar(50) NULL,
       NewEducationOrganizationId int NULL,
       NewEventDate date NULL,
       NewInterventionIdentificationCode nvarchar(60) NULL,
       NewStudentUSI int NULL,
       NewStudentUniqueId nvarchar(32) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_StudentInterventionAttendanceEvent_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StudentLanguageInstructionProgramAssociation_TrackedChange]
(
       OldBeginDate date NOT NULL,
       OldEducationOrganizationId int NOT NULL,
       OldProgramEducationOrganizationId int NOT NULL,
       OldProgramName nvarchar(60) NOT NULL,
       OldProgramTypeDescriptorId int NOT NULL,
       OldProgramTypeDescriptorNamespace nvarchar(255) NOT NULL,
       OldProgramTypeDescriptorCodeValue nvarchar(50) NOT NULL,
       OldStudentUSI int NOT NULL,
       OldStudentUniqueId nvarchar(32) NOT NULL,
       NewBeginDate date NULL,
       NewEducationOrganizationId int NULL,
       NewProgramEducationOrganizationId int NULL,
       NewProgramName nvarchar(60) NULL,
       NewProgramTypeDescriptorId int NULL,
       NewProgramTypeDescriptorNamespace nvarchar(255) NULL,
       NewProgramTypeDescriptorCodeValue nvarchar(50) NULL,
       NewStudentUSI int NULL,
       NewStudentUniqueId nvarchar(32) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_StudentLanguageInstructionProgramAssociation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StudentLearningObjective_TrackedChange]
(
       OldGradingPeriodDescriptorId int NOT NULL,
       OldGradingPeriodDescriptorNamespace nvarchar(255) NOT NULL,
       OldGradingPeriodDescriptorCodeValue nvarchar(50) NOT NULL,
       OldGradingPeriodSchoolId int NOT NULL,
       OldGradingPeriodSchoolYear smallint NOT NULL,
       OldGradingPeriodSequence int NOT NULL,
       OldLearningObjectiveId nvarchar(60) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       OldStudentUSI int NOT NULL,
       OldStudentUniqueId nvarchar(32) NOT NULL,
       NewGradingPeriodDescriptorId int NULL,
       NewGradingPeriodDescriptorNamespace nvarchar(255) NULL,
       NewGradingPeriodDescriptorCodeValue nvarchar(50) NULL,
       NewGradingPeriodSchoolId int NULL,
       NewGradingPeriodSchoolYear smallint NULL,
       NewGradingPeriodSequence int NULL,
       NewLearningObjectiveId nvarchar(60) NULL,
       NewNamespace nvarchar(255) NULL,
       NewStudentUSI int NULL,
       NewStudentUniqueId nvarchar(32) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_StudentLearningObjective_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StudentMigrantEducationProgramAssociation_TrackedChange]
(
       OldBeginDate date NOT NULL,
       OldEducationOrganizationId int NOT NULL,
       OldProgramEducationOrganizationId int NOT NULL,
       OldProgramName nvarchar(60) NOT NULL,
       OldProgramTypeDescriptorId int NOT NULL,
       OldProgramTypeDescriptorNamespace nvarchar(255) NOT NULL,
       OldProgramTypeDescriptorCodeValue nvarchar(50) NOT NULL,
       OldStudentUSI int NOT NULL,
       OldStudentUniqueId nvarchar(32) NOT NULL,
       NewBeginDate date NULL,
       NewEducationOrganizationId int NULL,
       NewProgramEducationOrganizationId int NULL,
       NewProgramName nvarchar(60) NULL,
       NewProgramTypeDescriptorId int NULL,
       NewProgramTypeDescriptorNamespace nvarchar(255) NULL,
       NewProgramTypeDescriptorCodeValue nvarchar(50) NULL,
       NewStudentUSI int NULL,
       NewStudentUniqueId nvarchar(32) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_StudentMigrantEducationProgramAssociation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StudentNeglectedOrDelinquentProgramAssociation_TrackedChange]
(
       OldBeginDate date NOT NULL,
       OldEducationOrganizationId int NOT NULL,
       OldProgramEducationOrganizationId int NOT NULL,
       OldProgramName nvarchar(60) NOT NULL,
       OldProgramTypeDescriptorId int NOT NULL,
       OldProgramTypeDescriptorNamespace nvarchar(255) NOT NULL,
       OldProgramTypeDescriptorCodeValue nvarchar(50) NOT NULL,
       OldStudentUSI int NOT NULL,
       OldStudentUniqueId nvarchar(32) NOT NULL,
       NewBeginDate date NULL,
       NewEducationOrganizationId int NULL,
       NewProgramEducationOrganizationId int NULL,
       NewProgramName nvarchar(60) NULL,
       NewProgramTypeDescriptorId int NULL,
       NewProgramTypeDescriptorNamespace nvarchar(255) NULL,
       NewProgramTypeDescriptorCodeValue nvarchar(50) NULL,
       NewStudentUSI int NULL,
       NewStudentUniqueId nvarchar(32) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_StudentNeglectedOrDelinquentProgramAssociation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StudentParentAssociation_TrackedChange]
(
       OldParentUSI int NOT NULL,
       OldParentUniqueId nvarchar(32) NOT NULL,
       OldStudentUSI int NOT NULL,
       OldStudentUniqueId nvarchar(32) NOT NULL,
       NewParentUSI int NULL,
       NewParentUniqueId nvarchar(32) NULL,
       NewStudentUSI int NULL,
       NewStudentUniqueId nvarchar(32) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_StudentParentAssociation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StudentParticipationCodeDescriptor_TrackedChange]
(
       OldStudentParticipationCodeDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewStudentParticipationCodeDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_StudentParticipationCodeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StudentProgramAssociation_TrackedChange]
(
       OldBeginDate date NOT NULL,
       OldEducationOrganizationId int NOT NULL,
       OldProgramEducationOrganizationId int NOT NULL,
       OldProgramName nvarchar(60) NOT NULL,
       OldProgramTypeDescriptorId int NOT NULL,
       OldProgramTypeDescriptorNamespace nvarchar(255) NOT NULL,
       OldProgramTypeDescriptorCodeValue nvarchar(50) NOT NULL,
       OldStudentUSI int NOT NULL,
       OldStudentUniqueId nvarchar(32) NOT NULL,
       NewBeginDate date NULL,
       NewEducationOrganizationId int NULL,
       NewProgramEducationOrganizationId int NULL,
       NewProgramName nvarchar(60) NULL,
       NewProgramTypeDescriptorId int NULL,
       NewProgramTypeDescriptorNamespace nvarchar(255) NULL,
       NewProgramTypeDescriptorCodeValue nvarchar(50) NULL,
       NewStudentUSI int NULL,
       NewStudentUniqueId nvarchar(32) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_StudentProgramAssociation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StudentProgramAttendanceEvent_TrackedChange]
(
       OldAttendanceEventCategoryDescriptorId int NOT NULL,
       OldAttendanceEventCategoryDescriptorNamespace nvarchar(255) NOT NULL,
       OldAttendanceEventCategoryDescriptorCodeValue nvarchar(50) NOT NULL,
       OldEducationOrganizationId int NOT NULL,
       OldEventDate date NOT NULL,
       OldProgramEducationOrganizationId int NOT NULL,
       OldProgramName nvarchar(60) NOT NULL,
       OldProgramTypeDescriptorId int NOT NULL,
       OldProgramTypeDescriptorNamespace nvarchar(255) NOT NULL,
       OldProgramTypeDescriptorCodeValue nvarchar(50) NOT NULL,
       OldStudentUSI int NOT NULL,
       OldStudentUniqueId nvarchar(32) NOT NULL,
       NewAttendanceEventCategoryDescriptorId int NULL,
       NewAttendanceEventCategoryDescriptorNamespace nvarchar(255) NULL,
       NewAttendanceEventCategoryDescriptorCodeValue nvarchar(50) NULL,
       NewEducationOrganizationId int NULL,
       NewEventDate date NULL,
       NewProgramEducationOrganizationId int NULL,
       NewProgramName nvarchar(60) NULL,
       NewProgramTypeDescriptorId int NULL,
       NewProgramTypeDescriptorNamespace nvarchar(255) NULL,
       NewProgramTypeDescriptorCodeValue nvarchar(50) NULL,
       NewStudentUSI int NULL,
       NewStudentUniqueId nvarchar(32) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_StudentProgramAttendanceEvent_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StudentSchoolAssociation_TrackedChange]
(
       OldEntryDate date NOT NULL,
       OldSchoolId int NOT NULL,
       OldStudentUSI int NOT NULL,
       OldStudentUniqueId nvarchar(32) NOT NULL,
       NewEntryDate date NULL,
       NewSchoolId int NULL,
       NewStudentUSI int NULL,
       NewStudentUniqueId nvarchar(32) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_StudentSchoolAssociation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StudentSchoolAttendanceEvent_TrackedChange]
(
       OldAttendanceEventCategoryDescriptorId int NOT NULL,
       OldAttendanceEventCategoryDescriptorNamespace nvarchar(255) NOT NULL,
       OldAttendanceEventCategoryDescriptorCodeValue nvarchar(50) NOT NULL,
       OldEventDate date NOT NULL,
       OldSchoolId int NOT NULL,
       OldSchoolYear smallint NOT NULL,
       OldSessionName nvarchar(60) NOT NULL,
       OldStudentUSI int NOT NULL,
       OldStudentUniqueId nvarchar(32) NOT NULL,
       NewAttendanceEventCategoryDescriptorId int NULL,
       NewAttendanceEventCategoryDescriptorNamespace nvarchar(255) NULL,
       NewAttendanceEventCategoryDescriptorCodeValue nvarchar(50) NULL,
       NewEventDate date NULL,
       NewSchoolId int NULL,
       NewSchoolYear smallint NULL,
       NewSessionName nvarchar(60) NULL,
       NewStudentUSI int NULL,
       NewStudentUniqueId nvarchar(32) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_StudentSchoolAttendanceEvent_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StudentSchoolFoodServiceProgramAssociation_TrackedChange]
(
       OldBeginDate date NOT NULL,
       OldEducationOrganizationId int NOT NULL,
       OldProgramEducationOrganizationId int NOT NULL,
       OldProgramName nvarchar(60) NOT NULL,
       OldProgramTypeDescriptorId int NOT NULL,
       OldProgramTypeDescriptorNamespace nvarchar(255) NOT NULL,
       OldProgramTypeDescriptorCodeValue nvarchar(50) NOT NULL,
       OldStudentUSI int NOT NULL,
       OldStudentUniqueId nvarchar(32) NOT NULL,
       NewBeginDate date NULL,
       NewEducationOrganizationId int NULL,
       NewProgramEducationOrganizationId int NULL,
       NewProgramName nvarchar(60) NULL,
       NewProgramTypeDescriptorId int NULL,
       NewProgramTypeDescriptorNamespace nvarchar(255) NULL,
       NewProgramTypeDescriptorCodeValue nvarchar(50) NULL,
       NewStudentUSI int NULL,
       NewStudentUniqueId nvarchar(32) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_StudentSchoolFoodServiceProgramAssociation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StudentSectionAssociation_TrackedChange]
(
       OldBeginDate date NOT NULL,
       OldLocalCourseCode nvarchar(60) NOT NULL,
       OldSchoolId int NOT NULL,
       OldSchoolYear smallint NOT NULL,
       OldSectionIdentifier nvarchar(255) NOT NULL,
       OldSessionName nvarchar(60) NOT NULL,
       OldStudentUSI int NOT NULL,
       OldStudentUniqueId nvarchar(32) NOT NULL,
       NewBeginDate date NULL,
       NewLocalCourseCode nvarchar(60) NULL,
       NewSchoolId int NULL,
       NewSchoolYear smallint NULL,
       NewSectionIdentifier nvarchar(255) NULL,
       NewSessionName nvarchar(60) NULL,
       NewStudentUSI int NULL,
       NewStudentUniqueId nvarchar(32) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_StudentSectionAssociation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StudentSectionAttendanceEvent_TrackedChange]
(
       OldAttendanceEventCategoryDescriptorId int NOT NULL,
       OldAttendanceEventCategoryDescriptorNamespace nvarchar(255) NOT NULL,
       OldAttendanceEventCategoryDescriptorCodeValue nvarchar(50) NOT NULL,
       OldEventDate date NOT NULL,
       OldLocalCourseCode nvarchar(60) NOT NULL,
       OldSchoolId int NOT NULL,
       OldSchoolYear smallint NOT NULL,
       OldSectionIdentifier nvarchar(255) NOT NULL,
       OldSessionName nvarchar(60) NOT NULL,
       OldStudentUSI int NOT NULL,
       OldStudentUniqueId nvarchar(32) NOT NULL,
       NewAttendanceEventCategoryDescriptorId int NULL,
       NewAttendanceEventCategoryDescriptorNamespace nvarchar(255) NULL,
       NewAttendanceEventCategoryDescriptorCodeValue nvarchar(50) NULL,
       NewEventDate date NULL,
       NewLocalCourseCode nvarchar(60) NULL,
       NewSchoolId int NULL,
       NewSchoolYear smallint NULL,
       NewSectionIdentifier nvarchar(255) NULL,
       NewSessionName nvarchar(60) NULL,
       NewStudentUSI int NULL,
       NewStudentUniqueId nvarchar(32) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_StudentSectionAttendanceEvent_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StudentSpecialEducationProgramAssociation_TrackedChange]
(
       OldBeginDate date NOT NULL,
       OldEducationOrganizationId int NOT NULL,
       OldProgramEducationOrganizationId int NOT NULL,
       OldProgramName nvarchar(60) NOT NULL,
       OldProgramTypeDescriptorId int NOT NULL,
       OldProgramTypeDescriptorNamespace nvarchar(255) NOT NULL,
       OldProgramTypeDescriptorCodeValue nvarchar(50) NOT NULL,
       OldStudentUSI int NOT NULL,
       OldStudentUniqueId nvarchar(32) NOT NULL,
       NewBeginDate date NULL,
       NewEducationOrganizationId int NULL,
       NewProgramEducationOrganizationId int NULL,
       NewProgramName nvarchar(60) NULL,
       NewProgramTypeDescriptorId int NULL,
       NewProgramTypeDescriptorNamespace nvarchar(255) NULL,
       NewProgramTypeDescriptorCodeValue nvarchar(50) NULL,
       NewStudentUSI int NULL,
       NewStudentUniqueId nvarchar(32) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_StudentSpecialEducationProgramAssociation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_StudentTitleIPartAProgramAssociation_TrackedChange]
(
       OldBeginDate date NOT NULL,
       OldEducationOrganizationId int NOT NULL,
       OldProgramEducationOrganizationId int NOT NULL,
       OldProgramName nvarchar(60) NOT NULL,
       OldProgramTypeDescriptorId int NOT NULL,
       OldProgramTypeDescriptorNamespace nvarchar(255) NOT NULL,
       OldProgramTypeDescriptorCodeValue nvarchar(50) NOT NULL,
       OldStudentUSI int NOT NULL,
       OldStudentUniqueId nvarchar(32) NOT NULL,
       NewBeginDate date NULL,
       NewEducationOrganizationId int NULL,
       NewProgramEducationOrganizationId int NULL,
       NewProgramName nvarchar(60) NULL,
       NewProgramTypeDescriptorId int NULL,
       NewProgramTypeDescriptorNamespace nvarchar(255) NULL,
       NewProgramTypeDescriptorCodeValue nvarchar(50) NULL,
       NewStudentUSI int NULL,
       NewStudentUniqueId nvarchar(32) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_StudentTitleIPartAProgramAssociation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_Student_TrackedChange]
(
       OldStudentUSI int NOT NULL,
       OldStudentUniqueId nvarchar(32) NOT NULL,
       NewStudentUSI int NULL,
       NewStudentUniqueId nvarchar(32) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_edfi_Student_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_TeachingCredentialBasisDescriptor_TrackedChange]
(
       OldTeachingCredentialBasisDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewTeachingCredentialBasisDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_TeachingCredentialBasisDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_TeachingCredentialDescriptor_TrackedChange]
(
       OldTeachingCredentialDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewTeachingCredentialDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_TeachingCredentialDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_TechnicalSkillsAssessmentDescriptor_TrackedChange]
(
       OldTechnicalSkillsAssessmentDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewTechnicalSkillsAssessmentDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_TechnicalSkillsAssessmentDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_TelephoneNumberTypeDescriptor_TrackedChange]
(
       OldTelephoneNumberTypeDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewTelephoneNumberTypeDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_TelephoneNumberTypeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_TermDescriptor_TrackedChange]
(
       OldTermDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewTermDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_TermDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_TitleIPartAParticipantDescriptor_TrackedChange]
(
       OldTitleIPartAParticipantDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewTitleIPartAParticipantDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_TitleIPartAParticipantDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_TitleIPartASchoolDesignationDescriptor_TrackedChange]
(
       OldTitleIPartASchoolDesignationDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewTitleIPartASchoolDesignationDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_TitleIPartASchoolDesignationDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_TribalAffiliationDescriptor_TrackedChange]
(
       OldTribalAffiliationDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewTribalAffiliationDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_TribalAffiliationDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_VisaDescriptor_TrackedChange]
(
       OldVisaDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewVisaDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_VisaDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfi_WeaponDescriptor_TrackedChange]
(
       OldWeaponDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewWeaponDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfi_WeaponDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

