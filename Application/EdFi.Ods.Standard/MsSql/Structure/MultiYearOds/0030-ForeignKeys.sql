
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.AbsenceEventCategoryDescriptor WITH CHECK ADD CONSTRAINT FK_AbsenceEventCategoryDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.AcademicHonorCategoryDescriptor WITH CHECK ADD CONSTRAINT FK_AcademicHonorCategoryDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.AcademicSubjectDescriptor WITH CHECK ADD CONSTRAINT FK_AcademicSubjectDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO
        -- Foreign key from entity identity table
        ALTER TABLE edfi.AcademicWeek_Attributes WITH CHECK ADD CONSTRAINT FK_AcademicWeek_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.AcademicWeek (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.AcademicWeek WITH CHECK ADD CONSTRAINT FK_AcademicWeek_School FOREIGN KEY (SchoolHashKey)
    REFERENCES edfi.School (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.AccommodationDescriptor WITH CHECK ADD CONSTRAINT FK_AccommodationDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO
        -- Foreign key from entity identity table
        ALTER TABLE edfi.Account_Attributes WITH CHECK ADD CONSTRAINT FK_Account_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.Account (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.Account WITH CHECK ADD CONSTRAINT FK_Account_EducationOrganization FOREIGN KEY (EducationOrganizationHashKey)
    REFERENCES edfi.EducationOrganization (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.AccountAccountCode WITH CHECK ADD CONSTRAINT FK_AccountAccountCode_AccountCode FOREIGN KEY (AccountCodeHashKey)
    REFERENCES edfi.AccountCode (HashKey)
    GO


        -- Foreign key from entity identity table
        ALTER TABLE edfi.AccountabilityRating_Attributes WITH CHECK ADD CONSTRAINT FK_AccountabilityRating_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.AccountabilityRating (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.AccountabilityRating WITH CHECK ADD CONSTRAINT FK_AccountabilityRating_EducationOrganization FOREIGN KEY (EducationOrganizationHashKey)
    REFERENCES edfi.EducationOrganization (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.AccountabilityRating WITH CHECK ADD CONSTRAINT FK_AccountabilityRating_SchoolYearType FOREIGN KEY (SchoolYearTypeHashKey)
    REFERENCES edfi.SchoolYearType (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.AccountClassificationDescriptor WITH CHECK ADD CONSTRAINT FK_AccountClassificationDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO
        -- Foreign key from entity identity table
        ALTER TABLE edfi.AccountCode_Attributes WITH CHECK ADD CONSTRAINT FK_AccountCode_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.AccountCode (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.AccountCode WITH CHECK ADD CONSTRAINT FK_AccountCode_AccountClassificationDescriptor FOREIGN KEY (AccountClassificationDescriptorHashKey)
    REFERENCES edfi.AccountClassificationDescriptor (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.AccountCode WITH CHECK ADD CONSTRAINT FK_AccountCode_EducationOrganization FOREIGN KEY (EducationOrganizationHashKey)
    REFERENCES edfi.EducationOrganization (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.AchievementCategoryDescriptor WITH CHECK ADD CONSTRAINT FK_AchievementCategoryDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO
        -- Foreign key from entity identity table
        ALTER TABLE edfi.Actual_Attributes WITH CHECK ADD CONSTRAINT FK_Actual_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.Actual (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.Actual WITH CHECK ADD CONSTRAINT FK_Actual_Account FOREIGN KEY (AccountHashKey)
    REFERENCES edfi.Account (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.AdditionalCreditTypeDescriptor WITH CHECK ADD CONSTRAINT FK_AdditionalCreditTypeDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.AddressTypeDescriptor WITH CHECK ADD CONSTRAINT FK_AddressTypeDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.AdministrationEnvironmentDescriptor WITH CHECK ADD CONSTRAINT FK_AdministrationEnvironmentDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.AdministrativeFundingControlDescriptor WITH CHECK ADD CONSTRAINT FK_AdministrativeFundingControlDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO
        -- Foreign key from entity identity table
        ALTER TABLE edfi.Assessment_Attributes WITH CHECK ADD CONSTRAINT FK_Assessment_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.Assessment (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.AssessmentAcademicSubject WITH CHECK ADD CONSTRAINT FK_AssessmentAcademicSubject_AcademicSubjectDescriptor FOREIGN KEY (AcademicSubjectDescriptorHashKey)
    REFERENCES edfi.AcademicSubjectDescriptor (HashKey)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.AssessmentAssessedGradeLevel WITH CHECK ADD CONSTRAINT FK_AssessmentAssessedGradeLevel_GradeLevelDescriptor FOREIGN KEY (GradeLevelDescriptorHashKey)
    REFERENCES edfi.GradeLevelDescriptor (HashKey)
    GO



        -- Foreign key from entity identity table
        ALTER TABLE edfi.AssessmentContentStandard_Attributes WITH CHECK ADD CONSTRAINT FK_AssessmentContentStandard_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.AssessmentContentStandard (HashKey)
        GO



    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.AssessmentIdentificationCode WITH CHECK ADD CONSTRAINT FK_AssessmentIdentificationCode_AssessmentIdentificationSystemDescriptor FOREIGN KEY (AssessmentIdentificationSystemDescriptorHashKey)
    REFERENCES edfi.AssessmentIdentificationSystemDescriptor (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.AssessmentIdentificationCode_Attributes WITH CHECK ADD CONSTRAINT FK_AssessmentIdentificationCode_Attributes FOREIGN KEY
        (HashKey, AssessmentIdentificationSystemDescriptorHashKey) REFERENCES edfi.AssessmentIdentificationCode (HashKey, AssessmentIdentificationSystemDescriptorHashKey)
        GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.AssessmentLanguage WITH CHECK ADD CONSTRAINT FK_AssessmentLanguage_LanguageDescriptor FOREIGN KEY (LanguageDescriptorHashKey)
    REFERENCES edfi.LanguageDescriptor (HashKey)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.AssessmentPerformanceLevel WITH CHECK ADD CONSTRAINT FK_AssessmentPerformanceLevel_AssessmentReportingMethodDescriptor FOREIGN KEY (AssessmentReportingMethodDescriptorHashKey)
    REFERENCES edfi.AssessmentReportingMethodDescriptor (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.AssessmentPerformanceLevel WITH CHECK ADD CONSTRAINT FK_AssessmentPerformanceLevel_PerformanceLevelDescriptor FOREIGN KEY (PerformanceLevelDescriptorHashKey)
    REFERENCES edfi.PerformanceLevelDescriptor (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.AssessmentPerformanceLevel_Attributes WITH CHECK ADD CONSTRAINT FK_AssessmentPerformanceLevel_Attributes FOREIGN KEY
        (HashKey, AssessmentReportingMethodDescriptorHashKey, PerformanceLevelDescriptorHashKey) REFERENCES edfi.AssessmentPerformanceLevel (HashKey, AssessmentReportingMethodDescriptorHashKey, PerformanceLevelDescriptorHashKey)
        GO


        -- Foreign key from entity identity table
        ALTER TABLE edfi.AssessmentPeriod_Attributes WITH CHECK ADD CONSTRAINT FK_AssessmentPeriod_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.AssessmentPeriod (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.AssessmentPlatformType WITH CHECK ADD CONSTRAINT FK_AssessmentPlatformType_PlatformTypeDescriptor FOREIGN KEY (PlatformTypeDescriptorHashKey)
    REFERENCES edfi.PlatformTypeDescriptor (HashKey)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.AssessmentProgram WITH CHECK ADD CONSTRAINT FK_AssessmentProgram_Program FOREIGN KEY (ProgramHashKey)
    REFERENCES edfi.Program (HashKey)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.AssessmentScore WITH CHECK ADD CONSTRAINT FK_AssessmentScore_AssessmentReportingMethodDescriptor FOREIGN KEY (AssessmentReportingMethodDescriptorHashKey)
    REFERENCES edfi.AssessmentReportingMethodDescriptor (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.AssessmentScore_Attributes WITH CHECK ADD CONSTRAINT FK_AssessmentScore_Attributes FOREIGN KEY
        (HashKey, AssessmentReportingMethodDescriptorHashKey) REFERENCES edfi.AssessmentScore (HashKey, AssessmentReportingMethodDescriptorHashKey)
        GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.AssessmentSection WITH CHECK ADD CONSTRAINT FK_AssessmentSection_Section FOREIGN KEY (SectionHashKey)
    REFERENCES edfi.Section (HashKey)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.AssessmentCategoryDescriptor WITH CHECK ADD CONSTRAINT FK_AssessmentCategoryDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.AssessmentIdentificationSystemDescriptor WITH CHECK ADD CONSTRAINT FK_AssessmentIdentificationSystemDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO
        -- Foreign key from entity identity table
        ALTER TABLE edfi.AssessmentItem_Attributes WITH CHECK ADD CONSTRAINT FK_AssessmentItem_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.AssessmentItem (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.AssessmentItem WITH CHECK ADD CONSTRAINT FK_AssessmentItem_Assessment FOREIGN KEY (AssessmentHashKey)
    REFERENCES edfi.Assessment (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.AssessmentItemLearningStandard WITH CHECK ADD CONSTRAINT FK_AssessmentItemLearningStandard_LearningStandard FOREIGN KEY (LearningStandardHashKey)
    REFERENCES edfi.LearningStandard (HashKey)
    GO



        -- Foreign key from entity identity table
        ALTER TABLE edfi.AssessmentItemPossibleResponse_Attributes WITH CHECK ADD CONSTRAINT FK_AssessmentItemPossibleResponse_Attributes FOREIGN KEY
        (HashKey, ResponseValue) REFERENCES edfi.AssessmentItemPossibleResponse (HashKey, ResponseValue)
        GO


    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.AssessmentItemCategoryDescriptor WITH CHECK ADD CONSTRAINT FK_AssessmentItemCategoryDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.AssessmentItemResultDescriptor WITH CHECK ADD CONSTRAINT FK_AssessmentItemResultDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.AssessmentPeriodDescriptor WITH CHECK ADD CONSTRAINT FK_AssessmentPeriodDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.AssessmentReportingMethodDescriptor WITH CHECK ADD CONSTRAINT FK_AssessmentReportingMethodDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.AttemptStatusDescriptor WITH CHECK ADD CONSTRAINT FK_AttemptStatusDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.AttendanceEventCategoryDescriptor WITH CHECK ADD CONSTRAINT FK_AttendanceEventCategoryDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.BehaviorDescriptor WITH CHECK ADD CONSTRAINT FK_BehaviorDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO
        -- Foreign key from entity identity table
        ALTER TABLE edfi.BellSchedule_Attributes WITH CHECK ADD CONSTRAINT FK_BellSchedule_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.BellSchedule (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.BellSchedule WITH CHECK ADD CONSTRAINT FK_BellSchedule_School FOREIGN KEY (SchoolHashKey)
    REFERENCES edfi.School (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.BellScheduleClassPeriod WITH CHECK ADD CONSTRAINT FK_BellScheduleClassPeriod_ClassPeriod FOREIGN KEY (ClassPeriodHashKey)
    REFERENCES edfi.ClassPeriod (HashKey)
    GO




    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.BellScheduleGradeLevel WITH CHECK ADD CONSTRAINT FK_BellScheduleGradeLevel_GradeLevelDescriptor FOREIGN KEY (GradeLevelDescriptorHashKey)
    REFERENCES edfi.GradeLevelDescriptor (HashKey)
    GO


        -- Foreign key from entity identity table
        ALTER TABLE edfi.Budget_Attributes WITH CHECK ADD CONSTRAINT FK_Budget_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.Budget (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.Budget WITH CHECK ADD CONSTRAINT FK_Budget_Account FOREIGN KEY (AccountHashKey)
    REFERENCES edfi.Account (HashKey)
    GO
        -- Foreign key from entity identity table
        ALTER TABLE edfi.Calendar_Attributes WITH CHECK ADD CONSTRAINT FK_Calendar_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.Calendar (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.Calendar WITH CHECK ADD CONSTRAINT FK_Calendar_School FOREIGN KEY (SchoolHashKey)
    REFERENCES edfi.School (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.Calendar WITH CHECK ADD CONSTRAINT FK_Calendar_SchoolYearType FOREIGN KEY (SchoolYearTypeHashKey)
    REFERENCES edfi.SchoolYearType (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.CalendarGradeLevel WITH CHECK ADD CONSTRAINT FK_CalendarGradeLevel_GradeLevelDescriptor FOREIGN KEY (GradeLevelDescriptorHashKey)
    REFERENCES edfi.GradeLevelDescriptor (HashKey)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CalendarDate WITH CHECK ADD CONSTRAINT FK_CalendarDate_Calendar FOREIGN KEY (CalendarHashKey)
    REFERENCES edfi.Calendar (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.CalendarDateCalendarEvent WITH CHECK ADD CONSTRAINT FK_CalendarDateCalendarEvent_CalendarEventDescriptor FOREIGN KEY (CalendarEventDescriptorHashKey)
    REFERENCES edfi.CalendarEventDescriptor (HashKey)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CalendarEventDescriptor WITH CHECK ADD CONSTRAINT FK_CalendarEventDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CalendarTypeDescriptor WITH CHECK ADD CONSTRAINT FK_CalendarTypeDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CareerPathwayDescriptor WITH CHECK ADD CONSTRAINT FK_CareerPathwayDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CharterApprovalAgencyTypeDescriptor WITH CHECK ADD CONSTRAINT FK_CharterApprovalAgencyTypeDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CharterStatusDescriptor WITH CHECK ADD CONSTRAINT FK_CharterStatusDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CitizenshipStatusDescriptor WITH CHECK ADD CONSTRAINT FK_CitizenshipStatusDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO
        -- Foreign key from entity identity table
        ALTER TABLE edfi.ClassPeriod_Attributes WITH CHECK ADD CONSTRAINT FK_ClassPeriod_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.ClassPeriod (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.ClassPeriod WITH CHECK ADD CONSTRAINT FK_ClassPeriod_School FOREIGN KEY (SchoolHashKey)
    REFERENCES edfi.School (HashKey)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.ClassroomPositionDescriptor WITH CHECK ADD CONSTRAINT FK_ClassroomPositionDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO
        -- Foreign key from entity identity table
        ALTER TABLE edfi.Cohort_Attributes WITH CHECK ADD CONSTRAINT FK_Cohort_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.Cohort (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.Cohort WITH CHECK ADD CONSTRAINT FK_Cohort_EducationOrganization FOREIGN KEY (EducationOrganizationHashKey)
    REFERENCES edfi.EducationOrganization (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.CohortProgram WITH CHECK ADD CONSTRAINT FK_CohortProgram_Program FOREIGN KEY (ProgramHashKey)
    REFERENCES edfi.Program (HashKey)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CohortScopeDescriptor WITH CHECK ADD CONSTRAINT FK_CohortScopeDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CohortTypeDescriptor WITH CHECK ADD CONSTRAINT FK_CohortTypeDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CohortYearTypeDescriptor WITH CHECK ADD CONSTRAINT FK_CohortYearTypeDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CommunityOrganization WITH CHECK ADD CONSTRAINT FK_CommunityOrganization_EducationOrganization FOREIGN KEY (EducationOrganizationHashKey)
    REFERENCES edfi.EducationOrganization (HashKey)
    GO
        -- Foreign key from entity identity table
        ALTER TABLE edfi.CommunityProvider_Attributes WITH CHECK ADD CONSTRAINT FK_CommunityProvider_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.CommunityProvider (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CommunityProvider WITH CHECK ADD CONSTRAINT FK_CommunityProvider_EducationOrganization FOREIGN KEY (EducationOrganizationHashKey)
    REFERENCES edfi.EducationOrganization (HashKey)
    GO
        -- Foreign key from entity identity table
        ALTER TABLE edfi.CommunityProviderLicense_Attributes WITH CHECK ADD CONSTRAINT FK_CommunityProviderLicense_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.CommunityProviderLicense (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CommunityProviderLicense WITH CHECK ADD CONSTRAINT FK_CommunityProviderLicense_CommunityProvider FOREIGN KEY (CommunityProviderHashKey)
    REFERENCES edfi.CommunityProvider (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CompetencyLevelDescriptor WITH CHECK ADD CONSTRAINT FK_CompetencyLevelDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO
        -- Foreign key from entity identity table
        ALTER TABLE edfi.CompetencyObjective_Attributes WITH CHECK ADD CONSTRAINT FK_CompetencyObjective_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.CompetencyObjective (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CompetencyObjective WITH CHECK ADD CONSTRAINT FK_CompetencyObjective_EducationOrganization FOREIGN KEY (EducationOrganizationHashKey)
    REFERENCES edfi.EducationOrganization (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CompetencyObjective WITH CHECK ADD CONSTRAINT FK_ObjectiveCompetencyObjective_GradeLevelDescriptor FOREIGN KEY (ObjectiveGradeLevelDescriptorHashKey)
    REFERENCES edfi.GradeLevelDescriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.ContactTypeDescriptor WITH CHECK ADD CONSTRAINT FK_ContactTypeDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.ContentClassDescriptor WITH CHECK ADD CONSTRAINT FK_ContentClassDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.ContinuationOfServicesReasonDescriptor WITH CHECK ADD CONSTRAINT FK_ContinuationOfServicesReasonDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO
        -- Foreign key from entity identity table
        ALTER TABLE edfi.ContractedStaff_Attributes WITH CHECK ADD CONSTRAINT FK_ContractedStaff_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.ContractedStaff (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.ContractedStaff WITH CHECK ADD CONSTRAINT FK_ContractedStaff_Account FOREIGN KEY (AccountHashKey)
    REFERENCES edfi.Account (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.ContractedStaff WITH CHECK ADD CONSTRAINT FK_ContractedStaff_Staff FOREIGN KEY (StaffHashKey)
    REFERENCES edfi.Staff (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CostRateDescriptor WITH CHECK ADD CONSTRAINT FK_CostRateDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CountryDescriptor WITH CHECK ADD CONSTRAINT FK_CountryDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO
        -- Foreign key from entity identity table
        ALTER TABLE edfi.Course_Attributes WITH CHECK ADD CONSTRAINT FK_Course_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.Course (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.Course WITH CHECK ADD CONSTRAINT FK_Course_EducationOrganization FOREIGN KEY (EducationOrganizationHashKey)
    REFERENCES edfi.EducationOrganization (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.CourseCompetencyLevel WITH CHECK ADD CONSTRAINT FK_CourseCompetencyLevel_CompetencyLevelDescriptor FOREIGN KEY (CompetencyLevelDescriptorHashKey)
    REFERENCES edfi.CompetencyLevelDescriptor (HashKey)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.CourseIdentificationCode WITH CHECK ADD CONSTRAINT FK_CourseIdentificationCode_CourseIdentificationSystemDescriptor FOREIGN KEY (CourseIdentificationSystemDescriptorHashKey)
    REFERENCES edfi.CourseIdentificationSystemDescriptor (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.CourseIdentificationCode_Attributes WITH CHECK ADD CONSTRAINT FK_CourseIdentificationCode_Attributes FOREIGN KEY
        (HashKey, CourseIdentificationSystemDescriptorHashKey) REFERENCES edfi.CourseIdentificationCode (HashKey, CourseIdentificationSystemDescriptorHashKey)
        GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.CourseLearningObjective WITH CHECK ADD CONSTRAINT FK_CourseLearningObjective_LearningObjective FOREIGN KEY (LearningObjectiveHashKey)
    REFERENCES edfi.LearningObjective (HashKey)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.CourseLearningStandard WITH CHECK ADD CONSTRAINT FK_CourseLearningStandard_LearningStandard FOREIGN KEY (LearningStandardHashKey)
    REFERENCES edfi.LearningStandard (HashKey)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.CourseLevelCharacteristic WITH CHECK ADD CONSTRAINT FK_CourseLevelCharacteristic_CourseLevelCharacteristicDescriptor FOREIGN KEY (CourseLevelCharacteristicDescriptorHashKey)
    REFERENCES edfi.CourseLevelCharacteristicDescriptor (HashKey)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.CourseOfferedGradeLevel WITH CHECK ADD CONSTRAINT FK_CourseOfferedGradeLevel_GradeLevelDescriptor FOREIGN KEY (GradeLevelDescriptorHashKey)
    REFERENCES edfi.GradeLevelDescriptor (HashKey)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CourseAttemptResultDescriptor WITH CHECK ADD CONSTRAINT FK_CourseAttemptResultDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CourseDefinedByDescriptor WITH CHECK ADD CONSTRAINT FK_CourseDefinedByDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CourseGPAApplicabilityDescriptor WITH CHECK ADD CONSTRAINT FK_CourseGPAApplicabilityDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CourseIdentificationSystemDescriptor WITH CHECK ADD CONSTRAINT FK_CourseIdentificationSystemDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CourseLevelCharacteristicDescriptor WITH CHECK ADD CONSTRAINT FK_CourseLevelCharacteristicDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO
        -- Foreign key from entity identity table
        ALTER TABLE edfi.CourseOffering_Attributes WITH CHECK ADD CONSTRAINT FK_CourseOffering_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.CourseOffering (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CourseOffering WITH CHECK ADD CONSTRAINT FK_CourseOffering_School FOREIGN KEY (SchoolHashKey)
    REFERENCES edfi.School (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CourseOffering WITH CHECK ADD CONSTRAINT FK_CourseOffering_Session FOREIGN KEY (SessionHashKey)
    REFERENCES edfi.Session (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.CourseOfferingCourseLevelCharacteristic WITH CHECK ADD CONSTRAINT FK_CourseOfferingCourseLevelCharacteristic_CourseLevelCharacteristicDescriptor FOREIGN KEY (CourseLevelCharacteristicDescriptorHashKey)
    REFERENCES edfi.CourseLevelCharacteristicDescriptor (HashKey)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.CourseOfferingCurriculumUsed WITH CHECK ADD CONSTRAINT FK_CourseOfferingCurriculumUsed_CurriculumUsedDescriptor FOREIGN KEY (CurriculumUsedDescriptorHashKey)
    REFERENCES edfi.CurriculumUsedDescriptor (HashKey)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.CourseOfferingOfferedGradeLevel WITH CHECK ADD CONSTRAINT FK_CourseOfferingOfferedGradeLevel_GradeLevelDescriptor FOREIGN KEY (GradeLevelDescriptorHashKey)
    REFERENCES edfi.GradeLevelDescriptor (HashKey)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CourseRepeatCodeDescriptor WITH CHECK ADD CONSTRAINT FK_CourseRepeatCodeDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO
        -- Foreign key from entity identity table
        ALTER TABLE edfi.CourseTranscript_Attributes WITH CHECK ADD CONSTRAINT FK_CourseTranscript_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.CourseTranscript (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CourseTranscript WITH CHECK ADD CONSTRAINT FK_CourseTranscript_Course FOREIGN KEY (CourseHashKey)
    REFERENCES edfi.Course (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CourseTranscript WITH CHECK ADD CONSTRAINT FK_CourseTranscript_CourseAttemptResultDescriptor FOREIGN KEY (CourseAttemptResultDescriptorHashKey)
    REFERENCES edfi.CourseAttemptResultDescriptor (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CourseTranscript WITH CHECK ADD CONSTRAINT FK_CourseTranscript_StudentAcademicRecord FOREIGN KEY (StudentAcademicRecordHashKey)
    REFERENCES edfi.StudentAcademicRecord (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.CourseTranscriptAcademicSubject WITH CHECK ADD CONSTRAINT FK_CourseTranscriptAcademicSubject_AcademicSubjectDescriptor FOREIGN KEY (AcademicSubjectDescriptorHashKey)
    REFERENCES edfi.AcademicSubjectDescriptor (HashKey)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.CourseTranscriptAlternativeCourseIdentificationCode WITH CHECK ADD CONSTRAINT FK_CourseTranscriptAlternativeCourseIdentificationCode_CourseIdentificationSystemDescriptor FOREIGN KEY (CourseIdentificationSystemDescriptorHashKey)
    REFERENCES edfi.CourseIdentificationSystemDescriptor (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.CourseTranscriptAlternativeCourseIdentificationCode_Attributes WITH CHECK ADD CONSTRAINT FK_CourseTranscriptAlternativeCourseIdentificationCode_Attributes FOREIGN KEY
        (HashKey, CourseIdentificationSystemDescriptorHashKey) REFERENCES edfi.CourseTranscriptAlternativeCourseIdentificationCode (HashKey, CourseIdentificationSystemDescriptorHashKey)
        GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.CourseTranscriptCreditCategory WITH CHECK ADD CONSTRAINT FK_CourseTranscriptCreditCategory_CreditCategoryDescriptor FOREIGN KEY (CreditCategoryDescriptorHashKey)
    REFERENCES edfi.CreditCategoryDescriptor (HashKey)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.CourseTranscriptEarnedAdditionalCredits WITH CHECK ADD CONSTRAINT FK_CourseTranscriptEarnedAdditionalCredits_AdditionalCreditTypeDescriptor FOREIGN KEY (AdditionalCreditTypeDescriptorHashKey)
    REFERENCES edfi.AdditionalCreditTypeDescriptor (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.CourseTranscriptEarnedAdditionalCredits_Attributes WITH CHECK ADD CONSTRAINT FK_CourseTranscriptEarnedAdditionalCredits_Attributes FOREIGN KEY
        (HashKey, AdditionalCreditTypeDescriptorHashKey) REFERENCES edfi.CourseTranscriptEarnedAdditionalCredits (HashKey, AdditionalCreditTypeDescriptorHashKey)
        GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.Credential_Attributes WITH CHECK ADD CONSTRAINT FK_Credential_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.Credential (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.Credential WITH CHECK ADD CONSTRAINT FK_StateOfIssueCredential_StateAbbreviationDescriptor FOREIGN KEY (StateOfIssueStateAbbreviationDescriptorHashKey)
    REFERENCES edfi.StateAbbreviationDescriptor (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.CredentialAcademicSubject WITH CHECK ADD CONSTRAINT FK_CredentialAcademicSubject_AcademicSubjectDescriptor FOREIGN KEY (AcademicSubjectDescriptorHashKey)
    REFERENCES edfi.AcademicSubjectDescriptor (HashKey)
    GO




    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.CredentialGradeLevel WITH CHECK ADD CONSTRAINT FK_CredentialGradeLevel_GradeLevelDescriptor FOREIGN KEY (GradeLevelDescriptorHashKey)
    REFERENCES edfi.GradeLevelDescriptor (HashKey)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CredentialFieldDescriptor WITH CHECK ADD CONSTRAINT FK_CredentialFieldDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CredentialTypeDescriptor WITH CHECK ADD CONSTRAINT FK_CredentialTypeDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CreditCategoryDescriptor WITH CHECK ADD CONSTRAINT FK_CreditCategoryDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CreditTypeDescriptor WITH CHECK ADD CONSTRAINT FK_CreditTypeDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CTEProgramServiceDescriptor WITH CHECK ADD CONSTRAINT FK_CTEProgramServiceDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.CurriculumUsedDescriptor WITH CHECK ADD CONSTRAINT FK_CurriculumUsedDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.DeliveryMethodDescriptor WITH CHECK ADD CONSTRAINT FK_DeliveryMethodDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO
        -- Foreign key from entity identity table
        ALTER TABLE edfi.Descriptor_Attributes WITH CHECK ADD CONSTRAINT FK_Descriptor_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.Descriptor (HashKey)
        GO


    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.DiagnosisDescriptor WITH CHECK ADD CONSTRAINT FK_DiagnosisDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.DiplomaLevelDescriptor WITH CHECK ADD CONSTRAINT FK_DiplomaLevelDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.DiplomaTypeDescriptor WITH CHECK ADD CONSTRAINT FK_DiplomaTypeDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.DisabilityDescriptor WITH CHECK ADD CONSTRAINT FK_DisabilityDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.DisabilityDesignationDescriptor WITH CHECK ADD CONSTRAINT FK_DisabilityDesignationDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.DisabilityDeterminationSourceTypeDescriptor WITH CHECK ADD CONSTRAINT FK_DisabilityDeterminationSourceTypeDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO
        -- Foreign key from entity identity table
        ALTER TABLE edfi.DisciplineAction_Attributes WITH CHECK ADD CONSTRAINT FK_DisciplineAction_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.DisciplineAction (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.DisciplineAction WITH CHECK ADD CONSTRAINT FK_DisciplineAction_Student FOREIGN KEY (StudentHashKey)
    REFERENCES edfi.Student (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.DisciplineActionDiscipline WITH CHECK ADD CONSTRAINT FK_DisciplineActionDiscipline_DisciplineDescriptor FOREIGN KEY (DisciplineDescriptorHashKey)
    REFERENCES edfi.DisciplineDescriptor (HashKey)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.DisciplineActionStaff WITH CHECK ADD CONSTRAINT FK_DisciplineActionStaff_Staff FOREIGN KEY (StaffHashKey)
    REFERENCES edfi.Staff (HashKey)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.DisciplineActionStudentDisciplineIncidentAssociation WITH CHECK ADD CONSTRAINT FK_DisciplineActionStudentDisciplineIncidentAssociation_StudentDisciplineIncidentAssociation FOREIGN KEY (StudentDisciplineIncidentAssociationHashKey)
    REFERENCES edfi.StudentDisciplineIncidentAssociation (HashKey)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.DisciplineActionLengthDifferenceReasonDescriptor WITH CHECK ADD CONSTRAINT FK_DisciplineActionLengthDifferenceReasonDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.DisciplineDescriptor WITH CHECK ADD CONSTRAINT FK_DisciplineDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO
        -- Foreign key from entity identity table
        ALTER TABLE edfi.DisciplineIncident_Attributes WITH CHECK ADD CONSTRAINT FK_DisciplineIncident_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.DisciplineIncident (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.DisciplineIncident WITH CHECK ADD CONSTRAINT FK_DisciplineIncident_School FOREIGN KEY (SchoolHashKey)
    REFERENCES edfi.School (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.DisciplineIncidentBehavior WITH CHECK ADD CONSTRAINT FK_DisciplineIncidentBehavior_BehaviorDescriptor FOREIGN KEY (BehaviorDescriptorHashKey)
    REFERENCES edfi.BehaviorDescriptor (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.DisciplineIncidentBehavior_Attributes WITH CHECK ADD CONSTRAINT FK_DisciplineIncidentBehavior_Attributes FOREIGN KEY
        (HashKey, BehaviorDescriptorHashKey) REFERENCES edfi.DisciplineIncidentBehavior (HashKey, BehaviorDescriptorHashKey)
        GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.DisciplineIncidentExternalParticipant WITH CHECK ADD CONSTRAINT FK_DisciplineIncidentExternalParticipant_DisciplineIncidentParticipationCodeDescriptor FOREIGN KEY (DisciplineIncidentParticipationCodeDescriptorHashKey)
    REFERENCES edfi.DisciplineIncidentParticipationCodeDescriptor (HashKey)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.DisciplineIncidentWeapon WITH CHECK ADD CONSTRAINT FK_DisciplineIncidentWeapon_WeaponDescriptor FOREIGN KEY (WeaponDescriptorHashKey)
    REFERENCES edfi.WeaponDescriptor (HashKey)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.DisciplineIncidentParticipationCodeDescriptor WITH CHECK ADD CONSTRAINT FK_DisciplineIncidentParticipationCodeDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.EducationalEnvironmentDescriptor WITH CHECK ADD CONSTRAINT FK_EducationalEnvironmentDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO
        -- Foreign key from entity identity table
        ALTER TABLE edfi.EducationContent_Attributes WITH CHECK ADD CONSTRAINT FK_EducationContent_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.EducationContent (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.EducationContentAppropriateGradeLevel WITH CHECK ADD CONSTRAINT FK_EducationContentAppropriateGradeLevel_GradeLevelDescriptor FOREIGN KEY (GradeLevelDescriptorHashKey)
    REFERENCES edfi.GradeLevelDescriptor (HashKey)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.EducationContentAppropriateSex WITH CHECK ADD CONSTRAINT FK_EducationContentAppropriateSex_SexDescriptor FOREIGN KEY (SexDescriptorHashKey)
    REFERENCES edfi.SexDescriptor (HashKey)
    GO










    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.EducationContentLanguage WITH CHECK ADD CONSTRAINT FK_EducationContentLanguage_LanguageDescriptor FOREIGN KEY (LanguageDescriptorHashKey)
    REFERENCES edfi.LanguageDescriptor (HashKey)
    GO


        -- Foreign key from entity identity table
        ALTER TABLE edfi.EducationOrganization_Attributes WITH CHECK ADD CONSTRAINT FK_EducationOrganization_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.EducationOrganization (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.EducationOrganizationAddress WITH CHECK ADD CONSTRAINT FK_EducationOrganizationAddress_AddressTypeDescriptor FOREIGN KEY (AddressTypeDescriptorHashKey)
    REFERENCES edfi.AddressTypeDescriptor (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.EducationOrganizationAddress WITH CHECK ADD CONSTRAINT FK_EducationOrganizationAddress_StateAbbreviationDescriptor FOREIGN KEY (StateAbbreviationDescriptorHashKey)
    REFERENCES edfi.StateAbbreviationDescriptor (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.EducationOrganizationAddress_Attributes WITH CHECK ADD CONSTRAINT FK_EducationOrganizationAddress_Attributes FOREIGN KEY
        (HashKey, AddressTypeDescriptorHashKey, StateAbbreviationDescriptorHashKey, City, PostalCode, StreetNumberName) REFERENCES edfi.EducationOrganizationAddress (HashKey, AddressTypeDescriptorHashKey, StateAbbreviationDescriptorHashKey, City, PostalCode, StreetNumberName)
        GO


        -- Foreign key from entity identity table
        ALTER TABLE edfi.EducationOrganizationAddressPeriod_Attributes WITH CHECK ADD CONSTRAINT FK_EducationOrganizationAddressPeriod_Attributes FOREIGN KEY
        (HashKey, BeginDate) REFERENCES edfi.EducationOrganizationAddressPeriod (HashKey, BeginDate)
        GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.EducationOrganizationCategory WITH CHECK ADD CONSTRAINT FK_EducationOrganizationCategory_EducationOrganizationCategoryDescriptor FOREIGN KEY (EducationOrganizationCategoryDescriptorHashKey)
    REFERENCES edfi.EducationOrganizationCategoryDescriptor (HashKey)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.EducationOrganizationIdentificationCode WITH CHECK ADD CONSTRAINT FK_EducationOrganizationIdentificationCode_EducationOrganizationIdentificationSystemDescriptor FOREIGN KEY (EducationOrganizationIdentificationSystemDescriptorHashKey)
    REFERENCES edfi.EducationOrganizationIdentificationSystemDescriptor (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.EducationOrganizationIdentificationCode_Attributes WITH CHECK ADD CONSTRAINT FK_EducationOrganizationIdentificationCode_Attributes FOREIGN KEY
        (HashKey, EducationOrganizationIdentificationSystemDescriptorHashKey) REFERENCES edfi.EducationOrganizationIdentificationCode (HashKey, EducationOrganizationIdentificationSystemDescriptorHashKey)
        GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.EducationOrganizationIndicator WITH CHECK ADD CONSTRAINT FK_EducationOrganizationIndicator_IndicatorDescriptor FOREIGN KEY (IndicatorDescriptorHashKey)
    REFERENCES edfi.IndicatorDescriptor (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.EducationOrganizationIndicator_Attributes WITH CHECK ADD CONSTRAINT FK_EducationOrganizationIndicator_Attributes FOREIGN KEY
        (HashKey, IndicatorDescriptorHashKey) REFERENCES edfi.EducationOrganizationIndicator (HashKey, IndicatorDescriptorHashKey)
        GO


        -- Foreign key from entity identity table
        ALTER TABLE edfi.EducationOrganizationIndicatorPeriod_Attributes WITH CHECK ADD CONSTRAINT FK_EducationOrganizationIndicatorPeriod_Attributes FOREIGN KEY
        (HashKey, BeginDate) REFERENCES edfi.EducationOrganizationIndicatorPeriod (HashKey, BeginDate)
        GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.EducationOrganizationInstitutionTelephone WITH CHECK ADD CONSTRAINT FK_EducationOrganizationInstitutionTelephone_InstitutionTelephoneNumberTypeDescriptor FOREIGN KEY (InstitutionTelephoneNumberTypeDescriptorHashKey)
    REFERENCES edfi.InstitutionTelephoneNumberTypeDescriptor (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.EducationOrganizationInstitutionTelephone_Attributes WITH CHECK ADD CONSTRAINT FK_EducationOrganizationInstitutionTelephone_Attributes FOREIGN KEY
        (HashKey, InstitutionTelephoneNumberTypeDescriptorHashKey) REFERENCES edfi.EducationOrganizationInstitutionTelephone (HashKey, InstitutionTelephoneNumberTypeDescriptorHashKey)
        GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.EducationOrganizationInternationalAddress WITH CHECK ADD CONSTRAINT FK_EducationOrganizationInternationalAddress_AddressTypeDescriptor FOREIGN KEY (AddressTypeDescriptorHashKey)
    REFERENCES edfi.AddressTypeDescriptor (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.EducationOrganizationInternationalAddress_Attributes WITH CHECK ADD CONSTRAINT FK_EducationOrganizationInternationalAddress_Attributes FOREIGN KEY
        (HashKey, AddressTypeDescriptorHashKey) REFERENCES edfi.EducationOrganizationInternationalAddress (HashKey, AddressTypeDescriptorHashKey)
        GO


    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.EducationOrganizationCategoryDescriptor WITH CHECK ADD CONSTRAINT FK_EducationOrganizationCategoryDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.EducationOrganizationIdentificationSystemDescriptor WITH CHECK ADD CONSTRAINT FK_EducationOrganizationIdentificationSystemDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO
        -- Foreign key from entity identity table
        ALTER TABLE edfi.EducationOrganizationInterventionPrescriptionAssociation_Attributes WITH CHECK ADD CONSTRAINT FK_EducationOrganizationInterventionPrescriptionAssociation_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.EducationOrganizationInterventionPrescriptionAssociation (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.EducationOrganizationInterventionPrescriptionAssociation WITH CHECK ADD CONSTRAINT FK_EducationOrganizationInterventionPrescriptionAssociation_EducationOrganization FOREIGN KEY (EducationOrganizationHashKey)
    REFERENCES edfi.EducationOrganization (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.EducationOrganizationInterventionPrescriptionAssociation WITH CHECK ADD CONSTRAINT FK_EducationOrganizationInterventionPrescriptionAssociation_InterventionPrescription FOREIGN KEY (InterventionPrescriptionHashKey)
    REFERENCES edfi.InterventionPrescription (HashKey)
    GO
        -- Foreign key from entity identity table
        ALTER TABLE edfi.EducationOrganizationNetwork_Attributes WITH CHECK ADD CONSTRAINT FK_EducationOrganizationNetwork_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.EducationOrganizationNetwork (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.EducationOrganizationNetwork WITH CHECK ADD CONSTRAINT FK_EducationOrganizationNetwork_EducationOrganization FOREIGN KEY (EducationOrganizationHashKey)
    REFERENCES edfi.EducationOrganization (HashKey)
    GO
        -- Foreign key from entity identity table
        ALTER TABLE edfi.EducationOrganizationNetworkAssociation_Attributes WITH CHECK ADD CONSTRAINT FK_EducationOrganizationNetworkAssociation_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.EducationOrganizationNetworkAssociation (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.EducationOrganizationNetworkAssociation WITH CHECK ADD CONSTRAINT FK_MemberEducationOrganizationNetworkAssociation_EducationOrganization FOREIGN KEY (MemberEducationOrganizationHashKey)
    REFERENCES edfi.EducationOrganization (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.EducationOrganizationNetworkAssociation WITH CHECK ADD CONSTRAINT FK_EducationOrganizationNetworkAssociation_EducationOrganizationNetwork FOREIGN KEY (EducationOrganizationNetworkHashKey)
    REFERENCES edfi.EducationOrganizationNetwork (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.EducationOrganizationPeerAssociation WITH CHECK ADD CONSTRAINT FK_EducationOrganizationPeerAssociation_EducationOrganization FOREIGN KEY (EducationOrganizationHashKey)
    REFERENCES edfi.EducationOrganization (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.EducationOrganizationPeerAssociation WITH CHECK ADD CONSTRAINT FK_PeerEducationOrganizationPeerAssociation_EducationOrganization FOREIGN KEY (PeerEducationOrganizationHashKey)
    REFERENCES edfi.EducationOrganization (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.EducationPlanDescriptor WITH CHECK ADD CONSTRAINT FK_EducationPlanDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO
        -- Foreign key from entity identity table
        ALTER TABLE edfi.EducationServiceCenter_Attributes WITH CHECK ADD CONSTRAINT FK_EducationServiceCenter_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.EducationServiceCenter (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.EducationServiceCenter WITH CHECK ADD CONSTRAINT FK_EducationServiceCenter_EducationOrganization FOREIGN KEY (EducationOrganizationHashKey)
    REFERENCES edfi.EducationOrganization (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.ElectronicMailTypeDescriptor WITH CHECK ADD CONSTRAINT FK_ElectronicMailTypeDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.EmploymentStatusDescriptor WITH CHECK ADD CONSTRAINT FK_EmploymentStatusDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.EntryGradeLevelReasonDescriptor WITH CHECK ADD CONSTRAINT FK_EntryGradeLevelReasonDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.EntryTypeDescriptor WITH CHECK ADD CONSTRAINT FK_EntryTypeDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.EventCircumstanceDescriptor WITH CHECK ADD CONSTRAINT FK_EventCircumstanceDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.ExitWithdrawTypeDescriptor WITH CHECK ADD CONSTRAINT FK_ExitWithdrawTypeDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO
        -- Foreign key from entity identity table
        ALTER TABLE edfi.FeederSchoolAssociation_Attributes WITH CHECK ADD CONSTRAINT FK_FeederSchoolAssociation_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.FeederSchoolAssociation (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.FeederSchoolAssociation WITH CHECK ADD CONSTRAINT FK_FeederFeederSchoolAssociation_School FOREIGN KEY (FeederSchoolHashKey)
    REFERENCES edfi.School (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.FeederSchoolAssociation WITH CHECK ADD CONSTRAINT FK_FeederSchoolAssociation_School FOREIGN KEY (SchoolHashKey)
    REFERENCES edfi.School (HashKey)
    GO
        -- Foreign key from entity identity table
        ALTER TABLE edfi.GeneralStudentProgramAssociation_Attributes WITH CHECK ADD CONSTRAINT FK_GeneralStudentProgramAssociation_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.GeneralStudentProgramAssociation (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.GeneralStudentProgramAssociation WITH CHECK ADD CONSTRAINT FK_GeneralStudentProgramAssociation_EducationOrganization FOREIGN KEY (EducationOrganizationHashKey)
    REFERENCES edfi.EducationOrganization (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.GeneralStudentProgramAssociation WITH CHECK ADD CONSTRAINT FK_GeneralStudentProgramAssociation_Program FOREIGN KEY (ProgramHashKey)
    REFERENCES edfi.Program (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.GeneralStudentProgramAssociation WITH CHECK ADD CONSTRAINT FK_GeneralStudentProgramAssociation_Student FOREIGN KEY (StudentHashKey)
    REFERENCES edfi.Student (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.GeneralStudentProgramAssociationParticipationStatus_Attributes WITH CHECK ADD CONSTRAINT FK_GeneralStudentProgramAssociationParticipationStatus_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.GeneralStudentProgramAssociationParticipationStatus (HashKey)
        GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.Grade_Attributes WITH CHECK ADD CONSTRAINT FK_Grade_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.Grade (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.Grade WITH CHECK ADD CONSTRAINT FK_Grade_GradeTypeDescriptor FOREIGN KEY (GradeTypeDescriptorHashKey)
    REFERENCES edfi.GradeTypeDescriptor (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.Grade WITH CHECK ADD CONSTRAINT FK_GradingGrade_GradingPeriod FOREIGN KEY (GradingPeriodHashKey)
    REFERENCES edfi.GradingPeriod (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.Grade WITH CHECK ADD CONSTRAINT FK_Grade_StudentSectionAssociation FOREIGN KEY (StudentSectionAssociationHashKey)
    REFERENCES edfi.StudentSectionAssociation (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.GradeLearningStandardGrade WITH CHECK ADD CONSTRAINT FK_GradeLearningStandardGrade_LearningStandard FOREIGN KEY (LearningStandardHashKey)
    REFERENCES edfi.LearningStandard (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.GradeLearningStandardGrade_Attributes WITH CHECK ADD CONSTRAINT FK_GradeLearningStandardGrade_Attributes FOREIGN KEY
        (HashKey, LearningStandardHashKey) REFERENCES edfi.GradeLearningStandardGrade (HashKey, LearningStandardHashKey)
        GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.GradebookEntry_Attributes WITH CHECK ADD CONSTRAINT FK_GradebookEntry_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.GradebookEntry (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.GradebookEntry WITH CHECK ADD CONSTRAINT FK_GradebookEntry_Section FOREIGN KEY (SectionHashKey)
    REFERENCES edfi.Section (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.GradebookEntryLearningObjective WITH CHECK ADD CONSTRAINT FK_GradebookEntryLearningObjective_LearningObjective FOREIGN KEY (LearningObjectiveHashKey)
    REFERENCES edfi.LearningObjective (HashKey)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.GradebookEntryLearningStandard WITH CHECK ADD CONSTRAINT FK_GradebookEntryLearningStandard_LearningStandard FOREIGN KEY (LearningStandardHashKey)
    REFERENCES edfi.LearningStandard (HashKey)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.GradebookEntryTypeDescriptor WITH CHECK ADD CONSTRAINT FK_GradebookEntryTypeDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.GradeLevelDescriptor WITH CHECK ADD CONSTRAINT FK_GradeLevelDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.GradePointAverageTypeDescriptor WITH CHECK ADD CONSTRAINT FK_GradePointAverageTypeDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.GradeTypeDescriptor WITH CHECK ADD CONSTRAINT FK_GradeTypeDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO
        -- Foreign key from entity identity table
        ALTER TABLE edfi.GradingPeriod_Attributes WITH CHECK ADD CONSTRAINT FK_GradingPeriod_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.GradingPeriod (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.GradingPeriod WITH CHECK ADD CONSTRAINT FK_GradingPeriod_GradingPeriodDescriptor FOREIGN KEY (GradingPeriodDescriptorHashKey)
    REFERENCES edfi.GradingPeriodDescriptor (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.GradingPeriod WITH CHECK ADD CONSTRAINT FK_GradingPeriod_School FOREIGN KEY (SchoolHashKey)
    REFERENCES edfi.School (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.GradingPeriod WITH CHECK ADD CONSTRAINT FK_GradingPeriod_SchoolYearType FOREIGN KEY (SchoolYearTypeHashKey)
    REFERENCES edfi.SchoolYearType (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.GradingPeriodDescriptor WITH CHECK ADD CONSTRAINT FK_GradingPeriodDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO
        -- Foreign key from entity identity table
        ALTER TABLE edfi.GraduationPlan_Attributes WITH CHECK ADD CONSTRAINT FK_GraduationPlan_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.GraduationPlan (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.GraduationPlan WITH CHECK ADD CONSTRAINT FK_GraduationPlan_EducationOrganization FOREIGN KEY (EducationOrganizationHashKey)
    REFERENCES edfi.EducationOrganization (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.GraduationPlan WITH CHECK ADD CONSTRAINT FK_GraduationPlan_GraduationPlanTypeDescriptor FOREIGN KEY (GraduationPlanTypeDescriptorHashKey)
    REFERENCES edfi.GraduationPlanTypeDescriptor (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.GraduationPlan WITH CHECK ADD CONSTRAINT FK_GraduationGraduationPlan_SchoolYearType FOREIGN KEY (GraduationSchoolYearTypeHashKey)
    REFERENCES edfi.SchoolYearType (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.GraduationPlanCreditsByCourse_Attributes WITH CHECK ADD CONSTRAINT FK_GraduationPlanCreditsByCourse_Attributes FOREIGN KEY
        (HashKey, CourseSetName) REFERENCES edfi.GraduationPlanCreditsByCourse (HashKey, CourseSetName)
        GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.GraduationPlanCreditsByCourseCourse WITH CHECK ADD CONSTRAINT FK_GraduationPlanCreditsByCourseCourse_Course FOREIGN KEY (CourseHashKey)
    REFERENCES edfi.Course (HashKey)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.GraduationPlanCreditsByCreditCategory WITH CHECK ADD CONSTRAINT FK_GraduationPlanCreditsByCreditCategory_CreditCategoryDescriptor FOREIGN KEY (CreditCategoryDescriptorHashKey)
    REFERENCES edfi.CreditCategoryDescriptor (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.GraduationPlanCreditsByCreditCategory_Attributes WITH CHECK ADD CONSTRAINT FK_GraduationPlanCreditsByCreditCategory_Attributes FOREIGN KEY
        (HashKey, CreditCategoryDescriptorHashKey) REFERENCES edfi.GraduationPlanCreditsByCreditCategory (HashKey, CreditCategoryDescriptorHashKey)
        GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.GraduationPlanCreditsBySubject WITH CHECK ADD CONSTRAINT FK_GraduationPlanCreditsBySubject_AcademicSubjectDescriptor FOREIGN KEY (AcademicSubjectDescriptorHashKey)
    REFERENCES edfi.AcademicSubjectDescriptor (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.GraduationPlanCreditsBySubject_Attributes WITH CHECK ADD CONSTRAINT FK_GraduationPlanCreditsBySubject_Attributes FOREIGN KEY
        (HashKey, AcademicSubjectDescriptorHashKey) REFERENCES edfi.GraduationPlanCreditsBySubject (HashKey, AcademicSubjectDescriptorHashKey)
        GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.GraduationPlanRequiredAssessment WITH CHECK ADD CONSTRAINT FK_GraduationPlanRequiredAssessment_Assessment FOREIGN KEY (AssessmentHashKey)
    REFERENCES edfi.Assessment (HashKey)
    GO



        -- Foreign key from entity identity table
        ALTER TABLE edfi.GraduationPlanRequiredAssessmentPerformanceLevel_Attributes WITH CHECK ADD CONSTRAINT FK_GraduationPlanRequiredAssessmentPerformanceLevel_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.GraduationPlanRequiredAssessmentPerformanceLevel (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.GraduationPlanRequiredAssessmentScore WITH CHECK ADD CONSTRAINT FK_GraduationPlanRequiredAssessmentScore_AssessmentReportingMethodDescriptor FOREIGN KEY (AssessmentReportingMethodDescriptorHashKey)
    REFERENCES edfi.AssessmentReportingMethodDescriptor (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.GraduationPlanRequiredAssessmentScore_Attributes WITH CHECK ADD CONSTRAINT FK_GraduationPlanRequiredAssessmentScore_Attributes FOREIGN KEY
        (HashKey, AssessmentReportingMethodDescriptorHashKey) REFERENCES edfi.GraduationPlanRequiredAssessmentScore (HashKey, AssessmentReportingMethodDescriptorHashKey)
        GO


    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.GraduationPlanTypeDescriptor WITH CHECK ADD CONSTRAINT FK_GraduationPlanTypeDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.GunFreeSchoolsActReportingStatusDescriptor WITH CHECK ADD CONSTRAINT FK_GunFreeSchoolsActReportingStatusDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.HomelessPrimaryNighttimeResidenceDescriptor WITH CHECK ADD CONSTRAINT FK_HomelessPrimaryNighttimeResidenceDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.HomelessProgramServiceDescriptor WITH CHECK ADD CONSTRAINT FK_HomelessProgramServiceDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.IdentificationDocumentUseDescriptor WITH CHECK ADD CONSTRAINT FK_IdentificationDocumentUseDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.IncidentLocationDescriptor WITH CHECK ADD CONSTRAINT FK_IncidentLocationDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.IndicatorDescriptor WITH CHECK ADD CONSTRAINT FK_IndicatorDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.IndicatorGroupDescriptor WITH CHECK ADD CONSTRAINT FK_IndicatorGroupDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.IndicatorLevelDescriptor WITH CHECK ADD CONSTRAINT FK_IndicatorLevelDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.InstitutionTelephoneNumberTypeDescriptor WITH CHECK ADD CONSTRAINT FK_InstitutionTelephoneNumberTypeDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.InteractivityStyleDescriptor WITH CHECK ADD CONSTRAINT FK_InteractivityStyleDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.InternetAccessDescriptor WITH CHECK ADD CONSTRAINT FK_InternetAccessDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO
        -- Foreign key from entity identity table
        ALTER TABLE edfi.Intervention_Attributes WITH CHECK ADD CONSTRAINT FK_Intervention_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.Intervention (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.Intervention WITH CHECK ADD CONSTRAINT FK_Intervention_EducationOrganization FOREIGN KEY (EducationOrganizationHashKey)
    REFERENCES edfi.EducationOrganization (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.InterventionAppropriateGradeLevel WITH CHECK ADD CONSTRAINT FK_InterventionAppropriateGradeLevel_GradeLevelDescriptor FOREIGN KEY (GradeLevelDescriptorHashKey)
    REFERENCES edfi.GradeLevelDescriptor (HashKey)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.InterventionAppropriateSex WITH CHECK ADD CONSTRAINT FK_InterventionAppropriateSex_SexDescriptor FOREIGN KEY (SexDescriptorHashKey)
    REFERENCES edfi.SexDescriptor (HashKey)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.InterventionDiagnosis WITH CHECK ADD CONSTRAINT FK_InterventionDiagnosis_DiagnosisDescriptor FOREIGN KEY (DiagnosisDescriptorHashKey)
    REFERENCES edfi.DiagnosisDescriptor (HashKey)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.InterventionEducationContent WITH CHECK ADD CONSTRAINT FK_InterventionEducationContent_EducationContent FOREIGN KEY (EducationContentHashKey)
    REFERENCES edfi.EducationContent (HashKey)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.InterventionInterventionPrescription WITH CHECK ADD CONSTRAINT FK_InterventionInterventionPrescription_InterventionPrescription FOREIGN KEY (InterventionPrescriptionHashKey)
    REFERENCES edfi.InterventionPrescription (HashKey)
    GO






    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.InterventionPopulationServed WITH CHECK ADD CONSTRAINT FK_InterventionPopulationServed_PopulationServedDescriptor FOREIGN KEY (PopulationServedDescriptorHashKey)
    REFERENCES edfi.PopulationServedDescriptor (HashKey)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.InterventionStaff WITH CHECK ADD CONSTRAINT FK_InterventionStaff_Staff FOREIGN KEY (StaffHashKey)
    REFERENCES edfi.Staff (HashKey)
    GO





    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.InterventionClassDescriptor WITH CHECK ADD CONSTRAINT FK_InterventionClassDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.InterventionEffectivenessRatingDescriptor WITH CHECK ADD CONSTRAINT FK_InterventionEffectivenessRatingDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO
        -- Foreign key from entity identity table
        ALTER TABLE edfi.InterventionPrescription_Attributes WITH CHECK ADD CONSTRAINT FK_InterventionPrescription_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.InterventionPrescription (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.InterventionPrescription WITH CHECK ADD CONSTRAINT FK_InterventionPrescription_EducationOrganization FOREIGN KEY (EducationOrganizationHashKey)
    REFERENCES edfi.EducationOrganization (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.InterventionPrescriptionAppropriateGradeLevel WITH CHECK ADD CONSTRAINT FK_InterventionPrescriptionAppropriateGradeLevel_GradeLevelDescriptor FOREIGN KEY (GradeLevelDescriptorHashKey)
    REFERENCES edfi.GradeLevelDescriptor (HashKey)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.InterventionPrescriptionAppropriateSex WITH CHECK ADD CONSTRAINT FK_InterventionPrescriptionAppropriateSex_SexDescriptor FOREIGN KEY (SexDescriptorHashKey)
    REFERENCES edfi.SexDescriptor (HashKey)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.InterventionPrescriptionDiagnosis WITH CHECK ADD CONSTRAINT FK_InterventionPrescriptionDiagnosis_DiagnosisDescriptor FOREIGN KEY (DiagnosisDescriptorHashKey)
    REFERENCES edfi.DiagnosisDescriptor (HashKey)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.InterventionPrescriptionEducationContent WITH CHECK ADD CONSTRAINT FK_InterventionPrescriptionEducationContent_EducationContent FOREIGN KEY (EducationContentHashKey)
    REFERENCES edfi.EducationContent (HashKey)
    GO




    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.InterventionPrescriptionPopulationServed WITH CHECK ADD CONSTRAINT FK_InterventionPrescriptionPopulationServed_PopulationServedDescriptor FOREIGN KEY (PopulationServedDescriptorHashKey)
    REFERENCES edfi.PopulationServedDescriptor (HashKey)
    GO




        -- Foreign key from entity identity table
        ALTER TABLE edfi.InterventionStudy_Attributes WITH CHECK ADD CONSTRAINT FK_InterventionStudy_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.InterventionStudy (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.InterventionStudy WITH CHECK ADD CONSTRAINT FK_InterventionStudy_EducationOrganization FOREIGN KEY (EducationOrganizationHashKey)
    REFERENCES edfi.EducationOrganization (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.InterventionStudyAppropriateGradeLevel WITH CHECK ADD CONSTRAINT FK_InterventionStudyAppropriateGradeLevel_GradeLevelDescriptor FOREIGN KEY (GradeLevelDescriptorHashKey)
    REFERENCES edfi.GradeLevelDescriptor (HashKey)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.InterventionStudyAppropriateSex WITH CHECK ADD CONSTRAINT FK_InterventionStudyAppropriateSex_SexDescriptor FOREIGN KEY (SexDescriptorHashKey)
    REFERENCES edfi.SexDescriptor (HashKey)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.InterventionStudyEducationContent WITH CHECK ADD CONSTRAINT FK_InterventionStudyEducationContent_EducationContent FOREIGN KEY (EducationContentHashKey)
    REFERENCES edfi.EducationContent (HashKey)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.InterventionStudyInterventionEffectiveness WITH CHECK ADD CONSTRAINT FK_InterventionStudyInterventionEffectiveness_DiagnosisDescriptor FOREIGN KEY (DiagnosisDescriptorHashKey)
    REFERENCES edfi.DiagnosisDescriptor (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.InterventionStudyInterventionEffectiveness WITH CHECK ADD CONSTRAINT FK_InterventionStudyInterventionEffectiveness_GradeLevelDescriptor FOREIGN KEY (GradeLevelDescriptorHashKey)
    REFERENCES edfi.GradeLevelDescriptor (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.InterventionStudyInterventionEffectiveness WITH CHECK ADD CONSTRAINT FK_InterventionStudyInterventionEffectiveness_PopulationServedDescriptor FOREIGN KEY (PopulationServedDescriptorHashKey)
    REFERENCES edfi.PopulationServedDescriptor (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.InterventionStudyInterventionEffectiveness_Attributes WITH CHECK ADD CONSTRAINT FK_InterventionStudyInterventionEffectiveness_Attributes FOREIGN KEY
        (HashKey, DiagnosisDescriptorHashKey, GradeLevelDescriptorHashKey, PopulationServedDescriptorHashKey) REFERENCES edfi.InterventionStudyInterventionEffectiveness (HashKey, DiagnosisDescriptorHashKey, GradeLevelDescriptorHashKey, PopulationServedDescriptorHashKey)
        GO



    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.InterventionStudyPopulationServed WITH CHECK ADD CONSTRAINT FK_InterventionStudyPopulationServed_PopulationServedDescriptor FOREIGN KEY (PopulationServedDescriptorHashKey)
    REFERENCES edfi.PopulationServedDescriptor (HashKey)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.InterventionStudyStateAbbreviation WITH CHECK ADD CONSTRAINT FK_InterventionStudyStateAbbreviation_StateAbbreviationDescriptor FOREIGN KEY (StateAbbreviationDescriptorHashKey)
    REFERENCES edfi.StateAbbreviationDescriptor (HashKey)
    GO





    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.LanguageDescriptor WITH CHECK ADD CONSTRAINT FK_LanguageDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.LanguageInstructionProgramServiceDescriptor WITH CHECK ADD CONSTRAINT FK_LanguageInstructionProgramServiceDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.LanguageUseDescriptor WITH CHECK ADD CONSTRAINT FK_LanguageUseDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO
        -- Foreign key from entity identity table
        ALTER TABLE edfi.LearningObjective_Attributes WITH CHECK ADD CONSTRAINT FK_LearningObjective_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.LearningObjective (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.LearningObjectiveAcademicSubject WITH CHECK ADD CONSTRAINT FK_LearningObjectiveAcademicSubject_AcademicSubjectDescriptor FOREIGN KEY (AcademicSubjectDescriptorHashKey)
    REFERENCES edfi.AcademicSubjectDescriptor (HashKey)
    GO



        -- Foreign key from entity identity table
        ALTER TABLE edfi.LearningObjectiveContentStandard_Attributes WITH CHECK ADD CONSTRAINT FK_LearningObjectiveContentStandard_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.LearningObjectiveContentStandard (HashKey)
        GO



    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.LearningObjectiveGradeLevel WITH CHECK ADD CONSTRAINT FK_LearningObjectiveGradeLevel_GradeLevelDescriptor FOREIGN KEY (GradeLevelDescriptorHashKey)
    REFERENCES edfi.GradeLevelDescriptor (HashKey)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.LearningObjectiveLearningStandard WITH CHECK ADD CONSTRAINT FK_LearningObjectiveLearningStandard_LearningStandard FOREIGN KEY (LearningStandardHashKey)
    REFERENCES edfi.LearningStandard (HashKey)
    GO


        -- Foreign key from entity identity table
        ALTER TABLE edfi.LearningStandard_Attributes WITH CHECK ADD CONSTRAINT FK_LearningStandard_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.LearningStandard (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.LearningStandardAcademicSubject WITH CHECK ADD CONSTRAINT FK_LearningStandardAcademicSubject_AcademicSubjectDescriptor FOREIGN KEY (AcademicSubjectDescriptorHashKey)
    REFERENCES edfi.AcademicSubjectDescriptor (HashKey)
    GO



        -- Foreign key from entity identity table
        ALTER TABLE edfi.LearningStandardContentStandard_Attributes WITH CHECK ADD CONSTRAINT FK_LearningStandardContentStandard_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.LearningStandardContentStandard (HashKey)
        GO



    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.LearningStandardGradeLevel WITH CHECK ADD CONSTRAINT FK_LearningStandardGradeLevel_GradeLevelDescriptor FOREIGN KEY (GradeLevelDescriptorHashKey)
    REFERENCES edfi.GradeLevelDescriptor (HashKey)
    GO







    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.LearningStandardCategoryDescriptor WITH CHECK ADD CONSTRAINT FK_LearningStandardCategoryDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO
        -- Foreign key from entity identity table
        ALTER TABLE edfi.LearningStandardEquivalenceAssociation_Attributes WITH CHECK ADD CONSTRAINT FK_LearningStandardEquivalenceAssociation_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.LearningStandardEquivalenceAssociation (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.LearningStandardEquivalenceAssociation WITH CHECK ADD CONSTRAINT FK_SourceLearningStandardEquivalenceAssociation_LearningStandard FOREIGN KEY (SourceLearningStandardHashKey)
    REFERENCES edfi.LearningStandard (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.LearningStandardEquivalenceAssociation WITH CHECK ADD CONSTRAINT FK_TargetLearningStandardEquivalenceAssociation_LearningStandard FOREIGN KEY (TargetLearningStandardHashKey)
    REFERENCES edfi.LearningStandard (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.LearningStandardEquivalenceStrengthDescriptor WITH CHECK ADD CONSTRAINT FK_LearningStandardEquivalenceStrengthDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.LearningStandardScopeDescriptor WITH CHECK ADD CONSTRAINT FK_LearningStandardScopeDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.LevelOfEducationDescriptor WITH CHECK ADD CONSTRAINT FK_LevelOfEducationDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.LicenseStatusDescriptor WITH CHECK ADD CONSTRAINT FK_LicenseStatusDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.LicenseTypeDescriptor WITH CHECK ADD CONSTRAINT FK_LicenseTypeDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.LimitedEnglishProficiencyDescriptor WITH CHECK ADD CONSTRAINT FK_LimitedEnglishProficiencyDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.LocaleDescriptor WITH CHECK ADD CONSTRAINT FK_LocaleDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO
        -- Foreign key from entity identity table
        ALTER TABLE edfi.LocalEducationAgency_Attributes WITH CHECK ADD CONSTRAINT FK_LocalEducationAgency_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.LocalEducationAgency (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.LocalEducationAgency WITH CHECK ADD CONSTRAINT FK_LocalEducationAgency_EducationOrganization FOREIGN KEY (EducationOrganizationHashKey)
    REFERENCES edfi.EducationOrganization (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.LocalEducationAgencyAccountability WITH CHECK ADD CONSTRAINT FK_LocalEducationAgencyAccountability_SchoolYearType FOREIGN KEY (SchoolYearTypeHashKey)
    REFERENCES edfi.SchoolYearType (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.LocalEducationAgencyAccountability_Attributes WITH CHECK ADD CONSTRAINT FK_LocalEducationAgencyAccountability_Attributes FOREIGN KEY
        (HashKey, SchoolYearTypeHashKey) REFERENCES edfi.LocalEducationAgencyAccountability (HashKey, SchoolYearTypeHashKey)
        GO


        -- Foreign key from entity identity table
        ALTER TABLE edfi.LocalEducationAgencyFederalFunds_Attributes WITH CHECK ADD CONSTRAINT FK_LocalEducationAgencyFederalFunds_Attributes FOREIGN KEY
        (HashKey, FiscalYear) REFERENCES edfi.LocalEducationAgencyFederalFunds (HashKey, FiscalYear)
        GO


    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.LocalEducationAgencyCategoryDescriptor WITH CHECK ADD CONSTRAINT FK_LocalEducationAgencyCategoryDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO
        -- Foreign key from entity identity table
        ALTER TABLE edfi.Location_Attributes WITH CHECK ADD CONSTRAINT FK_Location_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.Location (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.Location WITH CHECK ADD CONSTRAINT FK_Location_School FOREIGN KEY (SchoolHashKey)
    REFERENCES edfi.School (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.MagnetSpecialProgramEmphasisSchoolDescriptor WITH CHECK ADD CONSTRAINT FK_MagnetSpecialProgramEmphasisSchoolDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.MediumOfInstructionDescriptor WITH CHECK ADD CONSTRAINT FK_MediumOfInstructionDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.MethodCreditEarnedDescriptor WITH CHECK ADD CONSTRAINT FK_MethodCreditEarnedDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.MigrantEducationProgramServiceDescriptor WITH CHECK ADD CONSTRAINT FK_MigrantEducationProgramServiceDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.MonitoredDescriptor WITH CHECK ADD CONSTRAINT FK_MonitoredDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.NeglectedOrDelinquentProgramDescriptor WITH CHECK ADD CONSTRAINT FK_NeglectedOrDelinquentProgramDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.NeglectedOrDelinquentProgramServiceDescriptor WITH CHECK ADD CONSTRAINT FK_NeglectedOrDelinquentProgramServiceDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.NetworkPurposeDescriptor WITH CHECK ADD CONSTRAINT FK_NetworkPurposeDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO
        -- Foreign key from entity identity table
        ALTER TABLE edfi.ObjectiveAssessment_Attributes WITH CHECK ADD CONSTRAINT FK_ObjectiveAssessment_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.ObjectiveAssessment (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.ObjectiveAssessment WITH CHECK ADD CONSTRAINT FK_ObjectiveAssessment_Assessment FOREIGN KEY (AssessmentHashKey)
    REFERENCES edfi.Assessment (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.ObjectiveAssessmentAssessmentItem WITH CHECK ADD CONSTRAINT FK_ObjectiveAssessmentAssessmentItem_AssessmentItem FOREIGN KEY (AssessmentItemHashKey)
    REFERENCES edfi.AssessmentItem (HashKey)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.ObjectiveAssessmentLearningObjective WITH CHECK ADD CONSTRAINT FK_ObjectiveAssessmentLearningObjective_LearningObjective FOREIGN KEY (LearningObjectiveHashKey)
    REFERENCES edfi.LearningObjective (HashKey)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.ObjectiveAssessmentLearningStandard WITH CHECK ADD CONSTRAINT FK_ObjectiveAssessmentLearningStandard_LearningStandard FOREIGN KEY (LearningStandardHashKey)
    REFERENCES edfi.LearningStandard (HashKey)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.ObjectiveAssessmentPerformanceLevel WITH CHECK ADD CONSTRAINT FK_ObjectiveAssessmentPerformanceLevel_AssessmentReportingMethodDescriptor FOREIGN KEY (AssessmentReportingMethodDescriptorHashKey)
    REFERENCES edfi.AssessmentReportingMethodDescriptor (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.ObjectiveAssessmentPerformanceLevel WITH CHECK ADD CONSTRAINT FK_ObjectiveAssessmentPerformanceLevel_PerformanceLevelDescriptor FOREIGN KEY (PerformanceLevelDescriptorHashKey)
    REFERENCES edfi.PerformanceLevelDescriptor (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.ObjectiveAssessmentPerformanceLevel_Attributes WITH CHECK ADD CONSTRAINT FK_ObjectiveAssessmentPerformanceLevel_Attributes FOREIGN KEY
        (HashKey, AssessmentReportingMethodDescriptorHashKey, PerformanceLevelDescriptorHashKey) REFERENCES edfi.ObjectiveAssessmentPerformanceLevel (HashKey, AssessmentReportingMethodDescriptorHashKey, PerformanceLevelDescriptorHashKey)
        GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.ObjectiveAssessmentScore WITH CHECK ADD CONSTRAINT FK_ObjectiveAssessmentScore_AssessmentReportingMethodDescriptor FOREIGN KEY (AssessmentReportingMethodDescriptorHashKey)
    REFERENCES edfi.AssessmentReportingMethodDescriptor (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.ObjectiveAssessmentScore_Attributes WITH CHECK ADD CONSTRAINT FK_ObjectiveAssessmentScore_Attributes FOREIGN KEY
        (HashKey, AssessmentReportingMethodDescriptorHashKey) REFERENCES edfi.ObjectiveAssessmentScore (HashKey, AssessmentReportingMethodDescriptorHashKey)
        GO


    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.OldEthnicityDescriptor WITH CHECK ADD CONSTRAINT FK_OldEthnicityDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO
        -- Foreign key from entity identity table
        ALTER TABLE edfi.OpenStaffPosition_Attributes WITH CHECK ADD CONSTRAINT FK_OpenStaffPosition_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.OpenStaffPosition (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.OpenStaffPosition WITH CHECK ADD CONSTRAINT FK_OpenStaffPosition_EducationOrganization FOREIGN KEY (EducationOrganizationHashKey)
    REFERENCES edfi.EducationOrganization (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.OpenStaffPositionAcademicSubject WITH CHECK ADD CONSTRAINT FK_OpenStaffPositionAcademicSubject_AcademicSubjectDescriptor FOREIGN KEY (AcademicSubjectDescriptorHashKey)
    REFERENCES edfi.AcademicSubjectDescriptor (HashKey)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.OpenStaffPositionInstructionalGradeLevel WITH CHECK ADD CONSTRAINT FK_OpenStaffPositionInstructionalGradeLevel_GradeLevelDescriptor FOREIGN KEY (GradeLevelDescriptorHashKey)
    REFERENCES edfi.GradeLevelDescriptor (HashKey)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.OperationalStatusDescriptor WITH CHECK ADD CONSTRAINT FK_OperationalStatusDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.OtherNameTypeDescriptor WITH CHECK ADD CONSTRAINT FK_OtherNameTypeDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO
        -- Foreign key from entity identity table
        ALTER TABLE edfi.Parent_Attributes WITH CHECK ADD CONSTRAINT FK_Parent_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.Parent (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.ParentAddress WITH CHECK ADD CONSTRAINT FK_ParentAddress_AddressTypeDescriptor FOREIGN KEY (AddressTypeDescriptorHashKey)
    REFERENCES edfi.AddressTypeDescriptor (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.ParentAddress WITH CHECK ADD CONSTRAINT FK_ParentAddress_StateAbbreviationDescriptor FOREIGN KEY (StateAbbreviationDescriptorHashKey)
    REFERENCES edfi.StateAbbreviationDescriptor (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.ParentAddress_Attributes WITH CHECK ADD CONSTRAINT FK_ParentAddress_Attributes FOREIGN KEY
        (HashKey, AddressTypeDescriptorHashKey, StateAbbreviationDescriptorHashKey, City, PostalCode, StreetNumberName) REFERENCES edfi.ParentAddress (HashKey, AddressTypeDescriptorHashKey, StateAbbreviationDescriptorHashKey, City, PostalCode, StreetNumberName)
        GO


        -- Foreign key from entity identity table
        ALTER TABLE edfi.ParentAddressPeriod_Attributes WITH CHECK ADD CONSTRAINT FK_ParentAddressPeriod_Attributes FOREIGN KEY
        (HashKey, BeginDate) REFERENCES edfi.ParentAddressPeriod (HashKey, BeginDate)
        GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.ParentElectronicMail WITH CHECK ADD CONSTRAINT FK_ParentElectronicMail_ElectronicMailTypeDescriptor FOREIGN KEY (ElectronicMailTypeDescriptorHashKey)
    REFERENCES edfi.ElectronicMailTypeDescriptor (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.ParentElectronicMail_Attributes WITH CHECK ADD CONSTRAINT FK_ParentElectronicMail_Attributes FOREIGN KEY
        (HashKey, ElectronicMailTypeDescriptorHashKey, ElectronicMailAddress) REFERENCES edfi.ParentElectronicMail (HashKey, ElectronicMailTypeDescriptorHashKey, ElectronicMailAddress)
        GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.ParentInternationalAddress WITH CHECK ADD CONSTRAINT FK_ParentInternationalAddress_AddressTypeDescriptor FOREIGN KEY (AddressTypeDescriptorHashKey)
    REFERENCES edfi.AddressTypeDescriptor (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.ParentInternationalAddress_Attributes WITH CHECK ADD CONSTRAINT FK_ParentInternationalAddress_Attributes FOREIGN KEY
        (HashKey, AddressTypeDescriptorHashKey) REFERENCES edfi.ParentInternationalAddress (HashKey, AddressTypeDescriptorHashKey)
        GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.ParentLanguage WITH CHECK ADD CONSTRAINT FK_ParentLanguage_LanguageDescriptor FOREIGN KEY (LanguageDescriptorHashKey)
    REFERENCES edfi.LanguageDescriptor (HashKey)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.ParentLanguageUse WITH CHECK ADD CONSTRAINT FK_ParentLanguageUse_LanguageUseDescriptor FOREIGN KEY (LanguageUseDescriptorHashKey)
    REFERENCES edfi.LanguageUseDescriptor (HashKey)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.ParentOtherName WITH CHECK ADD CONSTRAINT FK_ParentOtherName_OtherNameTypeDescriptor FOREIGN KEY (OtherNameTypeDescriptorHashKey)
    REFERENCES edfi.OtherNameTypeDescriptor (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.ParentOtherName_Attributes WITH CHECK ADD CONSTRAINT FK_ParentOtherName_Attributes FOREIGN KEY
        (HashKey, OtherNameTypeDescriptorHashKey) REFERENCES edfi.ParentOtherName (HashKey, OtherNameTypeDescriptorHashKey)
        GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.ParentPersonalIdentificationDocument WITH CHECK ADD CONSTRAINT FK_ParentPersonalIdentificationDocument_IdentificationDocumentUseDescriptor FOREIGN KEY (IdentificationDocumentUseDescriptorHashKey)
    REFERENCES edfi.IdentificationDocumentUseDescriptor (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.ParentPersonalIdentificationDocument WITH CHECK ADD CONSTRAINT FK_ParentPersonalIdentificationDocument_PersonalInformationVerificationDescriptor FOREIGN KEY (PersonalInformationVerificationDescriptorHashKey)
    REFERENCES edfi.PersonalInformationVerificationDescriptor (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.ParentPersonalIdentificationDocument_Attributes WITH CHECK ADD CONSTRAINT FK_ParentPersonalIdentificationDocument_Attributes FOREIGN KEY
        (HashKey, IdentificationDocumentUseDescriptorHashKey, PersonalInformationVerificationDescriptorHashKey) REFERENCES edfi.ParentPersonalIdentificationDocument (HashKey, IdentificationDocumentUseDescriptorHashKey, PersonalInformationVerificationDescriptorHashKey)
        GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.ParentTelephone WITH CHECK ADD CONSTRAINT FK_ParentTelephone_TelephoneNumberTypeDescriptor FOREIGN KEY (TelephoneNumberTypeDescriptorHashKey)
    REFERENCES edfi.TelephoneNumberTypeDescriptor (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.ParentTelephone_Attributes WITH CHECK ADD CONSTRAINT FK_ParentTelephone_Attributes FOREIGN KEY
        (HashKey, TelephoneNumberTypeDescriptorHashKey, TelephoneNumber) REFERENCES edfi.ParentTelephone (HashKey, TelephoneNumberTypeDescriptorHashKey, TelephoneNumber)
        GO


    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.ParticipationDescriptor WITH CHECK ADD CONSTRAINT FK_ParticipationDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.ParticipationStatusDescriptor WITH CHECK ADD CONSTRAINT FK_ParticipationStatusDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO
        -- Foreign key from entity identity table
        ALTER TABLE edfi.Payroll_Attributes WITH CHECK ADD CONSTRAINT FK_Payroll_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.Payroll (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.Payroll WITH CHECK ADD CONSTRAINT FK_Payroll_Account FOREIGN KEY (AccountHashKey)
    REFERENCES edfi.Account (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.Payroll WITH CHECK ADD CONSTRAINT FK_Payroll_Staff FOREIGN KEY (StaffHashKey)
    REFERENCES edfi.Staff (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.PerformanceBaseConversionDescriptor WITH CHECK ADD CONSTRAINT FK_PerformanceBaseConversionDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.PerformanceLevelDescriptor WITH CHECK ADD CONSTRAINT FK_PerformanceLevelDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.Person WITH CHECK ADD CONSTRAINT FK_Person_SourceSystemDescriptor FOREIGN KEY (SourceSystemDescriptorHashKey)
    REFERENCES edfi.SourceSystemDescriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.PersonalInformationVerificationDescriptor WITH CHECK ADD CONSTRAINT FK_PersonalInformationVerificationDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.PlatformTypeDescriptor WITH CHECK ADD CONSTRAINT FK_PlatformTypeDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.PopulationServedDescriptor WITH CHECK ADD CONSTRAINT FK_PopulationServedDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.PostingResultDescriptor WITH CHECK ADD CONSTRAINT FK_PostingResultDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO
        -- Foreign key from entity identity table
        ALTER TABLE edfi.PostSecondaryEvent_Attributes WITH CHECK ADD CONSTRAINT FK_PostSecondaryEvent_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.PostSecondaryEvent (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.PostSecondaryEvent WITH CHECK ADD CONSTRAINT FK_PostSecondaryEvent_PostSecondaryEventCategoryDescriptor FOREIGN KEY (PostSecondaryEventCategoryDescriptorHashKey)
    REFERENCES edfi.PostSecondaryEventCategoryDescriptor (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.PostSecondaryEvent WITH CHECK ADD CONSTRAINT FK_PostSecondaryEvent_Student FOREIGN KEY (StudentHashKey)
    REFERENCES edfi.Student (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.PostSecondaryEventCategoryDescriptor WITH CHECK ADD CONSTRAINT FK_PostSecondaryEventCategoryDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO
        -- Foreign key from entity identity table
        ALTER TABLE edfi.PostSecondaryInstitution_Attributes WITH CHECK ADD CONSTRAINT FK_PostSecondaryInstitution_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.PostSecondaryInstitution (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.PostSecondaryInstitution WITH CHECK ADD CONSTRAINT FK_PostSecondaryInstitution_EducationOrganization FOREIGN KEY (EducationOrganizationHashKey)
    REFERENCES edfi.EducationOrganization (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.PostSecondaryInstitutionMediumOfInstruction WITH CHECK ADD CONSTRAINT FK_PostSecondaryInstitutionMediumOfInstruction_MediumOfInstructionDescriptor FOREIGN KEY (MediumOfInstructionDescriptorHashKey)
    REFERENCES edfi.MediumOfInstructionDescriptor (HashKey)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.PostSecondaryInstitutionLevelDescriptor WITH CHECK ADD CONSTRAINT FK_PostSecondaryInstitutionLevelDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.ProficiencyDescriptor WITH CHECK ADD CONSTRAINT FK_ProficiencyDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO
        -- Foreign key from entity identity table
        ALTER TABLE edfi.Program_Attributes WITH CHECK ADD CONSTRAINT FK_Program_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.Program (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.Program WITH CHECK ADD CONSTRAINT FK_Program_EducationOrganization FOREIGN KEY (EducationOrganizationHashKey)
    REFERENCES edfi.EducationOrganization (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.Program WITH CHECK ADD CONSTRAINT FK_Program_ProgramTypeDescriptor FOREIGN KEY (ProgramTypeDescriptorHashKey)
    REFERENCES edfi.ProgramTypeDescriptor (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.ProgramCharacteristic WITH CHECK ADD CONSTRAINT FK_ProgramCharacteristic_ProgramCharacteristicDescriptor FOREIGN KEY (ProgramCharacteristicDescriptorHashKey)
    REFERENCES edfi.ProgramCharacteristicDescriptor (HashKey)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.ProgramLearningObjective WITH CHECK ADD CONSTRAINT FK_ProgramLearningObjective_LearningObjective FOREIGN KEY (LearningObjectiveHashKey)
    REFERENCES edfi.LearningObjective (HashKey)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.ProgramLearningStandard WITH CHECK ADD CONSTRAINT FK_ProgramLearningStandard_LearningStandard FOREIGN KEY (LearningStandardHashKey)
    REFERENCES edfi.LearningStandard (HashKey)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.ProgramService WITH CHECK ADD CONSTRAINT FK_ProgramService_ServiceDescriptor FOREIGN KEY (ServiceDescriptorHashKey)
    REFERENCES edfi.ServiceDescriptor (HashKey)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.ProgramSponsor WITH CHECK ADD CONSTRAINT FK_ProgramSponsor_ProgramSponsorDescriptor FOREIGN KEY (ProgramSponsorDescriptorHashKey)
    REFERENCES edfi.ProgramSponsorDescriptor (HashKey)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.ProgramAssignmentDescriptor WITH CHECK ADD CONSTRAINT FK_ProgramAssignmentDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.ProgramCharacteristicDescriptor WITH CHECK ADD CONSTRAINT FK_ProgramCharacteristicDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.ProgramSponsorDescriptor WITH CHECK ADD CONSTRAINT FK_ProgramSponsorDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.ProgramTypeDescriptor WITH CHECK ADD CONSTRAINT FK_ProgramTypeDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.ProgressDescriptor WITH CHECK ADD CONSTRAINT FK_ProgressDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.ProgressLevelDescriptor WITH CHECK ADD CONSTRAINT FK_ProgressLevelDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.ProviderCategoryDescriptor WITH CHECK ADD CONSTRAINT FK_ProviderCategoryDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.ProviderProfitabilityDescriptor WITH CHECK ADD CONSTRAINT FK_ProviderProfitabilityDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.ProviderStatusDescriptor WITH CHECK ADD CONSTRAINT FK_ProviderStatusDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.PublicationStatusDescriptor WITH CHECK ADD CONSTRAINT FK_PublicationStatusDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.QuestionFormDescriptor WITH CHECK ADD CONSTRAINT FK_QuestionFormDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.RaceDescriptor WITH CHECK ADD CONSTRAINT FK_RaceDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.ReasonExitedDescriptor WITH CHECK ADD CONSTRAINT FK_ReasonExitedDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.ReasonNotTestedDescriptor WITH CHECK ADD CONSTRAINT FK_ReasonNotTestedDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.RecognitionTypeDescriptor WITH CHECK ADD CONSTRAINT FK_RecognitionTypeDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.RelationDescriptor WITH CHECK ADD CONSTRAINT FK_RelationDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.RepeatIdentifierDescriptor WITH CHECK ADD CONSTRAINT FK_RepeatIdentifierDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO
        -- Foreign key from entity identity table
        ALTER TABLE edfi.ReportCard_Attributes WITH CHECK ADD CONSTRAINT FK_ReportCard_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.ReportCard (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.ReportCard WITH CHECK ADD CONSTRAINT FK_ReportCard_EducationOrganization FOREIGN KEY (EducationOrganizationHashKey)
    REFERENCES edfi.EducationOrganization (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.ReportCard WITH CHECK ADD CONSTRAINT FK_GradingReportCard_GradingPeriod FOREIGN KEY (GradingPeriodHashKey)
    REFERENCES edfi.GradingPeriod (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.ReportCard WITH CHECK ADD CONSTRAINT FK_ReportCard_Student FOREIGN KEY (StudentHashKey)
    REFERENCES edfi.Student (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.ReportCardGrade WITH CHECK ADD CONSTRAINT FK_ReportCardGrade_Grade FOREIGN KEY (GradeHashKey)
    REFERENCES edfi.Grade (HashKey)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.ReportCardGradePointAverage WITH CHECK ADD CONSTRAINT FK_ReportCardGradePointAverage_GradePointAverageTypeDescriptor FOREIGN KEY (GradePointAverageTypeDescriptorHashKey)
    REFERENCES edfi.GradePointAverageTypeDescriptor (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.ReportCardGradePointAverage_Attributes WITH CHECK ADD CONSTRAINT FK_ReportCardGradePointAverage_Attributes FOREIGN KEY
        (HashKey, GradePointAverageTypeDescriptorHashKey) REFERENCES edfi.ReportCardGradePointAverage (HashKey, GradePointAverageTypeDescriptorHashKey)
        GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.ReportCardStudentCompetencyObjective WITH CHECK ADD CONSTRAINT FK_ReportCardStudentCompetencyObjective_StudentCompetencyObjective FOREIGN KEY (StudentCompetencyObjectiveHashKey)
    REFERENCES edfi.StudentCompetencyObjective (HashKey)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.ReportCardStudentLearningObjective WITH CHECK ADD CONSTRAINT FK_ReportCardStudentLearningObjective_StudentLearningObjective FOREIGN KEY (StudentLearningObjectiveHashKey)
    REFERENCES edfi.StudentLearningObjective (HashKey)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.ReporterDescriptionDescriptor WITH CHECK ADD CONSTRAINT FK_ReporterDescriptionDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.ResidencyStatusDescriptor WITH CHECK ADD CONSTRAINT FK_ResidencyStatusDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.ResponseIndicatorDescriptor WITH CHECK ADD CONSTRAINT FK_ResponseIndicatorDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.ResponsibilityDescriptor WITH CHECK ADD CONSTRAINT FK_ResponsibilityDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO
        -- Foreign key from entity identity table
        ALTER TABLE edfi.RestraintEvent_Attributes WITH CHECK ADD CONSTRAINT FK_RestraintEvent_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.RestraintEvent (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.RestraintEvent WITH CHECK ADD CONSTRAINT FK_RestraintEvent_School FOREIGN KEY (SchoolHashKey)
    REFERENCES edfi.School (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.RestraintEvent WITH CHECK ADD CONSTRAINT FK_RestraintEvent_Student FOREIGN KEY (StudentHashKey)
    REFERENCES edfi.Student (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.RestraintEventProgram WITH CHECK ADD CONSTRAINT FK_RestraintEventProgram_Program FOREIGN KEY (ProgramHashKey)
    REFERENCES edfi.Program (HashKey)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.RestraintEventReason WITH CHECK ADD CONSTRAINT FK_RestraintEventReason_RestraintEventReasonDescriptor FOREIGN KEY (RestraintEventReasonDescriptorHashKey)
    REFERENCES edfi.RestraintEventReasonDescriptor (HashKey)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.RestraintEventReasonDescriptor WITH CHECK ADD CONSTRAINT FK_RestraintEventReasonDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.ResultDatatypeTypeDescriptor WITH CHECK ADD CONSTRAINT FK_ResultDatatypeTypeDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.RetestIndicatorDescriptor WITH CHECK ADD CONSTRAINT FK_RetestIndicatorDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO
        -- Foreign key from entity identity table
        ALTER TABLE edfi.School_Attributes WITH CHECK ADD CONSTRAINT FK_School_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.School (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.School WITH CHECK ADD CONSTRAINT FK_School_EducationOrganization FOREIGN KEY (EducationOrganizationHashKey)
    REFERENCES edfi.EducationOrganization (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.SchoolCategory WITH CHECK ADD CONSTRAINT FK_SchoolCategory_SchoolCategoryDescriptor FOREIGN KEY (SchoolCategoryDescriptorHashKey)
    REFERENCES edfi.SchoolCategoryDescriptor (HashKey)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.SchoolGradeLevel WITH CHECK ADD CONSTRAINT FK_SchoolGradeLevel_GradeLevelDescriptor FOREIGN KEY (GradeLevelDescriptorHashKey)
    REFERENCES edfi.GradeLevelDescriptor (HashKey)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SchoolCategoryDescriptor WITH CHECK ADD CONSTRAINT FK_SchoolCategoryDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SchoolChoiceImplementStatusDescriptor WITH CHECK ADD CONSTRAINT FK_SchoolChoiceImplementStatusDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SchoolFoodServiceProgramServiceDescriptor WITH CHECK ADD CONSTRAINT FK_SchoolFoodServiceProgramServiceDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SchoolTypeDescriptor WITH CHECK ADD CONSTRAINT FK_SchoolTypeDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO
        -- Foreign key from entity identity table
        ALTER TABLE edfi.SchoolYearType_Attributes WITH CHECK ADD CONSTRAINT FK_SchoolYearType_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.SchoolYearType (HashKey)
        GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.Section_Attributes WITH CHECK ADD CONSTRAINT FK_Section_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.Section (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.Section WITH CHECK ADD CONSTRAINT FK_Section_CourseOffering FOREIGN KEY (CourseOfferingHashKey)
    REFERENCES edfi.CourseOffering (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.SectionCharacteristic WITH CHECK ADD CONSTRAINT FK_SectionCharacteristic_SectionCharacteristicDescriptor FOREIGN KEY (SectionCharacteristicDescriptorHashKey)
    REFERENCES edfi.SectionCharacteristicDescriptor (HashKey)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.SectionClassPeriod WITH CHECK ADD CONSTRAINT FK_SectionClassPeriod_ClassPeriod FOREIGN KEY (ClassPeriodHashKey)
    REFERENCES edfi.ClassPeriod (HashKey)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.SectionCourseLevelCharacteristic WITH CHECK ADD CONSTRAINT FK_SectionCourseLevelCharacteristic_CourseLevelCharacteristicDescriptor FOREIGN KEY (CourseLevelCharacteristicDescriptorHashKey)
    REFERENCES edfi.CourseLevelCharacteristicDescriptor (HashKey)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.SectionOfferedGradeLevel WITH CHECK ADD CONSTRAINT FK_SectionOfferedGradeLevel_GradeLevelDescriptor FOREIGN KEY (GradeLevelDescriptorHashKey)
    REFERENCES edfi.GradeLevelDescriptor (HashKey)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.SectionProgram WITH CHECK ADD CONSTRAINT FK_SectionProgram_Program FOREIGN KEY (ProgramHashKey)
    REFERENCES edfi.Program (HashKey)
    GO


        -- Foreign key from entity identity table
        ALTER TABLE edfi.SectionAttendanceTakenEvent_Attributes WITH CHECK ADD CONSTRAINT FK_SectionAttendanceTakenEvent_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.SectionAttendanceTakenEvent (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SectionAttendanceTakenEvent WITH CHECK ADD CONSTRAINT FK_SectionAttendanceTakenEvent_CalendarDate FOREIGN KEY (CalendarDateHashKey)
    REFERENCES edfi.CalendarDate (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SectionAttendanceTakenEvent WITH CHECK ADD CONSTRAINT FK_SectionAttendanceTakenEvent_Section FOREIGN KEY (SectionHashKey)
    REFERENCES edfi.Section (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SectionCharacteristicDescriptor WITH CHECK ADD CONSTRAINT FK_SectionCharacteristicDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SeparationDescriptor WITH CHECK ADD CONSTRAINT FK_SeparationDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SeparationReasonDescriptor WITH CHECK ADD CONSTRAINT FK_SeparationReasonDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.ServiceDescriptor WITH CHECK ADD CONSTRAINT FK_ServiceDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO
        -- Foreign key from entity identity table
        ALTER TABLE edfi.Session_Attributes WITH CHECK ADD CONSTRAINT FK_Session_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.Session (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.Session WITH CHECK ADD CONSTRAINT FK_Session_School FOREIGN KEY (SchoolHashKey)
    REFERENCES edfi.School (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.Session WITH CHECK ADD CONSTRAINT FK_Session_SchoolYearType FOREIGN KEY (SchoolYearTypeHashKey)
    REFERENCES edfi.SchoolYearType (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.SessionAcademicWeek WITH CHECK ADD CONSTRAINT FK_SessionAcademicWeek_AcademicWeek FOREIGN KEY (AcademicWeekHashKey)
    REFERENCES edfi.AcademicWeek (HashKey)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.SessionGradingPeriod WITH CHECK ADD CONSTRAINT FK_SessionGradingPeriod_GradingPeriod FOREIGN KEY (GradingPeriodHashKey)
    REFERENCES edfi.GradingPeriod (HashKey)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SexDescriptor WITH CHECK ADD CONSTRAINT FK_SexDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SourceSystemDescriptor WITH CHECK ADD CONSTRAINT FK_SourceSystemDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SpecialEducationProgramServiceDescriptor WITH CHECK ADD CONSTRAINT FK_SpecialEducationProgramServiceDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SpecialEducationSettingDescriptor WITH CHECK ADD CONSTRAINT FK_SpecialEducationSettingDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO
        -- Foreign key from entity identity table
        ALTER TABLE edfi.Staff_Attributes WITH CHECK ADD CONSTRAINT FK_Staff_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.Staff (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StaffAddress WITH CHECK ADD CONSTRAINT FK_StaffAddress_AddressTypeDescriptor FOREIGN KEY (AddressTypeDescriptorHashKey)
    REFERENCES edfi.AddressTypeDescriptor (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StaffAddress WITH CHECK ADD CONSTRAINT FK_StaffAddress_StateAbbreviationDescriptor FOREIGN KEY (StateAbbreviationDescriptorHashKey)
    REFERENCES edfi.StateAbbreviationDescriptor (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.StaffAddress_Attributes WITH CHECK ADD CONSTRAINT FK_StaffAddress_Attributes FOREIGN KEY
        (HashKey, AddressTypeDescriptorHashKey, StateAbbreviationDescriptorHashKey, City, PostalCode, StreetNumberName) REFERENCES edfi.StaffAddress (HashKey, AddressTypeDescriptorHashKey, StateAbbreviationDescriptorHashKey, City, PostalCode, StreetNumberName)
        GO


        -- Foreign key from entity identity table
        ALTER TABLE edfi.StaffAddressPeriod_Attributes WITH CHECK ADD CONSTRAINT FK_StaffAddressPeriod_Attributes FOREIGN KEY
        (HashKey, BeginDate) REFERENCES edfi.StaffAddressPeriod (HashKey, BeginDate)
        GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StaffCredential WITH CHECK ADD CONSTRAINT FK_StaffCredential_Credential FOREIGN KEY (CredentialHashKey)
    REFERENCES edfi.Credential (HashKey)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StaffElectronicMail WITH CHECK ADD CONSTRAINT FK_StaffElectronicMail_ElectronicMailTypeDescriptor FOREIGN KEY (ElectronicMailTypeDescriptorHashKey)
    REFERENCES edfi.ElectronicMailTypeDescriptor (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.StaffElectronicMail_Attributes WITH CHECK ADD CONSTRAINT FK_StaffElectronicMail_Attributes FOREIGN KEY
        (HashKey, ElectronicMailTypeDescriptorHashKey, ElectronicMailAddress) REFERENCES edfi.StaffElectronicMail (HashKey, ElectronicMailTypeDescriptorHashKey, ElectronicMailAddress)
        GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StaffIdentificationCode WITH CHECK ADD CONSTRAINT FK_StaffIdentificationCode_StaffIdentificationSystemDescriptor FOREIGN KEY (StaffIdentificationSystemDescriptorHashKey)
    REFERENCES edfi.StaffIdentificationSystemDescriptor (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.StaffIdentificationCode_Attributes WITH CHECK ADD CONSTRAINT FK_StaffIdentificationCode_Attributes FOREIGN KEY
        (HashKey, StaffIdentificationSystemDescriptorHashKey) REFERENCES edfi.StaffIdentificationCode (HashKey, StaffIdentificationSystemDescriptorHashKey)
        GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StaffIdentificationDocument WITH CHECK ADD CONSTRAINT FK_StaffIdentificationDocument_IdentificationDocumentUseDescriptor FOREIGN KEY (IdentificationDocumentUseDescriptorHashKey)
    REFERENCES edfi.IdentificationDocumentUseDescriptor (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StaffIdentificationDocument WITH CHECK ADD CONSTRAINT FK_StaffIdentificationDocument_PersonalInformationVerificationDescriptor FOREIGN KEY (PersonalInformationVerificationDescriptorHashKey)
    REFERENCES edfi.PersonalInformationVerificationDescriptor (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.StaffIdentificationDocument_Attributes WITH CHECK ADD CONSTRAINT FK_StaffIdentificationDocument_Attributes FOREIGN KEY
        (HashKey, IdentificationDocumentUseDescriptorHashKey, PersonalInformationVerificationDescriptorHashKey) REFERENCES edfi.StaffIdentificationDocument (HashKey, IdentificationDocumentUseDescriptorHashKey, PersonalInformationVerificationDescriptorHashKey)
        GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StaffInternationalAddress WITH CHECK ADD CONSTRAINT FK_StaffInternationalAddress_AddressTypeDescriptor FOREIGN KEY (AddressTypeDescriptorHashKey)
    REFERENCES edfi.AddressTypeDescriptor (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.StaffInternationalAddress_Attributes WITH CHECK ADD CONSTRAINT FK_StaffInternationalAddress_Attributes FOREIGN KEY
        (HashKey, AddressTypeDescriptorHashKey) REFERENCES edfi.StaffInternationalAddress (HashKey, AddressTypeDescriptorHashKey)
        GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StaffLanguage WITH CHECK ADD CONSTRAINT FK_StaffLanguage_LanguageDescriptor FOREIGN KEY (LanguageDescriptorHashKey)
    REFERENCES edfi.LanguageDescriptor (HashKey)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StaffLanguageUse WITH CHECK ADD CONSTRAINT FK_StaffLanguageUse_LanguageUseDescriptor FOREIGN KEY (LanguageUseDescriptorHashKey)
    REFERENCES edfi.LanguageUseDescriptor (HashKey)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StaffOtherName WITH CHECK ADD CONSTRAINT FK_StaffOtherName_OtherNameTypeDescriptor FOREIGN KEY (OtherNameTypeDescriptorHashKey)
    REFERENCES edfi.OtherNameTypeDescriptor (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.StaffOtherName_Attributes WITH CHECK ADD CONSTRAINT FK_StaffOtherName_Attributes FOREIGN KEY
        (HashKey, OtherNameTypeDescriptorHashKey) REFERENCES edfi.StaffOtherName (HashKey, OtherNameTypeDescriptorHashKey)
        GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StaffPersonalIdentificationDocument WITH CHECK ADD CONSTRAINT FK_StaffPersonalIdentificationDocument_IdentificationDocumentUseDescriptor FOREIGN KEY (IdentificationDocumentUseDescriptorHashKey)
    REFERENCES edfi.IdentificationDocumentUseDescriptor (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StaffPersonalIdentificationDocument WITH CHECK ADD CONSTRAINT FK_StaffPersonalIdentificationDocument_PersonalInformationVerificationDescriptor FOREIGN KEY (PersonalInformationVerificationDescriptorHashKey)
    REFERENCES edfi.PersonalInformationVerificationDescriptor (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.StaffPersonalIdentificationDocument_Attributes WITH CHECK ADD CONSTRAINT FK_StaffPersonalIdentificationDocument_Attributes FOREIGN KEY
        (HashKey, IdentificationDocumentUseDescriptorHashKey, PersonalInformationVerificationDescriptorHashKey) REFERENCES edfi.StaffPersonalIdentificationDocument (HashKey, IdentificationDocumentUseDescriptorHashKey, PersonalInformationVerificationDescriptorHashKey)
        GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StaffRace WITH CHECK ADD CONSTRAINT FK_StaffRace_RaceDescriptor FOREIGN KEY (RaceDescriptorHashKey)
    REFERENCES edfi.RaceDescriptor (HashKey)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StaffRecognition WITH CHECK ADD CONSTRAINT FK_StaffRecognition_RecognitionTypeDescriptor FOREIGN KEY (RecognitionTypeDescriptorHashKey)
    REFERENCES edfi.RecognitionTypeDescriptor (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.StaffRecognition_Attributes WITH CHECK ADD CONSTRAINT FK_StaffRecognition_Attributes FOREIGN KEY
        (HashKey, RecognitionTypeDescriptorHashKey) REFERENCES edfi.StaffRecognition (HashKey, RecognitionTypeDescriptorHashKey)
        GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StaffTelephone WITH CHECK ADD CONSTRAINT FK_StaffTelephone_TelephoneNumberTypeDescriptor FOREIGN KEY (TelephoneNumberTypeDescriptorHashKey)
    REFERENCES edfi.TelephoneNumberTypeDescriptor (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.StaffTelephone_Attributes WITH CHECK ADD CONSTRAINT FK_StaffTelephone_Attributes FOREIGN KEY
        (HashKey, TelephoneNumberTypeDescriptorHashKey, TelephoneNumber) REFERENCES edfi.StaffTelephone (HashKey, TelephoneNumberTypeDescriptorHashKey, TelephoneNumber)
        GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StaffTribalAffiliation WITH CHECK ADD CONSTRAINT FK_StaffTribalAffiliation_TribalAffiliationDescriptor FOREIGN KEY (TribalAffiliationDescriptorHashKey)
    REFERENCES edfi.TribalAffiliationDescriptor (HashKey)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StaffVisa WITH CHECK ADD CONSTRAINT FK_StaffVisa_VisaDescriptor FOREIGN KEY (VisaDescriptorHashKey)
    REFERENCES edfi.VisaDescriptor (HashKey)
    GO


        -- Foreign key from entity identity table
        ALTER TABLE edfi.StaffAbsenceEvent_Attributes WITH CHECK ADD CONSTRAINT FK_StaffAbsenceEvent_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.StaffAbsenceEvent (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StaffAbsenceEvent WITH CHECK ADD CONSTRAINT FK_StaffAbsenceEvent_AbsenceEventCategoryDescriptor FOREIGN KEY (AbsenceEventCategoryDescriptorHashKey)
    REFERENCES edfi.AbsenceEventCategoryDescriptor (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StaffAbsenceEvent WITH CHECK ADD CONSTRAINT FK_StaffAbsenceEvent_Staff FOREIGN KEY (StaffHashKey)
    REFERENCES edfi.Staff (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StaffClassificationDescriptor WITH CHECK ADD CONSTRAINT FK_StaffClassificationDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO
        -- Foreign key from entity identity table
        ALTER TABLE edfi.StaffCohortAssociation_Attributes WITH CHECK ADD CONSTRAINT FK_StaffCohortAssociation_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.StaffCohortAssociation (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StaffCohortAssociation WITH CHECK ADD CONSTRAINT FK_StaffCohortAssociation_Cohort FOREIGN KEY (CohortHashKey)
    REFERENCES edfi.Cohort (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StaffCohortAssociation WITH CHECK ADD CONSTRAINT FK_StaffCohortAssociation_Staff FOREIGN KEY (StaffHashKey)
    REFERENCES edfi.Staff (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StaffDisciplineIncidentAssociation WITH CHECK ADD CONSTRAINT FK_StaffDisciplineIncidentAssociation_DisciplineIncident FOREIGN KEY (DisciplineIncidentHashKey)
    REFERENCES edfi.DisciplineIncident (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StaffDisciplineIncidentAssociation WITH CHECK ADD CONSTRAINT FK_StaffDisciplineIncidentAssociation_Staff FOREIGN KEY (StaffHashKey)
    REFERENCES edfi.Staff (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StaffDisciplineIncidentAssociationDisciplineIncidentParticipationCode WITH CHECK ADD CONSTRAINT FK_StaffDisciplineIncidentAssociationDisciplineIncidentParticipationCode_DisciplineIncidentParticipationCodeDescriptor FOREIGN KEY (DisciplineIncidentParticipationCodeDescriptorHashKey)
    REFERENCES edfi.DisciplineIncidentParticipationCodeDescriptor (HashKey)
    GO


        -- Foreign key from entity identity table
        ALTER TABLE edfi.StaffEducationOrganizationAssignmentAssociation_Attributes WITH CHECK ADD CONSTRAINT FK_StaffEducationOrganizationAssignmentAssociation_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.StaffEducationOrganizationAssignmentAssociation (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StaffEducationOrganizationAssignmentAssociation WITH CHECK ADD CONSTRAINT FK_StaffEducationOrganizationAssignmentAssociation_EducationOrganization FOREIGN KEY (EducationOrganizationHashKey)
    REFERENCES edfi.EducationOrganization (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StaffEducationOrganizationAssignmentAssociation WITH CHECK ADD CONSTRAINT FK_StaffEducationOrganizationAssignmentAssociation_Staff FOREIGN KEY (StaffHashKey)
    REFERENCES edfi.Staff (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StaffEducationOrganizationAssignmentAssociation WITH CHECK ADD CONSTRAINT FK_StaffEducationOrganizationAssignmentAssociation_StaffClassificationDescriptor FOREIGN KEY (StaffClassificationDescriptorHashKey)
    REFERENCES edfi.StaffClassificationDescriptor (HashKey)
    GO
        -- Foreign key from entity identity table
        ALTER TABLE edfi.StaffEducationOrganizationContactAssociation_Attributes WITH CHECK ADD CONSTRAINT FK_StaffEducationOrganizationContactAssociation_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.StaffEducationOrganizationContactAssociation (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StaffEducationOrganizationContactAssociation WITH CHECK ADD CONSTRAINT FK_StaffEducationOrganizationContactAssociation_EducationOrganization FOREIGN KEY (EducationOrganizationHashKey)
    REFERENCES edfi.EducationOrganization (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StaffEducationOrganizationContactAssociation WITH CHECK ADD CONSTRAINT FK_StaffEducationOrganizationContactAssociation_Staff FOREIGN KEY (StaffHashKey)
    REFERENCES edfi.Staff (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.StaffEducationOrganizationContactAssociationAddress_Attributes WITH CHECK ADD CONSTRAINT FK_StaffEducationOrganizationContactAssociationAddress_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.StaffEducationOrganizationContactAssociationAddress (HashKey)
        GO


        -- Foreign key from entity identity table
        ALTER TABLE edfi.StaffEducationOrganizationContactAssociationAddressPeriod_Attributes WITH CHECK ADD CONSTRAINT FK_StaffEducationOrganizationContactAssociationAddressPeriod_Attributes FOREIGN KEY
        (HashKey, BeginDate) REFERENCES edfi.StaffEducationOrganizationContactAssociationAddressPeriod (HashKey, BeginDate)
        GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StaffEducationOrganizationContactAssociationTelephone WITH CHECK ADD CONSTRAINT FK_StaffEducationOrganizationContactAssociationTelephone_TelephoneNumberTypeDescriptor FOREIGN KEY (TelephoneNumberTypeDescriptorHashKey)
    REFERENCES edfi.TelephoneNumberTypeDescriptor (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.StaffEducationOrganizationContactAssociationTelephone_Attributes WITH CHECK ADD CONSTRAINT FK_StaffEducationOrganizationContactAssociationTelephone_Attributes FOREIGN KEY
        (HashKey, TelephoneNumberTypeDescriptorHashKey, TelephoneNumber) REFERENCES edfi.StaffEducationOrganizationContactAssociationTelephone (HashKey, TelephoneNumberTypeDescriptorHashKey, TelephoneNumber)
        GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.StaffEducationOrganizationEmploymentAssociation_Attributes WITH CHECK ADD CONSTRAINT FK_StaffEducationOrganizationEmploymentAssociation_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.StaffEducationOrganizationEmploymentAssociation (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StaffEducationOrganizationEmploymentAssociation WITH CHECK ADD CONSTRAINT FK_StaffEducationOrganizationEmploymentAssociation_EducationOrganization FOREIGN KEY (EducationOrganizationHashKey)
    REFERENCES edfi.EducationOrganization (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StaffEducationOrganizationEmploymentAssociation WITH CHECK ADD CONSTRAINT FK_StaffEducationOrganizationEmploymentAssociation_EmploymentStatusDescriptor FOREIGN KEY (EmploymentStatusDescriptorHashKey)
    REFERENCES edfi.EmploymentStatusDescriptor (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StaffEducationOrganizationEmploymentAssociation WITH CHECK ADD CONSTRAINT FK_StaffEducationOrganizationEmploymentAssociation_Staff FOREIGN KEY (StaffHashKey)
    REFERENCES edfi.Staff (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StaffIdentificationSystemDescriptor WITH CHECK ADD CONSTRAINT FK_StaffIdentificationSystemDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO
        -- Foreign key from entity identity table
        ALTER TABLE edfi.StaffLeave_Attributes WITH CHECK ADD CONSTRAINT FK_StaffLeave_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.StaffLeave (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StaffLeave WITH CHECK ADD CONSTRAINT FK_StaffLeave_Staff FOREIGN KEY (StaffHashKey)
    REFERENCES edfi.Staff (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StaffLeave WITH CHECK ADD CONSTRAINT FK_StaffLeave_StaffLeaveEventCategoryDescriptor FOREIGN KEY (StaffLeaveEventCategoryDescriptorHashKey)
    REFERENCES edfi.StaffLeaveEventCategoryDescriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StaffLeaveEventCategoryDescriptor WITH CHECK ADD CONSTRAINT FK_StaffLeaveEventCategoryDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO
        -- Foreign key from entity identity table
        ALTER TABLE edfi.StaffProgramAssociation_Attributes WITH CHECK ADD CONSTRAINT FK_StaffProgramAssociation_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.StaffProgramAssociation (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StaffProgramAssociation WITH CHECK ADD CONSTRAINT FK_StaffProgramAssociation_Program FOREIGN KEY (ProgramHashKey)
    REFERENCES edfi.Program (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StaffProgramAssociation WITH CHECK ADD CONSTRAINT FK_StaffProgramAssociation_Staff FOREIGN KEY (StaffHashKey)
    REFERENCES edfi.Staff (HashKey)
    GO
        -- Foreign key from entity identity table
        ALTER TABLE edfi.StaffSchoolAssociation_Attributes WITH CHECK ADD CONSTRAINT FK_StaffSchoolAssociation_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.StaffSchoolAssociation (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StaffSchoolAssociation WITH CHECK ADD CONSTRAINT FK_StaffSchoolAssociation_ProgramAssignmentDescriptor FOREIGN KEY (ProgramAssignmentDescriptorHashKey)
    REFERENCES edfi.ProgramAssignmentDescriptor (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StaffSchoolAssociation WITH CHECK ADD CONSTRAINT FK_StaffSchoolAssociation_School FOREIGN KEY (SchoolHashKey)
    REFERENCES edfi.School (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StaffSchoolAssociation WITH CHECK ADD CONSTRAINT FK_StaffSchoolAssociation_Staff FOREIGN KEY (StaffHashKey)
    REFERENCES edfi.Staff (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StaffSchoolAssociationAcademicSubject WITH CHECK ADD CONSTRAINT FK_StaffSchoolAssociationAcademicSubject_AcademicSubjectDescriptor FOREIGN KEY (AcademicSubjectDescriptorHashKey)
    REFERENCES edfi.AcademicSubjectDescriptor (HashKey)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StaffSchoolAssociationGradeLevel WITH CHECK ADD CONSTRAINT FK_StaffSchoolAssociationGradeLevel_GradeLevelDescriptor FOREIGN KEY (GradeLevelDescriptorHashKey)
    REFERENCES edfi.GradeLevelDescriptor (HashKey)
    GO


        -- Foreign key from entity identity table
        ALTER TABLE edfi.StaffSectionAssociation_Attributes WITH CHECK ADD CONSTRAINT FK_StaffSectionAssociation_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.StaffSectionAssociation (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StaffSectionAssociation WITH CHECK ADD CONSTRAINT FK_StaffSectionAssociation_Section FOREIGN KEY (SectionHashKey)
    REFERENCES edfi.Section (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StaffSectionAssociation WITH CHECK ADD CONSTRAINT FK_StaffSectionAssociation_Staff FOREIGN KEY (StaffHashKey)
    REFERENCES edfi.Staff (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StateAbbreviationDescriptor WITH CHECK ADD CONSTRAINT FK_StateAbbreviationDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StateEducationAgency WITH CHECK ADD CONSTRAINT FK_StateEducationAgency_EducationOrganization FOREIGN KEY (EducationOrganizationHashKey)
    REFERENCES edfi.EducationOrganization (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StateEducationAgencyAccountability WITH CHECK ADD CONSTRAINT FK_StateEducationAgencyAccountability_SchoolYearType FOREIGN KEY (SchoolYearTypeHashKey)
    REFERENCES edfi.SchoolYearType (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.StateEducationAgencyAccountability_Attributes WITH CHECK ADD CONSTRAINT FK_StateEducationAgencyAccountability_Attributes FOREIGN KEY
        (HashKey, SchoolYearTypeHashKey) REFERENCES edfi.StateEducationAgencyAccountability (HashKey, SchoolYearTypeHashKey)
        GO


        -- Foreign key from entity identity table
        ALTER TABLE edfi.StateEducationAgencyFederalFunds_Attributes WITH CHECK ADD CONSTRAINT FK_StateEducationAgencyFederalFunds_Attributes FOREIGN KEY
        (HashKey, FiscalYear) REFERENCES edfi.StateEducationAgencyFederalFunds (HashKey, FiscalYear)
        GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.Student_Attributes WITH CHECK ADD CONSTRAINT FK_Student_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.Student (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentIdentificationDocument WITH CHECK ADD CONSTRAINT FK_StudentIdentificationDocument_IdentificationDocumentUseDescriptor FOREIGN KEY (IdentificationDocumentUseDescriptorHashKey)
    REFERENCES edfi.IdentificationDocumentUseDescriptor (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentIdentificationDocument WITH CHECK ADD CONSTRAINT FK_StudentIdentificationDocument_PersonalInformationVerificationDescriptor FOREIGN KEY (PersonalInformationVerificationDescriptorHashKey)
    REFERENCES edfi.PersonalInformationVerificationDescriptor (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.StudentIdentificationDocument_Attributes WITH CHECK ADD CONSTRAINT FK_StudentIdentificationDocument_Attributes FOREIGN KEY
        (HashKey, IdentificationDocumentUseDescriptorHashKey, PersonalInformationVerificationDescriptorHashKey) REFERENCES edfi.StudentIdentificationDocument (HashKey, IdentificationDocumentUseDescriptorHashKey, PersonalInformationVerificationDescriptorHashKey)
        GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentOtherName WITH CHECK ADD CONSTRAINT FK_StudentOtherName_OtherNameTypeDescriptor FOREIGN KEY (OtherNameTypeDescriptorHashKey)
    REFERENCES edfi.OtherNameTypeDescriptor (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.StudentOtherName_Attributes WITH CHECK ADD CONSTRAINT FK_StudentOtherName_Attributes FOREIGN KEY
        (HashKey, OtherNameTypeDescriptorHashKey) REFERENCES edfi.StudentOtherName (HashKey, OtherNameTypeDescriptorHashKey)
        GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentPersonalIdentificationDocument WITH CHECK ADD CONSTRAINT FK_StudentPersonalIdentificationDocument_IdentificationDocumentUseDescriptor FOREIGN KEY (IdentificationDocumentUseDescriptorHashKey)
    REFERENCES edfi.IdentificationDocumentUseDescriptor (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentPersonalIdentificationDocument WITH CHECK ADD CONSTRAINT FK_StudentPersonalIdentificationDocument_PersonalInformationVerificationDescriptor FOREIGN KEY (PersonalInformationVerificationDescriptorHashKey)
    REFERENCES edfi.PersonalInformationVerificationDescriptor (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.StudentPersonalIdentificationDocument_Attributes WITH CHECK ADD CONSTRAINT FK_StudentPersonalIdentificationDocument_Attributes FOREIGN KEY
        (HashKey, IdentificationDocumentUseDescriptorHashKey, PersonalInformationVerificationDescriptorHashKey) REFERENCES edfi.StudentPersonalIdentificationDocument (HashKey, IdentificationDocumentUseDescriptorHashKey, PersonalInformationVerificationDescriptorHashKey)
        GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentVisa WITH CHECK ADD CONSTRAINT FK_StudentVisa_VisaDescriptor FOREIGN KEY (VisaDescriptorHashKey)
    REFERENCES edfi.VisaDescriptor (HashKey)
    GO


        -- Foreign key from entity identity table
        ALTER TABLE edfi.StudentAcademicRecord_Attributes WITH CHECK ADD CONSTRAINT FK_StudentAcademicRecord_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.StudentAcademicRecord (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentAcademicRecord WITH CHECK ADD CONSTRAINT FK_StudentAcademicRecord_EducationOrganization FOREIGN KEY (EducationOrganizationHashKey)
    REFERENCES edfi.EducationOrganization (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentAcademicRecord WITH CHECK ADD CONSTRAINT FK_StudentAcademicRecord_SchoolYearType FOREIGN KEY (SchoolYearTypeHashKey)
    REFERENCES edfi.SchoolYearType (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentAcademicRecord WITH CHECK ADD CONSTRAINT FK_StudentAcademicRecord_Student FOREIGN KEY (StudentHashKey)
    REFERENCES edfi.Student (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentAcademicRecord WITH CHECK ADD CONSTRAINT FK_StudentAcademicRecord_TermDescriptor FOREIGN KEY (TermDescriptorHashKey)
    REFERENCES edfi.TermDescriptor (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentAcademicRecordAcademicHonor WITH CHECK ADD CONSTRAINT FK_StudentAcademicRecordAcademicHonor_AcademicHonorCategoryDescriptor FOREIGN KEY (AcademicHonorCategoryDescriptorHashKey)
    REFERENCES edfi.AcademicHonorCategoryDescriptor (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.StudentAcademicRecordAcademicHonor_Attributes WITH CHECK ADD CONSTRAINT FK_StudentAcademicRecordAcademicHonor_Attributes FOREIGN KEY
        (HashKey, AcademicHonorCategoryDescriptorHashKey, HonorDescription) REFERENCES edfi.StudentAcademicRecordAcademicHonor (HashKey, AcademicHonorCategoryDescriptorHashKey, HonorDescription)
        GO


        -- Foreign key from entity identity table
        ALTER TABLE edfi.StudentAcademicRecordClassRanking_Attributes WITH CHECK ADD CONSTRAINT FK_StudentAcademicRecordClassRanking_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.StudentAcademicRecordClassRanking (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentAcademicRecordDiploma WITH CHECK ADD CONSTRAINT FK_StudentAcademicRecordDiploma_DiplomaTypeDescriptor FOREIGN KEY (DiplomaTypeDescriptorHashKey)
    REFERENCES edfi.DiplomaTypeDescriptor (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.StudentAcademicRecordDiploma_Attributes WITH CHECK ADD CONSTRAINT FK_StudentAcademicRecordDiploma_Attributes FOREIGN KEY
        (HashKey, DiplomaTypeDescriptorHashKey, DiplomaAwardDate) REFERENCES edfi.StudentAcademicRecordDiploma (HashKey, DiplomaTypeDescriptorHashKey, DiplomaAwardDate)
        GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentAcademicRecordGradePointAverage WITH CHECK ADD CONSTRAINT FK_StudentAcademicRecordGradePointAverage_GradePointAverageTypeDescriptor FOREIGN KEY (GradePointAverageTypeDescriptorHashKey)
    REFERENCES edfi.GradePointAverageTypeDescriptor (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.StudentAcademicRecordGradePointAverage_Attributes WITH CHECK ADD CONSTRAINT FK_StudentAcademicRecordGradePointAverage_Attributes FOREIGN KEY
        (HashKey, GradePointAverageTypeDescriptorHashKey) REFERENCES edfi.StudentAcademicRecordGradePointAverage (HashKey, GradePointAverageTypeDescriptorHashKey)
        GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentAcademicRecordRecognition WITH CHECK ADD CONSTRAINT FK_StudentAcademicRecordRecognition_RecognitionTypeDescriptor FOREIGN KEY (RecognitionTypeDescriptorHashKey)
    REFERENCES edfi.RecognitionTypeDescriptor (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.StudentAcademicRecordRecognition_Attributes WITH CHECK ADD CONSTRAINT FK_StudentAcademicRecordRecognition_Attributes FOREIGN KEY
        (HashKey, RecognitionTypeDescriptorHashKey) REFERENCES edfi.StudentAcademicRecordRecognition (HashKey, RecognitionTypeDescriptorHashKey)
        GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentAcademicRecordReportCard WITH CHECK ADD CONSTRAINT FK_StudentAcademicRecordReportCard_ReportCard FOREIGN KEY (ReportCardHashKey)
    REFERENCES edfi.ReportCard (HashKey)
    GO


        -- Foreign key from entity identity table
        ALTER TABLE edfi.StudentAssessment_Attributes WITH CHECK ADD CONSTRAINT FK_StudentAssessment_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.StudentAssessment (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentAssessment WITH CHECK ADD CONSTRAINT FK_StudentAssessment_Assessment FOREIGN KEY (AssessmentHashKey)
    REFERENCES edfi.Assessment (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentAssessment WITH CHECK ADD CONSTRAINT FK_StudentAssessment_Student FOREIGN KEY (StudentHashKey)
    REFERENCES edfi.Student (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentAssessmentAccommodation WITH CHECK ADD CONSTRAINT FK_StudentAssessmentAccommodation_AccommodationDescriptor FOREIGN KEY (AccommodationDescriptorHashKey)
    REFERENCES edfi.AccommodationDescriptor (HashKey)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentAssessmentItem WITH CHECK ADD CONSTRAINT FK_StudentAssessmentItem_AssessmentItem FOREIGN KEY (AssessmentItemHashKey)
    REFERENCES edfi.AssessmentItem (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.StudentAssessmentItem_Attributes WITH CHECK ADD CONSTRAINT FK_StudentAssessmentItem_Attributes FOREIGN KEY
        (HashKey, AssessmentItemHashKey) REFERENCES edfi.StudentAssessmentItem (HashKey, AssessmentItemHashKey)
        GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentAssessmentPerformanceLevel WITH CHECK ADD CONSTRAINT FK_StudentAssessmentPerformanceLevel_AssessmentReportingMethodDescriptor FOREIGN KEY (AssessmentReportingMethodDescriptorHashKey)
    REFERENCES edfi.AssessmentReportingMethodDescriptor (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentAssessmentPerformanceLevel WITH CHECK ADD CONSTRAINT FK_StudentAssessmentPerformanceLevel_PerformanceLevelDescriptor FOREIGN KEY (PerformanceLevelDescriptorHashKey)
    REFERENCES edfi.PerformanceLevelDescriptor (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.StudentAssessmentPerformanceLevel_Attributes WITH CHECK ADD CONSTRAINT FK_StudentAssessmentPerformanceLevel_Attributes FOREIGN KEY
        (HashKey, AssessmentReportingMethodDescriptorHashKey, PerformanceLevelDescriptorHashKey) REFERENCES edfi.StudentAssessmentPerformanceLevel (HashKey, AssessmentReportingMethodDescriptorHashKey, PerformanceLevelDescriptorHashKey)
        GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentAssessmentScoreResult WITH CHECK ADD CONSTRAINT FK_StudentAssessmentScoreResult_AssessmentReportingMethodDescriptor FOREIGN KEY (AssessmentReportingMethodDescriptorHashKey)
    REFERENCES edfi.AssessmentReportingMethodDescriptor (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.StudentAssessmentScoreResult_Attributes WITH CHECK ADD CONSTRAINT FK_StudentAssessmentScoreResult_Attributes FOREIGN KEY
        (HashKey, AssessmentReportingMethodDescriptorHashKey) REFERENCES edfi.StudentAssessmentScoreResult (HashKey, AssessmentReportingMethodDescriptorHashKey)
        GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentAssessmentStudentObjectiveAssessment WITH CHECK ADD CONSTRAINT FK_StudentAssessmentStudentObjectiveAssessment_ObjectiveAssessment FOREIGN KEY (ObjectiveAssessmentHashKey)
    REFERENCES edfi.ObjectiveAssessment (HashKey)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentAssessmentStudentObjectiveAssessmentPerformanceLevel WITH CHECK ADD CONSTRAINT FK_StudentAssessmentStudentObjectiveAssessmentPerformanceLevel_AssessmentReportingMethodDescriptor FOREIGN KEY (AssessmentReportingMethodDescriptorHashKey)
    REFERENCES edfi.AssessmentReportingMethodDescriptor (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentAssessmentStudentObjectiveAssessmentPerformanceLevel WITH CHECK ADD CONSTRAINT FK_StudentAssessmentStudentObjectiveAssessmentPerformanceLevel_PerformanceLevelDescriptor FOREIGN KEY (PerformanceLevelDescriptorHashKey)
    REFERENCES edfi.PerformanceLevelDescriptor (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.StudentAssessmentStudentObjectiveAssessmentPerformanceLevel_Attributes WITH CHECK ADD CONSTRAINT FK_StudentAssessmentStudentObjectiveAssessmentPerformanceLevel_Attributes FOREIGN KEY
        (HashKey, AssessmentReportingMethodDescriptorHashKey, PerformanceLevelDescriptorHashKey) REFERENCES edfi.StudentAssessmentStudentObjectiveAssessmentPerformanceLevel (HashKey, AssessmentReportingMethodDescriptorHashKey, PerformanceLevelDescriptorHashKey)
        GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentAssessmentStudentObjectiveAssessmentScoreResult WITH CHECK ADD CONSTRAINT FK_StudentAssessmentStudentObjectiveAssessmentScoreResult_AssessmentReportingMethodDescriptor FOREIGN KEY (AssessmentReportingMethodDescriptorHashKey)
    REFERENCES edfi.AssessmentReportingMethodDescriptor (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.StudentAssessmentStudentObjectiveAssessmentScoreResult_Attributes WITH CHECK ADD CONSTRAINT FK_StudentAssessmentStudentObjectiveAssessmentScoreResult_Attributes FOREIGN KEY
        (HashKey, AssessmentReportingMethodDescriptorHashKey) REFERENCES edfi.StudentAssessmentStudentObjectiveAssessmentScoreResult (HashKey, AssessmentReportingMethodDescriptorHashKey)
        GO


    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentCharacteristicDescriptor WITH CHECK ADD CONSTRAINT FK_StudentCharacteristicDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO
        -- Foreign key from entity identity table
        ALTER TABLE edfi.StudentCohortAssociation_Attributes WITH CHECK ADD CONSTRAINT FK_StudentCohortAssociation_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.StudentCohortAssociation (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentCohortAssociation WITH CHECK ADD CONSTRAINT FK_StudentCohortAssociation_Cohort FOREIGN KEY (CohortHashKey)
    REFERENCES edfi.Cohort (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentCohortAssociation WITH CHECK ADD CONSTRAINT FK_StudentCohortAssociation_Student FOREIGN KEY (StudentHashKey)
    REFERENCES edfi.Student (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentCohortAssociationSection WITH CHECK ADD CONSTRAINT FK_StudentCohortAssociationSection_Section FOREIGN KEY (SectionHashKey)
    REFERENCES edfi.Section (HashKey)
    GO


        -- Foreign key from entity identity table
        ALTER TABLE edfi.StudentCompetencyObjective_Attributes WITH CHECK ADD CONSTRAINT FK_StudentCompetencyObjective_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.StudentCompetencyObjective (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentCompetencyObjective WITH CHECK ADD CONSTRAINT FK_ObjectiveStudentCompetencyObjective_CompetencyObjective FOREIGN KEY (ObjectiveCompetencyObjectiveHashKey)
    REFERENCES edfi.CompetencyObjective (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentCompetencyObjective WITH CHECK ADD CONSTRAINT FK_GradingStudentCompetencyObjective_GradingPeriod FOREIGN KEY (GradingPeriodHashKey)
    REFERENCES edfi.GradingPeriod (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentCompetencyObjective WITH CHECK ADD CONSTRAINT FK_StudentCompetencyObjective_Student FOREIGN KEY (StudentHashKey)
    REFERENCES edfi.Student (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentCompetencyObjectiveGeneralStudentProgramAssociation WITH CHECK ADD CONSTRAINT FK_StudentCompetencyObjectiveGeneralStudentProgramAssociation_GeneralStudentProgramAssociation FOREIGN KEY (GeneralStudentProgramAssociationHashKey)
    REFERENCES edfi.GeneralStudentProgramAssociation (HashKey)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentCompetencyObjectiveStudentSectionAssociation WITH CHECK ADD CONSTRAINT FK_StudentCompetencyObjectiveStudentSectionAssociation_StudentSectionAssociation FOREIGN KEY (StudentSectionAssociationHashKey)
    REFERENCES edfi.StudentSectionAssociation (HashKey)
    GO


        -- Foreign key from entity identity table
        ALTER TABLE edfi.StudentCTEProgramAssociation_Attributes WITH CHECK ADD CONSTRAINT FK_StudentCTEProgramAssociation_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.StudentCTEProgramAssociation (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentCTEProgramAssociation WITH CHECK ADD CONSTRAINT FK_StudentCTEProgramAssociation_GeneralStudentProgramAssociation FOREIGN KEY (GeneralStudentProgramAssociationHashKey)
    REFERENCES edfi.GeneralStudentProgramAssociation (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentCTEProgramAssociationCTEProgram WITH CHECK ADD CONSTRAINT FK_StudentCTEProgramAssociationCTEProgram_CareerPathwayDescriptor FOREIGN KEY (CareerPathwayDescriptorHashKey)
    REFERENCES edfi.CareerPathwayDescriptor (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.StudentCTEProgramAssociationCTEProgram_Attributes WITH CHECK ADD CONSTRAINT FK_StudentCTEProgramAssociationCTEProgram_Attributes FOREIGN KEY
        (HashKey, CareerPathwayDescriptorHashKey) REFERENCES edfi.StudentCTEProgramAssociationCTEProgram (HashKey, CareerPathwayDescriptorHashKey)
        GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentCTEProgramAssociationCTEProgramService WITH CHECK ADD CONSTRAINT FK_StudentCTEProgramAssociationCTEProgramService_CTEProgramServiceDescriptor FOREIGN KEY (CTEProgramServiceDescriptorHashKey)
    REFERENCES edfi.CTEProgramServiceDescriptor (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.StudentCTEProgramAssociationCTEProgramService_Attributes WITH CHECK ADD CONSTRAINT FK_StudentCTEProgramAssociationCTEProgramService_Attributes FOREIGN KEY
        (HashKey, CTEProgramServiceDescriptorHashKey) REFERENCES edfi.StudentCTEProgramAssociationCTEProgramService (HashKey, CTEProgramServiceDescriptorHashKey)
        GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentCTEProgramAssociationService WITH CHECK ADD CONSTRAINT FK_StudentCTEProgramAssociationService_ServiceDescriptor FOREIGN KEY (ServiceDescriptorHashKey)
    REFERENCES edfi.ServiceDescriptor (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.StudentCTEProgramAssociationService_Attributes WITH CHECK ADD CONSTRAINT FK_StudentCTEProgramAssociationService_Attributes FOREIGN KEY
        (HashKey, ServiceDescriptorHashKey) REFERENCES edfi.StudentCTEProgramAssociationService (HashKey, ServiceDescriptorHashKey)
        GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.StudentDisciplineIncidentAssociation_Attributes WITH CHECK ADD CONSTRAINT FK_StudentDisciplineIncidentAssociation_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.StudentDisciplineIncidentAssociation (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentDisciplineIncidentAssociation WITH CHECK ADD CONSTRAINT FK_StudentDisciplineIncidentAssociation_DisciplineIncident FOREIGN KEY (DisciplineIncidentHashKey)
    REFERENCES edfi.DisciplineIncident (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentDisciplineIncidentAssociation WITH CHECK ADD CONSTRAINT FK_StudentDisciplineIncidentAssociation_Student FOREIGN KEY (StudentHashKey)
    REFERENCES edfi.Student (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentDisciplineIncidentAssociationBehavior WITH CHECK ADD CONSTRAINT FK_StudentDisciplineIncidentAssociationBehavior_BehaviorDescriptor FOREIGN KEY (BehaviorDescriptorHashKey)
    REFERENCES edfi.BehaviorDescriptor (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.StudentDisciplineIncidentAssociationBehavior_Attributes WITH CHECK ADD CONSTRAINT FK_StudentDisciplineIncidentAssociationBehavior_Attributes FOREIGN KEY
        (HashKey, BehaviorDescriptorHashKey) REFERENCES edfi.StudentDisciplineIncidentAssociationBehavior (HashKey, BehaviorDescriptorHashKey)
        GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.StudentEducationOrganizationAssociation_Attributes WITH CHECK ADD CONSTRAINT FK_StudentEducationOrganizationAssociation_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.StudentEducationOrganizationAssociation (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentEducationOrganizationAssociation WITH CHECK ADD CONSTRAINT FK_StudentEducationOrganizationAssociation_EducationOrganization FOREIGN KEY (EducationOrganizationHashKey)
    REFERENCES edfi.EducationOrganization (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentEducationOrganizationAssociation WITH CHECK ADD CONSTRAINT FK_StudentEducationOrganizationAssociation_Student FOREIGN KEY (StudentHashKey)
    REFERENCES edfi.Student (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentEducationOrganizationAssociationAddress WITH CHECK ADD CONSTRAINT FK_StudentEducationOrganizationAssociationAddress_AddressTypeDescriptor FOREIGN KEY (AddressTypeDescriptorHashKey)
    REFERENCES edfi.AddressTypeDescriptor (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentEducationOrganizationAssociationAddress WITH CHECK ADD CONSTRAINT FK_StudentEducationOrganizationAssociationAddress_StateAbbreviationDescriptor FOREIGN KEY (StateAbbreviationDescriptorHashKey)
    REFERENCES edfi.StateAbbreviationDescriptor (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.StudentEducationOrganizationAssociationAddress_Attributes WITH CHECK ADD CONSTRAINT FK_StudentEducationOrganizationAssociationAddress_Attributes FOREIGN KEY
        (HashKey, AddressTypeDescriptorHashKey, StateAbbreviationDescriptorHashKey, City, PostalCode, StreetNumberName) REFERENCES edfi.StudentEducationOrganizationAssociationAddress (HashKey, AddressTypeDescriptorHashKey, StateAbbreviationDescriptorHashKey, City, PostalCode, StreetNumberName)
        GO


        -- Foreign key from entity identity table
        ALTER TABLE edfi.StudentEducationOrganizationAssociationAddressPeriod_Attributes WITH CHECK ADD CONSTRAINT FK_StudentEducationOrganizationAssociationAddressPeriod_Attributes FOREIGN KEY
        (HashKey, BeginDate) REFERENCES edfi.StudentEducationOrganizationAssociationAddressPeriod (HashKey, BeginDate)
        GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentEducationOrganizationAssociationCohortYear WITH CHECK ADD CONSTRAINT FK_StudentEducationOrganizationAssociationCohortYear_CohortYearTypeDescriptor FOREIGN KEY (CohortYearTypeDescriptorHashKey)
    REFERENCES edfi.CohortYearTypeDescriptor (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentEducationOrganizationAssociationCohortYear WITH CHECK ADD CONSTRAINT FK_StudentEducationOrganizationAssociationCohortYear_SchoolYearType FOREIGN KEY (SchoolYearTypeHashKey)
    REFERENCES edfi.SchoolYearType (HashKey)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentEducationOrganizationAssociationDisability WITH CHECK ADD CONSTRAINT FK_StudentEducationOrganizationAssociationDisability_DisabilityDescriptor FOREIGN KEY (DisabilityDescriptorHashKey)
    REFERENCES edfi.DisabilityDescriptor (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.StudentEducationOrganizationAssociationDisability_Attributes WITH CHECK ADD CONSTRAINT FK_StudentEducationOrganizationAssociationDisability_Attributes FOREIGN KEY
        (HashKey, DisabilityDescriptorHashKey) REFERENCES edfi.StudentEducationOrganizationAssociationDisability (HashKey, DisabilityDescriptorHashKey)
        GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentEducationOrganizationAssociationDisabilityDesignation WITH CHECK ADD CONSTRAINT FK_StudentEducationOrganizationAssociationDisabilityDesignation_DisabilityDesignationDescriptor FOREIGN KEY (DisabilityDesignationDescriptorHashKey)
    REFERENCES edfi.DisabilityDesignationDescriptor (HashKey)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentEducationOrganizationAssociationElectronicMail WITH CHECK ADD CONSTRAINT FK_StudentEducationOrganizationAssociationElectronicMail_ElectronicMailTypeDescriptor FOREIGN KEY (ElectronicMailTypeDescriptorHashKey)
    REFERENCES edfi.ElectronicMailTypeDescriptor (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.StudentEducationOrganizationAssociationElectronicMail_Attributes WITH CHECK ADD CONSTRAINT FK_StudentEducationOrganizationAssociationElectronicMail_Attributes FOREIGN KEY
        (HashKey, ElectronicMailTypeDescriptorHashKey, ElectronicMailAddress) REFERENCES edfi.StudentEducationOrganizationAssociationElectronicMail (HashKey, ElectronicMailTypeDescriptorHashKey, ElectronicMailAddress)
        GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentEducationOrganizationAssociationInternationalAddress WITH CHECK ADD CONSTRAINT FK_StudentEducationOrganizationAssociationInternationalAddress_AddressTypeDescriptor FOREIGN KEY (AddressTypeDescriptorHashKey)
    REFERENCES edfi.AddressTypeDescriptor (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.StudentEducationOrganizationAssociationInternationalAddress_Attributes WITH CHECK ADD CONSTRAINT FK_StudentEducationOrganizationAssociationInternationalAddress_Attributes FOREIGN KEY
        (HashKey, AddressTypeDescriptorHashKey) REFERENCES edfi.StudentEducationOrganizationAssociationInternationalAddress (HashKey, AddressTypeDescriptorHashKey)
        GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentEducationOrganizationAssociationLanguage WITH CHECK ADD CONSTRAINT FK_StudentEducationOrganizationAssociationLanguage_LanguageDescriptor FOREIGN KEY (LanguageDescriptorHashKey)
    REFERENCES edfi.LanguageDescriptor (HashKey)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentEducationOrganizationAssociationLanguageUse WITH CHECK ADD CONSTRAINT FK_StudentEducationOrganizationAssociationLanguageUse_LanguageUseDescriptor FOREIGN KEY (LanguageUseDescriptorHashKey)
    REFERENCES edfi.LanguageUseDescriptor (HashKey)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentEducationOrganizationAssociationProgramParticipation WITH CHECK ADD CONSTRAINT FK_StudentEducationOrganizationAssociationProgramParticipation_ProgramTypeDescriptor FOREIGN KEY (ProgramTypeDescriptorHashKey)
    REFERENCES edfi.ProgramTypeDescriptor (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.StudentEducationOrganizationAssociationProgramParticipation_Attributes WITH CHECK ADD CONSTRAINT FK_StudentEducationOrganizationAssociationProgramParticipation_Attributes FOREIGN KEY
        (HashKey, ProgramTypeDescriptorHashKey) REFERENCES edfi.StudentEducationOrganizationAssociationProgramParticipation (HashKey, ProgramTypeDescriptorHashKey)
        GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentEducationOrganizationAssociationProgramParticipationProgramCharacteristic WITH CHECK ADD CONSTRAINT FK_StudentEducationOrganizationAssociationProgramParticipationProgramCharacteristic_ProgramCharacteristicDescriptor FOREIGN KEY (ProgramCharacteristicDescriptorHashKey)
    REFERENCES edfi.ProgramCharacteristicDescriptor (HashKey)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentEducationOrganizationAssociationRace WITH CHECK ADD CONSTRAINT FK_StudentEducationOrganizationAssociationRace_RaceDescriptor FOREIGN KEY (RaceDescriptorHashKey)
    REFERENCES edfi.RaceDescriptor (HashKey)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentEducationOrganizationAssociationStudentCharacteristic WITH CHECK ADD CONSTRAINT FK_StudentEducationOrganizationAssociationStudentCharacteristic_StudentCharacteristicDescriptor FOREIGN KEY (StudentCharacteristicDescriptorHashKey)
    REFERENCES edfi.StudentCharacteristicDescriptor (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.StudentEducationOrganizationAssociationStudentCharacteristic_Attributes WITH CHECK ADD CONSTRAINT FK_StudentEducationOrganizationAssociationStudentCharacteristic_Attributes FOREIGN KEY
        (HashKey, StudentCharacteristicDescriptorHashKey) REFERENCES edfi.StudentEducationOrganizationAssociationStudentCharacteristic (HashKey, StudentCharacteristicDescriptorHashKey)
        GO


        -- Foreign key from entity identity table
        ALTER TABLE edfi.StudentEducationOrganizationAssociationStudentCharacteristicPeriod_Attributes WITH CHECK ADD CONSTRAINT FK_StudentEducationOrganizationAssociationStudentCharacteristicPeriod_Attributes FOREIGN KEY
        (HashKey, BeginDate) REFERENCES edfi.StudentEducationOrganizationAssociationStudentCharacteristicPeriod (HashKey, BeginDate)
        GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentEducationOrganizationAssociationStudentIdentificationCode WITH CHECK ADD CONSTRAINT FK_StudentEducationOrganizationAssociationStudentIdentificationCode_StudentIdentificationSystemDescriptor FOREIGN KEY (StudentIdentificationSystemDescriptorHashKey)
    REFERENCES edfi.StudentIdentificationSystemDescriptor (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.StudentEducationOrganizationAssociationStudentIdentificationCode_Attributes WITH CHECK ADD CONSTRAINT FK_StudentEducationOrganizationAssociationStudentIdentificationCode_Attributes FOREIGN KEY
        (HashKey, StudentIdentificationSystemDescriptorHashKey, AssigningOrganizationIdentificationCode) REFERENCES edfi.StudentEducationOrganizationAssociationStudentIdentificationCode (HashKey, StudentIdentificationSystemDescriptorHashKey, AssigningOrganizationIdentificationCode)
        GO


        -- Foreign key from entity identity table
        ALTER TABLE edfi.StudentEducationOrganizationAssociationStudentIndicator_Attributes WITH CHECK ADD CONSTRAINT FK_StudentEducationOrganizationAssociationStudentIndicator_Attributes FOREIGN KEY
        (HashKey, IndicatorName) REFERENCES edfi.StudentEducationOrganizationAssociationStudentIndicator (HashKey, IndicatorName)
        GO


        -- Foreign key from entity identity table
        ALTER TABLE edfi.StudentEducationOrganizationAssociationStudentIndicatorPeriod_Attributes WITH CHECK ADD CONSTRAINT FK_StudentEducationOrganizationAssociationStudentIndicatorPeriod_Attributes FOREIGN KEY
        (HashKey, BeginDate) REFERENCES edfi.StudentEducationOrganizationAssociationStudentIndicatorPeriod (HashKey, BeginDate)
        GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentEducationOrganizationAssociationTelephone WITH CHECK ADD CONSTRAINT FK_StudentEducationOrganizationAssociationTelephone_TelephoneNumberTypeDescriptor FOREIGN KEY (TelephoneNumberTypeDescriptorHashKey)
    REFERENCES edfi.TelephoneNumberTypeDescriptor (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.StudentEducationOrganizationAssociationTelephone_Attributes WITH CHECK ADD CONSTRAINT FK_StudentEducationOrganizationAssociationTelephone_Attributes FOREIGN KEY
        (HashKey, TelephoneNumberTypeDescriptorHashKey, TelephoneNumber) REFERENCES edfi.StudentEducationOrganizationAssociationTelephone (HashKey, TelephoneNumberTypeDescriptorHashKey, TelephoneNumber)
        GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentEducationOrganizationAssociationTribalAffiliation WITH CHECK ADD CONSTRAINT FK_StudentEducationOrganizationAssociationTribalAffiliation_TribalAffiliationDescriptor FOREIGN KEY (TribalAffiliationDescriptorHashKey)
    REFERENCES edfi.TribalAffiliationDescriptor (HashKey)
    GO


        -- Foreign key from entity identity table
        ALTER TABLE edfi.StudentEducationOrganizationResponsibilityAssociation_Attributes WITH CHECK ADD CONSTRAINT FK_StudentEducationOrganizationResponsibilityAssociation_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.StudentEducationOrganizationResponsibilityAssociation (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentEducationOrganizationResponsibilityAssociation WITH CHECK ADD CONSTRAINT FK_StudentEducationOrganizationResponsibilityAssociation_EducationOrganization FOREIGN KEY (EducationOrganizationHashKey)
    REFERENCES edfi.EducationOrganization (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentEducationOrganizationResponsibilityAssociation WITH CHECK ADD CONSTRAINT FK_StudentEducationOrganizationResponsibilityAssociation_ResponsibilityDescriptor FOREIGN KEY (ResponsibilityDescriptorHashKey)
    REFERENCES edfi.ResponsibilityDescriptor (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentEducationOrganizationResponsibilityAssociation WITH CHECK ADD CONSTRAINT FK_StudentEducationOrganizationResponsibilityAssociation_Student FOREIGN KEY (StudentHashKey)
    REFERENCES edfi.Student (HashKey)
    GO
        -- Foreign key from entity identity table
        ALTER TABLE edfi.StudentGradebookEntry_Attributes WITH CHECK ADD CONSTRAINT FK_StudentGradebookEntry_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.StudentGradebookEntry (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentGradebookEntry WITH CHECK ADD CONSTRAINT FK_StudentGradebookEntry_GradebookEntry FOREIGN KEY (GradebookEntryHashKey)
    REFERENCES edfi.GradebookEntry (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentGradebookEntry WITH CHECK ADD CONSTRAINT FK_StudentGradebookEntry_StudentSectionAssociation FOREIGN KEY (StudentSectionAssociationHashKey)
    REFERENCES edfi.StudentSectionAssociation (HashKey)
    GO
        -- Foreign key from entity identity table
        ALTER TABLE edfi.StudentHomelessProgramAssociation_Attributes WITH CHECK ADD CONSTRAINT FK_StudentHomelessProgramAssociation_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.StudentHomelessProgramAssociation (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentHomelessProgramAssociation WITH CHECK ADD CONSTRAINT FK_StudentHomelessProgramAssociation_GeneralStudentProgramAssociation FOREIGN KEY (GeneralStudentProgramAssociationHashKey)
    REFERENCES edfi.GeneralStudentProgramAssociation (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentHomelessProgramAssociationHomelessProgramService WITH CHECK ADD CONSTRAINT FK_StudentHomelessProgramAssociationHomelessProgramService_HomelessProgramServiceDescriptor FOREIGN KEY (HomelessProgramServiceDescriptorHashKey)
    REFERENCES edfi.HomelessProgramServiceDescriptor (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.StudentHomelessProgramAssociationHomelessProgramService_Attributes WITH CHECK ADD CONSTRAINT FK_StudentHomelessProgramAssociationHomelessProgramService_Attributes FOREIGN KEY
        (HashKey, HomelessProgramServiceDescriptorHashKey) REFERENCES edfi.StudentHomelessProgramAssociationHomelessProgramService (HashKey, HomelessProgramServiceDescriptorHashKey)
        GO


    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentIdentificationSystemDescriptor WITH CHECK ADD CONSTRAINT FK_StudentIdentificationSystemDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO
        -- Foreign key from entity identity table
        ALTER TABLE edfi.StudentInterventionAssociation_Attributes WITH CHECK ADD CONSTRAINT FK_StudentInterventionAssociation_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.StudentInterventionAssociation (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentInterventionAssociation WITH CHECK ADD CONSTRAINT FK_StudentInterventionAssociation_Intervention FOREIGN KEY (InterventionHashKey)
    REFERENCES edfi.Intervention (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentInterventionAssociation WITH CHECK ADD CONSTRAINT FK_StudentInterventionAssociation_Student FOREIGN KEY (StudentHashKey)
    REFERENCES edfi.Student (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentInterventionAssociationInterventionEffectiveness WITH CHECK ADD CONSTRAINT FK_StudentInterventionAssociationInterventionEffectiveness_DiagnosisDescriptor FOREIGN KEY (DiagnosisDescriptorHashKey)
    REFERENCES edfi.DiagnosisDescriptor (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentInterventionAssociationInterventionEffectiveness WITH CHECK ADD CONSTRAINT FK_StudentInterventionAssociationInterventionEffectiveness_GradeLevelDescriptor FOREIGN KEY (GradeLevelDescriptorHashKey)
    REFERENCES edfi.GradeLevelDescriptor (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentInterventionAssociationInterventionEffectiveness WITH CHECK ADD CONSTRAINT FK_StudentInterventionAssociationInterventionEffectiveness_PopulationServedDescriptor FOREIGN KEY (PopulationServedDescriptorHashKey)
    REFERENCES edfi.PopulationServedDescriptor (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.StudentInterventionAssociationInterventionEffectiveness_Attributes WITH CHECK ADD CONSTRAINT FK_StudentInterventionAssociationInterventionEffectiveness_Attributes FOREIGN KEY
        (HashKey, DiagnosisDescriptorHashKey, GradeLevelDescriptorHashKey, PopulationServedDescriptorHashKey) REFERENCES edfi.StudentInterventionAssociationInterventionEffectiveness (HashKey, DiagnosisDescriptorHashKey, GradeLevelDescriptorHashKey, PopulationServedDescriptorHashKey)
        GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.StudentInterventionAttendanceEvent_Attributes WITH CHECK ADD CONSTRAINT FK_StudentInterventionAttendanceEvent_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.StudentInterventionAttendanceEvent (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentInterventionAttendanceEvent WITH CHECK ADD CONSTRAINT FK_StudentInterventionAttendanceEvent_AttendanceEventCategoryDescriptor FOREIGN KEY (AttendanceEventCategoryDescriptorHashKey)
    REFERENCES edfi.AttendanceEventCategoryDescriptor (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentInterventionAttendanceEvent WITH CHECK ADD CONSTRAINT FK_StudentInterventionAttendanceEvent_Intervention FOREIGN KEY (InterventionHashKey)
    REFERENCES edfi.Intervention (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentInterventionAttendanceEvent WITH CHECK ADD CONSTRAINT FK_StudentInterventionAttendanceEvent_Student FOREIGN KEY (StudentHashKey)
    REFERENCES edfi.Student (HashKey)
    GO
        -- Foreign key from entity identity table
        ALTER TABLE edfi.StudentLanguageInstructionProgramAssociation_Attributes WITH CHECK ADD CONSTRAINT FK_StudentLanguageInstructionProgramAssociation_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.StudentLanguageInstructionProgramAssociation (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentLanguageInstructionProgramAssociation WITH CHECK ADD CONSTRAINT FK_StudentLanguageInstructionProgramAssociation_GeneralStudentProgramAssociation FOREIGN KEY (GeneralStudentProgramAssociationHashKey)
    REFERENCES edfi.GeneralStudentProgramAssociation (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentLanguageInstructionProgramAssociationEnglishLanguageProficiencyAssessment WITH CHECK ADD CONSTRAINT FK_StudentLanguageInstructionProgramAssociationEnglishLanguageProficiencyAssessment_SchoolYearType FOREIGN KEY (SchoolYearTypeHashKey)
    REFERENCES edfi.SchoolYearType (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.StudentLanguageInstructionProgramAssociationEnglishLanguageProficiencyAssessment_Attributes WITH CHECK ADD CONSTRAINT FK_StudentLanguageInstructionProgramAssociationEnglishLanguageProficiencyAssessment_Attributes FOREIGN KEY
        (HashKey, SchoolYearTypeHashKey) REFERENCES edfi.StudentLanguageInstructionProgramAssociationEnglishLanguageProficiencyAssessment (HashKey, SchoolYearTypeHashKey)
        GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentLanguageInstructionProgramAssociationLanguageInstructionProgramService WITH CHECK ADD CONSTRAINT FK_StudentLanguageInstructionProgramAssociationLanguageInstructionProgramService_LanguageInstructionProgramServiceDescriptor FOREIGN KEY (LanguageInstructionProgramServiceDescriptorHashKey)
    REFERENCES edfi.LanguageInstructionProgramServiceDescriptor (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.StudentLanguageInstructionProgramAssociationLanguageInstructionProgramService_Attributes WITH CHECK ADD CONSTRAINT FK_StudentLanguageInstructionProgramAssociationLanguageInstructionProgramService_Attributes FOREIGN KEY
        (HashKey, LanguageInstructionProgramServiceDescriptorHashKey) REFERENCES edfi.StudentLanguageInstructionProgramAssociationLanguageInstructionProgramService (HashKey, LanguageInstructionProgramServiceDescriptorHashKey)
        GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.StudentLearningObjective_Attributes WITH CHECK ADD CONSTRAINT FK_StudentLearningObjective_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.StudentLearningObjective (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentLearningObjective WITH CHECK ADD CONSTRAINT FK_GradingStudentLearningObjective_GradingPeriod FOREIGN KEY (GradingPeriodHashKey)
    REFERENCES edfi.GradingPeriod (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentLearningObjective WITH CHECK ADD CONSTRAINT FK_StudentLearningObjective_LearningObjective FOREIGN KEY (LearningObjectiveHashKey)
    REFERENCES edfi.LearningObjective (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentLearningObjective WITH CHECK ADD CONSTRAINT FK_StudentLearningObjective_Student FOREIGN KEY (StudentHashKey)
    REFERENCES edfi.Student (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentLearningObjectiveGeneralStudentProgramAssociation WITH CHECK ADD CONSTRAINT FK_StudentLearningObjectiveGeneralStudentProgramAssociation_GeneralStudentProgramAssociation FOREIGN KEY (GeneralStudentProgramAssociationHashKey)
    REFERENCES edfi.GeneralStudentProgramAssociation (HashKey)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentLearningObjectiveStudentSectionAssociation WITH CHECK ADD CONSTRAINT FK_StudentLearningObjectiveStudentSectionAssociation_StudentSectionAssociation FOREIGN KEY (StudentSectionAssociationHashKey)
    REFERENCES edfi.StudentSectionAssociation (HashKey)
    GO


        -- Foreign key from entity identity table
        ALTER TABLE edfi.StudentMigrantEducationProgramAssociation_Attributes WITH CHECK ADD CONSTRAINT FK_StudentMigrantEducationProgramAssociation_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.StudentMigrantEducationProgramAssociation (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentMigrantEducationProgramAssociation WITH CHECK ADD CONSTRAINT FK_StudentMigrantEducationProgramAssociation_GeneralStudentProgramAssociation FOREIGN KEY (GeneralStudentProgramAssociationHashKey)
    REFERENCES edfi.GeneralStudentProgramAssociation (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentMigrantEducationProgramAssociationMigrantEducationProgramService WITH CHECK ADD CONSTRAINT FK_StudentMigrantEducationProgramAssociationMigrantEducationProgramService_MigrantEducationProgramServiceDescriptor FOREIGN KEY (MigrantEducationProgramServiceDescriptorHashKey)
    REFERENCES edfi.MigrantEducationProgramServiceDescriptor (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.StudentMigrantEducationProgramAssociationMigrantEducationProgramService_Attributes WITH CHECK ADD CONSTRAINT FK_StudentMigrantEducationProgramAssociationMigrantEducationProgramService_Attributes FOREIGN KEY
        (HashKey, MigrantEducationProgramServiceDescriptorHashKey) REFERENCES edfi.StudentMigrantEducationProgramAssociationMigrantEducationProgramService (HashKey, MigrantEducationProgramServiceDescriptorHashKey)
        GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.StudentNeglectedOrDelinquentProgramAssociation_Attributes WITH CHECK ADD CONSTRAINT FK_StudentNeglectedOrDelinquentProgramAssociation_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.StudentNeglectedOrDelinquentProgramAssociation (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentNeglectedOrDelinquentProgramAssociation WITH CHECK ADD CONSTRAINT FK_StudentNeglectedOrDelinquentProgramAssociation_GeneralStudentProgramAssociation FOREIGN KEY (GeneralStudentProgramAssociationHashKey)
    REFERENCES edfi.GeneralStudentProgramAssociation (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentNeglectedOrDelinquentProgramAssociationNeglectedOrDelinquentProgramService WITH CHECK ADD CONSTRAINT FK_StudentNeglectedOrDelinquentProgramAssociationNeglectedOrDelinquentProgramService_NeglectedOrDelinquentProgramServiceDescript FOREIGN KEY (NeglectedOrDelinquentProgramServiceDescriptorHashKey)
    REFERENCES edfi.NeglectedOrDelinquentProgramServiceDescriptor (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.StudentNeglectedOrDelinquentProgramAssociationNeglectedOrDelinquentProgramService_Attributes WITH CHECK ADD CONSTRAINT FK_StudentNeglectedOrDelinquentProgramAssociationNeglectedOrDelinquentProgramService_Attributes FOREIGN KEY
        (HashKey, NeglectedOrDelinquentProgramServiceDescriptorHashKey) REFERENCES edfi.StudentNeglectedOrDelinquentProgramAssociationNeglectedOrDelinquentProgramService (HashKey, NeglectedOrDelinquentProgramServiceDescriptorHashKey)
        GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.StudentParentAssociation_Attributes WITH CHECK ADD CONSTRAINT FK_StudentParentAssociation_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.StudentParentAssociation (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentParentAssociation WITH CHECK ADD CONSTRAINT FK_StudentParentAssociation_Parent FOREIGN KEY (ParentHashKey)
    REFERENCES edfi.Parent (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentParentAssociation WITH CHECK ADD CONSTRAINT FK_StudentParentAssociation_Student FOREIGN KEY (StudentHashKey)
    REFERENCES edfi.Student (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentParticipationCodeDescriptor WITH CHECK ADD CONSTRAINT FK_StudentParticipationCodeDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentProgramAssociation WITH CHECK ADD CONSTRAINT FK_StudentProgramAssociation_GeneralStudentProgramAssociation FOREIGN KEY (GeneralStudentProgramAssociationHashKey)
    REFERENCES edfi.GeneralStudentProgramAssociation (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentProgramAssociationService WITH CHECK ADD CONSTRAINT FK_StudentProgramAssociationService_ServiceDescriptor FOREIGN KEY (ServiceDescriptorHashKey)
    REFERENCES edfi.ServiceDescriptor (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.StudentProgramAssociationService_Attributes WITH CHECK ADD CONSTRAINT FK_StudentProgramAssociationService_Attributes FOREIGN KEY
        (HashKey, ServiceDescriptorHashKey) REFERENCES edfi.StudentProgramAssociationService (HashKey, ServiceDescriptorHashKey)
        GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.StudentProgramAttendanceEvent_Attributes WITH CHECK ADD CONSTRAINT FK_StudentProgramAttendanceEvent_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.StudentProgramAttendanceEvent (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentProgramAttendanceEvent WITH CHECK ADD CONSTRAINT FK_StudentProgramAttendanceEvent_AttendanceEventCategoryDescriptor FOREIGN KEY (AttendanceEventCategoryDescriptorHashKey)
    REFERENCES edfi.AttendanceEventCategoryDescriptor (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentProgramAttendanceEvent WITH CHECK ADD CONSTRAINT FK_StudentProgramAttendanceEvent_EducationOrganization FOREIGN KEY (EducationOrganizationHashKey)
    REFERENCES edfi.EducationOrganization (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentProgramAttendanceEvent WITH CHECK ADD CONSTRAINT FK_StudentProgramAttendanceEvent_Program FOREIGN KEY (ProgramHashKey)
    REFERENCES edfi.Program (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentProgramAttendanceEvent WITH CHECK ADD CONSTRAINT FK_StudentProgramAttendanceEvent_Student FOREIGN KEY (StudentHashKey)
    REFERENCES edfi.Student (HashKey)
    GO
        -- Foreign key from entity identity table
        ALTER TABLE edfi.StudentSchoolAssociation_Attributes WITH CHECK ADD CONSTRAINT FK_StudentSchoolAssociation_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.StudentSchoolAssociation (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentSchoolAssociation WITH CHECK ADD CONSTRAINT FK_StudentSchoolAssociation_School FOREIGN KEY (SchoolHashKey)
    REFERENCES edfi.School (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentSchoolAssociation WITH CHECK ADD CONSTRAINT FK_StudentSchoolAssociation_Student FOREIGN KEY (StudentHashKey)
    REFERENCES edfi.Student (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentSchoolAssociationAlternativeGraduationPlan WITH CHECK ADD CONSTRAINT FK_AlternativeStudentSchoolAssociationAlternativeGraduationPlan_GraduationPlan FOREIGN KEY (AlternativeGraduationPlanHashKey)
    REFERENCES edfi.GraduationPlan (HashKey)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentSchoolAssociationEducationPlan WITH CHECK ADD CONSTRAINT FK_StudentSchoolAssociationEducationPlan_EducationPlanDescriptor FOREIGN KEY (EducationPlanDescriptorHashKey)
    REFERENCES edfi.EducationPlanDescriptor (HashKey)
    GO


        -- Foreign key from entity identity table
        ALTER TABLE edfi.StudentSchoolAttendanceEvent_Attributes WITH CHECK ADD CONSTRAINT FK_StudentSchoolAttendanceEvent_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.StudentSchoolAttendanceEvent (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentSchoolAttendanceEvent WITH CHECK ADD CONSTRAINT FK_StudentSchoolAttendanceEvent_AttendanceEventCategoryDescriptor FOREIGN KEY (AttendanceEventCategoryDescriptorHashKey)
    REFERENCES edfi.AttendanceEventCategoryDescriptor (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentSchoolAttendanceEvent WITH CHECK ADD CONSTRAINT FK_StudentSchoolAttendanceEvent_School FOREIGN KEY (SchoolHashKey)
    REFERENCES edfi.School (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentSchoolAttendanceEvent WITH CHECK ADD CONSTRAINT FK_StudentSchoolAttendanceEvent_Session FOREIGN KEY (SessionHashKey)
    REFERENCES edfi.Session (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentSchoolAttendanceEvent WITH CHECK ADD CONSTRAINT FK_StudentSchoolAttendanceEvent_Student FOREIGN KEY (StudentHashKey)
    REFERENCES edfi.Student (HashKey)
    GO
        -- Foreign key from entity identity table
        ALTER TABLE edfi.StudentSchoolFoodServiceProgramAssociation_Attributes WITH CHECK ADD CONSTRAINT FK_StudentSchoolFoodServiceProgramAssociation_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.StudentSchoolFoodServiceProgramAssociation (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentSchoolFoodServiceProgramAssociation WITH CHECK ADD CONSTRAINT FK_StudentSchoolFoodServiceProgramAssociation_GeneralStudentProgramAssociation FOREIGN KEY (GeneralStudentProgramAssociationHashKey)
    REFERENCES edfi.GeneralStudentProgramAssociation (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentSchoolFoodServiceProgramAssociationSchoolFoodServiceProgramService WITH CHECK ADD CONSTRAINT FK_StudentSchoolFoodServiceProgramAssociationSchoolFoodServiceProgramService_SchoolFoodServiceProgramServiceDescriptor FOREIGN KEY (SchoolFoodServiceProgramServiceDescriptorHashKey)
    REFERENCES edfi.SchoolFoodServiceProgramServiceDescriptor (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.StudentSchoolFoodServiceProgramAssociationSchoolFoodServiceProgramService_Attributes WITH CHECK ADD CONSTRAINT FK_StudentSchoolFoodServiceProgramAssociationSchoolFoodServiceProgramService_Attributes FOREIGN KEY
        (HashKey, SchoolFoodServiceProgramServiceDescriptorHashKey) REFERENCES edfi.StudentSchoolFoodServiceProgramAssociationSchoolFoodServiceProgramService (HashKey, SchoolFoodServiceProgramServiceDescriptorHashKey)
        GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.StudentSectionAssociation_Attributes WITH CHECK ADD CONSTRAINT FK_StudentSectionAssociation_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.StudentSectionAssociation (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentSectionAssociation WITH CHECK ADD CONSTRAINT FK_StudentSectionAssociation_Section FOREIGN KEY (SectionHashKey)
    REFERENCES edfi.Section (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentSectionAssociation WITH CHECK ADD CONSTRAINT FK_StudentSectionAssociation_Student FOREIGN KEY (StudentHashKey)
    REFERENCES edfi.Student (HashKey)
    GO
        -- Foreign key from entity identity table
        ALTER TABLE edfi.StudentSectionAttendanceEvent_Attributes WITH CHECK ADD CONSTRAINT FK_StudentSectionAttendanceEvent_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.StudentSectionAttendanceEvent (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentSectionAttendanceEvent WITH CHECK ADD CONSTRAINT FK_StudentSectionAttendanceEvent_AttendanceEventCategoryDescriptor FOREIGN KEY (AttendanceEventCategoryDescriptorHashKey)
    REFERENCES edfi.AttendanceEventCategoryDescriptor (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentSectionAttendanceEvent WITH CHECK ADD CONSTRAINT FK_StudentSectionAttendanceEvent_Section FOREIGN KEY (SectionHashKey)
    REFERENCES edfi.Section (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentSectionAttendanceEvent WITH CHECK ADD CONSTRAINT FK_StudentSectionAttendanceEvent_Student FOREIGN KEY (StudentHashKey)
    REFERENCES edfi.Student (HashKey)
    GO
        -- Foreign key from entity identity table
        ALTER TABLE edfi.StudentSpecialEducationProgramAssociation_Attributes WITH CHECK ADD CONSTRAINT FK_StudentSpecialEducationProgramAssociation_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.StudentSpecialEducationProgramAssociation (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentSpecialEducationProgramAssociation WITH CHECK ADD CONSTRAINT FK_StudentSpecialEducationProgramAssociation_GeneralStudentProgramAssociation FOREIGN KEY (GeneralStudentProgramAssociationHashKey)
    REFERENCES edfi.GeneralStudentProgramAssociation (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentSpecialEducationProgramAssociationDisability WITH CHECK ADD CONSTRAINT FK_StudentSpecialEducationProgramAssociationDisability_DisabilityDescriptor FOREIGN KEY (DisabilityDescriptorHashKey)
    REFERENCES edfi.DisabilityDescriptor (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.StudentSpecialEducationProgramAssociationDisability_Attributes WITH CHECK ADD CONSTRAINT FK_StudentSpecialEducationProgramAssociationDisability_Attributes FOREIGN KEY
        (HashKey, DisabilityDescriptorHashKey) REFERENCES edfi.StudentSpecialEducationProgramAssociationDisability (HashKey, DisabilityDescriptorHashKey)
        GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentSpecialEducationProgramAssociationDisabilityDesignation WITH CHECK ADD CONSTRAINT FK_StudentSpecialEducationProgramAssociationDisabilityDesignation_DisabilityDesignationDescriptor FOREIGN KEY (DisabilityDesignationDescriptorHashKey)
    REFERENCES edfi.DisabilityDesignationDescriptor (HashKey)
    GO


    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentSpecialEducationProgramAssociationServiceProvider WITH CHECK ADD CONSTRAINT FK_StudentSpecialEducationProgramAssociationServiceProvider_Staff FOREIGN KEY (StaffHashKey)
    REFERENCES edfi.Staff (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.StudentSpecialEducationProgramAssociationServiceProvider_Attributes WITH CHECK ADD CONSTRAINT FK_StudentSpecialEducationProgramAssociationServiceProvider_Attributes FOREIGN KEY
        (HashKey, StaffHashKey) REFERENCES edfi.StudentSpecialEducationProgramAssociationServiceProvider (HashKey, StaffHashKey)
        GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentSpecialEducationProgramAssociationSpecialEducationProgramService WITH CHECK ADD CONSTRAINT FK_StudentSpecialEducationProgramAssociationSpecialEducationProgramService_SpecialEducationProgramServiceDescriptor FOREIGN KEY (SpecialEducationProgramServiceDescriptorHashKey)
    REFERENCES edfi.SpecialEducationProgramServiceDescriptor (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.StudentSpecialEducationProgramAssociationSpecialEducationProgramService_Attributes WITH CHECK ADD CONSTRAINT FK_StudentSpecialEducationProgramAssociationSpecialEducationProgramService_Attributes FOREIGN KEY
        (HashKey, SpecialEducationProgramServiceDescriptorHashKey) REFERENCES edfi.StudentSpecialEducationProgramAssociationSpecialEducationProgramService (HashKey, SpecialEducationProgramServiceDescriptorHashKey)
        GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentSpecialEducationProgramAssociationSpecialEducationProgramServiceProvider WITH CHECK ADD CONSTRAINT FK_StudentSpecialEducationProgramAssociationSpecialEducationProgramServiceProvider_Staff FOREIGN KEY (StaffHashKey)
    REFERENCES edfi.Staff (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.StudentSpecialEducationProgramAssociationSpecialEducationProgramServiceProvider_Attributes WITH CHECK ADD CONSTRAINT FK_StudentSpecialEducationProgramAssociationSpecialEducationProgramServiceProvider_Attributes FOREIGN KEY
        (HashKey, StaffHashKey) REFERENCES edfi.StudentSpecialEducationProgramAssociationSpecialEducationProgramServiceProvider (HashKey, StaffHashKey)
        GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.StudentTitleIPartAProgramAssociation_Attributes WITH CHECK ADD CONSTRAINT FK_StudentTitleIPartAProgramAssociation_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.StudentTitleIPartAProgramAssociation (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.StudentTitleIPartAProgramAssociation WITH CHECK ADD CONSTRAINT FK_StudentTitleIPartAProgramAssociation_GeneralStudentProgramAssociation FOREIGN KEY (GeneralStudentProgramAssociationHashKey)
    REFERENCES edfi.GeneralStudentProgramAssociation (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentTitleIPartAProgramAssociationService WITH CHECK ADD CONSTRAINT FK_StudentTitleIPartAProgramAssociationService_ServiceDescriptor FOREIGN KEY (ServiceDescriptorHashKey)
    REFERENCES edfi.ServiceDescriptor (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.StudentTitleIPartAProgramAssociationService_Attributes WITH CHECK ADD CONSTRAINT FK_StudentTitleIPartAProgramAssociationService_Attributes FOREIGN KEY
        (HashKey, ServiceDescriptorHashKey) REFERENCES edfi.StudentTitleIPartAProgramAssociationService (HashKey, ServiceDescriptorHashKey)
        GO

    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.StudentTitleIPartAProgramAssociationTitleIPartAProgramService WITH CHECK ADD CONSTRAINT FK_StudentTitleIPartAProgramAssociationTitleIPartAProgramService_TitleIPartAProgramServiceDescriptor FOREIGN KEY (TitleIPartAProgramServiceDescriptorHashKey)
    REFERENCES edfi.TitleIPartAProgramServiceDescriptor (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.StudentTitleIPartAProgramAssociationTitleIPartAProgramService_Attributes WITH CHECK ADD CONSTRAINT FK_StudentTitleIPartAProgramAssociationTitleIPartAProgramService_Attributes FOREIGN KEY
        (HashKey, TitleIPartAProgramServiceDescriptorHashKey) REFERENCES edfi.StudentTitleIPartAProgramAssociationTitleIPartAProgramService (HashKey, TitleIPartAProgramServiceDescriptorHashKey)
        GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.Survey_Attributes WITH CHECK ADD CONSTRAINT FK_Survey_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.Survey (HashKey)
        GO


    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SurveyCategoryDescriptor WITH CHECK ADD CONSTRAINT FK_SurveyCategoryDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SurveyCourseAssociation WITH CHECK ADD CONSTRAINT FK_SurveyCourseAssociation_Course FOREIGN KEY (CourseHashKey)
    REFERENCES edfi.Course (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SurveyCourseAssociation WITH CHECK ADD CONSTRAINT FK_SurveyCourseAssociation_Survey FOREIGN KEY (SurveyHashKey)
    REFERENCES edfi.Survey (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SurveyLevelDescriptor WITH CHECK ADD CONSTRAINT FK_SurveyLevelDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SurveyProgramAssociation WITH CHECK ADD CONSTRAINT FK_SurveyProgramAssociation_Program FOREIGN KEY (ProgramHashKey)
    REFERENCES edfi.Program (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SurveyProgramAssociation WITH CHECK ADD CONSTRAINT FK_SurveyProgramAssociation_Survey FOREIGN KEY (SurveyHashKey)
    REFERENCES edfi.Survey (HashKey)
    GO
        -- Foreign key from entity identity table
        ALTER TABLE edfi.SurveyQuestion_Attributes WITH CHECK ADD CONSTRAINT FK_SurveyQuestion_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.SurveyQuestion (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SurveyQuestion WITH CHECK ADD CONSTRAINT FK_SurveyQuestion_Survey FOREIGN KEY (SurveyHashKey)
    REFERENCES edfi.Survey (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.SurveyQuestionMatrix_Attributes WITH CHECK ADD CONSTRAINT FK_SurveyQuestionMatrix_Attributes FOREIGN KEY
        (HashKey, MatrixElement) REFERENCES edfi.SurveyQuestionMatrix (HashKey, MatrixElement)
        GO


        -- Foreign key from entity identity table
        ALTER TABLE edfi.SurveyQuestionResponseChoice_Attributes WITH CHECK ADD CONSTRAINT FK_SurveyQuestionResponseChoice_Attributes FOREIGN KEY
        (HashKey, SortOrder) REFERENCES edfi.SurveyQuestionResponseChoice (HashKey, SortOrder)
        GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.SurveyQuestionResponse_Attributes WITH CHECK ADD CONSTRAINT FK_SurveyQuestionResponse_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.SurveyQuestionResponse (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SurveyQuestionResponse WITH CHECK ADD CONSTRAINT FK_SurveyQuestionResponse_SurveyQuestion FOREIGN KEY (SurveyQuestionHashKey)
    REFERENCES edfi.SurveyQuestion (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SurveyQuestionResponse WITH CHECK ADD CONSTRAINT FK_SurveyQuestionResponse_SurveyResponse FOREIGN KEY (SurveyResponseHashKey)
    REFERENCES edfi.SurveyResponse (HashKey)
    GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.SurveyQuestionResponseSurveyQuestionMatrixElementResponse_Attributes WITH CHECK ADD CONSTRAINT FK_SurveyQuestionResponseSurveyQuestionMatrixElementResponse_Attributes FOREIGN KEY
        (HashKey, MatrixElement) REFERENCES edfi.SurveyQuestionResponseSurveyQuestionMatrixElementResponse (HashKey, MatrixElement)
        GO


        -- Foreign key from entity identity table
        ALTER TABLE edfi.SurveyQuestionResponseValue_Attributes WITH CHECK ADD CONSTRAINT FK_SurveyQuestionResponseValue_Attributes FOREIGN KEY
        (HashKey, SurveyQuestionResponseValueIdentifier) REFERENCES edfi.SurveyQuestionResponseValue (HashKey, SurveyQuestionResponseValueIdentifier)
        GO

        -- Foreign key from entity identity table
        ALTER TABLE edfi.SurveyResponse_Attributes WITH CHECK ADD CONSTRAINT FK_SurveyResponse_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.SurveyResponse (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SurveyResponse WITH CHECK ADD CONSTRAINT FK_SurveyResponse_Survey FOREIGN KEY (SurveyHashKey)
    REFERENCES edfi.Survey (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate child entity)
    ALTER TABLE edfi.SurveyResponseSurveyLevel WITH CHECK ADD CONSTRAINT FK_SurveyResponseSurveyLevel_SurveyLevelDescriptor FOREIGN KEY (SurveyLevelDescriptorHashKey)
    REFERENCES edfi.SurveyLevelDescriptor (HashKey)
    GO



    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SurveyResponseEducationOrganizationTargetAssociation WITH CHECK ADD CONSTRAINT FK_SurveyResponseEducationOrganizationTargetAssociation_EducationOrganization FOREIGN KEY (EducationOrganizationHashKey)
    REFERENCES edfi.EducationOrganization (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SurveyResponseEducationOrganizationTargetAssociation WITH CHECK ADD CONSTRAINT FK_SurveyResponseEducationOrganizationTargetAssociation_SurveyResponse FOREIGN KEY (SurveyResponseHashKey)
    REFERENCES edfi.SurveyResponse (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SurveyResponseStaffTargetAssociation WITH CHECK ADD CONSTRAINT FK_SurveyResponseStaffTargetAssociation_Staff FOREIGN KEY (StaffHashKey)
    REFERENCES edfi.Staff (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SurveyResponseStaffTargetAssociation WITH CHECK ADD CONSTRAINT FK_SurveyResponseStaffTargetAssociation_SurveyResponse FOREIGN KEY (SurveyResponseHashKey)
    REFERENCES edfi.SurveyResponse (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SurveySection WITH CHECK ADD CONSTRAINT FK_SurveySection_Survey FOREIGN KEY (SurveyHashKey)
    REFERENCES edfi.Survey (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SurveySectionAssociation WITH CHECK ADD CONSTRAINT FK_SurveySectionAssociation_Section FOREIGN KEY (SectionHashKey)
    REFERENCES edfi.Section (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SurveySectionAssociation WITH CHECK ADD CONSTRAINT FK_SurveySectionAssociation_Survey FOREIGN KEY (SurveyHashKey)
    REFERENCES edfi.Survey (HashKey)
    GO
        -- Foreign key from entity identity table
        ALTER TABLE edfi.SurveySectionResponse_Attributes WITH CHECK ADD CONSTRAINT FK_SurveySectionResponse_Attributes FOREIGN KEY
        (HashKey) REFERENCES edfi.SurveySectionResponse (HashKey)
        GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SurveySectionResponse WITH CHECK ADD CONSTRAINT FK_SurveySectionResponse_SurveyResponse FOREIGN KEY (SurveyResponseHashKey)
    REFERENCES edfi.SurveyResponse (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SurveySectionResponse WITH CHECK ADD CONSTRAINT FK_SurveySectionResponse_SurveySection FOREIGN KEY (SurveySectionHashKey)
    REFERENCES edfi.SurveySection (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SurveySectionResponseEducationOrganizationTargetAssociation WITH CHECK ADD CONSTRAINT FK_SurveySectionResponseEducationOrganizationTargetAssociation_EducationOrganization FOREIGN KEY (EducationOrganizationHashKey)
    REFERENCES edfi.EducationOrganization (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SurveySectionResponseEducationOrganizationTargetAssociation WITH CHECK ADD CONSTRAINT FK_SurveySectionResponseEducationOrganizationTargetAssociation_SurveySectionResponse FOREIGN KEY (SurveySectionResponseHashKey)
    REFERENCES edfi.SurveySectionResponse (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SurveySectionResponseStaffTargetAssociation WITH CHECK ADD CONSTRAINT FK_SurveySectionResponseStaffTargetAssociation_Staff FOREIGN KEY (StaffHashKey)
    REFERENCES edfi.Staff (HashKey)
    GO
    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.SurveySectionResponseStaffTargetAssociation WITH CHECK ADD CONSTRAINT FK_SurveySectionResponseStaffTargetAssociation_SurveySectionResponse FOREIGN KEY (SurveySectionResponseHashKey)
    REFERENCES edfi.SurveySectionResponse (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.TeachingCredentialBasisDescriptor WITH CHECK ADD CONSTRAINT FK_TeachingCredentialBasisDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.TeachingCredentialDescriptor WITH CHECK ADD CONSTRAINT FK_TeachingCredentialDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.TechnicalSkillsAssessmentDescriptor WITH CHECK ADD CONSTRAINT FK_TechnicalSkillsAssessmentDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.TelephoneNumberTypeDescriptor WITH CHECK ADD CONSTRAINT FK_TelephoneNumberTypeDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.TermDescriptor WITH CHECK ADD CONSTRAINT FK_TermDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.TitleIPartAParticipantDescriptor WITH CHECK ADD CONSTRAINT FK_TitleIPartAParticipantDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.TitleIPartAProgramServiceDescriptor WITH CHECK ADD CONSTRAINT FK_TitleIPartAProgramServiceDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.TitleIPartASchoolDesignationDescriptor WITH CHECK ADD CONSTRAINT FK_TitleIPartASchoolDesignationDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.TribalAffiliationDescriptor WITH CHECK ADD CONSTRAINT FK_TribalAffiliationDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.VisaDescriptor WITH CHECK ADD CONSTRAINT FK_VisaDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO

    -- Foreign key to identifying reference (for aggregate root entity)
    ALTER TABLE edfi.WeaponDescriptor WITH CHECK ADD CONSTRAINT FK_WeaponDescriptor_Descriptor FOREIGN KEY (DescriptorHashKey)
    REFERENCES edfi.Descriptor (HashKey)
    GO
