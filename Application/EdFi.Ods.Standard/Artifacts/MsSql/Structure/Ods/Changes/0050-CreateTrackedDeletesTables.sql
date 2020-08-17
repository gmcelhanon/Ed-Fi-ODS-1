-- SPDX-License-Identifier: Apache-2.0
-- Licensed to the Ed-Fi Alliance under one or more agreements.
-- The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
-- See the LICENSE and NOTICES files in the project root for more information.

CREATE TABLE [tracked_deletes_edfi].[AbsenceEventCategoryDescriptor]
(
       OldAbsenceEventCategoryDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewAbsenceEventCategoryDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_AbsenceEventCategoryDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[AcademicHonorCategoryDescriptor]
(
       OldAcademicHonorCategoryDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewAcademicHonorCategoryDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_AcademicHonorCategoryDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[AcademicSubjectDescriptor]
(
       OldAcademicSubjectDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewAcademicSubjectDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_AcademicSubjectDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[AcademicWeek]
(
       OldSchoolId int NOT NULL,
       OldWeekIdentifier nvarchar(80) NOT NULL,
       NewSchoolId int NULL,
       NewWeekIdentifier nvarchar(80) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_AcademicWeek PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[AccommodationDescriptor]
(
       OldAccommodationDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewAccommodationDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_AccommodationDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[AccountClassificationDescriptor]
(
       OldAccountClassificationDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewAccountClassificationDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_AccountClassificationDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[AccountCode]
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
       CONSTRAINT PK_AccountCode PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[Account]
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
       CONSTRAINT PK_Account PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[AccountabilityRating]
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
       CONSTRAINT PK_AccountabilityRating PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[AchievementCategoryDescriptor]
(
       OldAchievementCategoryDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewAchievementCategoryDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_AchievementCategoryDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[Actual]
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
       CONSTRAINT PK_Actual PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[AdditionalCreditTypeDescriptor]
(
       OldAdditionalCreditTypeDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewAdditionalCreditTypeDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_AdditionalCreditTypeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[AddressTypeDescriptor]
(
       OldAddressTypeDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewAddressTypeDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_AddressTypeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[AdministrationEnvironmentDescriptor]
(
       OldAdministrationEnvironmentDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewAdministrationEnvironmentDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_AdministrationEnvironmentDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[AdministrativeFundingControlDescriptor]
(
       OldAdministrativeFundingControlDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewAdministrativeFundingControlDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_AdministrativeFundingControlDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[AssessmentCategoryDescriptor]
(
       OldAssessmentCategoryDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewAssessmentCategoryDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_AssessmentCategoryDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[AssessmentIdentificationSystemDescriptor]
(
       OldAssessmentIdentificationSystemDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewAssessmentIdentificationSystemDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_AssessmentIdentificationSystemDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[AssessmentItemCategoryDescriptor]
(
       OldAssessmentItemCategoryDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewAssessmentItemCategoryDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_AssessmentItemCategoryDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[AssessmentItemResultDescriptor]
(
       OldAssessmentItemResultDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewAssessmentItemResultDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_AssessmentItemResultDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[AssessmentItem]
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
       CONSTRAINT PK_AssessmentItem PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[AssessmentPeriodDescriptor]
(
       OldAssessmentPeriodDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewAssessmentPeriodDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_AssessmentPeriodDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[AssessmentReportingMethodDescriptor]
(
       OldAssessmentReportingMethodDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewAssessmentReportingMethodDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_AssessmentReportingMethodDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[Assessment]
(
       OldAssessmentIdentifier nvarchar(60) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewAssessmentIdentifier nvarchar(60) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_Assessment PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[AttemptStatusDescriptor]
(
       OldAttemptStatusDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewAttemptStatusDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_AttemptStatusDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[AttendanceEventCategoryDescriptor]
(
       OldAttendanceEventCategoryDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewAttendanceEventCategoryDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_AttendanceEventCategoryDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[BehaviorDescriptor]
(
       OldBehaviorDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewBehaviorDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_BehaviorDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[BellSchedule]
(
       OldBellScheduleName nvarchar(60) NOT NULL,
       OldSchoolId int NOT NULL,
       NewBellScheduleName nvarchar(60) NULL,
       NewSchoolId int NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_BellSchedule PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[Budget]
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
       CONSTRAINT PK_Budget PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[CTEProgramServiceDescriptor]
(
       OldCTEProgramServiceDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewCTEProgramServiceDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_CTEProgramServiceDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[CalendarDate]
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
       CONSTRAINT PK_CalendarDate PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[CalendarEventDescriptor]
(
       OldCalendarEventDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewCalendarEventDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_CalendarEventDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[CalendarTypeDescriptor]
(
       OldCalendarTypeDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewCalendarTypeDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_CalendarTypeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[Calendar]
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
       CONSTRAINT PK_Calendar PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[CareerPathwayDescriptor]
(
       OldCareerPathwayDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewCareerPathwayDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_CareerPathwayDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[CharterApprovalAgencyTypeDescriptor]
(
       OldCharterApprovalAgencyTypeDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewCharterApprovalAgencyTypeDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_CharterApprovalAgencyTypeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[CharterStatusDescriptor]
(
       OldCharterStatusDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewCharterStatusDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_CharterStatusDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[CitizenshipStatusDescriptor]
(
       OldCitizenshipStatusDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewCitizenshipStatusDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_CitizenshipStatusDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[ClassPeriod]
(
       OldClassPeriodName nvarchar(60) NOT NULL,
       OldSchoolId int NOT NULL,
       NewClassPeriodName nvarchar(60) NULL,
       NewSchoolId int NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_ClassPeriod PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[ClassroomPositionDescriptor]
(
       OldClassroomPositionDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewClassroomPositionDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_ClassroomPositionDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[CohortScopeDescriptor]
(
       OldCohortScopeDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewCohortScopeDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_CohortScopeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[CohortTypeDescriptor]
(
       OldCohortTypeDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewCohortTypeDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_CohortTypeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[CohortYearTypeDescriptor]
(
       OldCohortYearTypeDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewCohortYearTypeDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_CohortYearTypeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[Cohort]
(
       OldCohortIdentifier nvarchar(20) NOT NULL,
       OldEducationOrganizationId int NOT NULL,
       NewCohortIdentifier nvarchar(20) NULL,
       NewEducationOrganizationId int NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_Cohort PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[CommunityOrganization]
(
       OldCommunityOrganizationId int NOT NULL,
       NewCommunityOrganizationId int NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_CommunityOrganization PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[CommunityProviderLicense]
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
       CONSTRAINT PK_CommunityProviderLicense PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[CommunityProvider]
(
       OldCommunityProviderId int NOT NULL,
       NewCommunityProviderId int NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_CommunityProvider PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[CompetencyLevelDescriptor]
(
       OldCompetencyLevelDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewCompetencyLevelDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_CompetencyLevelDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[CompetencyObjective]
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
       CONSTRAINT PK_CompetencyObjective PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[ContactTypeDescriptor]
(
       OldContactTypeDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewContactTypeDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_ContactTypeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[ContentClassDescriptor]
(
       OldContentClassDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewContentClassDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_ContentClassDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[ContinuationOfServicesReasonDescriptor]
(
       OldContinuationOfServicesReasonDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewContinuationOfServicesReasonDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_ContinuationOfServicesReasonDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[ContractedStaff]
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
       CONSTRAINT PK_ContractedStaff PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[CostRateDescriptor]
(
       OldCostRateDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewCostRateDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_CostRateDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[CountryDescriptor]
(
       OldCountryDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewCountryDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_CountryDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[CourseAttemptResultDescriptor]
(
       OldCourseAttemptResultDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewCourseAttemptResultDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_CourseAttemptResultDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[CourseDefinedByDescriptor]
(
       OldCourseDefinedByDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewCourseDefinedByDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_CourseDefinedByDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[CourseGPAApplicabilityDescriptor]
(
       OldCourseGPAApplicabilityDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewCourseGPAApplicabilityDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_CourseGPAApplicabilityDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[CourseIdentificationSystemDescriptor]
(
       OldCourseIdentificationSystemDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewCourseIdentificationSystemDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_CourseIdentificationSystemDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[CourseLevelCharacteristicDescriptor]
(
       OldCourseLevelCharacteristicDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewCourseLevelCharacteristicDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_CourseLevelCharacteristicDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[CourseOffering]
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
       CONSTRAINT PK_CourseOffering PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[CourseRepeatCodeDescriptor]
(
       OldCourseRepeatCodeDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewCourseRepeatCodeDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_CourseRepeatCodeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[CourseTranscript]
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
       CONSTRAINT PK_CourseTranscript PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[Course]
(
       OldCourseCode nvarchar(60) NOT NULL,
       OldEducationOrganizationId int NOT NULL,
       NewCourseCode nvarchar(60) NULL,
       NewEducationOrganizationId int NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_Course PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[CredentialFieldDescriptor]
(
       OldCredentialFieldDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewCredentialFieldDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_CredentialFieldDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[CredentialTypeDescriptor]
(
       OldCredentialTypeDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewCredentialTypeDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_CredentialTypeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[Credential]
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
       CONSTRAINT PK_Credential PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[CreditCategoryDescriptor]
(
       OldCreditCategoryDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewCreditCategoryDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_CreditCategoryDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[CreditTypeDescriptor]
(
       OldCreditTypeDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewCreditTypeDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_CreditTypeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[CurriculumUsedDescriptor]
(
       OldCurriculumUsedDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewCurriculumUsedDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_CurriculumUsedDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[DeliveryMethodDescriptor]
(
       OldDeliveryMethodDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewDeliveryMethodDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_DeliveryMethodDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[Descriptor]
(
       OldDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_Descriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[DiagnosisDescriptor]
(
       OldDiagnosisDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewDiagnosisDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_DiagnosisDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[DiplomaLevelDescriptor]
(
       OldDiplomaLevelDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewDiplomaLevelDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_DiplomaLevelDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[DiplomaTypeDescriptor]
(
       OldDiplomaTypeDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewDiplomaTypeDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_DiplomaTypeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[DisabilityDescriptor]
(
       OldDisabilityDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewDisabilityDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_DisabilityDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[DisabilityDesignationDescriptor]
(
       OldDisabilityDesignationDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewDisabilityDesignationDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_DisabilityDesignationDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[DisabilityDeterminationSourceTypeDescriptor]
(
       OldDisabilityDeterminationSourceTypeDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewDisabilityDeterminationSourceTypeDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_DisabilityDeterminationSourceTypeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[DisciplineActionLengthDifferenceReasonDescriptor]
(
       OldDisciplineActionLengthDifferenceReasonDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewDisciplineActionLengthDifferenceReasonDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_DisciplineActionLengthDifferenceReasonDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[DisciplineAction]
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
       CONSTRAINT PK_DisciplineAction PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[DisciplineDescriptor]
(
       OldDisciplineDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewDisciplineDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_DisciplineDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[DisciplineIncidentParticipationCodeDescriptor]
(
       OldDisciplineIncidentParticipationCodeDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewDisciplineIncidentParticipationCodeDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_DisciplineIncidentParticipationCodeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[DisciplineIncident]
(
       OldIncidentIdentifier nvarchar(20) NOT NULL,
       OldSchoolId int NOT NULL,
       NewIncidentIdentifier nvarchar(20) NULL,
       NewSchoolId int NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_DisciplineIncident PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[EducationContent]
(
       OldContentIdentifier nvarchar(225) NOT NULL,
       NewContentIdentifier nvarchar(225) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_EducationContent PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[EducationOrganizationCategoryDescriptor]
(
       OldEducationOrganizationCategoryDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewEducationOrganizationCategoryDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_EducationOrganizationCategoryDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[EducationOrganizationIdentificationSystemDescriptor]
(
       OldEducationOrganizationIdentificationSystemDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewEducationOrganizationIdentificationSystemDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_EducationOrganizationIdentificationSystemDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[EducationOrganizationInterventionPrescriptionAssociation]
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
       CONSTRAINT PK_EducationOrganizationInterventionPrescriptionAssociation PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[EducationOrganizationNetworkAssociation]
(
       OldEducationOrganizationNetworkId int NOT NULL,
       OldMemberEducationOrganizationId int NOT NULL,
       NewEducationOrganizationNetworkId int NULL,
       NewMemberEducationOrganizationId int NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_EducationOrganizationNetworkAssociation PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[EducationOrganizationNetwork]
(
       OldEducationOrganizationNetworkId int NOT NULL,
       NewEducationOrganizationNetworkId int NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_EducationOrganizationNetwork PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[EducationOrganizationPeerAssociation]
(
       OldEducationOrganizationId int NOT NULL,
       OldPeerEducationOrganizationId int NOT NULL,
       NewEducationOrganizationId int NULL,
       NewPeerEducationOrganizationId int NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_EducationOrganizationPeerAssociation PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[EducationOrganization]
(
       OldEducationOrganizationId int NOT NULL,
       NewEducationOrganizationId int NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_EducationOrganization PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[EducationPlanDescriptor]
(
       OldEducationPlanDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewEducationPlanDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_EducationPlanDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[EducationServiceCenter]
(
       OldEducationServiceCenterId int NOT NULL,
       NewEducationServiceCenterId int NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_EducationServiceCenter PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[EducationalEnvironmentDescriptor]
(
       OldEducationalEnvironmentDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewEducationalEnvironmentDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_EducationalEnvironmentDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[ElectronicMailTypeDescriptor]
(
       OldElectronicMailTypeDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewElectronicMailTypeDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_ElectronicMailTypeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[EmploymentStatusDescriptor]
(
       OldEmploymentStatusDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewEmploymentStatusDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_EmploymentStatusDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[EntryGradeLevelReasonDescriptor]
(
       OldEntryGradeLevelReasonDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewEntryGradeLevelReasonDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_EntryGradeLevelReasonDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[EntryTypeDescriptor]
(
       OldEntryTypeDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewEntryTypeDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_EntryTypeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[EventCircumstanceDescriptor]
(
       OldEventCircumstanceDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewEventCircumstanceDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_EventCircumstanceDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[ExitWithdrawTypeDescriptor]
(
       OldExitWithdrawTypeDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewExitWithdrawTypeDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_ExitWithdrawTypeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[FeederSchoolAssociation]
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
       CONSTRAINT PK_FeederSchoolAssociation PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[GeneralStudentProgramAssociation]
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
       CONSTRAINT PK_GeneralStudentProgramAssociation PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[GradeLevelDescriptor]
(
       OldGradeLevelDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewGradeLevelDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_GradeLevelDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[GradePointAverageTypeDescriptor]
(
       OldGradePointAverageTypeDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewGradePointAverageTypeDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_GradePointAverageTypeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[GradeTypeDescriptor]
(
       OldGradeTypeDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewGradeTypeDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_GradeTypeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[Grade]
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
       CONSTRAINT PK_Grade PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[GradebookEntryTypeDescriptor]
(
       OldGradebookEntryTypeDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewGradebookEntryTypeDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_GradebookEntryTypeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[GradebookEntry]
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
       CONSTRAINT PK_GradebookEntry PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[GradingPeriodDescriptor]
(
       OldGradingPeriodDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewGradingPeriodDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_GradingPeriodDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[GradingPeriod]
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
       CONSTRAINT PK_GradingPeriod PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[GraduationPlanTypeDescriptor]
(
       OldGraduationPlanTypeDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewGraduationPlanTypeDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_GraduationPlanTypeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[GraduationPlan]
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
       CONSTRAINT PK_GraduationPlan PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[GunFreeSchoolsActReportingStatusDescriptor]
(
       OldGunFreeSchoolsActReportingStatusDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewGunFreeSchoolsActReportingStatusDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_GunFreeSchoolsActReportingStatusDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[HomelessPrimaryNighttimeResidenceDescriptor]
(
       OldHomelessPrimaryNighttimeResidenceDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewHomelessPrimaryNighttimeResidenceDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_HomelessPrimaryNighttimeResidenceDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[HomelessProgramServiceDescriptor]
(
       OldHomelessProgramServiceDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewHomelessProgramServiceDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_HomelessProgramServiceDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[IdentificationDocumentUseDescriptor]
(
       OldIdentificationDocumentUseDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewIdentificationDocumentUseDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_IdentificationDocumentUseDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[IncidentLocationDescriptor]
(
       OldIncidentLocationDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewIncidentLocationDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_IncidentLocationDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[IndicatorDescriptor]
(
       OldIndicatorDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewIndicatorDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_IndicatorDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[IndicatorGroupDescriptor]
(
       OldIndicatorGroupDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewIndicatorGroupDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_IndicatorGroupDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[IndicatorLevelDescriptor]
(
       OldIndicatorLevelDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewIndicatorLevelDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_IndicatorLevelDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[InstitutionTelephoneNumberTypeDescriptor]
(
       OldInstitutionTelephoneNumberTypeDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewInstitutionTelephoneNumberTypeDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_InstitutionTelephoneNumberTypeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[InteractivityStyleDescriptor]
(
       OldInteractivityStyleDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewInteractivityStyleDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_InteractivityStyleDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[InternetAccessDescriptor]
(
       OldInternetAccessDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewInternetAccessDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_InternetAccessDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[InterventionClassDescriptor]
(
       OldInterventionClassDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewInterventionClassDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_InterventionClassDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[InterventionEffectivenessRatingDescriptor]
(
       OldInterventionEffectivenessRatingDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewInterventionEffectivenessRatingDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_InterventionEffectivenessRatingDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[InterventionPrescription]
(
       OldEducationOrganizationId int NOT NULL,
       OldInterventionPrescriptionIdentificationCode nvarchar(60) NOT NULL,
       NewEducationOrganizationId int NULL,
       NewInterventionPrescriptionIdentificationCode nvarchar(60) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_InterventionPrescription PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[InterventionStudy]
(
       OldEducationOrganizationId int NOT NULL,
       OldInterventionStudyIdentificationCode nvarchar(60) NOT NULL,
       NewEducationOrganizationId int NULL,
       NewInterventionStudyIdentificationCode nvarchar(60) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_InterventionStudy PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[Intervention]
(
       OldEducationOrganizationId int NOT NULL,
       OldInterventionIdentificationCode nvarchar(60) NOT NULL,
       NewEducationOrganizationId int NULL,
       NewInterventionIdentificationCode nvarchar(60) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_Intervention PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[LanguageDescriptor]
(
       OldLanguageDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewLanguageDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_LanguageDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[LanguageInstructionProgramServiceDescriptor]
(
       OldLanguageInstructionProgramServiceDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewLanguageInstructionProgramServiceDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_LanguageInstructionProgramServiceDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[LanguageUseDescriptor]
(
       OldLanguageUseDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewLanguageUseDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_LanguageUseDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[LearningObjective]
(
       OldLearningObjectiveId nvarchar(60) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewLearningObjectiveId nvarchar(60) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_LearningObjective PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[LearningStandardCategoryDescriptor]
(
       OldLearningStandardCategoryDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewLearningStandardCategoryDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_LearningStandardCategoryDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[LearningStandardEquivalenceAssociation]
(
       OldNamespace nvarchar(255) NOT NULL,
       OldSourceLearningStandardId nvarchar(60) NOT NULL,
       OldTargetLearningStandardId nvarchar(60) NOT NULL,
       NewNamespace nvarchar(255) NULL,
       NewSourceLearningStandardId nvarchar(60) NULL,
       NewTargetLearningStandardId nvarchar(60) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_LearningStandardEquivalenceAssociation PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[LearningStandardEquivalenceStrengthDescriptor]
(
       OldLearningStandardEquivalenceStrengthDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewLearningStandardEquivalenceStrengthDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_LearningStandardEquivalenceStrengthDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[LearningStandardScopeDescriptor]
(
       OldLearningStandardScopeDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewLearningStandardScopeDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_LearningStandardScopeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[LearningStandard]
(
       OldLearningStandardId nvarchar(60) NOT NULL,
       NewLearningStandardId nvarchar(60) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_LearningStandard PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[LevelOfEducationDescriptor]
(
       OldLevelOfEducationDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewLevelOfEducationDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_LevelOfEducationDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[LicenseStatusDescriptor]
(
       OldLicenseStatusDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewLicenseStatusDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_LicenseStatusDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[LicenseTypeDescriptor]
(
       OldLicenseTypeDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewLicenseTypeDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_LicenseTypeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[LimitedEnglishProficiencyDescriptor]
(
       OldLimitedEnglishProficiencyDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewLimitedEnglishProficiencyDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_LimitedEnglishProficiencyDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[LocalEducationAgencyCategoryDescriptor]
(
       OldLocalEducationAgencyCategoryDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewLocalEducationAgencyCategoryDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_LocalEducationAgencyCategoryDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[LocalEducationAgency]
(
       OldLocalEducationAgencyId int NOT NULL,
       NewLocalEducationAgencyId int NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_LocalEducationAgency PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[LocaleDescriptor]
(
       OldLocaleDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewLocaleDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_LocaleDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[Location]
(
       OldClassroomIdentificationCode nvarchar(60) NOT NULL,
       OldSchoolId int NOT NULL,
       NewClassroomIdentificationCode nvarchar(60) NULL,
       NewSchoolId int NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_Location PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[MagnetSpecialProgramEmphasisSchoolDescriptor]
(
       OldMagnetSpecialProgramEmphasisSchoolDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewMagnetSpecialProgramEmphasisSchoolDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_MagnetSpecialProgramEmphasisSchoolDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[MediumOfInstructionDescriptor]
(
       OldMediumOfInstructionDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewMediumOfInstructionDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_MediumOfInstructionDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[MethodCreditEarnedDescriptor]
(
       OldMethodCreditEarnedDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewMethodCreditEarnedDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_MethodCreditEarnedDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[MigrantEducationProgramServiceDescriptor]
(
       OldMigrantEducationProgramServiceDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewMigrantEducationProgramServiceDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_MigrantEducationProgramServiceDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[MonitoredDescriptor]
(
       OldMonitoredDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewMonitoredDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_MonitoredDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[NeglectedOrDelinquentProgramDescriptor]
(
       OldNeglectedOrDelinquentProgramDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewNeglectedOrDelinquentProgramDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_NeglectedOrDelinquentProgramDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[NeglectedOrDelinquentProgramServiceDescriptor]
(
       OldNeglectedOrDelinquentProgramServiceDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewNeglectedOrDelinquentProgramServiceDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_NeglectedOrDelinquentProgramServiceDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[NetworkPurposeDescriptor]
(
       OldNetworkPurposeDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewNetworkPurposeDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_NetworkPurposeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[ObjectiveAssessment]
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
       CONSTRAINT PK_ObjectiveAssessment PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[OldEthnicityDescriptor]
(
       OldOldEthnicityDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewOldEthnicityDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_OldEthnicityDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[OpenStaffPosition]
(
       OldEducationOrganizationId int NOT NULL,
       OldRequisitionNumber nvarchar(20) NOT NULL,
       NewEducationOrganizationId int NULL,
       NewRequisitionNumber nvarchar(20) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_OpenStaffPosition PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[OperationalStatusDescriptor]
(
       OldOperationalStatusDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewOperationalStatusDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_OperationalStatusDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[OtherNameTypeDescriptor]
(
       OldOtherNameTypeDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewOtherNameTypeDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_OtherNameTypeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[Parent]
(
       OldParentUSI int NOT NULL,
       OldParentUniqueId nvarchar(32) NOT NULL,
       NewParentUSI int NULL,
       NewParentUniqueId nvarchar(32) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_Parent PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[ParticipationDescriptor]
(
       OldParticipationDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewParticipationDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_ParticipationDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[ParticipationStatusDescriptor]
(
       OldParticipationStatusDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewParticipationStatusDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_ParticipationStatusDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[Payroll]
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
       CONSTRAINT PK_Payroll PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[PerformanceBaseConversionDescriptor]
(
       OldPerformanceBaseConversionDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewPerformanceBaseConversionDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_PerformanceBaseConversionDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[PerformanceLevelDescriptor]
(
       OldPerformanceLevelDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewPerformanceLevelDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_PerformanceLevelDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[Person]
(
       OldPersonId nvarchar(32) NOT NULL,
       OldSourceSystemDescriptorId int NOT NULL,
       OldSourceSystemDescriptorNamespace nvarchar(255) NOT NULL,
       OldSourceSystemDescriptorCodeValue nvarchar(50) NOT NULL,
       NewPersonId nvarchar(32) NULL,
       NewSourceSystemDescriptorId int NULL,
       NewSourceSystemDescriptorNamespace nvarchar(255) NULL,
       NewSourceSystemDescriptorCodeValue nvarchar(50) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_Person PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[PersonalInformationVerificationDescriptor]
(
       OldPersonalInformationVerificationDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewPersonalInformationVerificationDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_PersonalInformationVerificationDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[PlatformTypeDescriptor]
(
       OldPlatformTypeDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewPlatformTypeDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_PlatformTypeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[PopulationServedDescriptor]
(
       OldPopulationServedDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewPopulationServedDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_PopulationServedDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[PostSecondaryEventCategoryDescriptor]
(
       OldPostSecondaryEventCategoryDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewPostSecondaryEventCategoryDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_PostSecondaryEventCategoryDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[PostSecondaryEvent]
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
       CONSTRAINT PK_PostSecondaryEvent PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[PostSecondaryInstitutionLevelDescriptor]
(
       OldPostSecondaryInstitutionLevelDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewPostSecondaryInstitutionLevelDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_PostSecondaryInstitutionLevelDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[PostSecondaryInstitution]
(
       OldPostSecondaryInstitutionId int NOT NULL,
       NewPostSecondaryInstitutionId int NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_PostSecondaryInstitution PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[PostingResultDescriptor]
(
       OldPostingResultDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewPostingResultDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_PostingResultDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[ProficiencyDescriptor]
(
       OldProficiencyDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewProficiencyDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_ProficiencyDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[ProgramAssignmentDescriptor]
(
       OldProgramAssignmentDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewProgramAssignmentDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_ProgramAssignmentDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[ProgramCharacteristicDescriptor]
(
       OldProgramCharacteristicDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewProgramCharacteristicDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_ProgramCharacteristicDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[ProgramSponsorDescriptor]
(
       OldProgramSponsorDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewProgramSponsorDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_ProgramSponsorDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[ProgramTypeDescriptor]
(
       OldProgramTypeDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewProgramTypeDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_ProgramTypeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[Program]
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
       CONSTRAINT PK_Program PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[ProgressDescriptor]
(
       OldProgressDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewProgressDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_ProgressDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[ProgressLevelDescriptor]
(
       OldProgressLevelDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewProgressLevelDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_ProgressLevelDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[ProviderCategoryDescriptor]
(
       OldProviderCategoryDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewProviderCategoryDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_ProviderCategoryDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[ProviderProfitabilityDescriptor]
(
       OldProviderProfitabilityDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewProviderProfitabilityDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_ProviderProfitabilityDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[ProviderStatusDescriptor]
(
       OldProviderStatusDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewProviderStatusDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_ProviderStatusDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[PublicationStatusDescriptor]
(
       OldPublicationStatusDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewPublicationStatusDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_PublicationStatusDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[QuestionFormDescriptor]
(
       OldQuestionFormDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewQuestionFormDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_QuestionFormDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[RaceDescriptor]
(
       OldRaceDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewRaceDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_RaceDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[ReasonExitedDescriptor]
(
       OldReasonExitedDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewReasonExitedDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_ReasonExitedDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[ReasonNotTestedDescriptor]
(
       OldReasonNotTestedDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewReasonNotTestedDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_ReasonNotTestedDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[RecognitionTypeDescriptor]
(
       OldRecognitionTypeDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewRecognitionTypeDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_RecognitionTypeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[RelationDescriptor]
(
       OldRelationDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewRelationDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_RelationDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[RepeatIdentifierDescriptor]
(
       OldRepeatIdentifierDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewRepeatIdentifierDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_RepeatIdentifierDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[ReportCard]
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
       CONSTRAINT PK_ReportCard PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[ReporterDescriptionDescriptor]
(
       OldReporterDescriptionDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewReporterDescriptionDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_ReporterDescriptionDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[ResidencyStatusDescriptor]
(
       OldResidencyStatusDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewResidencyStatusDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_ResidencyStatusDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[ResponseIndicatorDescriptor]
(
       OldResponseIndicatorDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewResponseIndicatorDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_ResponseIndicatorDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[ResponsibilityDescriptor]
(
       OldResponsibilityDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewResponsibilityDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_ResponsibilityDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[RestraintEventReasonDescriptor]
(
       OldRestraintEventReasonDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewRestraintEventReasonDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_RestraintEventReasonDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[RestraintEvent]
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
       CONSTRAINT PK_RestraintEvent PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[ResultDatatypeTypeDescriptor]
(
       OldResultDatatypeTypeDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewResultDatatypeTypeDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_ResultDatatypeTypeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[RetestIndicatorDescriptor]
(
       OldRetestIndicatorDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewRetestIndicatorDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_RetestIndicatorDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[SchoolCategoryDescriptor]
(
       OldSchoolCategoryDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewSchoolCategoryDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_SchoolCategoryDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[SchoolChoiceImplementStatusDescriptor]
(
       OldSchoolChoiceImplementStatusDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewSchoolChoiceImplementStatusDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_SchoolChoiceImplementStatusDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[SchoolFoodServiceProgramServiceDescriptor]
(
       OldSchoolFoodServiceProgramServiceDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewSchoolFoodServiceProgramServiceDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_SchoolFoodServiceProgramServiceDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[SchoolTypeDescriptor]
(
       OldSchoolTypeDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewSchoolTypeDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_SchoolTypeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[School]
(
       OldSchoolId int NOT NULL,
       NewSchoolId int NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_School PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[SectionAttendanceTakenEvent]
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
       CONSTRAINT PK_SectionAttendanceTakenEvent PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[SectionCharacteristicDescriptor]
(
       OldSectionCharacteristicDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewSectionCharacteristicDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_SectionCharacteristicDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[Section]
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
       CONSTRAINT PK_Section PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[SeparationDescriptor]
(
       OldSeparationDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewSeparationDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_SeparationDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[SeparationReasonDescriptor]
(
       OldSeparationReasonDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewSeparationReasonDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_SeparationReasonDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[ServiceDescriptor]
(
       OldServiceDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewServiceDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_ServiceDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[Session]
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
       CONSTRAINT PK_Session PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[SexDescriptor]
(
       OldSexDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewSexDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_SexDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[SourceSystemDescriptor]
(
       OldSourceSystemDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewSourceSystemDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_SourceSystemDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[SpecialEducationProgramServiceDescriptor]
(
       OldSpecialEducationProgramServiceDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewSpecialEducationProgramServiceDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_SpecialEducationProgramServiceDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[SpecialEducationSettingDescriptor]
(
       OldSpecialEducationSettingDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewSpecialEducationSettingDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_SpecialEducationSettingDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[StaffAbsenceEvent]
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
       CONSTRAINT PK_StaffAbsenceEvent PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[StaffClassificationDescriptor]
(
       OldStaffClassificationDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewStaffClassificationDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_StaffClassificationDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[StaffCohortAssociation]
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
       CONSTRAINT PK_StaffCohortAssociation PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[StaffDisciplineIncidentAssociation]
(
       OldIncidentIdentifier nvarchar(20) NOT NULL,
       OldSchoolId int NOT NULL,
       OldStaffUSI int NOT NULL,
       OldStaffUniqueId nvarchar(32) NOT NULL,
       NewIncidentIdentifier nvarchar(20) NULL,
       NewSchoolId int NULL,
       NewStaffUSI int NULL,
       NewStaffUniqueId nvarchar(32) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_StaffDisciplineIncidentAssociation PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[StaffEducationOrganizationAssignmentAssociation]
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
       CONSTRAINT PK_StaffEducationOrganizationAssignmentAssociation PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[StaffEducationOrganizationContactAssociation]
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
       CONSTRAINT PK_StaffEducationOrganizationContactAssociation PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[StaffEducationOrganizationEmploymentAssociation]
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
       CONSTRAINT PK_StaffEducationOrganizationEmploymentAssociation PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[StaffIdentificationSystemDescriptor]
(
       OldStaffIdentificationSystemDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewStaffIdentificationSystemDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_StaffIdentificationSystemDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[StaffLeaveEventCategoryDescriptor]
(
       OldStaffLeaveEventCategoryDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewStaffLeaveEventCategoryDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_StaffLeaveEventCategoryDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[StaffLeave]
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
       CONSTRAINT PK_StaffLeave PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[StaffProgramAssociation]
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
       CONSTRAINT PK_StaffProgramAssociation PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[StaffSchoolAssociation]
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
       CONSTRAINT PK_StaffSchoolAssociation PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[StaffSectionAssociation]
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
       CONSTRAINT PK_StaffSectionAssociation PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[Staff]
(
       OldStaffUSI int NOT NULL,
       OldStaffUniqueId nvarchar(32) NOT NULL,
       NewStaffUSI int NULL,
       NewStaffUniqueId nvarchar(32) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_Staff PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[StateAbbreviationDescriptor]
(
       OldStateAbbreviationDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewStateAbbreviationDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_StateAbbreviationDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[StateEducationAgency]
(
       OldStateEducationAgencyId int NOT NULL,
       NewStateEducationAgencyId int NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_StateEducationAgency PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[StudentAcademicRecord]
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
       CONSTRAINT PK_StudentAcademicRecord PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[StudentAssessment]
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
       CONSTRAINT PK_StudentAssessment PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[StudentCTEProgramAssociation]
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
       CONSTRAINT PK_StudentCTEProgramAssociation PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[StudentCharacteristicDescriptor]
(
       OldStudentCharacteristicDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewStudentCharacteristicDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_StudentCharacteristicDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[StudentCohortAssociation]
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
       CONSTRAINT PK_StudentCohortAssociation PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[StudentCompetencyObjective]
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
       CONSTRAINT PK_StudentCompetencyObjective PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[StudentDisciplineIncidentAssociation]
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
       CONSTRAINT PK_StudentDisciplineIncidentAssociation PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[StudentEducationOrganizationAssociation]
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
       CONSTRAINT PK_StudentEducationOrganizationAssociation PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[StudentEducationOrganizationResponsibilityAssociation]
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
       CONSTRAINT PK_StudentEducationOrganizationResponsibilityAssociation PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[StudentGradebookEntry]
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
       CONSTRAINT PK_StudentGradebookEntry PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[StudentHomelessProgramAssociation]
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
       CONSTRAINT PK_StudentHomelessProgramAssociation PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[StudentIdentificationSystemDescriptor]
(
       OldStudentIdentificationSystemDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewStudentIdentificationSystemDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_StudentIdentificationSystemDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[StudentInterventionAssociation]
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
       CONSTRAINT PK_StudentInterventionAssociation PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[StudentInterventionAttendanceEvent]
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
       CONSTRAINT PK_StudentInterventionAttendanceEvent PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[StudentLanguageInstructionProgramAssociation]
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
       CONSTRAINT PK_StudentLanguageInstructionProgramAssociation PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[StudentLearningObjective]
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
       CONSTRAINT PK_StudentLearningObjective PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[StudentMigrantEducationProgramAssociation]
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
       CONSTRAINT PK_StudentMigrantEducationProgramAssociation PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[StudentNeglectedOrDelinquentProgramAssociation]
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
       CONSTRAINT PK_StudentNeglectedOrDelinquentProgramAssociation PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[StudentParentAssociation]
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
       CONSTRAINT PK_StudentParentAssociation PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[StudentParticipationCodeDescriptor]
(
       OldStudentParticipationCodeDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewStudentParticipationCodeDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_StudentParticipationCodeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[StudentProgramAssociation]
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
       CONSTRAINT PK_StudentProgramAssociation PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[StudentProgramAttendanceEvent]
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
       CONSTRAINT PK_StudentProgramAttendanceEvent PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[StudentSchoolAssociation]
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
       CONSTRAINT PK_StudentSchoolAssociation PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[StudentSchoolAttendanceEvent]
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
       CONSTRAINT PK_StudentSchoolAttendanceEvent PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[StudentSchoolFoodServiceProgramAssociation]
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
       CONSTRAINT PK_StudentSchoolFoodServiceProgramAssociation PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[StudentSectionAssociation]
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
       CONSTRAINT PK_StudentSectionAssociation PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[StudentSectionAttendanceEvent]
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
       CONSTRAINT PK_StudentSectionAttendanceEvent PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[StudentSpecialEducationProgramAssociation]
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
       CONSTRAINT PK_StudentSpecialEducationProgramAssociation PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[StudentTitleIPartAProgramAssociation]
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
       CONSTRAINT PK_StudentTitleIPartAProgramAssociation PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[Student]
(
       OldStudentUSI int NOT NULL,
       OldStudentUniqueId nvarchar(32) NOT NULL,
       NewStudentUSI int NULL,
       NewStudentUniqueId nvarchar(32) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_Student PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[SurveyCategoryDescriptor]
(
       OldSurveyCategoryDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewSurveyCategoryDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_SurveyCategoryDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[SurveyCourseAssociation]
(
       OldCourseCode nvarchar(60) NOT NULL,
       OldEducationOrganizationId int NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       OldSurveyIdentifier nvarchar(60) NOT NULL,
       NewCourseCode nvarchar(60) NULL,
       NewEducationOrganizationId int NULL,
       NewNamespace nvarchar(255) NULL,
       NewSurveyIdentifier nvarchar(60) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_SurveyCourseAssociation PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[SurveyLevelDescriptor]
(
       OldSurveyLevelDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewSurveyLevelDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_SurveyLevelDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[SurveyProgramAssociation]
(
       OldEducationOrganizationId int NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       OldProgramName nvarchar(60) NOT NULL,
       OldProgramTypeDescriptorId int NOT NULL,
       OldProgramTypeDescriptorNamespace nvarchar(255) NOT NULL,
       OldProgramTypeDescriptorCodeValue nvarchar(50) NOT NULL,
       OldSurveyIdentifier nvarchar(60) NOT NULL,
       NewEducationOrganizationId int NULL,
       NewNamespace nvarchar(255) NULL,
       NewProgramName nvarchar(60) NULL,
       NewProgramTypeDescriptorId int NULL,
       NewProgramTypeDescriptorNamespace nvarchar(255) NULL,
       NewProgramTypeDescriptorCodeValue nvarchar(50) NULL,
       NewSurveyIdentifier nvarchar(60) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_SurveyProgramAssociation PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[SurveyQuestionResponse]
(
       OldNamespace nvarchar(255) NOT NULL,
       OldQuestionCode nvarchar(60) NOT NULL,
       OldSurveyIdentifier nvarchar(60) NOT NULL,
       OldSurveyResponseIdentifier nvarchar(60) NOT NULL,
       NewNamespace nvarchar(255) NULL,
       NewQuestionCode nvarchar(60) NULL,
       NewSurveyIdentifier nvarchar(60) NULL,
       NewSurveyResponseIdentifier nvarchar(60) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_SurveyQuestionResponse PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[SurveyQuestion]
(
       OldNamespace nvarchar(255) NOT NULL,
       OldQuestionCode nvarchar(60) NOT NULL,
       OldSurveyIdentifier nvarchar(60) NOT NULL,
       NewNamespace nvarchar(255) NULL,
       NewQuestionCode nvarchar(60) NULL,
       NewSurveyIdentifier nvarchar(60) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_SurveyQuestion PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[SurveyResponseEducationOrganizationTargetAssociation]
(
       OldEducationOrganizationId int NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       OldSurveyIdentifier nvarchar(60) NOT NULL,
       OldSurveyResponseIdentifier nvarchar(60) NOT NULL,
       NewEducationOrganizationId int NULL,
       NewNamespace nvarchar(255) NULL,
       NewSurveyIdentifier nvarchar(60) NULL,
       NewSurveyResponseIdentifier nvarchar(60) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_SurveyResponseEducationOrganizationTargetAssociation PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[SurveyResponseStaffTargetAssociation]
(
       OldNamespace nvarchar(255) NOT NULL,
       OldStaffUSI int NOT NULL,
       OldStaffUniqueId nvarchar(32) NOT NULL,
       OldSurveyIdentifier nvarchar(60) NOT NULL,
       OldSurveyResponseIdentifier nvarchar(60) NOT NULL,
       NewNamespace nvarchar(255) NULL,
       NewStaffUSI int NULL,
       NewStaffUniqueId nvarchar(32) NULL,
       NewSurveyIdentifier nvarchar(60) NULL,
       NewSurveyResponseIdentifier nvarchar(60) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_SurveyResponseStaffTargetAssociation PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[SurveyResponse]
(
       OldNamespace nvarchar(255) NOT NULL,
       OldSurveyIdentifier nvarchar(60) NOT NULL,
       OldSurveyResponseIdentifier nvarchar(60) NOT NULL,
       NewNamespace nvarchar(255) NULL,
       NewSurveyIdentifier nvarchar(60) NULL,
       NewSurveyResponseIdentifier nvarchar(60) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_SurveyResponse PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[SurveySectionAssociation]
(
       OldLocalCourseCode nvarchar(60) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       OldSchoolId int NOT NULL,
       OldSchoolYear smallint NOT NULL,
       OldSectionIdentifier nvarchar(255) NOT NULL,
       OldSessionName nvarchar(60) NOT NULL,
       OldSurveyIdentifier nvarchar(60) NOT NULL,
       NewLocalCourseCode nvarchar(60) NULL,
       NewNamespace nvarchar(255) NULL,
       NewSchoolId int NULL,
       NewSchoolYear smallint NULL,
       NewSectionIdentifier nvarchar(255) NULL,
       NewSessionName nvarchar(60) NULL,
       NewSurveyIdentifier nvarchar(60) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_SurveySectionAssociation PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[SurveySectionResponseEducationOrganizationTargetAssociation]
(
       OldEducationOrganizationId int NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       OldSurveyIdentifier nvarchar(60) NOT NULL,
       OldSurveyResponseIdentifier nvarchar(60) NOT NULL,
       OldSurveySectionTitle nvarchar(255) NOT NULL,
       NewEducationOrganizationId int NULL,
       NewNamespace nvarchar(255) NULL,
       NewSurveyIdentifier nvarchar(60) NULL,
       NewSurveyResponseIdentifier nvarchar(60) NULL,
       NewSurveySectionTitle nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_SurveySectionResponseEducationOrganizationTargetAssociation PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[SurveySectionResponseStaffTargetAssociation]
(
       OldNamespace nvarchar(255) NOT NULL,
       OldStaffUSI int NOT NULL,
       OldStaffUniqueId nvarchar(32) NOT NULL,
       OldSurveyIdentifier nvarchar(60) NOT NULL,
       OldSurveyResponseIdentifier nvarchar(60) NOT NULL,
       OldSurveySectionTitle nvarchar(255) NOT NULL,
       NewNamespace nvarchar(255) NULL,
       NewStaffUSI int NULL,
       NewStaffUniqueId nvarchar(32) NULL,
       NewSurveyIdentifier nvarchar(60) NULL,
       NewSurveyResponseIdentifier nvarchar(60) NULL,
       NewSurveySectionTitle nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_SurveySectionResponseStaffTargetAssociation PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[SurveySectionResponse]
(
       OldNamespace nvarchar(255) NOT NULL,
       OldSurveyIdentifier nvarchar(60) NOT NULL,
       OldSurveyResponseIdentifier nvarchar(60) NOT NULL,
       OldSurveySectionTitle nvarchar(255) NOT NULL,
       NewNamespace nvarchar(255) NULL,
       NewSurveyIdentifier nvarchar(60) NULL,
       NewSurveyResponseIdentifier nvarchar(60) NULL,
       NewSurveySectionTitle nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_SurveySectionResponse PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[SurveySection]
(
       OldNamespace nvarchar(255) NOT NULL,
       OldSurveyIdentifier nvarchar(60) NOT NULL,
       OldSurveySectionTitle nvarchar(255) NOT NULL,
       NewNamespace nvarchar(255) NULL,
       NewSurveyIdentifier nvarchar(60) NULL,
       NewSurveySectionTitle nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_SurveySection PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[Survey]
(
       OldNamespace nvarchar(255) NOT NULL,
       OldSurveyIdentifier nvarchar(60) NOT NULL,
       NewNamespace nvarchar(255) NULL,
       NewSurveyIdentifier nvarchar(60) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       Discriminator nvarchar(128) NULL,
       CONSTRAINT PK_Survey PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[TeachingCredentialBasisDescriptor]
(
       OldTeachingCredentialBasisDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewTeachingCredentialBasisDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_TeachingCredentialBasisDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[TeachingCredentialDescriptor]
(
       OldTeachingCredentialDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewTeachingCredentialDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_TeachingCredentialDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[TechnicalSkillsAssessmentDescriptor]
(
       OldTechnicalSkillsAssessmentDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewTechnicalSkillsAssessmentDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_TechnicalSkillsAssessmentDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[TelephoneNumberTypeDescriptor]
(
       OldTelephoneNumberTypeDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewTelephoneNumberTypeDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_TelephoneNumberTypeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[TermDescriptor]
(
       OldTermDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewTermDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_TermDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[TitleIPartAParticipantDescriptor]
(
       OldTitleIPartAParticipantDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewTitleIPartAParticipantDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_TitleIPartAParticipantDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[TitleIPartAProgramServiceDescriptor]
(
       OldTitleIPartAProgramServiceDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewTitleIPartAProgramServiceDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_TitleIPartAProgramServiceDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[TitleIPartASchoolDesignationDescriptor]
(
       OldTitleIPartASchoolDesignationDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewTitleIPartASchoolDesignationDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_TitleIPartASchoolDesignationDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[TribalAffiliationDescriptor]
(
       OldTribalAffiliationDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewTribalAffiliationDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_TribalAffiliationDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[VisaDescriptor]
(
       OldVisaDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewVisaDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_VisaDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfi].[WeaponDescriptor]
(
       OldWeaponDescriptorId int NOT NULL,
       OldCodeValue nvarchar(50) NOT NULL,
       OldNamespace nvarchar(255) NOT NULL,
       NewWeaponDescriptorId int NULL,
       NewCodeValue nvarchar(50) NULL,
       NewNamespace nvarchar(255) NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_WeaponDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

