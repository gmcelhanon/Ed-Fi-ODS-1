
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.AbsenceEventCategoryDescriptor WITH CHECK ADD CONSTRAINT FK_AbsenceEventCategoryDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.AcademicHonorCategoryDescriptor WITH CHECK ADD CONSTRAINT FK_AcademicHonorCategoryDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.AcademicSubjectDescriptor WITH CHECK ADD CONSTRAINT FK_AcademicSubjectDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.AcademicWeek WITH CHECK ADD CONSTRAINT FK_AcademicWeek_School FOREIGN KEY (SchoolHashKey, SchoolYearContext)
    REFERENCES edfi.School (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.AccommodationDescriptor WITH CHECK ADD CONSTRAINT FK_AccommodationDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.Account WITH CHECK ADD CONSTRAINT FK_Account_EducationOrganization FOREIGN KEY (EducationOrganizationHashKey, SchoolYearContext)
    REFERENCES edfi.EducationOrganization (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.AccountAccountCode WITH CHECK ADD CONSTRAINT FK_AccountAccountCode_AccountCode FOREIGN KEY (AccountCodeHashKey, SchoolYearContext)
    REFERENCES edfi.AccountCode (HashKey, SchoolYearContext)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.AccountabilityRating WITH CHECK ADD CONSTRAINT FK_AccountabilityRating_EducationOrganization FOREIGN KEY (EducationOrganizationHashKey, SchoolYearContext)
    REFERENCES edfi.EducationOrganization (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.AccountabilityRating WITH CHECK ADD CONSTRAINT FK_AccountabilityRating_SchoolYearType FOREIGN KEY (SchoolYearTypeHashKey, SchoolYearContext)
    REFERENCES edfi.SchoolYearType (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.AccountClassificationDescriptor WITH CHECK ADD CONSTRAINT FK_AccountClassificationDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.AccountCode WITH CHECK ADD CONSTRAINT FK_AccountCode_AccountClassificationDescriptor FOREIGN KEY (AccountClassificationDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.AccountClassificationDescriptor (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.AccountCode WITH CHECK ADD CONSTRAINT FK_AccountCode_EducationOrganization FOREIGN KEY (EducationOrganizationHashKey, SchoolYearContext)
    REFERENCES edfi.EducationOrganization (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.AchievementCategoryDescriptor WITH CHECK ADD CONSTRAINT FK_AchievementCategoryDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.Actual WITH CHECK ADD CONSTRAINT FK_Actual_Account FOREIGN KEY (AccountHashKey, SchoolYearContext)
    REFERENCES edfi.Account (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.AdditionalCreditTypeDescriptor WITH CHECK ADD CONSTRAINT FK_AdditionalCreditTypeDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.AddressTypeDescriptor WITH CHECK ADD CONSTRAINT FK_AddressTypeDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.AdministrationEnvironmentDescriptor WITH CHECK ADD CONSTRAINT FK_AdministrationEnvironmentDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.AdministrativeFundingControlDescriptor WITH CHECK ADD CONSTRAINT FK_AdministrativeFundingControlDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.AssessmentAcademicSubject WITH CHECK ADD CONSTRAINT FK_AssessmentAcademicSubject_AcademicSubjectDescriptor FOREIGN KEY (AcademicSubjectDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.AcademicSubjectDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.AssessmentAssessedGradeLevel WITH CHECK ADD CONSTRAINT FK_AssessmentAssessedGradeLevel_GradeLevelDescriptor FOREIGN KEY (GradeLevelDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.GradeLevelDescriptor (HashKey, SchoolYearContext)
    GO






    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.AssessmentIdentificationCode WITH CHECK ADD CONSTRAINT FK_AssessmentIdentificationCode_AssessmentIdentificationSystemDescriptor FOREIGN KEY (AssessmentIdentificationSystemDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.AssessmentIdentificationSystemDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.AssessmentLanguage WITH CHECK ADD CONSTRAINT FK_AssessmentLanguage_LanguageDescriptor FOREIGN KEY (LanguageDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.LanguageDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.AssessmentPerformanceLevel WITH CHECK ADD CONSTRAINT FK_AssessmentPerformanceLevel_AssessmentReportingMethodDescriptor FOREIGN KEY (AssessmentReportingMethodDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.AssessmentReportingMethodDescriptor (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.AssessmentPerformanceLevel WITH CHECK ADD CONSTRAINT FK_AssessmentPerformanceLevel_PerformanceLevelDescriptor FOREIGN KEY (PerformanceLevelDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.PerformanceLevelDescriptor (HashKey, SchoolYearContext)
    GO




    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.AssessmentPlatformType WITH CHECK ADD CONSTRAINT FK_AssessmentPlatformType_PlatformTypeDescriptor FOREIGN KEY (PlatformTypeDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.PlatformTypeDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.AssessmentProgram WITH CHECK ADD CONSTRAINT FK_AssessmentProgram_Program FOREIGN KEY (ProgramHashKey, SchoolYearContext)
    REFERENCES edfi.Program (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.AssessmentScore WITH CHECK ADD CONSTRAINT FK_AssessmentScore_AssessmentReportingMethodDescriptor FOREIGN KEY (AssessmentReportingMethodDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.AssessmentReportingMethodDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.AssessmentSection WITH CHECK ADD CONSTRAINT FK_AssessmentSection_Section FOREIGN KEY (SectionHashKey, SchoolYearContext)
    REFERENCES edfi.Section (HashKey, SchoolYearContext)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.AssessmentCategoryDescriptor WITH CHECK ADD CONSTRAINT FK_AssessmentCategoryDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.AssessmentIdentificationSystemDescriptor WITH CHECK ADD CONSTRAINT FK_AssessmentIdentificationSystemDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.AssessmentItem WITH CHECK ADD CONSTRAINT FK_AssessmentItem_Assessment FOREIGN KEY (AssessmentHashKey, SchoolYearContext)
    REFERENCES edfi.Assessment (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.AssessmentItemLearningStandard WITH CHECK ADD CONSTRAINT FK_AssessmentItemLearningStandard_LearningStandard FOREIGN KEY (LearningStandardHashKey, SchoolYearContext)
    REFERENCES edfi.LearningStandard (HashKey, SchoolYearContext)
    GO





    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.AssessmentItemCategoryDescriptor WITH CHECK ADD CONSTRAINT FK_AssessmentItemCategoryDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.AssessmentItemResultDescriptor WITH CHECK ADD CONSTRAINT FK_AssessmentItemResultDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.AssessmentPeriodDescriptor WITH CHECK ADD CONSTRAINT FK_AssessmentPeriodDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.AssessmentReportingMethodDescriptor WITH CHECK ADD CONSTRAINT FK_AssessmentReportingMethodDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.AttemptStatusDescriptor WITH CHECK ADD CONSTRAINT FK_AttemptStatusDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.AttendanceEventCategoryDescriptor WITH CHECK ADD CONSTRAINT FK_AttendanceEventCategoryDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.BehaviorDescriptor WITH CHECK ADD CONSTRAINT FK_BehaviorDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.BellSchedule WITH CHECK ADD CONSTRAINT FK_BellSchedule_School FOREIGN KEY (SchoolHashKey, SchoolYearContext)
    REFERENCES edfi.School (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.BellScheduleClassPeriod WITH CHECK ADD CONSTRAINT FK_BellScheduleClassPeriod_ClassPeriod FOREIGN KEY (ClassPeriodHashKey, SchoolYearContext)
    REFERENCES edfi.ClassPeriod (HashKey, SchoolYearContext)
    GO




    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.BellScheduleGradeLevel WITH CHECK ADD CONSTRAINT FK_BellScheduleGradeLevel_GradeLevelDescriptor FOREIGN KEY (GradeLevelDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.GradeLevelDescriptor (HashKey, SchoolYearContext)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.Budget WITH CHECK ADD CONSTRAINT FK_Budget_Account FOREIGN KEY (AccountHashKey, SchoolYearContext)
    REFERENCES edfi.Account (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.Calendar WITH CHECK ADD CONSTRAINT FK_Calendar_School FOREIGN KEY (SchoolHashKey, SchoolYearContext)
    REFERENCES edfi.School (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.Calendar WITH CHECK ADD CONSTRAINT FK_Calendar_SchoolYearType FOREIGN KEY (SchoolYearTypeHashKey, SchoolYearContext)
    REFERENCES edfi.SchoolYearType (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.CalendarGradeLevel WITH CHECK ADD CONSTRAINT FK_CalendarGradeLevel_GradeLevelDescriptor FOREIGN KEY (GradeLevelDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.GradeLevelDescriptor (HashKey, SchoolYearContext)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CalendarDate WITH CHECK ADD CONSTRAINT FK_CalendarDate_Calendar FOREIGN KEY (CalendarHashKey, SchoolYearContext)
    REFERENCES edfi.Calendar (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.CalendarDateCalendarEvent WITH CHECK ADD CONSTRAINT FK_CalendarDateCalendarEvent_CalendarEventDescriptor FOREIGN KEY (CalendarEventDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.CalendarEventDescriptor (HashKey, SchoolYearContext)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CalendarEventDescriptor WITH CHECK ADD CONSTRAINT FK_CalendarEventDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CalendarTypeDescriptor WITH CHECK ADD CONSTRAINT FK_CalendarTypeDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CareerPathwayDescriptor WITH CHECK ADD CONSTRAINT FK_CareerPathwayDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CharterApprovalAgencyTypeDescriptor WITH CHECK ADD CONSTRAINT FK_CharterApprovalAgencyTypeDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CharterStatusDescriptor WITH CHECK ADD CONSTRAINT FK_CharterStatusDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CitizenshipStatusDescriptor WITH CHECK ADD CONSTRAINT FK_CitizenshipStatusDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.ClassPeriod WITH CHECK ADD CONSTRAINT FK_ClassPeriod_School FOREIGN KEY (SchoolHashKey, SchoolYearContext)
    REFERENCES edfi.School (HashKey, SchoolYearContext)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.ClassroomPositionDescriptor WITH CHECK ADD CONSTRAINT FK_ClassroomPositionDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.Cohort WITH CHECK ADD CONSTRAINT FK_Cohort_EducationOrganization FOREIGN KEY (EducationOrganizationHashKey, SchoolYearContext)
    REFERENCES edfi.EducationOrganization (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.CohortProgram WITH CHECK ADD CONSTRAINT FK_CohortProgram_Program FOREIGN KEY (ProgramHashKey, SchoolYearContext)
    REFERENCES edfi.Program (HashKey, SchoolYearContext)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CohortScopeDescriptor WITH CHECK ADD CONSTRAINT FK_CohortScopeDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CohortTypeDescriptor WITH CHECK ADD CONSTRAINT FK_CohortTypeDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CohortYearTypeDescriptor WITH CHECK ADD CONSTRAINT FK_CohortYearTypeDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CommunityOrganization WITH CHECK ADD CONSTRAINT FK_CommunityOrganization_EducationOrganization FOREIGN KEY (EducationOrganizationHashKey, SchoolYearContext)
    REFERENCES edfi.EducationOrganization (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CommunityProvider WITH CHECK ADD CONSTRAINT FK_CommunityProvider_EducationOrganization FOREIGN KEY (EducationOrganizationHashKey, SchoolYearContext)
    REFERENCES edfi.EducationOrganization (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CommunityProviderLicense WITH CHECK ADD CONSTRAINT FK_CommunityProviderLicense_CommunityProvider FOREIGN KEY (CommunityProviderHashKey, SchoolYearContext)
    REFERENCES edfi.CommunityProvider (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CompetencyLevelDescriptor WITH CHECK ADD CONSTRAINT FK_CompetencyLevelDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CompetencyObjective WITH CHECK ADD CONSTRAINT FK_CompetencyObjective_EducationOrganization FOREIGN KEY (EducationOrganizationHashKey, SchoolYearContext)
    REFERENCES edfi.EducationOrganization (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CompetencyObjective WITH CHECK ADD CONSTRAINT FK_ObjectiveCompetencyObjective_GradeLevelDescriptor FOREIGN KEY (ObjectiveGradeLevelDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.GradeLevelDescriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.ContactTypeDescriptor WITH CHECK ADD CONSTRAINT FK_ContactTypeDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.ContentClassDescriptor WITH CHECK ADD CONSTRAINT FK_ContentClassDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.ContinuationOfServicesReasonDescriptor WITH CHECK ADD CONSTRAINT FK_ContinuationOfServicesReasonDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.ContractedStaff WITH CHECK ADD CONSTRAINT FK_ContractedStaff_Account FOREIGN KEY (AccountHashKey, SchoolYearContext)
    REFERENCES edfi.Account (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.ContractedStaff WITH CHECK ADD CONSTRAINT FK_ContractedStaff_Staff FOREIGN KEY (StaffHashKey, SchoolYearContext)
    REFERENCES edfi.Staff (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CostRateDescriptor WITH CHECK ADD CONSTRAINT FK_CostRateDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CountryDescriptor WITH CHECK ADD CONSTRAINT FK_CountryDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.Course WITH CHECK ADD CONSTRAINT FK_Course_EducationOrganization FOREIGN KEY (EducationOrganizationHashKey, SchoolYearContext)
    REFERENCES edfi.EducationOrganization (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.CourseCompetencyLevel WITH CHECK ADD CONSTRAINT FK_CourseCompetencyLevel_CompetencyLevelDescriptor FOREIGN KEY (CompetencyLevelDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.CompetencyLevelDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.CourseIdentificationCode WITH CHECK ADD CONSTRAINT FK_CourseIdentificationCode_CourseIdentificationSystemDescriptor FOREIGN KEY (CourseIdentificationSystemDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.CourseIdentificationSystemDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.CourseLearningObjective WITH CHECK ADD CONSTRAINT FK_CourseLearningObjective_LearningObjective FOREIGN KEY (LearningObjectiveHashKey, SchoolYearContext)
    REFERENCES edfi.LearningObjective (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.CourseLearningStandard WITH CHECK ADD CONSTRAINT FK_CourseLearningStandard_LearningStandard FOREIGN KEY (LearningStandardHashKey, SchoolYearContext)
    REFERENCES edfi.LearningStandard (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.CourseLevelCharacteristic WITH CHECK ADD CONSTRAINT FK_CourseLevelCharacteristic_CourseLevelCharacteristicDescriptor FOREIGN KEY (CourseLevelCharacteristicDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.CourseLevelCharacteristicDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.CourseOfferedGradeLevel WITH CHECK ADD CONSTRAINT FK_CourseOfferedGradeLevel_GradeLevelDescriptor FOREIGN KEY (GradeLevelDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.GradeLevelDescriptor (HashKey, SchoolYearContext)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CourseAttemptResultDescriptor WITH CHECK ADD CONSTRAINT FK_CourseAttemptResultDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CourseDefinedByDescriptor WITH CHECK ADD CONSTRAINT FK_CourseDefinedByDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CourseGPAApplicabilityDescriptor WITH CHECK ADD CONSTRAINT FK_CourseGPAApplicabilityDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CourseIdentificationSystemDescriptor WITH CHECK ADD CONSTRAINT FK_CourseIdentificationSystemDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CourseLevelCharacteristicDescriptor WITH CHECK ADD CONSTRAINT FK_CourseLevelCharacteristicDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CourseOffering WITH CHECK ADD CONSTRAINT FK_CourseOffering_School FOREIGN KEY (SchoolHashKey, SchoolYearContext)
    REFERENCES edfi.School (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CourseOffering WITH CHECK ADD CONSTRAINT FK_CourseOffering_Session FOREIGN KEY (SessionHashKey, SchoolYearContext)
    REFERENCES edfi.Session (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.CourseOfferingCourseLevelCharacteristic WITH CHECK ADD CONSTRAINT FK_CourseOfferingCourseLevelCharacteristic_CourseLevelCharacteristicDescriptor FOREIGN KEY (CourseLevelCharacteristicDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.CourseLevelCharacteristicDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.CourseOfferingCurriculumUsed WITH CHECK ADD CONSTRAINT FK_CourseOfferingCurriculumUsed_CurriculumUsedDescriptor FOREIGN KEY (CurriculumUsedDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.CurriculumUsedDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.CourseOfferingOfferedGradeLevel WITH CHECK ADD CONSTRAINT FK_CourseOfferingOfferedGradeLevel_GradeLevelDescriptor FOREIGN KEY (GradeLevelDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.GradeLevelDescriptor (HashKey, SchoolYearContext)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CourseRepeatCodeDescriptor WITH CHECK ADD CONSTRAINT FK_CourseRepeatCodeDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CourseTranscript WITH CHECK ADD CONSTRAINT FK_CourseTranscript_Course FOREIGN KEY (CourseHashKey, SchoolYearContext)
    REFERENCES edfi.Course (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CourseTranscript WITH CHECK ADD CONSTRAINT FK_CourseTranscript_CourseAttemptResultDescriptor FOREIGN KEY (CourseAttemptResultDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.CourseAttemptResultDescriptor (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CourseTranscript WITH CHECK ADD CONSTRAINT FK_CourseTranscript_StudentAcademicRecord FOREIGN KEY (StudentAcademicRecordHashKey, SchoolYearContext)
    REFERENCES edfi.StudentAcademicRecord (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.CourseTranscriptAcademicSubject WITH CHECK ADD CONSTRAINT FK_CourseTranscriptAcademicSubject_AcademicSubjectDescriptor FOREIGN KEY (AcademicSubjectDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.AcademicSubjectDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.CourseTranscriptAlternativeCourseIdentificationCode WITH CHECK ADD CONSTRAINT FK_CourseTranscriptAlternativeCourseIdentificationCode_CourseIdentificationSystemDescriptor FOREIGN KEY (CourseIdentificationSystemDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.CourseIdentificationSystemDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.CourseTranscriptCreditCategory WITH CHECK ADD CONSTRAINT FK_CourseTranscriptCreditCategory_CreditCategoryDescriptor FOREIGN KEY (CreditCategoryDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.CreditCategoryDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.CourseTranscriptEarnedAdditionalCredits WITH CHECK ADD CONSTRAINT FK_CourseTranscriptEarnedAdditionalCredits_AdditionalCreditTypeDescriptor FOREIGN KEY (AdditionalCreditTypeDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.AdditionalCreditTypeDescriptor (HashKey, SchoolYearContext)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.Credential WITH CHECK ADD CONSTRAINT FK_StateOfIssueCredential_StateAbbreviationDescriptor FOREIGN KEY (StateOfIssueStateAbbreviationDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.StateAbbreviationDescriptor (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.CredentialAcademicSubject WITH CHECK ADD CONSTRAINT FK_CredentialAcademicSubject_AcademicSubjectDescriptor FOREIGN KEY (AcademicSubjectDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.AcademicSubjectDescriptor (HashKey, SchoolYearContext)
    GO




    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.CredentialGradeLevel WITH CHECK ADD CONSTRAINT FK_CredentialGradeLevel_GradeLevelDescriptor FOREIGN KEY (GradeLevelDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.GradeLevelDescriptor (HashKey, SchoolYearContext)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CredentialFieldDescriptor WITH CHECK ADD CONSTRAINT FK_CredentialFieldDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CredentialTypeDescriptor WITH CHECK ADD CONSTRAINT FK_CredentialTypeDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CreditCategoryDescriptor WITH CHECK ADD CONSTRAINT FK_CreditCategoryDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CreditTypeDescriptor WITH CHECK ADD CONSTRAINT FK_CreditTypeDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CTEProgramServiceDescriptor WITH CHECK ADD CONSTRAINT FK_CTEProgramServiceDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CurriculumUsedDescriptor WITH CHECK ADD CONSTRAINT FK_CurriculumUsedDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.DeliveryMethodDescriptor WITH CHECK ADD CONSTRAINT FK_DeliveryMethodDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.DiagnosisDescriptor WITH CHECK ADD CONSTRAINT FK_DiagnosisDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.DiplomaLevelDescriptor WITH CHECK ADD CONSTRAINT FK_DiplomaLevelDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.DiplomaTypeDescriptor WITH CHECK ADD CONSTRAINT FK_DiplomaTypeDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.DisabilityDescriptor WITH CHECK ADD CONSTRAINT FK_DisabilityDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.DisabilityDesignationDescriptor WITH CHECK ADD CONSTRAINT FK_DisabilityDesignationDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.DisabilityDeterminationSourceTypeDescriptor WITH CHECK ADD CONSTRAINT FK_DisabilityDeterminationSourceTypeDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.DisciplineAction WITH CHECK ADD CONSTRAINT FK_DisciplineAction_Student FOREIGN KEY (StudentHashKey, SchoolYearContext)
    REFERENCES edfi.Student (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.DisciplineActionDiscipline WITH CHECK ADD CONSTRAINT FK_DisciplineActionDiscipline_DisciplineDescriptor FOREIGN KEY (DisciplineDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.DisciplineDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.DisciplineActionStaff WITH CHECK ADD CONSTRAINT FK_DisciplineActionStaff_Staff FOREIGN KEY (StaffHashKey, SchoolYearContext)
    REFERENCES edfi.Staff (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.DisciplineActionStudentDisciplineIncidentAssociation WITH CHECK ADD CONSTRAINT FK_DisciplineActionStudentDisciplineIncidentAssociation_StudentDisciplineIncidentAssociation FOREIGN KEY (StudentDisciplineIncidentAssociationHashKey, SchoolYearContext)
    REFERENCES edfi.StudentDisciplineIncidentAssociation (HashKey, SchoolYearContext)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.DisciplineActionLengthDifferenceReasonDescriptor WITH CHECK ADD CONSTRAINT FK_DisciplineActionLengthDifferenceReasonDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.DisciplineDescriptor WITH CHECK ADD CONSTRAINT FK_DisciplineDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.DisciplineIncident WITH CHECK ADD CONSTRAINT FK_DisciplineIncident_School FOREIGN KEY (SchoolHashKey, SchoolYearContext)
    REFERENCES edfi.School (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.DisciplineIncidentBehavior WITH CHECK ADD CONSTRAINT FK_DisciplineIncidentBehavior_BehaviorDescriptor FOREIGN KEY (BehaviorDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.BehaviorDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.DisciplineIncidentExternalParticipant WITH CHECK ADD CONSTRAINT FK_DisciplineIncidentExternalParticipant_DisciplineIncidentParticipationCodeDescriptor FOREIGN KEY (DisciplineIncidentParticipationCodeDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.DisciplineIncidentParticipationCodeDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.DisciplineIncidentWeapon WITH CHECK ADD CONSTRAINT FK_DisciplineIncidentWeapon_WeaponDescriptor FOREIGN KEY (WeaponDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.WeaponDescriptor (HashKey, SchoolYearContext)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.DisciplineIncidentParticipationCodeDescriptor WITH CHECK ADD CONSTRAINT FK_DisciplineIncidentParticipationCodeDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.EducationalEnvironmentDescriptor WITH CHECK ADD CONSTRAINT FK_EducationalEnvironmentDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.EducationContentAppropriateGradeLevel WITH CHECK ADD CONSTRAINT FK_EducationContentAppropriateGradeLevel_GradeLevelDescriptor FOREIGN KEY (GradeLevelDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.GradeLevelDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.EducationContentAppropriateSex WITH CHECK ADD CONSTRAINT FK_EducationContentAppropriateSex_SexDescriptor FOREIGN KEY (SexDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.SexDescriptor (HashKey, SchoolYearContext)
    GO










    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.EducationContentLanguage WITH CHECK ADD CONSTRAINT FK_EducationContentLanguage_LanguageDescriptor FOREIGN KEY (LanguageDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.LanguageDescriptor (HashKey, SchoolYearContext)
    GO



    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.EducationOrganizationAddress WITH CHECK ADD CONSTRAINT FK_EducationOrganizationAddress_AddressTypeDescriptor FOREIGN KEY (AddressTypeDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.AddressTypeDescriptor (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.EducationOrganizationAddress WITH CHECK ADD CONSTRAINT FK_EducationOrganizationAddress_StateAbbreviationDescriptor FOREIGN KEY (StateAbbreviationDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.StateAbbreviationDescriptor (HashKey, SchoolYearContext)
    GO




    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.EducationOrganizationCategory WITH CHECK ADD CONSTRAINT FK_EducationOrganizationCategory_EducationOrganizationCategoryDescriptor FOREIGN KEY (EducationOrganizationCategoryDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.EducationOrganizationCategoryDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.EducationOrganizationIdentificationCode WITH CHECK ADD CONSTRAINT FK_EducationOrganizationIdentificationCode_EducationOrganizationIdentificationSystemDescriptor FOREIGN KEY (EducationOrganizationIdentificationSystemDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.EducationOrganizationIdentificationSystemDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.EducationOrganizationIndicator WITH CHECK ADD CONSTRAINT FK_EducationOrganizationIndicator_IndicatorDescriptor FOREIGN KEY (IndicatorDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.IndicatorDescriptor (HashKey, SchoolYearContext)
    GO




    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.EducationOrganizationInstitutionTelephone WITH CHECK ADD CONSTRAINT FK_EducationOrganizationInstitutionTelephone_InstitutionTelephoneNumberTypeDescriptor FOREIGN KEY (InstitutionTelephoneNumberTypeDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.InstitutionTelephoneNumberTypeDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.EducationOrganizationInternationalAddress WITH CHECK ADD CONSTRAINT FK_EducationOrganizationInternationalAddress_AddressTypeDescriptor FOREIGN KEY (AddressTypeDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.AddressTypeDescriptor (HashKey, SchoolYearContext)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.EducationOrganizationCategoryDescriptor WITH CHECK ADD CONSTRAINT FK_EducationOrganizationCategoryDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.EducationOrganizationIdentificationSystemDescriptor WITH CHECK ADD CONSTRAINT FK_EducationOrganizationIdentificationSystemDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.EducationOrganizationInterventionPrescriptionAssociation WITH CHECK ADD CONSTRAINT FK_EducationOrganizationInterventionPrescriptionAssociation_EducationOrganization FOREIGN KEY (EducationOrganizationHashKey, SchoolYearContext)
    REFERENCES edfi.EducationOrganization (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.EducationOrganizationInterventionPrescriptionAssociation WITH CHECK ADD CONSTRAINT FK_EducationOrganizationInterventionPrescriptionAssociation_InterventionPrescription FOREIGN KEY (InterventionPrescriptionHashKey, SchoolYearContext)
    REFERENCES edfi.InterventionPrescription (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.EducationOrganizationNetwork WITH CHECK ADD CONSTRAINT FK_EducationOrganizationNetwork_EducationOrganization FOREIGN KEY (EducationOrganizationHashKey, SchoolYearContext)
    REFERENCES edfi.EducationOrganization (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.EducationOrganizationNetworkAssociation WITH CHECK ADD CONSTRAINT FK_MemberEducationOrganizationNetworkAssociation_EducationOrganization FOREIGN KEY (MemberEducationOrganizationHashKey, SchoolYearContext)
    REFERENCES edfi.EducationOrganization (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.EducationOrganizationNetworkAssociation WITH CHECK ADD CONSTRAINT FK_EducationOrganizationNetworkAssociation_EducationOrganizationNetwork FOREIGN KEY (EducationOrganizationNetworkHashKey, SchoolYearContext)
    REFERENCES edfi.EducationOrganizationNetwork (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.EducationOrganizationPeerAssociation WITH CHECK ADD CONSTRAINT FK_EducationOrganizationPeerAssociation_EducationOrganization FOREIGN KEY (EducationOrganizationHashKey, SchoolYearContext)
    REFERENCES edfi.EducationOrganization (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.EducationOrganizationPeerAssociation WITH CHECK ADD CONSTRAINT FK_PeerEducationOrganizationPeerAssociation_EducationOrganization FOREIGN KEY (PeerEducationOrganizationHashKey, SchoolYearContext)
    REFERENCES edfi.EducationOrganization (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.EducationPlanDescriptor WITH CHECK ADD CONSTRAINT FK_EducationPlanDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.EducationServiceCenter WITH CHECK ADD CONSTRAINT FK_EducationServiceCenter_EducationOrganization FOREIGN KEY (EducationOrganizationHashKey, SchoolYearContext)
    REFERENCES edfi.EducationOrganization (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.ElectronicMailTypeDescriptor WITH CHECK ADD CONSTRAINT FK_ElectronicMailTypeDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.EmploymentStatusDescriptor WITH CHECK ADD CONSTRAINT FK_EmploymentStatusDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.EntryGradeLevelReasonDescriptor WITH CHECK ADD CONSTRAINT FK_EntryGradeLevelReasonDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.EntryTypeDescriptor WITH CHECK ADD CONSTRAINT FK_EntryTypeDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.EventCircumstanceDescriptor WITH CHECK ADD CONSTRAINT FK_EventCircumstanceDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.ExitWithdrawTypeDescriptor WITH CHECK ADD CONSTRAINT FK_ExitWithdrawTypeDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.FeederSchoolAssociation WITH CHECK ADD CONSTRAINT FK_FeederFeederSchoolAssociation_School FOREIGN KEY (FeederSchoolHashKey, SchoolYearContext)
    REFERENCES edfi.School (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.FeederSchoolAssociation WITH CHECK ADD CONSTRAINT FK_FeederSchoolAssociation_School FOREIGN KEY (SchoolHashKey, SchoolYearContext)
    REFERENCES edfi.School (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.GeneralStudentProgramAssociation WITH CHECK ADD CONSTRAINT FK_GeneralStudentProgramAssociation_EducationOrganization FOREIGN KEY (EducationOrganizationHashKey, SchoolYearContext)
    REFERENCES edfi.EducationOrganization (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.GeneralStudentProgramAssociation WITH CHECK ADD CONSTRAINT FK_GeneralStudentProgramAssociation_Program FOREIGN KEY (ProgramHashKey, SchoolYearContext)
    REFERENCES edfi.Program (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.GeneralStudentProgramAssociation WITH CHECK ADD CONSTRAINT FK_GeneralStudentProgramAssociation_Student FOREIGN KEY (StudentHashKey, SchoolYearContext)
    REFERENCES edfi.Student (HashKey, SchoolYearContext)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.Grade WITH CHECK ADD CONSTRAINT FK_Grade_GradeTypeDescriptor FOREIGN KEY (GradeTypeDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.GradeTypeDescriptor (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.Grade WITH CHECK ADD CONSTRAINT FK_GradingGrade_GradingPeriod FOREIGN KEY (GradingPeriodHashKey, SchoolYearContext)
    REFERENCES edfi.GradingPeriod (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.Grade WITH CHECK ADD CONSTRAINT FK_Grade_StudentSectionAssociation FOREIGN KEY (StudentSectionAssociationHashKey, SchoolYearContext)
    REFERENCES edfi.StudentSectionAssociation (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.GradeLearningStandardGrade WITH CHECK ADD CONSTRAINT FK_GradeLearningStandardGrade_LearningStandard FOREIGN KEY (LearningStandardHashKey, SchoolYearContext)
    REFERENCES edfi.LearningStandard (HashKey, SchoolYearContext)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.GradebookEntry WITH CHECK ADD CONSTRAINT FK_GradebookEntry_Section FOREIGN KEY (SectionHashKey, SchoolYearContext)
    REFERENCES edfi.Section (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.GradebookEntryLearningObjective WITH CHECK ADD CONSTRAINT FK_GradebookEntryLearningObjective_LearningObjective FOREIGN KEY (LearningObjectiveHashKey, SchoolYearContext)
    REFERENCES edfi.LearningObjective (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.GradebookEntryLearningStandard WITH CHECK ADD CONSTRAINT FK_GradebookEntryLearningStandard_LearningStandard FOREIGN KEY (LearningStandardHashKey, SchoolYearContext)
    REFERENCES edfi.LearningStandard (HashKey, SchoolYearContext)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.GradebookEntryTypeDescriptor WITH CHECK ADD CONSTRAINT FK_GradebookEntryTypeDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.GradeLevelDescriptor WITH CHECK ADD CONSTRAINT FK_GradeLevelDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.GradePointAverageTypeDescriptor WITH CHECK ADD CONSTRAINT FK_GradePointAverageTypeDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.GradeTypeDescriptor WITH CHECK ADD CONSTRAINT FK_GradeTypeDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.GradingPeriod WITH CHECK ADD CONSTRAINT FK_GradingPeriod_GradingPeriodDescriptor FOREIGN KEY (GradingPeriodDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.GradingPeriodDescriptor (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.GradingPeriod WITH CHECK ADD CONSTRAINT FK_GradingPeriod_School FOREIGN KEY (SchoolHashKey, SchoolYearContext)
    REFERENCES edfi.School (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.GradingPeriod WITH CHECK ADD CONSTRAINT FK_GradingPeriod_SchoolYearType FOREIGN KEY (SchoolYearTypeHashKey, SchoolYearContext)
    REFERENCES edfi.SchoolYearType (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.GradingPeriodDescriptor WITH CHECK ADD CONSTRAINT FK_GradingPeriodDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.GraduationPlan WITH CHECK ADD CONSTRAINT FK_GraduationPlan_EducationOrganization FOREIGN KEY (EducationOrganizationHashKey, SchoolYearContext)
    REFERENCES edfi.EducationOrganization (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.GraduationPlan WITH CHECK ADD CONSTRAINT FK_GraduationPlan_GraduationPlanTypeDescriptor FOREIGN KEY (GraduationPlanTypeDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.GraduationPlanTypeDescriptor (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.GraduationPlan WITH CHECK ADD CONSTRAINT FK_GraduationGraduationPlan_SchoolYearType FOREIGN KEY (GraduationSchoolYearTypeHashKey, SchoolYearContext)
    REFERENCES edfi.SchoolYearType (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.GraduationPlanCreditsByCourseCourse WITH CHECK ADD CONSTRAINT FK_GraduationPlanCreditsByCourseCourse_Course FOREIGN KEY (CourseHashKey, SchoolYearContext)
    REFERENCES edfi.Course (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.GraduationPlanCreditsByCreditCategory WITH CHECK ADD CONSTRAINT FK_GraduationPlanCreditsByCreditCategory_CreditCategoryDescriptor FOREIGN KEY (CreditCategoryDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.CreditCategoryDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.GraduationPlanCreditsBySubject WITH CHECK ADD CONSTRAINT FK_GraduationPlanCreditsBySubject_AcademicSubjectDescriptor FOREIGN KEY (AcademicSubjectDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.AcademicSubjectDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.GraduationPlanRequiredAssessment WITH CHECK ADD CONSTRAINT FK_GraduationPlanRequiredAssessment_Assessment FOREIGN KEY (AssessmentHashKey, SchoolYearContext)
    REFERENCES edfi.Assessment (HashKey, SchoolYearContext)
    GO




    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.GraduationPlanRequiredAssessmentScore WITH CHECK ADD CONSTRAINT FK_GraduationPlanRequiredAssessmentScore_AssessmentReportingMethodDescriptor FOREIGN KEY (AssessmentReportingMethodDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.AssessmentReportingMethodDescriptor (HashKey, SchoolYearContext)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.GraduationPlanTypeDescriptor WITH CHECK ADD CONSTRAINT FK_GraduationPlanTypeDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.GunFreeSchoolsActReportingStatusDescriptor WITH CHECK ADD CONSTRAINT FK_GunFreeSchoolsActReportingStatusDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.HomelessPrimaryNighttimeResidenceDescriptor WITH CHECK ADD CONSTRAINT FK_HomelessPrimaryNighttimeResidenceDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.HomelessProgramServiceDescriptor WITH CHECK ADD CONSTRAINT FK_HomelessProgramServiceDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.IdentificationDocumentUseDescriptor WITH CHECK ADD CONSTRAINT FK_IdentificationDocumentUseDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.IncidentLocationDescriptor WITH CHECK ADD CONSTRAINT FK_IncidentLocationDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.IndicatorDescriptor WITH CHECK ADD CONSTRAINT FK_IndicatorDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.IndicatorGroupDescriptor WITH CHECK ADD CONSTRAINT FK_IndicatorGroupDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.IndicatorLevelDescriptor WITH CHECK ADD CONSTRAINT FK_IndicatorLevelDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.InstitutionTelephoneNumberTypeDescriptor WITH CHECK ADD CONSTRAINT FK_InstitutionTelephoneNumberTypeDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.InteractivityStyleDescriptor WITH CHECK ADD CONSTRAINT FK_InteractivityStyleDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.InternetAccessDescriptor WITH CHECK ADD CONSTRAINT FK_InternetAccessDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.Intervention WITH CHECK ADD CONSTRAINT FK_Intervention_EducationOrganization FOREIGN KEY (EducationOrganizationHashKey, SchoolYearContext)
    REFERENCES edfi.EducationOrganization (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.InterventionAppropriateGradeLevel WITH CHECK ADD CONSTRAINT FK_InterventionAppropriateGradeLevel_GradeLevelDescriptor FOREIGN KEY (GradeLevelDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.GradeLevelDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.InterventionAppropriateSex WITH CHECK ADD CONSTRAINT FK_InterventionAppropriateSex_SexDescriptor FOREIGN KEY (SexDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.SexDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.InterventionDiagnosis WITH CHECK ADD CONSTRAINT FK_InterventionDiagnosis_DiagnosisDescriptor FOREIGN KEY (DiagnosisDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.DiagnosisDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.InterventionEducationContent WITH CHECK ADD CONSTRAINT FK_InterventionEducationContent_EducationContent FOREIGN KEY (EducationContentHashKey, SchoolYearContext)
    REFERENCES edfi.EducationContent (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.InterventionInterventionPrescription WITH CHECK ADD CONSTRAINT FK_InterventionInterventionPrescription_InterventionPrescription FOREIGN KEY (InterventionPrescriptionHashKey, SchoolYearContext)
    REFERENCES edfi.InterventionPrescription (HashKey, SchoolYearContext)
    GO






    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.InterventionPopulationServed WITH CHECK ADD CONSTRAINT FK_InterventionPopulationServed_PopulationServedDescriptor FOREIGN KEY (PopulationServedDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.PopulationServedDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.InterventionStaff WITH CHECK ADD CONSTRAINT FK_InterventionStaff_Staff FOREIGN KEY (StaffHashKey, SchoolYearContext)
    REFERENCES edfi.Staff (HashKey, SchoolYearContext)
    GO





    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.InterventionClassDescriptor WITH CHECK ADD CONSTRAINT FK_InterventionClassDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.InterventionEffectivenessRatingDescriptor WITH CHECK ADD CONSTRAINT FK_InterventionEffectivenessRatingDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.InterventionPrescription WITH CHECK ADD CONSTRAINT FK_InterventionPrescription_EducationOrganization FOREIGN KEY (EducationOrganizationHashKey, SchoolYearContext)
    REFERENCES edfi.EducationOrganization (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.InterventionPrescriptionAppropriateGradeLevel WITH CHECK ADD CONSTRAINT FK_InterventionPrescriptionAppropriateGradeLevel_GradeLevelDescriptor FOREIGN KEY (GradeLevelDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.GradeLevelDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.InterventionPrescriptionAppropriateSex WITH CHECK ADD CONSTRAINT FK_InterventionPrescriptionAppropriateSex_SexDescriptor FOREIGN KEY (SexDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.SexDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.InterventionPrescriptionDiagnosis WITH CHECK ADD CONSTRAINT FK_InterventionPrescriptionDiagnosis_DiagnosisDescriptor FOREIGN KEY (DiagnosisDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.DiagnosisDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.InterventionPrescriptionEducationContent WITH CHECK ADD CONSTRAINT FK_InterventionPrescriptionEducationContent_EducationContent FOREIGN KEY (EducationContentHashKey, SchoolYearContext)
    REFERENCES edfi.EducationContent (HashKey, SchoolYearContext)
    GO




    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.InterventionPrescriptionPopulationServed WITH CHECK ADD CONSTRAINT FK_InterventionPrescriptionPopulationServed_PopulationServedDescriptor FOREIGN KEY (PopulationServedDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.PopulationServedDescriptor (HashKey, SchoolYearContext)
    GO





    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.InterventionStudy WITH CHECK ADD CONSTRAINT FK_InterventionStudy_EducationOrganization FOREIGN KEY (EducationOrganizationHashKey, SchoolYearContext)
    REFERENCES edfi.EducationOrganization (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.InterventionStudyAppropriateGradeLevel WITH CHECK ADD CONSTRAINT FK_InterventionStudyAppropriateGradeLevel_GradeLevelDescriptor FOREIGN KEY (GradeLevelDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.GradeLevelDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.InterventionStudyAppropriateSex WITH CHECK ADD CONSTRAINT FK_InterventionStudyAppropriateSex_SexDescriptor FOREIGN KEY (SexDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.SexDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.InterventionStudyEducationContent WITH CHECK ADD CONSTRAINT FK_InterventionStudyEducationContent_EducationContent FOREIGN KEY (EducationContentHashKey, SchoolYearContext)
    REFERENCES edfi.EducationContent (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.InterventionStudyInterventionEffectiveness WITH CHECK ADD CONSTRAINT FK_InterventionStudyInterventionEffectiveness_DiagnosisDescriptor FOREIGN KEY (DiagnosisDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.DiagnosisDescriptor (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.InterventionStudyInterventionEffectiveness WITH CHECK ADD CONSTRAINT FK_InterventionStudyInterventionEffectiveness_GradeLevelDescriptor FOREIGN KEY (GradeLevelDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.GradeLevelDescriptor (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.InterventionStudyInterventionEffectiveness WITH CHECK ADD CONSTRAINT FK_InterventionStudyInterventionEffectiveness_PopulationServedDescriptor FOREIGN KEY (PopulationServedDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.PopulationServedDescriptor (HashKey, SchoolYearContext)
    GO




    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.InterventionStudyPopulationServed WITH CHECK ADD CONSTRAINT FK_InterventionStudyPopulationServed_PopulationServedDescriptor FOREIGN KEY (PopulationServedDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.PopulationServedDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.InterventionStudyStateAbbreviation WITH CHECK ADD CONSTRAINT FK_InterventionStudyStateAbbreviation_StateAbbreviationDescriptor FOREIGN KEY (StateAbbreviationDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.StateAbbreviationDescriptor (HashKey, SchoolYearContext)
    GO





    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.LanguageDescriptor WITH CHECK ADD CONSTRAINT FK_LanguageDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.LanguageInstructionProgramServiceDescriptor WITH CHECK ADD CONSTRAINT FK_LanguageInstructionProgramServiceDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.LanguageUseDescriptor WITH CHECK ADD CONSTRAINT FK_LanguageUseDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.LearningObjectiveAcademicSubject WITH CHECK ADD CONSTRAINT FK_LearningObjectiveAcademicSubject_AcademicSubjectDescriptor FOREIGN KEY (AcademicSubjectDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.AcademicSubjectDescriptor (HashKey, SchoolYearContext)
    GO






    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.LearningObjectiveGradeLevel WITH CHECK ADD CONSTRAINT FK_LearningObjectiveGradeLevel_GradeLevelDescriptor FOREIGN KEY (GradeLevelDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.GradeLevelDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.LearningObjectiveLearningStandard WITH CHECK ADD CONSTRAINT FK_LearningObjectiveLearningStandard_LearningStandard FOREIGN KEY (LearningStandardHashKey, SchoolYearContext)
    REFERENCES edfi.LearningStandard (HashKey, SchoolYearContext)
    GO



    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.LearningStandardAcademicSubject WITH CHECK ADD CONSTRAINT FK_LearningStandardAcademicSubject_AcademicSubjectDescriptor FOREIGN KEY (AcademicSubjectDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.AcademicSubjectDescriptor (HashKey, SchoolYearContext)
    GO






    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.LearningStandardGradeLevel WITH CHECK ADD CONSTRAINT FK_LearningStandardGradeLevel_GradeLevelDescriptor FOREIGN KEY (GradeLevelDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.GradeLevelDescriptor (HashKey, SchoolYearContext)
    GO







    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.LearningStandardCategoryDescriptor WITH CHECK ADD CONSTRAINT FK_LearningStandardCategoryDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.LearningStandardEquivalenceAssociation WITH CHECK ADD CONSTRAINT FK_SourceLearningStandardEquivalenceAssociation_LearningStandard FOREIGN KEY (SourceLearningStandardHashKey, SchoolYearContext)
    REFERENCES edfi.LearningStandard (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.LearningStandardEquivalenceAssociation WITH CHECK ADD CONSTRAINT FK_TargetLearningStandardEquivalenceAssociation_LearningStandard FOREIGN KEY (TargetLearningStandardHashKey, SchoolYearContext)
    REFERENCES edfi.LearningStandard (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.LearningStandardEquivalenceStrengthDescriptor WITH CHECK ADD CONSTRAINT FK_LearningStandardEquivalenceStrengthDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.LearningStandardScopeDescriptor WITH CHECK ADD CONSTRAINT FK_LearningStandardScopeDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.LevelOfEducationDescriptor WITH CHECK ADD CONSTRAINT FK_LevelOfEducationDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.LicenseStatusDescriptor WITH CHECK ADD CONSTRAINT FK_LicenseStatusDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.LicenseTypeDescriptor WITH CHECK ADD CONSTRAINT FK_LicenseTypeDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.LimitedEnglishProficiencyDescriptor WITH CHECK ADD CONSTRAINT FK_LimitedEnglishProficiencyDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.LocaleDescriptor WITH CHECK ADD CONSTRAINT FK_LocaleDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.LocalEducationAgency WITH CHECK ADD CONSTRAINT FK_LocalEducationAgency_EducationOrganization FOREIGN KEY (EducationOrganizationHashKey, SchoolYearContext)
    REFERENCES edfi.EducationOrganization (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.LocalEducationAgencyAccountability WITH CHECK ADD CONSTRAINT FK_LocalEducationAgencyAccountability_SchoolYearType FOREIGN KEY (SchoolYearTypeHashKey, SchoolYearContext)
    REFERENCES edfi.SchoolYearType (HashKey, SchoolYearContext)
    GO





    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.LocalEducationAgencyCategoryDescriptor WITH CHECK ADD CONSTRAINT FK_LocalEducationAgencyCategoryDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.Location WITH CHECK ADD CONSTRAINT FK_Location_School FOREIGN KEY (SchoolHashKey, SchoolYearContext)
    REFERENCES edfi.School (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.MagnetSpecialProgramEmphasisSchoolDescriptor WITH CHECK ADD CONSTRAINT FK_MagnetSpecialProgramEmphasisSchoolDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.MediumOfInstructionDescriptor WITH CHECK ADD CONSTRAINT FK_MediumOfInstructionDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.MethodCreditEarnedDescriptor WITH CHECK ADD CONSTRAINT FK_MethodCreditEarnedDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.MigrantEducationProgramServiceDescriptor WITH CHECK ADD CONSTRAINT FK_MigrantEducationProgramServiceDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.MonitoredDescriptor WITH CHECK ADD CONSTRAINT FK_MonitoredDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.NeglectedOrDelinquentProgramDescriptor WITH CHECK ADD CONSTRAINT FK_NeglectedOrDelinquentProgramDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.NeglectedOrDelinquentProgramServiceDescriptor WITH CHECK ADD CONSTRAINT FK_NeglectedOrDelinquentProgramServiceDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.NetworkPurposeDescriptor WITH CHECK ADD CONSTRAINT FK_NetworkPurposeDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.ObjectiveAssessment WITH CHECK ADD CONSTRAINT FK_ObjectiveAssessment_Assessment FOREIGN KEY (AssessmentHashKey, SchoolYearContext)
    REFERENCES edfi.Assessment (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.ObjectiveAssessmentAssessmentItem WITH CHECK ADD CONSTRAINT FK_ObjectiveAssessmentAssessmentItem_AssessmentItem FOREIGN KEY (AssessmentItemHashKey, SchoolYearContext)
    REFERENCES edfi.AssessmentItem (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.ObjectiveAssessmentLearningObjective WITH CHECK ADD CONSTRAINT FK_ObjectiveAssessmentLearningObjective_LearningObjective FOREIGN KEY (LearningObjectiveHashKey, SchoolYearContext)
    REFERENCES edfi.LearningObjective (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.ObjectiveAssessmentLearningStandard WITH CHECK ADD CONSTRAINT FK_ObjectiveAssessmentLearningStandard_LearningStandard FOREIGN KEY (LearningStandardHashKey, SchoolYearContext)
    REFERENCES edfi.LearningStandard (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.ObjectiveAssessmentPerformanceLevel WITH CHECK ADD CONSTRAINT FK_ObjectiveAssessmentPerformanceLevel_AssessmentReportingMethodDescriptor FOREIGN KEY (AssessmentReportingMethodDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.AssessmentReportingMethodDescriptor (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.ObjectiveAssessmentPerformanceLevel WITH CHECK ADD CONSTRAINT FK_ObjectiveAssessmentPerformanceLevel_PerformanceLevelDescriptor FOREIGN KEY (PerformanceLevelDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.PerformanceLevelDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.ObjectiveAssessmentScore WITH CHECK ADD CONSTRAINT FK_ObjectiveAssessmentScore_AssessmentReportingMethodDescriptor FOREIGN KEY (AssessmentReportingMethodDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.AssessmentReportingMethodDescriptor (HashKey, SchoolYearContext)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.OldEthnicityDescriptor WITH CHECK ADD CONSTRAINT FK_OldEthnicityDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.OpenStaffPosition WITH CHECK ADD CONSTRAINT FK_OpenStaffPosition_EducationOrganization FOREIGN KEY (EducationOrganizationHashKey, SchoolYearContext)
    REFERENCES edfi.EducationOrganization (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.OpenStaffPositionAcademicSubject WITH CHECK ADD CONSTRAINT FK_OpenStaffPositionAcademicSubject_AcademicSubjectDescriptor FOREIGN KEY (AcademicSubjectDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.AcademicSubjectDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.OpenStaffPositionInstructionalGradeLevel WITH CHECK ADD CONSTRAINT FK_OpenStaffPositionInstructionalGradeLevel_GradeLevelDescriptor FOREIGN KEY (GradeLevelDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.GradeLevelDescriptor (HashKey, SchoolYearContext)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.OperationalStatusDescriptor WITH CHECK ADD CONSTRAINT FK_OperationalStatusDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.OtherNameTypeDescriptor WITH CHECK ADD CONSTRAINT FK_OtherNameTypeDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.ParentAddress WITH CHECK ADD CONSTRAINT FK_ParentAddress_AddressTypeDescriptor FOREIGN KEY (AddressTypeDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.AddressTypeDescriptor (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.ParentAddress WITH CHECK ADD CONSTRAINT FK_ParentAddress_StateAbbreviationDescriptor FOREIGN KEY (StateAbbreviationDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.StateAbbreviationDescriptor (HashKey, SchoolYearContext)
    GO




    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.ParentElectronicMail WITH CHECK ADD CONSTRAINT FK_ParentElectronicMail_ElectronicMailTypeDescriptor FOREIGN KEY (ElectronicMailTypeDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.ElectronicMailTypeDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.ParentInternationalAddress WITH CHECK ADD CONSTRAINT FK_ParentInternationalAddress_AddressTypeDescriptor FOREIGN KEY (AddressTypeDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.AddressTypeDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.ParentLanguage WITH CHECK ADD CONSTRAINT FK_ParentLanguage_LanguageDescriptor FOREIGN KEY (LanguageDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.LanguageDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.ParentLanguageUse WITH CHECK ADD CONSTRAINT FK_ParentLanguageUse_LanguageUseDescriptor FOREIGN KEY (LanguageUseDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.LanguageUseDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.ParentOtherName WITH CHECK ADD CONSTRAINT FK_ParentOtherName_OtherNameTypeDescriptor FOREIGN KEY (OtherNameTypeDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.OtherNameTypeDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.ParentPersonalIdentificationDocument WITH CHECK ADD CONSTRAINT FK_ParentPersonalIdentificationDocument_IdentificationDocumentUseDescriptor FOREIGN KEY (IdentificationDocumentUseDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.IdentificationDocumentUseDescriptor (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.ParentPersonalIdentificationDocument WITH CHECK ADD CONSTRAINT FK_ParentPersonalIdentificationDocument_PersonalInformationVerificationDescriptor FOREIGN KEY (PersonalInformationVerificationDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.PersonalInformationVerificationDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.ParentTelephone WITH CHECK ADD CONSTRAINT FK_ParentTelephone_TelephoneNumberTypeDescriptor FOREIGN KEY (TelephoneNumberTypeDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.TelephoneNumberTypeDescriptor (HashKey, SchoolYearContext)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.ParticipationDescriptor WITH CHECK ADD CONSTRAINT FK_ParticipationDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.ParticipationStatusDescriptor WITH CHECK ADD CONSTRAINT FK_ParticipationStatusDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.Payroll WITH CHECK ADD CONSTRAINT FK_Payroll_Account FOREIGN KEY (AccountHashKey, SchoolYearContext)
    REFERENCES edfi.Account (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.Payroll WITH CHECK ADD CONSTRAINT FK_Payroll_Staff FOREIGN KEY (StaffHashKey, SchoolYearContext)
    REFERENCES edfi.Staff (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.PerformanceBaseConversionDescriptor WITH CHECK ADD CONSTRAINT FK_PerformanceBaseConversionDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.PerformanceLevelDescriptor WITH CHECK ADD CONSTRAINT FK_PerformanceLevelDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.Person WITH CHECK ADD CONSTRAINT FK_Person_SourceSystemDescriptor FOREIGN KEY (SourceSystemDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.SourceSystemDescriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.PersonalInformationVerificationDescriptor WITH CHECK ADD CONSTRAINT FK_PersonalInformationVerificationDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.PlatformTypeDescriptor WITH CHECK ADD CONSTRAINT FK_PlatformTypeDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.PopulationServedDescriptor WITH CHECK ADD CONSTRAINT FK_PopulationServedDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.PostingResultDescriptor WITH CHECK ADD CONSTRAINT FK_PostingResultDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.PostSecondaryEvent WITH CHECK ADD CONSTRAINT FK_PostSecondaryEvent_PostSecondaryEventCategoryDescriptor FOREIGN KEY (PostSecondaryEventCategoryDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.PostSecondaryEventCategoryDescriptor (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.PostSecondaryEvent WITH CHECK ADD CONSTRAINT FK_PostSecondaryEvent_Student FOREIGN KEY (StudentHashKey, SchoolYearContext)
    REFERENCES edfi.Student (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.PostSecondaryEventCategoryDescriptor WITH CHECK ADD CONSTRAINT FK_PostSecondaryEventCategoryDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.PostSecondaryInstitution WITH CHECK ADD CONSTRAINT FK_PostSecondaryInstitution_EducationOrganization FOREIGN KEY (EducationOrganizationHashKey, SchoolYearContext)
    REFERENCES edfi.EducationOrganization (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.PostSecondaryInstitutionMediumOfInstruction WITH CHECK ADD CONSTRAINT FK_PostSecondaryInstitutionMediumOfInstruction_MediumOfInstructionDescriptor FOREIGN KEY (MediumOfInstructionDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.MediumOfInstructionDescriptor (HashKey, SchoolYearContext)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.PostSecondaryInstitutionLevelDescriptor WITH CHECK ADD CONSTRAINT FK_PostSecondaryInstitutionLevelDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.ProficiencyDescriptor WITH CHECK ADD CONSTRAINT FK_ProficiencyDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.Program WITH CHECK ADD CONSTRAINT FK_Program_EducationOrganization FOREIGN KEY (EducationOrganizationHashKey, SchoolYearContext)
    REFERENCES edfi.EducationOrganization (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.Program WITH CHECK ADD CONSTRAINT FK_Program_ProgramTypeDescriptor FOREIGN KEY (ProgramTypeDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.ProgramTypeDescriptor (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.ProgramCharacteristic WITH CHECK ADD CONSTRAINT FK_ProgramCharacteristic_ProgramCharacteristicDescriptor FOREIGN KEY (ProgramCharacteristicDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.ProgramCharacteristicDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.ProgramLearningObjective WITH CHECK ADD CONSTRAINT FK_ProgramLearningObjective_LearningObjective FOREIGN KEY (LearningObjectiveHashKey, SchoolYearContext)
    REFERENCES edfi.LearningObjective (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.ProgramLearningStandard WITH CHECK ADD CONSTRAINT FK_ProgramLearningStandard_LearningStandard FOREIGN KEY (LearningStandardHashKey, SchoolYearContext)
    REFERENCES edfi.LearningStandard (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.ProgramService WITH CHECK ADD CONSTRAINT FK_ProgramService_ServiceDescriptor FOREIGN KEY (ServiceDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.ServiceDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.ProgramSponsor WITH CHECK ADD CONSTRAINT FK_ProgramSponsor_ProgramSponsorDescriptor FOREIGN KEY (ProgramSponsorDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.ProgramSponsorDescriptor (HashKey, SchoolYearContext)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.ProgramAssignmentDescriptor WITH CHECK ADD CONSTRAINT FK_ProgramAssignmentDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.ProgramCharacteristicDescriptor WITH CHECK ADD CONSTRAINT FK_ProgramCharacteristicDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.ProgramSponsorDescriptor WITH CHECK ADD CONSTRAINT FK_ProgramSponsorDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.ProgramTypeDescriptor WITH CHECK ADD CONSTRAINT FK_ProgramTypeDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.ProgressDescriptor WITH CHECK ADD CONSTRAINT FK_ProgressDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.ProgressLevelDescriptor WITH CHECK ADD CONSTRAINT FK_ProgressLevelDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.ProviderCategoryDescriptor WITH CHECK ADD CONSTRAINT FK_ProviderCategoryDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.ProviderProfitabilityDescriptor WITH CHECK ADD CONSTRAINT FK_ProviderProfitabilityDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.ProviderStatusDescriptor WITH CHECK ADD CONSTRAINT FK_ProviderStatusDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.PublicationStatusDescriptor WITH CHECK ADD CONSTRAINT FK_PublicationStatusDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.QuestionFormDescriptor WITH CHECK ADD CONSTRAINT FK_QuestionFormDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.RaceDescriptor WITH CHECK ADD CONSTRAINT FK_RaceDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.ReasonExitedDescriptor WITH CHECK ADD CONSTRAINT FK_ReasonExitedDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.ReasonNotTestedDescriptor WITH CHECK ADD CONSTRAINT FK_ReasonNotTestedDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.RecognitionTypeDescriptor WITH CHECK ADD CONSTRAINT FK_RecognitionTypeDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.RelationDescriptor WITH CHECK ADD CONSTRAINT FK_RelationDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.RepeatIdentifierDescriptor WITH CHECK ADD CONSTRAINT FK_RepeatIdentifierDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.ReportCard WITH CHECK ADD CONSTRAINT FK_ReportCard_EducationOrganization FOREIGN KEY (EducationOrganizationHashKey, SchoolYearContext)
    REFERENCES edfi.EducationOrganization (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.ReportCard WITH CHECK ADD CONSTRAINT FK_GradingReportCard_GradingPeriod FOREIGN KEY (GradingPeriodHashKey, SchoolYearContext)
    REFERENCES edfi.GradingPeriod (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.ReportCard WITH CHECK ADD CONSTRAINT FK_ReportCard_Student FOREIGN KEY (StudentHashKey, SchoolYearContext)
    REFERENCES edfi.Student (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.ReportCardGrade WITH CHECK ADD CONSTRAINT FK_ReportCardGrade_Grade FOREIGN KEY (GradeHashKey, SchoolYearContext)
    REFERENCES edfi.Grade (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.ReportCardGradePointAverage WITH CHECK ADD CONSTRAINT FK_ReportCardGradePointAverage_GradePointAverageTypeDescriptor FOREIGN KEY (GradePointAverageTypeDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.GradePointAverageTypeDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.ReportCardStudentCompetencyObjective WITH CHECK ADD CONSTRAINT FK_ReportCardStudentCompetencyObjective_StudentCompetencyObjective FOREIGN KEY (StudentCompetencyObjectiveHashKey, SchoolYearContext)
    REFERENCES edfi.StudentCompetencyObjective (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.ReportCardStudentLearningObjective WITH CHECK ADD CONSTRAINT FK_ReportCardStudentLearningObjective_StudentLearningObjective FOREIGN KEY (StudentLearningObjectiveHashKey, SchoolYearContext)
    REFERENCES edfi.StudentLearningObjective (HashKey, SchoolYearContext)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.ReporterDescriptionDescriptor WITH CHECK ADD CONSTRAINT FK_ReporterDescriptionDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.ResidencyStatusDescriptor WITH CHECK ADD CONSTRAINT FK_ResidencyStatusDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.ResponseIndicatorDescriptor WITH CHECK ADD CONSTRAINT FK_ResponseIndicatorDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.ResponsibilityDescriptor WITH CHECK ADD CONSTRAINT FK_ResponsibilityDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.RestraintEvent WITH CHECK ADD CONSTRAINT FK_RestraintEvent_School FOREIGN KEY (SchoolHashKey, SchoolYearContext)
    REFERENCES edfi.School (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.RestraintEvent WITH CHECK ADD CONSTRAINT FK_RestraintEvent_Student FOREIGN KEY (StudentHashKey, SchoolYearContext)
    REFERENCES edfi.Student (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.RestraintEventProgram WITH CHECK ADD CONSTRAINT FK_RestraintEventProgram_Program FOREIGN KEY (ProgramHashKey, SchoolYearContext)
    REFERENCES edfi.Program (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.RestraintEventReason WITH CHECK ADD CONSTRAINT FK_RestraintEventReason_RestraintEventReasonDescriptor FOREIGN KEY (RestraintEventReasonDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.RestraintEventReasonDescriptor (HashKey, SchoolYearContext)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.RestraintEventReasonDescriptor WITH CHECK ADD CONSTRAINT FK_RestraintEventReasonDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.ResultDatatypeTypeDescriptor WITH CHECK ADD CONSTRAINT FK_ResultDatatypeTypeDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.RetestIndicatorDescriptor WITH CHECK ADD CONSTRAINT FK_RetestIndicatorDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.School WITH CHECK ADD CONSTRAINT FK_School_EducationOrganization FOREIGN KEY (EducationOrganizationHashKey, SchoolYearContext)
    REFERENCES edfi.EducationOrganization (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.SchoolCategory WITH CHECK ADD CONSTRAINT FK_SchoolCategory_SchoolCategoryDescriptor FOREIGN KEY (SchoolCategoryDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.SchoolCategoryDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.SchoolGradeLevel WITH CHECK ADD CONSTRAINT FK_SchoolGradeLevel_GradeLevelDescriptor FOREIGN KEY (GradeLevelDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.GradeLevelDescriptor (HashKey, SchoolYearContext)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SchoolCategoryDescriptor WITH CHECK ADD CONSTRAINT FK_SchoolCategoryDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SchoolChoiceImplementStatusDescriptor WITH CHECK ADD CONSTRAINT FK_SchoolChoiceImplementStatusDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SchoolFoodServiceProgramServiceDescriptor WITH CHECK ADD CONSTRAINT FK_SchoolFoodServiceProgramServiceDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SchoolTypeDescriptor WITH CHECK ADD CONSTRAINT FK_SchoolTypeDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.Section WITH CHECK ADD CONSTRAINT FK_Section_CourseOffering FOREIGN KEY (CourseOfferingHashKey, SchoolYearContext)
    REFERENCES edfi.CourseOffering (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.SectionCharacteristic WITH CHECK ADD CONSTRAINT FK_SectionCharacteristic_SectionCharacteristicDescriptor FOREIGN KEY (SectionCharacteristicDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.SectionCharacteristicDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.SectionClassPeriod WITH CHECK ADD CONSTRAINT FK_SectionClassPeriod_ClassPeriod FOREIGN KEY (ClassPeriodHashKey, SchoolYearContext)
    REFERENCES edfi.ClassPeriod (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.SectionCourseLevelCharacteristic WITH CHECK ADD CONSTRAINT FK_SectionCourseLevelCharacteristic_CourseLevelCharacteristicDescriptor FOREIGN KEY (CourseLevelCharacteristicDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.CourseLevelCharacteristicDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.SectionOfferedGradeLevel WITH CHECK ADD CONSTRAINT FK_SectionOfferedGradeLevel_GradeLevelDescriptor FOREIGN KEY (GradeLevelDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.GradeLevelDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.SectionProgram WITH CHECK ADD CONSTRAINT FK_SectionProgram_Program FOREIGN KEY (ProgramHashKey, SchoolYearContext)
    REFERENCES edfi.Program (HashKey, SchoolYearContext)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SectionAttendanceTakenEvent WITH CHECK ADD CONSTRAINT FK_SectionAttendanceTakenEvent_CalendarDate FOREIGN KEY (CalendarDateHashKey, SchoolYearContext)
    REFERENCES edfi.CalendarDate (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SectionAttendanceTakenEvent WITH CHECK ADD CONSTRAINT FK_SectionAttendanceTakenEvent_Section FOREIGN KEY (SectionHashKey, SchoolYearContext)
    REFERENCES edfi.Section (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SectionCharacteristicDescriptor WITH CHECK ADD CONSTRAINT FK_SectionCharacteristicDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SeparationDescriptor WITH CHECK ADD CONSTRAINT FK_SeparationDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SeparationReasonDescriptor WITH CHECK ADD CONSTRAINT FK_SeparationReasonDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.ServiceDescriptor WITH CHECK ADD CONSTRAINT FK_ServiceDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.Session WITH CHECK ADD CONSTRAINT FK_Session_School FOREIGN KEY (SchoolHashKey, SchoolYearContext)
    REFERENCES edfi.School (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.Session WITH CHECK ADD CONSTRAINT FK_Session_SchoolYearType FOREIGN KEY (SchoolYearTypeHashKey, SchoolYearContext)
    REFERENCES edfi.SchoolYearType (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.SessionAcademicWeek WITH CHECK ADD CONSTRAINT FK_SessionAcademicWeek_AcademicWeek FOREIGN KEY (AcademicWeekHashKey, SchoolYearContext)
    REFERENCES edfi.AcademicWeek (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.SessionGradingPeriod WITH CHECK ADD CONSTRAINT FK_SessionGradingPeriod_GradingPeriod FOREIGN KEY (GradingPeriodHashKey, SchoolYearContext)
    REFERENCES edfi.GradingPeriod (HashKey, SchoolYearContext)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SexDescriptor WITH CHECK ADD CONSTRAINT FK_SexDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SourceSystemDescriptor WITH CHECK ADD CONSTRAINT FK_SourceSystemDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SpecialEducationProgramServiceDescriptor WITH CHECK ADD CONSTRAINT FK_SpecialEducationProgramServiceDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SpecialEducationSettingDescriptor WITH CHECK ADD CONSTRAINT FK_SpecialEducationSettingDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StaffAddress WITH CHECK ADD CONSTRAINT FK_StaffAddress_AddressTypeDescriptor FOREIGN KEY (AddressTypeDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.AddressTypeDescriptor (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StaffAddress WITH CHECK ADD CONSTRAINT FK_StaffAddress_StateAbbreviationDescriptor FOREIGN KEY (StateAbbreviationDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.StateAbbreviationDescriptor (HashKey, SchoolYearContext)
    GO




    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StaffCredential WITH CHECK ADD CONSTRAINT FK_StaffCredential_Credential FOREIGN KEY (CredentialHashKey, SchoolYearContext)
    REFERENCES edfi.Credential (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StaffElectronicMail WITH CHECK ADD CONSTRAINT FK_StaffElectronicMail_ElectronicMailTypeDescriptor FOREIGN KEY (ElectronicMailTypeDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.ElectronicMailTypeDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StaffIdentificationCode WITH CHECK ADD CONSTRAINT FK_StaffIdentificationCode_StaffIdentificationSystemDescriptor FOREIGN KEY (StaffIdentificationSystemDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.StaffIdentificationSystemDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StaffIdentificationDocument WITH CHECK ADD CONSTRAINT FK_StaffIdentificationDocument_IdentificationDocumentUseDescriptor FOREIGN KEY (IdentificationDocumentUseDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.IdentificationDocumentUseDescriptor (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StaffIdentificationDocument WITH CHECK ADD CONSTRAINT FK_StaffIdentificationDocument_PersonalInformationVerificationDescriptor FOREIGN KEY (PersonalInformationVerificationDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.PersonalInformationVerificationDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StaffInternationalAddress WITH CHECK ADD CONSTRAINT FK_StaffInternationalAddress_AddressTypeDescriptor FOREIGN KEY (AddressTypeDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.AddressTypeDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StaffLanguage WITH CHECK ADD CONSTRAINT FK_StaffLanguage_LanguageDescriptor FOREIGN KEY (LanguageDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.LanguageDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StaffLanguageUse WITH CHECK ADD CONSTRAINT FK_StaffLanguageUse_LanguageUseDescriptor FOREIGN KEY (LanguageUseDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.LanguageUseDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StaffOtherName WITH CHECK ADD CONSTRAINT FK_StaffOtherName_OtherNameTypeDescriptor FOREIGN KEY (OtherNameTypeDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.OtherNameTypeDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StaffPersonalIdentificationDocument WITH CHECK ADD CONSTRAINT FK_StaffPersonalIdentificationDocument_IdentificationDocumentUseDescriptor FOREIGN KEY (IdentificationDocumentUseDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.IdentificationDocumentUseDescriptor (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StaffPersonalIdentificationDocument WITH CHECK ADD CONSTRAINT FK_StaffPersonalIdentificationDocument_PersonalInformationVerificationDescriptor FOREIGN KEY (PersonalInformationVerificationDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.PersonalInformationVerificationDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StaffRace WITH CHECK ADD CONSTRAINT FK_StaffRace_RaceDescriptor FOREIGN KEY (RaceDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.RaceDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StaffRecognition WITH CHECK ADD CONSTRAINT FK_StaffRecognition_RecognitionTypeDescriptor FOREIGN KEY (RecognitionTypeDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.RecognitionTypeDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StaffTelephone WITH CHECK ADD CONSTRAINT FK_StaffTelephone_TelephoneNumberTypeDescriptor FOREIGN KEY (TelephoneNumberTypeDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.TelephoneNumberTypeDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StaffTribalAffiliation WITH CHECK ADD CONSTRAINT FK_StaffTribalAffiliation_TribalAffiliationDescriptor FOREIGN KEY (TribalAffiliationDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.TribalAffiliationDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StaffVisa WITH CHECK ADD CONSTRAINT FK_StaffVisa_VisaDescriptor FOREIGN KEY (VisaDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.VisaDescriptor (HashKey, SchoolYearContext)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StaffAbsenceEvent WITH CHECK ADD CONSTRAINT FK_StaffAbsenceEvent_AbsenceEventCategoryDescriptor FOREIGN KEY (AbsenceEventCategoryDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.AbsenceEventCategoryDescriptor (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StaffAbsenceEvent WITH CHECK ADD CONSTRAINT FK_StaffAbsenceEvent_Staff FOREIGN KEY (StaffHashKey, SchoolYearContext)
    REFERENCES edfi.Staff (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StaffClassificationDescriptor WITH CHECK ADD CONSTRAINT FK_StaffClassificationDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StaffCohortAssociation WITH CHECK ADD CONSTRAINT FK_StaffCohortAssociation_Cohort FOREIGN KEY (CohortHashKey, SchoolYearContext)
    REFERENCES edfi.Cohort (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StaffCohortAssociation WITH CHECK ADD CONSTRAINT FK_StaffCohortAssociation_Staff FOREIGN KEY (StaffHashKey, SchoolYearContext)
    REFERENCES edfi.Staff (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StaffDisciplineIncidentAssociation WITH CHECK ADD CONSTRAINT FK_StaffDisciplineIncidentAssociation_DisciplineIncident FOREIGN KEY (DisciplineIncidentHashKey, SchoolYearContext)
    REFERENCES edfi.DisciplineIncident (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StaffDisciplineIncidentAssociation WITH CHECK ADD CONSTRAINT FK_StaffDisciplineIncidentAssociation_Staff FOREIGN KEY (StaffHashKey, SchoolYearContext)
    REFERENCES edfi.Staff (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StaffDisciplineIncidentAssociationDisciplineIncidentParticipationCode WITH CHECK ADD CONSTRAINT FK_StaffDisciplineIncidentAssociationDisciplineIncidentParticipationCode_DisciplineIncidentParticipationCodeDescriptor FOREIGN KEY (DisciplineIncidentParticipationCodeDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.DisciplineIncidentParticipationCodeDescriptor (HashKey, SchoolYearContext)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StaffEducationOrganizationAssignmentAssociation WITH CHECK ADD CONSTRAINT FK_StaffEducationOrganizationAssignmentAssociation_EducationOrganization FOREIGN KEY (EducationOrganizationHashKey, SchoolYearContext)
    REFERENCES edfi.EducationOrganization (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StaffEducationOrganizationAssignmentAssociation WITH CHECK ADD CONSTRAINT FK_StaffEducationOrganizationAssignmentAssociation_Staff FOREIGN KEY (StaffHashKey, SchoolYearContext)
    REFERENCES edfi.Staff (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StaffEducationOrganizationAssignmentAssociation WITH CHECK ADD CONSTRAINT FK_StaffEducationOrganizationAssignmentAssociation_StaffClassificationDescriptor FOREIGN KEY (StaffClassificationDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.StaffClassificationDescriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StaffEducationOrganizationContactAssociation WITH CHECK ADD CONSTRAINT FK_StaffEducationOrganizationContactAssociation_EducationOrganization FOREIGN KEY (EducationOrganizationHashKey, SchoolYearContext)
    REFERENCES edfi.EducationOrganization (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StaffEducationOrganizationContactAssociation WITH CHECK ADD CONSTRAINT FK_StaffEducationOrganizationContactAssociation_Staff FOREIGN KEY (StaffHashKey, SchoolYearContext)
    REFERENCES edfi.Staff (HashKey, SchoolYearContext)
    GO




    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StaffEducationOrganizationContactAssociationTelephone WITH CHECK ADD CONSTRAINT FK_StaffEducationOrganizationContactAssociationTelephone_TelephoneNumberTypeDescriptor FOREIGN KEY (TelephoneNumberTypeDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.TelephoneNumberTypeDescriptor (HashKey, SchoolYearContext)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StaffEducationOrganizationEmploymentAssociation WITH CHECK ADD CONSTRAINT FK_StaffEducationOrganizationEmploymentAssociation_EducationOrganization FOREIGN KEY (EducationOrganizationHashKey, SchoolYearContext)
    REFERENCES edfi.EducationOrganization (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StaffEducationOrganizationEmploymentAssociation WITH CHECK ADD CONSTRAINT FK_StaffEducationOrganizationEmploymentAssociation_EmploymentStatusDescriptor FOREIGN KEY (EmploymentStatusDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.EmploymentStatusDescriptor (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StaffEducationOrganizationEmploymentAssociation WITH CHECK ADD CONSTRAINT FK_StaffEducationOrganizationEmploymentAssociation_Staff FOREIGN KEY (StaffHashKey, SchoolYearContext)
    REFERENCES edfi.Staff (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StaffIdentificationSystemDescriptor WITH CHECK ADD CONSTRAINT FK_StaffIdentificationSystemDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StaffLeave WITH CHECK ADD CONSTRAINT FK_StaffLeave_Staff FOREIGN KEY (StaffHashKey, SchoolYearContext)
    REFERENCES edfi.Staff (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StaffLeave WITH CHECK ADD CONSTRAINT FK_StaffLeave_StaffLeaveEventCategoryDescriptor FOREIGN KEY (StaffLeaveEventCategoryDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.StaffLeaveEventCategoryDescriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StaffLeaveEventCategoryDescriptor WITH CHECK ADD CONSTRAINT FK_StaffLeaveEventCategoryDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StaffProgramAssociation WITH CHECK ADD CONSTRAINT FK_StaffProgramAssociation_Program FOREIGN KEY (ProgramHashKey, SchoolYearContext)
    REFERENCES edfi.Program (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StaffProgramAssociation WITH CHECK ADD CONSTRAINT FK_StaffProgramAssociation_Staff FOREIGN KEY (StaffHashKey, SchoolYearContext)
    REFERENCES edfi.Staff (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StaffSchoolAssociation WITH CHECK ADD CONSTRAINT FK_StaffSchoolAssociation_ProgramAssignmentDescriptor FOREIGN KEY (ProgramAssignmentDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.ProgramAssignmentDescriptor (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StaffSchoolAssociation WITH CHECK ADD CONSTRAINT FK_StaffSchoolAssociation_School FOREIGN KEY (SchoolHashKey, SchoolYearContext)
    REFERENCES edfi.School (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StaffSchoolAssociation WITH CHECK ADD CONSTRAINT FK_StaffSchoolAssociation_Staff FOREIGN KEY (StaffHashKey, SchoolYearContext)
    REFERENCES edfi.Staff (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StaffSchoolAssociationAcademicSubject WITH CHECK ADD CONSTRAINT FK_StaffSchoolAssociationAcademicSubject_AcademicSubjectDescriptor FOREIGN KEY (AcademicSubjectDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.AcademicSubjectDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StaffSchoolAssociationGradeLevel WITH CHECK ADD CONSTRAINT FK_StaffSchoolAssociationGradeLevel_GradeLevelDescriptor FOREIGN KEY (GradeLevelDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.GradeLevelDescriptor (HashKey, SchoolYearContext)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StaffSectionAssociation WITH CHECK ADD CONSTRAINT FK_StaffSectionAssociation_Section FOREIGN KEY (SectionHashKey, SchoolYearContext)
    REFERENCES edfi.Section (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StaffSectionAssociation WITH CHECK ADD CONSTRAINT FK_StaffSectionAssociation_Staff FOREIGN KEY (StaffHashKey, SchoolYearContext)
    REFERENCES edfi.Staff (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StateAbbreviationDescriptor WITH CHECK ADD CONSTRAINT FK_StateAbbreviationDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StateEducationAgency WITH CHECK ADD CONSTRAINT FK_StateEducationAgency_EducationOrganization FOREIGN KEY (EducationOrganizationHashKey, SchoolYearContext)
    REFERENCES edfi.EducationOrganization (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StateEducationAgencyAccountability WITH CHECK ADD CONSTRAINT FK_StateEducationAgencyAccountability_SchoolYearType FOREIGN KEY (SchoolYearTypeHashKey, SchoolYearContext)
    REFERENCES edfi.SchoolYearType (HashKey, SchoolYearContext)
    GO





    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentIdentificationDocument WITH CHECK ADD CONSTRAINT FK_StudentIdentificationDocument_IdentificationDocumentUseDescriptor FOREIGN KEY (IdentificationDocumentUseDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.IdentificationDocumentUseDescriptor (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentIdentificationDocument WITH CHECK ADD CONSTRAINT FK_StudentIdentificationDocument_PersonalInformationVerificationDescriptor FOREIGN KEY (PersonalInformationVerificationDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.PersonalInformationVerificationDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentOtherName WITH CHECK ADD CONSTRAINT FK_StudentOtherName_OtherNameTypeDescriptor FOREIGN KEY (OtherNameTypeDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.OtherNameTypeDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentPersonalIdentificationDocument WITH CHECK ADD CONSTRAINT FK_StudentPersonalIdentificationDocument_IdentificationDocumentUseDescriptor FOREIGN KEY (IdentificationDocumentUseDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.IdentificationDocumentUseDescriptor (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentPersonalIdentificationDocument WITH CHECK ADD CONSTRAINT FK_StudentPersonalIdentificationDocument_PersonalInformationVerificationDescriptor FOREIGN KEY (PersonalInformationVerificationDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.PersonalInformationVerificationDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentVisa WITH CHECK ADD CONSTRAINT FK_StudentVisa_VisaDescriptor FOREIGN KEY (VisaDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.VisaDescriptor (HashKey, SchoolYearContext)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentAcademicRecord WITH CHECK ADD CONSTRAINT FK_StudentAcademicRecord_EducationOrganization FOREIGN KEY (EducationOrganizationHashKey, SchoolYearContext)
    REFERENCES edfi.EducationOrganization (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentAcademicRecord WITH CHECK ADD CONSTRAINT FK_StudentAcademicRecord_SchoolYearType FOREIGN KEY (SchoolYearTypeHashKey, SchoolYearContext)
    REFERENCES edfi.SchoolYearType (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentAcademicRecord WITH CHECK ADD CONSTRAINT FK_StudentAcademicRecord_Student FOREIGN KEY (StudentHashKey, SchoolYearContext)
    REFERENCES edfi.Student (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentAcademicRecord WITH CHECK ADD CONSTRAINT FK_StudentAcademicRecord_TermDescriptor FOREIGN KEY (TermDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.TermDescriptor (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentAcademicRecordAcademicHonor WITH CHECK ADD CONSTRAINT FK_StudentAcademicRecordAcademicHonor_AcademicHonorCategoryDescriptor FOREIGN KEY (AcademicHonorCategoryDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.AcademicHonorCategoryDescriptor (HashKey, SchoolYearContext)
    GO




    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentAcademicRecordDiploma WITH CHECK ADD CONSTRAINT FK_StudentAcademicRecordDiploma_DiplomaTypeDescriptor FOREIGN KEY (DiplomaTypeDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.DiplomaTypeDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentAcademicRecordGradePointAverage WITH CHECK ADD CONSTRAINT FK_StudentAcademicRecordGradePointAverage_GradePointAverageTypeDescriptor FOREIGN KEY (GradePointAverageTypeDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.GradePointAverageTypeDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentAcademicRecordRecognition WITH CHECK ADD CONSTRAINT FK_StudentAcademicRecordRecognition_RecognitionTypeDescriptor FOREIGN KEY (RecognitionTypeDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.RecognitionTypeDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentAcademicRecordReportCard WITH CHECK ADD CONSTRAINT FK_StudentAcademicRecordReportCard_ReportCard FOREIGN KEY (ReportCardHashKey, SchoolYearContext)
    REFERENCES edfi.ReportCard (HashKey, SchoolYearContext)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentAssessment WITH CHECK ADD CONSTRAINT FK_StudentAssessment_Assessment FOREIGN KEY (AssessmentHashKey, SchoolYearContext)
    REFERENCES edfi.Assessment (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentAssessment WITH CHECK ADD CONSTRAINT FK_StudentAssessment_Student FOREIGN KEY (StudentHashKey, SchoolYearContext)
    REFERENCES edfi.Student (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentAssessmentAccommodation WITH CHECK ADD CONSTRAINT FK_StudentAssessmentAccommodation_AccommodationDescriptor FOREIGN KEY (AccommodationDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.AccommodationDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentAssessmentItem WITH CHECK ADD CONSTRAINT FK_StudentAssessmentItem_AssessmentItem FOREIGN KEY (AssessmentItemHashKey, SchoolYearContext)
    REFERENCES edfi.AssessmentItem (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentAssessmentPerformanceLevel WITH CHECK ADD CONSTRAINT FK_StudentAssessmentPerformanceLevel_AssessmentReportingMethodDescriptor FOREIGN KEY (AssessmentReportingMethodDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.AssessmentReportingMethodDescriptor (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentAssessmentPerformanceLevel WITH CHECK ADD CONSTRAINT FK_StudentAssessmentPerformanceLevel_PerformanceLevelDescriptor FOREIGN KEY (PerformanceLevelDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.PerformanceLevelDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentAssessmentScoreResult WITH CHECK ADD CONSTRAINT FK_StudentAssessmentScoreResult_AssessmentReportingMethodDescriptor FOREIGN KEY (AssessmentReportingMethodDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.AssessmentReportingMethodDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentAssessmentStudentObjectiveAssessment WITH CHECK ADD CONSTRAINT FK_StudentAssessmentStudentObjectiveAssessment_ObjectiveAssessment FOREIGN KEY (ObjectiveAssessmentHashKey, SchoolYearContext)
    REFERENCES edfi.ObjectiveAssessment (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentAssessmentStudentObjectiveAssessmentPerformanceLevel WITH CHECK ADD CONSTRAINT FK_StudentAssessmentStudentObjectiveAssessmentPerformanceLevel_AssessmentReportingMethodDescriptor FOREIGN KEY (AssessmentReportingMethodDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.AssessmentReportingMethodDescriptor (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentAssessmentStudentObjectiveAssessmentPerformanceLevel WITH CHECK ADD CONSTRAINT FK_StudentAssessmentStudentObjectiveAssessmentPerformanceLevel_PerformanceLevelDescriptor FOREIGN KEY (PerformanceLevelDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.PerformanceLevelDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentAssessmentStudentObjectiveAssessmentScoreResult WITH CHECK ADD CONSTRAINT FK_StudentAssessmentStudentObjectiveAssessmentScoreResult_AssessmentReportingMethodDescriptor FOREIGN KEY (AssessmentReportingMethodDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.AssessmentReportingMethodDescriptor (HashKey, SchoolYearContext)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentCharacteristicDescriptor WITH CHECK ADD CONSTRAINT FK_StudentCharacteristicDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentCohortAssociation WITH CHECK ADD CONSTRAINT FK_StudentCohortAssociation_Cohort FOREIGN KEY (CohortHashKey, SchoolYearContext)
    REFERENCES edfi.Cohort (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentCohortAssociation WITH CHECK ADD CONSTRAINT FK_StudentCohortAssociation_Student FOREIGN KEY (StudentHashKey, SchoolYearContext)
    REFERENCES edfi.Student (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentCohortAssociationSection WITH CHECK ADD CONSTRAINT FK_StudentCohortAssociationSection_Section FOREIGN KEY (SectionHashKey, SchoolYearContext)
    REFERENCES edfi.Section (HashKey, SchoolYearContext)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentCompetencyObjective WITH CHECK ADD CONSTRAINT FK_ObjectiveStudentCompetencyObjective_CompetencyObjective FOREIGN KEY (ObjectiveCompetencyObjectiveHashKey, SchoolYearContext)
    REFERENCES edfi.CompetencyObjective (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentCompetencyObjective WITH CHECK ADD CONSTRAINT FK_GradingStudentCompetencyObjective_GradingPeriod FOREIGN KEY (GradingPeriodHashKey, SchoolYearContext)
    REFERENCES edfi.GradingPeriod (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentCompetencyObjective WITH CHECK ADD CONSTRAINT FK_StudentCompetencyObjective_Student FOREIGN KEY (StudentHashKey, SchoolYearContext)
    REFERENCES edfi.Student (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentCompetencyObjectiveGeneralStudentProgramAssociation WITH CHECK ADD CONSTRAINT FK_StudentCompetencyObjectiveGeneralStudentProgramAssociation_GeneralStudentProgramAssociation FOREIGN KEY (GeneralStudentProgramAssociationHashKey, SchoolYearContext)
    REFERENCES edfi.GeneralStudentProgramAssociation (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentCompetencyObjectiveStudentSectionAssociation WITH CHECK ADD CONSTRAINT FK_StudentCompetencyObjectiveStudentSectionAssociation_StudentSectionAssociation FOREIGN KEY (StudentSectionAssociationHashKey, SchoolYearContext)
    REFERENCES edfi.StudentSectionAssociation (HashKey, SchoolYearContext)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentCTEProgramAssociation WITH CHECK ADD CONSTRAINT FK_StudentCTEProgramAssociation_GeneralStudentProgramAssociation FOREIGN KEY (GeneralStudentProgramAssociationHashKey, SchoolYearContext)
    REFERENCES edfi.GeneralStudentProgramAssociation (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentCTEProgramAssociationCTEProgram WITH CHECK ADD CONSTRAINT FK_StudentCTEProgramAssociationCTEProgram_CareerPathwayDescriptor FOREIGN KEY (CareerPathwayDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.CareerPathwayDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentCTEProgramAssociationCTEProgramService WITH CHECK ADD CONSTRAINT FK_StudentCTEProgramAssociationCTEProgramService_CTEProgramServiceDescriptor FOREIGN KEY (CTEProgramServiceDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.CTEProgramServiceDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentCTEProgramAssociationService WITH CHECK ADD CONSTRAINT FK_StudentCTEProgramAssociationService_ServiceDescriptor FOREIGN KEY (ServiceDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.ServiceDescriptor (HashKey, SchoolYearContext)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentDisciplineIncidentAssociation WITH CHECK ADD CONSTRAINT FK_StudentDisciplineIncidentAssociation_DisciplineIncident FOREIGN KEY (DisciplineIncidentHashKey, SchoolYearContext)
    REFERENCES edfi.DisciplineIncident (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentDisciplineIncidentAssociation WITH CHECK ADD CONSTRAINT FK_StudentDisciplineIncidentAssociation_Student FOREIGN KEY (StudentHashKey, SchoolYearContext)
    REFERENCES edfi.Student (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentDisciplineIncidentAssociationBehavior WITH CHECK ADD CONSTRAINT FK_StudentDisciplineIncidentAssociationBehavior_BehaviorDescriptor FOREIGN KEY (BehaviorDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.BehaviorDescriptor (HashKey, SchoolYearContext)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentEducationOrganizationAssociation WITH CHECK ADD CONSTRAINT FK_StudentEducationOrganizationAssociation_EducationOrganization FOREIGN KEY (EducationOrganizationHashKey, SchoolYearContext)
    REFERENCES edfi.EducationOrganization (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentEducationOrganizationAssociation WITH CHECK ADD CONSTRAINT FK_StudentEducationOrganizationAssociation_Student FOREIGN KEY (StudentHashKey, SchoolYearContext)
    REFERENCES edfi.Student (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentEducationOrganizationAssociationAddress WITH CHECK ADD CONSTRAINT FK_StudentEducationOrganizationAssociationAddress_AddressTypeDescriptor FOREIGN KEY (AddressTypeDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.AddressTypeDescriptor (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentEducationOrganizationAssociationAddress WITH CHECK ADD CONSTRAINT FK_StudentEducationOrganizationAssociationAddress_StateAbbreviationDescriptor FOREIGN KEY (StateAbbreviationDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.StateAbbreviationDescriptor (HashKey, SchoolYearContext)
    GO




    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentEducationOrganizationAssociationCohortYear WITH CHECK ADD CONSTRAINT FK_StudentEducationOrganizationAssociationCohortYear_CohortYearTypeDescriptor FOREIGN KEY (CohortYearTypeDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.CohortYearTypeDescriptor (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentEducationOrganizationAssociationCohortYear WITH CHECK ADD CONSTRAINT FK_StudentEducationOrganizationAssociationCohortYear_SchoolYearType FOREIGN KEY (SchoolYearTypeHashKey, SchoolYearContext)
    REFERENCES edfi.SchoolYearType (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentEducationOrganizationAssociationDisability WITH CHECK ADD CONSTRAINT FK_StudentEducationOrganizationAssociationDisability_DisabilityDescriptor FOREIGN KEY (DisabilityDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.DisabilityDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentEducationOrganizationAssociationDisabilityDesignation WITH CHECK ADD CONSTRAINT FK_StudentEducationOrganizationAssociationDisabilityDesignation_DisabilityDesignationDescriptor FOREIGN KEY (DisabilityDesignationDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.DisabilityDesignationDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentEducationOrganizationAssociationElectronicMail WITH CHECK ADD CONSTRAINT FK_StudentEducationOrganizationAssociationElectronicMail_ElectronicMailTypeDescriptor FOREIGN KEY (ElectronicMailTypeDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.ElectronicMailTypeDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentEducationOrganizationAssociationInternationalAddress WITH CHECK ADD CONSTRAINT FK_StudentEducationOrganizationAssociationInternationalAddress_AddressTypeDescriptor FOREIGN KEY (AddressTypeDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.AddressTypeDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentEducationOrganizationAssociationLanguage WITH CHECK ADD CONSTRAINT FK_StudentEducationOrganizationAssociationLanguage_LanguageDescriptor FOREIGN KEY (LanguageDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.LanguageDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentEducationOrganizationAssociationLanguageUse WITH CHECK ADD CONSTRAINT FK_StudentEducationOrganizationAssociationLanguageUse_LanguageUseDescriptor FOREIGN KEY (LanguageUseDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.LanguageUseDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentEducationOrganizationAssociationProgramParticipation WITH CHECK ADD CONSTRAINT FK_StudentEducationOrganizationAssociationProgramParticipation_ProgramTypeDescriptor FOREIGN KEY (ProgramTypeDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.ProgramTypeDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentEducationOrganizationAssociationProgramParticipationProgramCharacteristic WITH CHECK ADD CONSTRAINT FK_StudentEducationOrganizationAssociationProgramParticipationProgramCharacteristic_ProgramCharacteristicDescriptor FOREIGN KEY (ProgramCharacteristicDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.ProgramCharacteristicDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentEducationOrganizationAssociationRace WITH CHECK ADD CONSTRAINT FK_StudentEducationOrganizationAssociationRace_RaceDescriptor FOREIGN KEY (RaceDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.RaceDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentEducationOrganizationAssociationStudentCharacteristic WITH CHECK ADD CONSTRAINT FK_StudentEducationOrganizationAssociationStudentCharacteristic_StudentCharacteristicDescriptor FOREIGN KEY (StudentCharacteristicDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.StudentCharacteristicDescriptor (HashKey, SchoolYearContext)
    GO




    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentEducationOrganizationAssociationStudentIdentificationCode WITH CHECK ADD CONSTRAINT FK_StudentEducationOrganizationAssociationStudentIdentificationCode_StudentIdentificationSystemDescriptor FOREIGN KEY (StudentIdentificationSystemDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.StudentIdentificationSystemDescriptor (HashKey, SchoolYearContext)
    GO






    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentEducationOrganizationAssociationTelephone WITH CHECK ADD CONSTRAINT FK_StudentEducationOrganizationAssociationTelephone_TelephoneNumberTypeDescriptor FOREIGN KEY (TelephoneNumberTypeDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.TelephoneNumberTypeDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentEducationOrganizationAssociationTribalAffiliation WITH CHECK ADD CONSTRAINT FK_StudentEducationOrganizationAssociationTribalAffiliation_TribalAffiliationDescriptor FOREIGN KEY (TribalAffiliationDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.TribalAffiliationDescriptor (HashKey, SchoolYearContext)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentEducationOrganizationResponsibilityAssociation WITH CHECK ADD CONSTRAINT FK_StudentEducationOrganizationResponsibilityAssociation_EducationOrganization FOREIGN KEY (EducationOrganizationHashKey, SchoolYearContext)
    REFERENCES edfi.EducationOrganization (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentEducationOrganizationResponsibilityAssociation WITH CHECK ADD CONSTRAINT FK_StudentEducationOrganizationResponsibilityAssociation_ResponsibilityDescriptor FOREIGN KEY (ResponsibilityDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.ResponsibilityDescriptor (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentEducationOrganizationResponsibilityAssociation WITH CHECK ADD CONSTRAINT FK_StudentEducationOrganizationResponsibilityAssociation_Student FOREIGN KEY (StudentHashKey, SchoolYearContext)
    REFERENCES edfi.Student (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentGradebookEntry WITH CHECK ADD CONSTRAINT FK_StudentGradebookEntry_GradebookEntry FOREIGN KEY (GradebookEntryHashKey, SchoolYearContext)
    REFERENCES edfi.GradebookEntry (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentGradebookEntry WITH CHECK ADD CONSTRAINT FK_StudentGradebookEntry_StudentSectionAssociation FOREIGN KEY (StudentSectionAssociationHashKey, SchoolYearContext)
    REFERENCES edfi.StudentSectionAssociation (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentHomelessProgramAssociation WITH CHECK ADD CONSTRAINT FK_StudentHomelessProgramAssociation_GeneralStudentProgramAssociation FOREIGN KEY (GeneralStudentProgramAssociationHashKey, SchoolYearContext)
    REFERENCES edfi.GeneralStudentProgramAssociation (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentHomelessProgramAssociationHomelessProgramService WITH CHECK ADD CONSTRAINT FK_StudentHomelessProgramAssociationHomelessProgramService_HomelessProgramServiceDescriptor FOREIGN KEY (HomelessProgramServiceDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.HomelessProgramServiceDescriptor (HashKey, SchoolYearContext)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentIdentificationSystemDescriptor WITH CHECK ADD CONSTRAINT FK_StudentIdentificationSystemDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentInterventionAssociation WITH CHECK ADD CONSTRAINT FK_StudentInterventionAssociation_Intervention FOREIGN KEY (InterventionHashKey, SchoolYearContext)
    REFERENCES edfi.Intervention (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentInterventionAssociation WITH CHECK ADD CONSTRAINT FK_StudentInterventionAssociation_Student FOREIGN KEY (StudentHashKey, SchoolYearContext)
    REFERENCES edfi.Student (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentInterventionAssociationInterventionEffectiveness WITH CHECK ADD CONSTRAINT FK_StudentInterventionAssociationInterventionEffectiveness_DiagnosisDescriptor FOREIGN KEY (DiagnosisDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.DiagnosisDescriptor (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentInterventionAssociationInterventionEffectiveness WITH CHECK ADD CONSTRAINT FK_StudentInterventionAssociationInterventionEffectiveness_GradeLevelDescriptor FOREIGN KEY (GradeLevelDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.GradeLevelDescriptor (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentInterventionAssociationInterventionEffectiveness WITH CHECK ADD CONSTRAINT FK_StudentInterventionAssociationInterventionEffectiveness_PopulationServedDescriptor FOREIGN KEY (PopulationServedDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.PopulationServedDescriptor (HashKey, SchoolYearContext)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentInterventionAttendanceEvent WITH CHECK ADD CONSTRAINT FK_StudentInterventionAttendanceEvent_AttendanceEventCategoryDescriptor FOREIGN KEY (AttendanceEventCategoryDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.AttendanceEventCategoryDescriptor (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentInterventionAttendanceEvent WITH CHECK ADD CONSTRAINT FK_StudentInterventionAttendanceEvent_Intervention FOREIGN KEY (InterventionHashKey, SchoolYearContext)
    REFERENCES edfi.Intervention (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentInterventionAttendanceEvent WITH CHECK ADD CONSTRAINT FK_StudentInterventionAttendanceEvent_Student FOREIGN KEY (StudentHashKey, SchoolYearContext)
    REFERENCES edfi.Student (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentLanguageInstructionProgramAssociation WITH CHECK ADD CONSTRAINT FK_StudentLanguageInstructionProgramAssociation_GeneralStudentProgramAssociation FOREIGN KEY (GeneralStudentProgramAssociationHashKey, SchoolYearContext)
    REFERENCES edfi.GeneralStudentProgramAssociation (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentLanguageInstructionProgramAssociationEnglishLanguageProficiencyAssessment WITH CHECK ADD CONSTRAINT FK_StudentLanguageInstructionProgramAssociationEnglishLanguageProficiencyAssessment_SchoolYearType FOREIGN KEY (SchoolYearTypeHashKey, SchoolYearContext)
    REFERENCES edfi.SchoolYearType (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentLanguageInstructionProgramAssociationLanguageInstructionProgramService WITH CHECK ADD CONSTRAINT FK_StudentLanguageInstructionProgramAssociationLanguageInstructionProgramService_LanguageInstructionProgramServiceDescriptor FOREIGN KEY (LanguageInstructionProgramServiceDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.LanguageInstructionProgramServiceDescriptor (HashKey, SchoolYearContext)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentLearningObjective WITH CHECK ADD CONSTRAINT FK_GradingStudentLearningObjective_GradingPeriod FOREIGN KEY (GradingPeriodHashKey, SchoolYearContext)
    REFERENCES edfi.GradingPeriod (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentLearningObjective WITH CHECK ADD CONSTRAINT FK_StudentLearningObjective_LearningObjective FOREIGN KEY (LearningObjectiveHashKey, SchoolYearContext)
    REFERENCES edfi.LearningObjective (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentLearningObjective WITH CHECK ADD CONSTRAINT FK_StudentLearningObjective_Student FOREIGN KEY (StudentHashKey, SchoolYearContext)
    REFERENCES edfi.Student (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentLearningObjectiveGeneralStudentProgramAssociation WITH CHECK ADD CONSTRAINT FK_StudentLearningObjectiveGeneralStudentProgramAssociation_GeneralStudentProgramAssociation FOREIGN KEY (GeneralStudentProgramAssociationHashKey, SchoolYearContext)
    REFERENCES edfi.GeneralStudentProgramAssociation (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentLearningObjectiveStudentSectionAssociation WITH CHECK ADD CONSTRAINT FK_StudentLearningObjectiveStudentSectionAssociation_StudentSectionAssociation FOREIGN KEY (StudentSectionAssociationHashKey, SchoolYearContext)
    REFERENCES edfi.StudentSectionAssociation (HashKey, SchoolYearContext)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentMigrantEducationProgramAssociation WITH CHECK ADD CONSTRAINT FK_StudentMigrantEducationProgramAssociation_GeneralStudentProgramAssociation FOREIGN KEY (GeneralStudentProgramAssociationHashKey, SchoolYearContext)
    REFERENCES edfi.GeneralStudentProgramAssociation (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentMigrantEducationProgramAssociationMigrantEducationProgramService WITH CHECK ADD CONSTRAINT FK_StudentMigrantEducationProgramAssociationMigrantEducationProgramService_MigrantEducationProgramServiceDescriptor FOREIGN KEY (MigrantEducationProgramServiceDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.MigrantEducationProgramServiceDescriptor (HashKey, SchoolYearContext)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentNeglectedOrDelinquentProgramAssociation WITH CHECK ADD CONSTRAINT FK_StudentNeglectedOrDelinquentProgramAssociation_GeneralStudentProgramAssociation FOREIGN KEY (GeneralStudentProgramAssociationHashKey, SchoolYearContext)
    REFERENCES edfi.GeneralStudentProgramAssociation (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentNeglectedOrDelinquentProgramAssociationNeglectedOrDelinquentProgramService WITH CHECK ADD CONSTRAINT FK_StudentNeglectedOrDelinquentProgramAssociationNeglectedOrDelinquentProgramService_NeglectedOrDelinquentProgramServiceDescript FOREIGN KEY (NeglectedOrDelinquentProgramServiceDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.NeglectedOrDelinquentProgramServiceDescriptor (HashKey, SchoolYearContext)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentParentAssociation WITH CHECK ADD CONSTRAINT FK_StudentParentAssociation_Parent FOREIGN KEY (ParentHashKey, SchoolYearContext)
    REFERENCES edfi.Parent (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentParentAssociation WITH CHECK ADD CONSTRAINT FK_StudentParentAssociation_Student FOREIGN KEY (StudentHashKey, SchoolYearContext)
    REFERENCES edfi.Student (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentParticipationCodeDescriptor WITH CHECK ADD CONSTRAINT FK_StudentParticipationCodeDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentProgramAssociation WITH CHECK ADD CONSTRAINT FK_StudentProgramAssociation_GeneralStudentProgramAssociation FOREIGN KEY (GeneralStudentProgramAssociationHashKey, SchoolYearContext)
    REFERENCES edfi.GeneralStudentProgramAssociation (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentProgramAssociationService WITH CHECK ADD CONSTRAINT FK_StudentProgramAssociationService_ServiceDescriptor FOREIGN KEY (ServiceDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.ServiceDescriptor (HashKey, SchoolYearContext)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentProgramAttendanceEvent WITH CHECK ADD CONSTRAINT FK_StudentProgramAttendanceEvent_AttendanceEventCategoryDescriptor FOREIGN KEY (AttendanceEventCategoryDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.AttendanceEventCategoryDescriptor (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentProgramAttendanceEvent WITH CHECK ADD CONSTRAINT FK_StudentProgramAttendanceEvent_EducationOrganization FOREIGN KEY (EducationOrganizationHashKey, SchoolYearContext)
    REFERENCES edfi.EducationOrganization (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentProgramAttendanceEvent WITH CHECK ADD CONSTRAINT FK_StudentProgramAttendanceEvent_Program FOREIGN KEY (ProgramHashKey, SchoolYearContext)
    REFERENCES edfi.Program (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentProgramAttendanceEvent WITH CHECK ADD CONSTRAINT FK_StudentProgramAttendanceEvent_Student FOREIGN KEY (StudentHashKey, SchoolYearContext)
    REFERENCES edfi.Student (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentSchoolAssociation WITH CHECK ADD CONSTRAINT FK_StudentSchoolAssociation_School FOREIGN KEY (SchoolHashKey, SchoolYearContext)
    REFERENCES edfi.School (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentSchoolAssociation WITH CHECK ADD CONSTRAINT FK_StudentSchoolAssociation_Student FOREIGN KEY (StudentHashKey, SchoolYearContext)
    REFERENCES edfi.Student (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentSchoolAssociationAlternativeGraduationPlan WITH CHECK ADD CONSTRAINT FK_AlternativeStudentSchoolAssociationAlternativeGraduationPlan_GraduationPlan FOREIGN KEY (AlternativeGraduationPlanHashKey, SchoolYearContext)
    REFERENCES edfi.GraduationPlan (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentSchoolAssociationEducationPlan WITH CHECK ADD CONSTRAINT FK_StudentSchoolAssociationEducationPlan_EducationPlanDescriptor FOREIGN KEY (EducationPlanDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.EducationPlanDescriptor (HashKey, SchoolYearContext)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentSchoolAttendanceEvent WITH CHECK ADD CONSTRAINT FK_StudentSchoolAttendanceEvent_AttendanceEventCategoryDescriptor FOREIGN KEY (AttendanceEventCategoryDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.AttendanceEventCategoryDescriptor (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentSchoolAttendanceEvent WITH CHECK ADD CONSTRAINT FK_StudentSchoolAttendanceEvent_School FOREIGN KEY (SchoolHashKey, SchoolYearContext)
    REFERENCES edfi.School (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentSchoolAttendanceEvent WITH CHECK ADD CONSTRAINT FK_StudentSchoolAttendanceEvent_Session FOREIGN KEY (SessionHashKey, SchoolYearContext)
    REFERENCES edfi.Session (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentSchoolAttendanceEvent WITH CHECK ADD CONSTRAINT FK_StudentSchoolAttendanceEvent_Student FOREIGN KEY (StudentHashKey, SchoolYearContext)
    REFERENCES edfi.Student (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentSchoolFoodServiceProgramAssociation WITH CHECK ADD CONSTRAINT FK_StudentSchoolFoodServiceProgramAssociation_GeneralStudentProgramAssociation FOREIGN KEY (GeneralStudentProgramAssociationHashKey, SchoolYearContext)
    REFERENCES edfi.GeneralStudentProgramAssociation (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentSchoolFoodServiceProgramAssociationSchoolFoodServiceProgramService WITH CHECK ADD CONSTRAINT FK_StudentSchoolFoodServiceProgramAssociationSchoolFoodServiceProgramService_SchoolFoodServiceProgramServiceDescriptor FOREIGN KEY (SchoolFoodServiceProgramServiceDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.SchoolFoodServiceProgramServiceDescriptor (HashKey, SchoolYearContext)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentSectionAssociation WITH CHECK ADD CONSTRAINT FK_StudentSectionAssociation_Section FOREIGN KEY (SectionHashKey, SchoolYearContext)
    REFERENCES edfi.Section (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentSectionAssociation WITH CHECK ADD CONSTRAINT FK_StudentSectionAssociation_Student FOREIGN KEY (StudentHashKey, SchoolYearContext)
    REFERENCES edfi.Student (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentSectionAttendanceEvent WITH CHECK ADD CONSTRAINT FK_StudentSectionAttendanceEvent_AttendanceEventCategoryDescriptor FOREIGN KEY (AttendanceEventCategoryDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.AttendanceEventCategoryDescriptor (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentSectionAttendanceEvent WITH CHECK ADD CONSTRAINT FK_StudentSectionAttendanceEvent_Section FOREIGN KEY (SectionHashKey, SchoolYearContext)
    REFERENCES edfi.Section (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentSectionAttendanceEvent WITH CHECK ADD CONSTRAINT FK_StudentSectionAttendanceEvent_Student FOREIGN KEY (StudentHashKey, SchoolYearContext)
    REFERENCES edfi.Student (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentSpecialEducationProgramAssociation WITH CHECK ADD CONSTRAINT FK_StudentSpecialEducationProgramAssociation_GeneralStudentProgramAssociation FOREIGN KEY (GeneralStudentProgramAssociationHashKey, SchoolYearContext)
    REFERENCES edfi.GeneralStudentProgramAssociation (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentSpecialEducationProgramAssociationDisability WITH CHECK ADD CONSTRAINT FK_StudentSpecialEducationProgramAssociationDisability_DisabilityDescriptor FOREIGN KEY (DisabilityDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.DisabilityDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentSpecialEducationProgramAssociationDisabilityDesignation WITH CHECK ADD CONSTRAINT FK_StudentSpecialEducationProgramAssociationDisabilityDesignation_DisabilityDesignationDescriptor FOREIGN KEY (DisabilityDesignationDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.DisabilityDesignationDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentSpecialEducationProgramAssociationServiceProvider WITH CHECK ADD CONSTRAINT FK_StudentSpecialEducationProgramAssociationServiceProvider_Staff FOREIGN KEY (StaffHashKey, SchoolYearContext)
    REFERENCES edfi.Staff (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentSpecialEducationProgramAssociationSpecialEducationProgramService WITH CHECK ADD CONSTRAINT FK_StudentSpecialEducationProgramAssociationSpecialEducationProgramService_SpecialEducationProgramServiceDescriptor FOREIGN KEY (SpecialEducationProgramServiceDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.SpecialEducationProgramServiceDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentSpecialEducationProgramAssociationSpecialEducationProgramServiceProvider WITH CHECK ADD CONSTRAINT FK_StudentSpecialEducationProgramAssociationSpecialEducationProgramServiceProvider_Staff FOREIGN KEY (StaffHashKey, SchoolYearContext)
    REFERENCES edfi.Staff (HashKey, SchoolYearContext)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentTitleIPartAProgramAssociation WITH CHECK ADD CONSTRAINT FK_StudentTitleIPartAProgramAssociation_GeneralStudentProgramAssociation FOREIGN KEY (GeneralStudentProgramAssociationHashKey, SchoolYearContext)
    REFERENCES edfi.GeneralStudentProgramAssociation (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentTitleIPartAProgramAssociationService WITH CHECK ADD CONSTRAINT FK_StudentTitleIPartAProgramAssociationService_ServiceDescriptor FOREIGN KEY (ServiceDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.ServiceDescriptor (HashKey, SchoolYearContext)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentTitleIPartAProgramAssociationTitleIPartAProgramService WITH CHECK ADD CONSTRAINT FK_StudentTitleIPartAProgramAssociationTitleIPartAProgramService_TitleIPartAProgramServiceDescriptor FOREIGN KEY (TitleIPartAProgramServiceDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.TitleIPartAProgramServiceDescriptor (HashKey, SchoolYearContext)
    GO




    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SurveyCategoryDescriptor WITH CHECK ADD CONSTRAINT FK_SurveyCategoryDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SurveyCourseAssociation WITH CHECK ADD CONSTRAINT FK_SurveyCourseAssociation_Course FOREIGN KEY (CourseHashKey, SchoolYearContext)
    REFERENCES edfi.Course (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SurveyCourseAssociation WITH CHECK ADD CONSTRAINT FK_SurveyCourseAssociation_Survey FOREIGN KEY (SurveyHashKey, SchoolYearContext)
    REFERENCES edfi.Survey (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SurveyLevelDescriptor WITH CHECK ADD CONSTRAINT FK_SurveyLevelDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SurveyProgramAssociation WITH CHECK ADD CONSTRAINT FK_SurveyProgramAssociation_Program FOREIGN KEY (ProgramHashKey, SchoolYearContext)
    REFERENCES edfi.Program (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SurveyProgramAssociation WITH CHECK ADD CONSTRAINT FK_SurveyProgramAssociation_Survey FOREIGN KEY (SurveyHashKey, SchoolYearContext)
    REFERENCES edfi.Survey (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SurveyQuestion WITH CHECK ADD CONSTRAINT FK_SurveyQuestion_Survey FOREIGN KEY (SurveyHashKey, SchoolYearContext)
    REFERENCES edfi.Survey (HashKey, SchoolYearContext)
    GO





    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SurveyQuestionResponse WITH CHECK ADD CONSTRAINT FK_SurveyQuestionResponse_SurveyQuestion FOREIGN KEY (SurveyQuestionHashKey, SchoolYearContext)
    REFERENCES edfi.SurveyQuestion (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SurveyQuestionResponse WITH CHECK ADD CONSTRAINT FK_SurveyQuestionResponse_SurveyResponse FOREIGN KEY (SurveyResponseHashKey, SchoolYearContext)
    REFERENCES edfi.SurveyResponse (HashKey, SchoolYearContext)
    GO





    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SurveyResponse WITH CHECK ADD CONSTRAINT FK_SurveyResponse_Survey FOREIGN KEY (SurveyHashKey, SchoolYearContext)
    REFERENCES edfi.Survey (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.SurveyResponseSurveyLevel WITH CHECK ADD CONSTRAINT FK_SurveyResponseSurveyLevel_SurveyLevelDescriptor FOREIGN KEY (SurveyLevelDescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.SurveyLevelDescriptor (HashKey, SchoolYearContext)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SurveyResponseEducationOrganizationTargetAssociation WITH CHECK ADD CONSTRAINT FK_SurveyResponseEducationOrganizationTargetAssociation_EducationOrganization FOREIGN KEY (EducationOrganizationHashKey, SchoolYearContext)
    REFERENCES edfi.EducationOrganization (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SurveyResponseEducationOrganizationTargetAssociation WITH CHECK ADD CONSTRAINT FK_SurveyResponseEducationOrganizationTargetAssociation_SurveyResponse FOREIGN KEY (SurveyResponseHashKey, SchoolYearContext)
    REFERENCES edfi.SurveyResponse (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SurveyResponseStaffTargetAssociation WITH CHECK ADD CONSTRAINT FK_SurveyResponseStaffTargetAssociation_Staff FOREIGN KEY (StaffHashKey, SchoolYearContext)
    REFERENCES edfi.Staff (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SurveyResponseStaffTargetAssociation WITH CHECK ADD CONSTRAINT FK_SurveyResponseStaffTargetAssociation_SurveyResponse FOREIGN KEY (SurveyResponseHashKey, SchoolYearContext)
    REFERENCES edfi.SurveyResponse (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SurveySection WITH CHECK ADD CONSTRAINT FK_SurveySection_Survey FOREIGN KEY (SurveyHashKey, SchoolYearContext)
    REFERENCES edfi.Survey (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SurveySectionAssociation WITH CHECK ADD CONSTRAINT FK_SurveySectionAssociation_Section FOREIGN KEY (SectionHashKey, SchoolYearContext)
    REFERENCES edfi.Section (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SurveySectionAssociation WITH CHECK ADD CONSTRAINT FK_SurveySectionAssociation_Survey FOREIGN KEY (SurveyHashKey, SchoolYearContext)
    REFERENCES edfi.Survey (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SurveySectionResponse WITH CHECK ADD CONSTRAINT FK_SurveySectionResponse_SurveyResponse FOREIGN KEY (SurveyResponseHashKey, SchoolYearContext)
    REFERENCES edfi.SurveyResponse (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SurveySectionResponse WITH CHECK ADD CONSTRAINT FK_SurveySectionResponse_SurveySection FOREIGN KEY (SurveySectionHashKey, SchoolYearContext)
    REFERENCES edfi.SurveySection (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SurveySectionResponseEducationOrganizationTargetAssociation WITH CHECK ADD CONSTRAINT FK_SurveySectionResponseEducationOrganizationTargetAssociation_EducationOrganization FOREIGN KEY (EducationOrganizationHashKey, SchoolYearContext)
    REFERENCES edfi.EducationOrganization (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SurveySectionResponseEducationOrganizationTargetAssociation WITH CHECK ADD CONSTRAINT FK_SurveySectionResponseEducationOrganizationTargetAssociation_SurveySectionResponse FOREIGN KEY (SurveySectionResponseHashKey, SchoolYearContext)
    REFERENCES edfi.SurveySectionResponse (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SurveySectionResponseStaffTargetAssociation WITH CHECK ADD CONSTRAINT FK_SurveySectionResponseStaffTargetAssociation_Staff FOREIGN KEY (StaffHashKey, SchoolYearContext)
    REFERENCES edfi.Staff (HashKey, SchoolYearContext)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SurveySectionResponseStaffTargetAssociation WITH CHECK ADD CONSTRAINT FK_SurveySectionResponseStaffTargetAssociation_SurveySectionResponse FOREIGN KEY (SurveySectionResponseHashKey, SchoolYearContext)
    REFERENCES edfi.SurveySectionResponse (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.TeachingCredentialBasisDescriptor WITH CHECK ADD CONSTRAINT FK_TeachingCredentialBasisDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.TeachingCredentialDescriptor WITH CHECK ADD CONSTRAINT FK_TeachingCredentialDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.TechnicalSkillsAssessmentDescriptor WITH CHECK ADD CONSTRAINT FK_TechnicalSkillsAssessmentDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.TelephoneNumberTypeDescriptor WITH CHECK ADD CONSTRAINT FK_TelephoneNumberTypeDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.TermDescriptor WITH CHECK ADD CONSTRAINT FK_TermDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.TitleIPartAParticipantDescriptor WITH CHECK ADD CONSTRAINT FK_TitleIPartAParticipantDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.TitleIPartAProgramServiceDescriptor WITH CHECK ADD CONSTRAINT FK_TitleIPartAProgramServiceDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.TitleIPartASchoolDesignationDescriptor WITH CHECK ADD CONSTRAINT FK_TitleIPartASchoolDesignationDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.TribalAffiliationDescriptor WITH CHECK ADD CONSTRAINT FK_TribalAffiliationDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.VisaDescriptor WITH CHECK ADD CONSTRAINT FK_VisaDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.WeaponDescriptor WITH CHECK ADD CONSTRAINT FK_WeaponDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey, SchoolYearContext)
    REFERENCES edfi.Descriptor (HashKey, SchoolYearContext)
    GO
