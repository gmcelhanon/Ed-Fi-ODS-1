BEGIN
    DECLARE @schoolYearContext AS INT = 2019

    INSERT INTO edfi.AbsenceEventCategoryDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , AbsenceEventCategoryDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, AbsenceEventCategoryDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, AbsenceEventCategoryDescriptorId)
        )
        , AbsenceEventCategoryDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.AbsenceEventCategoryDescriptor
    -- GO


    
    INSERT INTO edfi.AcademicHonorCategoryDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , AcademicHonorCategoryDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, AcademicHonorCategoryDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, AcademicHonorCategoryDescriptorId)
        )
        , AcademicHonorCategoryDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.AcademicHonorCategoryDescriptor
    -- GO


    
    INSERT INTO edfi.AcademicSubjectDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , AcademicSubjectDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, AcademicSubjectDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, AcademicSubjectDescriptorId)
        )
        , AcademicSubjectDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.AcademicSubjectDescriptor
    -- GO


    
    INSERT INTO edfi.AcademicWeek (
        HashKey
        -- Identifying references (for aggregate root entity)
        , SchoolHashKey
        -- Primary key columns
        , SchoolId
                , WeekIdentifier
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, SchoolId)
                    + '|' + WeekIdentifier
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, SchoolId)
        )
        , SchoolId
        , WeekIdentifier
    FROM EdFi_Ods_Populated_Template.edfi.AcademicWeek
    -- GO

        INSERT INTO edfi.AcademicWeek_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , BeginDate
            , EndDate
            , TotalInstructionalDays
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, SchoolId)
                    + '|' + WeekIdentifier
        )
            , @schoolYearContext
            -- Attributes
            , BeginDate
            , EndDate
            , TotalInstructionalDays
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.AcademicWeek
    
    INSERT INTO edfi.AccommodationDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , AccommodationDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, AccommodationDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, AccommodationDescriptorId)
        )
        , AccommodationDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.AccommodationDescriptor
    -- GO


    
    INSERT INTO edfi.Account (
        HashKey
        -- Identifying references (for aggregate root entity)
        , EducationOrganizationHashKey
        -- Primary key columns
        , AccountIdentifier
                , EducationOrganizationId
                , FiscalYear
        )
    SELECT 
        HASHBYTES('sha1', 
            AccountIdentifier
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, FiscalYear)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
        )
        , AccountIdentifier
        , EducationOrganizationId
        , FiscalYear
    FROM EdFi_Ods_Populated_Template.edfi.Account
    -- GO

        INSERT INTO edfi.Account_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , AccountName
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            AccountIdentifier
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, FiscalYear)
        )
            , @schoolYearContext
            -- Attributes
            , AccountName
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.Account
    
    INSERT INTO edfi.AccountAccountCode (
        HashKey
        -- Identifying references (for aggregate child entity)
        , AccountCodeHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, AccountClassificationDescriptorId)
                    + '|' + AccountCodeNumber
                    + '|' + AccountIdentifier
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, FiscalYear)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, AccountClassificationDescriptorId)
            + '|' + AccountCodeNumber
            + '|' + CONVERT(nvarchar, EducationOrganizationId)
            + '|' + CONVERT(nvarchar, FiscalYear)
        )
    FROM EdFi_Ods_Populated_Template.edfi.AccountAccountCode
    -- GO

    INSERT INTO edfi.AccountabilityRating (
        HashKey
        -- Identifying references (for aggregate root entity)
        , EducationOrganizationHashKey
        , SchoolYearTypeHashKey
        -- Primary key columns
        , EducationOrganizationId
                , RatingTitle
                , SchoolYear
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + RatingTitle
                    + '|' + CONVERT(nvarchar, SchoolYear)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, SchoolYear)
        )
        , EducationOrganizationId
        , RatingTitle
        , SchoolYear
    FROM EdFi_Ods_Populated_Template.edfi.AccountabilityRating
    -- GO

        INSERT INTO edfi.AccountabilityRating_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , Rating
            , RatingDate
            , RatingOrganization
            , RatingProgram
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + RatingTitle
                    + '|' + CONVERT(nvarchar, SchoolYear)
        )
            , @schoolYearContext
            -- Attributes
            , Rating
            , RatingDate
            , RatingOrganization
            , RatingProgram
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.AccountabilityRating
    
    INSERT INTO edfi.AccountClassificationDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , AccountClassificationDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, AccountClassificationDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, AccountClassificationDescriptorId)
        )
        , AccountClassificationDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.AccountClassificationDescriptor
    -- GO


    
    INSERT INTO edfi.AccountCode (
        HashKey
        -- Identifying references (for aggregate root entity)
        , AccountClassificationDescriptorHashKey
        , EducationOrganizationHashKey
        -- Primary key columns
        , AccountClassificationDescriptorId
                , AccountCodeNumber
                , EducationOrganizationId
                , FiscalYear
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, AccountClassificationDescriptorId)
                    + '|' + AccountCodeNumber
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, FiscalYear)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, AccountClassificationDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
        )
        , AccountClassificationDescriptorId
        , AccountCodeNumber
        , EducationOrganizationId
        , FiscalYear
    FROM EdFi_Ods_Populated_Template.edfi.AccountCode
    -- GO

        INSERT INTO edfi.AccountCode_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , AccountCodeDescription
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, AccountClassificationDescriptorId)
                    + '|' + AccountCodeNumber
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, FiscalYear)
        )
            , @schoolYearContext
            -- Attributes
            , AccountCodeDescription
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.AccountCode
    
    INSERT INTO edfi.AchievementCategoryDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , AchievementCategoryDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, AchievementCategoryDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, AchievementCategoryDescriptorId)
        )
        , AchievementCategoryDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.AchievementCategoryDescriptor
    -- GO


    
    INSERT INTO edfi.Actual (
        HashKey
        -- Identifying references (for aggregate root entity)
        , AccountHashKey
        -- Primary key columns
        , AccountIdentifier
                , AsOfDate
                , EducationOrganizationId
                , FiscalYear
        )
    SELECT 
        HASHBYTES('sha1', 
            AccountIdentifier
                    + '|' + CONVERT(nvarchar, AsOfDate, 23)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, FiscalYear)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            AccountIdentifier
            + '|' + CONVERT(nvarchar, EducationOrganizationId)
            + '|' + CONVERT(nvarchar, FiscalYear)
        )
        , AccountIdentifier
        , AsOfDate
        , EducationOrganizationId
        , FiscalYear
    FROM EdFi_Ods_Populated_Template.edfi.Actual
    -- GO

        INSERT INTO edfi.Actual_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , AmountToDate
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            AccountIdentifier
                    + '|' + CONVERT(nvarchar, AsOfDate, 23)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, FiscalYear)
        )
            , @schoolYearContext
            -- Attributes
            , AmountToDate
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.Actual
    
    INSERT INTO edfi.AdditionalCreditTypeDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , AdditionalCreditTypeDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, AdditionalCreditTypeDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, AdditionalCreditTypeDescriptorId)
        )
        , AdditionalCreditTypeDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.AdditionalCreditTypeDescriptor
    -- GO


    
    INSERT INTO edfi.AddressTypeDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , AddressTypeDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, AddressTypeDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, AddressTypeDescriptorId)
        )
        , AddressTypeDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.AddressTypeDescriptor
    -- GO


    
    INSERT INTO edfi.AdministrationEnvironmentDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , AdministrationEnvironmentDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, AdministrationEnvironmentDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, AdministrationEnvironmentDescriptorId)
        )
        , AdministrationEnvironmentDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.AdministrationEnvironmentDescriptor
    -- GO


    
    INSERT INTO edfi.AdministrativeFundingControlDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , AdministrativeFundingControlDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, AdministrativeFundingControlDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, AdministrativeFundingControlDescriptorId)
        )
        , AdministrativeFundingControlDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.AdministrativeFundingControlDescriptor
    -- GO


    
    INSERT INTO edfi.Assessment (
        HashKey
        -- Identifying references (for aggregate root entity)
        -- Primary key columns
        , AssessmentIdentifier
                , Namespace
        )
    SELECT 
        HASHBYTES('sha1', 
            AssessmentIdentifier
                    + '|' + Namespace
        )
        -- Identifying references
        , AssessmentIdentifier
        , Namespace
    FROM EdFi_Ods_Populated_Template.edfi.Assessment
    -- GO

        INSERT INTO edfi.Assessment_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , AdaptiveAssessment
            , AssessmentFamily
            , AssessmentForm
            , AssessmentTitle
            , AssessmentVersion
            , MaxRawScore
            , Nomenclature
            , RevisionDate
            -- References
            , AssessmentCategoryDescriptorHashKey
            , EducationOrganizationHashKey
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            AssessmentIdentifier
                    + '|' + Namespace
        )
            , @schoolYearContext
            -- Attributes
            , AdaptiveAssessment
            , AssessmentFamily
            , AssessmentForm
            , AssessmentTitle
            , AssessmentVersion
            , MaxRawScore
            , Nomenclature
            , RevisionDate
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, AssessmentCategoryDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
            )
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.Assessment
    
    INSERT INTO edfi.AssessmentAcademicSubject (
        HashKey
        -- Identifying references (for aggregate child entity)
        , AcademicSubjectDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, AcademicSubjectDescriptorId)
                    + '|' + AssessmentIdentifier
                    + '|' + Namespace
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, AcademicSubjectDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.AssessmentAcademicSubject
    -- GO

    INSERT INTO edfi.AssessmentAssessedGradeLevel (
        HashKey
        -- Identifying references (for aggregate child entity)
        , GradeLevelDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            AssessmentIdentifier
                    + '|' + CONVERT(nvarchar, GradeLevelDescriptorId)
                    + '|' + Namespace
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, GradeLevelDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.AssessmentAssessedGradeLevel
    -- GO

    INSERT INTO edfi.AssessmentContentStandard (
        HashKey
        -- Identifying references (for aggregate child entity)
    )
    SELECT
        HASHBYTES('sha1', 
            AssessmentIdentifier
                    + '|' + Namespace
        )
    FROM EdFi_Ods_Populated_Template.edfi.AssessmentContentStandard
    -- GO

        INSERT INTO edfi.AssessmentContentStandard_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            -- Attributes
            , BeginDate
            , EndDate
            , PublicationDate
            , PublicationYear
            , Title
            , URI
            , Version
            -- References
            , MandatingEducationOrganizationHashKey
            , PublicationStatusDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            AssessmentIdentifier
                    + '|' + Namespace
        )
            , @schoolYearContext
            -- Identifying references
            -- Attributes
            , BeginDate
            , EndDate
            , PublicationDate
            , PublicationYear
            , Title
            , URI
            , Version
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, MandatingEducationOrganizationId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, PublicationStatusDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.AssessmentContentStandard
    INSERT INTO edfi.AssessmentContentStandardAuthor (
        HashKey
        -- Identifying references (for aggregate child entity)
        -- Contextual primary key
        , Author
    )
    SELECT
        HASHBYTES('sha1', 
            AssessmentIdentifier
                    + '|' + Namespace
        )
            , Author
    FROM EdFi_Ods_Populated_Template.edfi.AssessmentContentStandardAuthor
    -- GO

    INSERT INTO edfi.AssessmentIdentificationCode (
        HashKey
        -- Identifying references (for aggregate child entity)
        , AssessmentIdentificationSystemDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, AssessmentIdentificationSystemDescriptorId)
                    + '|' + AssessmentIdentifier
                    + '|' + Namespace
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, AssessmentIdentificationSystemDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.AssessmentIdentificationCode
    -- GO

        INSERT INTO edfi.AssessmentIdentificationCode_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , AssessmentIdentificationSystemDescriptorHashKey
            -- Attributes
            , AssigningOrganizationIdentificationCode
            , IdentificationCode
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, AssessmentIdentificationSystemDescriptorId)
                    + '|' + AssessmentIdentifier
                    + '|' + Namespace
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, AssessmentIdentificationSystemDescriptorId)
            )
            -- Attributes
            , AssigningOrganizationIdentificationCode
            , IdentificationCode
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.AssessmentIdentificationCode
    INSERT INTO edfi.AssessmentLanguage (
        HashKey
        -- Identifying references (for aggregate child entity)
        , LanguageDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            AssessmentIdentifier
                    + '|' + CONVERT(nvarchar, LanguageDescriptorId)
                    + '|' + Namespace
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, LanguageDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.AssessmentLanguage
    -- GO

    INSERT INTO edfi.AssessmentPerformanceLevel (
        HashKey
        -- Identifying references (for aggregate child entity)
        , AssessmentReportingMethodDescriptorHashKey
        , PerformanceLevelDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            AssessmentIdentifier
                    + '|' + CONVERT(nvarchar, AssessmentReportingMethodDescriptorId)
                    + '|' + Namespace
                    + '|' + CONVERT(nvarchar, PerformanceLevelDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, AssessmentReportingMethodDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, PerformanceLevelDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.AssessmentPerformanceLevel
    -- GO

        INSERT INTO edfi.AssessmentPerformanceLevel_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , AssessmentReportingMethodDescriptorHashKey
            , PerformanceLevelDescriptorHashKey
            -- Attributes
            , MaximumScore
            , MinimumScore
            -- References
            , ResultDatatypeTypeDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            AssessmentIdentifier
                    + '|' + CONVERT(nvarchar, AssessmentReportingMethodDescriptorId)
                    + '|' + Namespace
                    + '|' + CONVERT(nvarchar, PerformanceLevelDescriptorId)
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, AssessmentReportingMethodDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, PerformanceLevelDescriptorId)
            )
            -- Attributes
            , MaximumScore
            , MinimumScore
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, ResultDatatypeTypeDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.AssessmentPerformanceLevel
    INSERT INTO edfi.AssessmentPeriod (
        HashKey
        -- Identifying references (for aggregate child entity)
    )
    SELECT
        HASHBYTES('sha1', 
            AssessmentIdentifier
                    + '|' + Namespace
        )
    FROM EdFi_Ods_Populated_Template.edfi.AssessmentPeriod
    -- GO

        INSERT INTO edfi.AssessmentPeriod_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            -- Attributes
            , BeginDate
            , EndDate
            -- References
            , AssessmentPeriodDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            AssessmentIdentifier
                    + '|' + Namespace
        )
            , @schoolYearContext
            -- Identifying references
            -- Attributes
            , BeginDate
            , EndDate
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, AssessmentPeriodDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.AssessmentPeriod
    INSERT INTO edfi.AssessmentPlatformType (
        HashKey
        -- Identifying references (for aggregate child entity)
        , PlatformTypeDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            AssessmentIdentifier
                    + '|' + Namespace
                    + '|' + CONVERT(nvarchar, PlatformTypeDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, PlatformTypeDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.AssessmentPlatformType
    -- GO

    INSERT INTO edfi.AssessmentProgram (
        HashKey
        -- Identifying references (for aggregate child entity)
        , ProgramHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            AssessmentIdentifier
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + Namespace
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
            + '|' + ProgramName
            + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.AssessmentProgram
    -- GO

    INSERT INTO edfi.AssessmentScore (
        HashKey
        -- Identifying references (for aggregate child entity)
        , AssessmentReportingMethodDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            AssessmentIdentifier
                    + '|' + CONVERT(nvarchar, AssessmentReportingMethodDescriptorId)
                    + '|' + Namespace
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, AssessmentReportingMethodDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.AssessmentScore
    -- GO

        INSERT INTO edfi.AssessmentScore_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , AssessmentReportingMethodDescriptorHashKey
            -- Attributes
            , MaximumScore
            , MinimumScore
            -- References
            , ResultDatatypeTypeDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            AssessmentIdentifier
                    + '|' + CONVERT(nvarchar, AssessmentReportingMethodDescriptorId)
                    + '|' + Namespace
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, AssessmentReportingMethodDescriptorId)
            )
            -- Attributes
            , MaximumScore
            , MinimumScore
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, ResultDatatypeTypeDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.AssessmentScore
    INSERT INTO edfi.AssessmentSection (
        HashKey
        -- Identifying references (for aggregate child entity)
        , SectionHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            AssessmentIdentifier
                    + '|' + LocalCourseCode
                    + '|' + Namespace
                    + '|' + CONVERT(nvarchar, SchoolId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
                    + '|' + SectionIdentifier
                    + '|' + SessionName
        )
        , HASHBYTES('sha1', 
            LocalCourseCode
            + '|' + CONVERT(nvarchar, SchoolId)
            + '|' + CONVERT(nvarchar, SchoolYear)
            + '|' + SectionIdentifier
            + '|' + SessionName
        )
    FROM EdFi_Ods_Populated_Template.edfi.AssessmentSection
    -- GO

    INSERT INTO edfi.AssessmentCategoryDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , AssessmentCategoryDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, AssessmentCategoryDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, AssessmentCategoryDescriptorId)
        )
        , AssessmentCategoryDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.AssessmentCategoryDescriptor
    -- GO


    
    INSERT INTO edfi.AssessmentIdentificationSystemDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , AssessmentIdentificationSystemDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, AssessmentIdentificationSystemDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, AssessmentIdentificationSystemDescriptorId)
        )
        , AssessmentIdentificationSystemDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.AssessmentIdentificationSystemDescriptor
    -- GO


    
    INSERT INTO edfi.AssessmentItem (
        HashKey
        -- Identifying references (for aggregate root entity)
        , AssessmentHashKey
        -- Primary key columns
        , AssessmentIdentifier
                , IdentificationCode
                , Namespace
        )
    SELECT 
        HASHBYTES('sha1', 
            AssessmentIdentifier
                    + '|' + IdentificationCode
                    + '|' + Namespace
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            AssessmentIdentifier
            + '|' + Namespace
        )
        , AssessmentIdentifier
        , IdentificationCode
        , Namespace
    FROM EdFi_Ods_Populated_Template.edfi.AssessmentItem
    -- GO

        INSERT INTO edfi.AssessmentItem_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , AssessmentItemURI
            , CorrectResponse
            , ExpectedTimeAssessed
            , ItemText
            , MaxRawScore
            , Nomenclature
            -- References
            , AssessmentItemCategoryDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            AssessmentIdentifier
                    + '|' + IdentificationCode
                    + '|' + Namespace
        )
            , @schoolYearContext
            -- Attributes
            , AssessmentItemURI
            , CorrectResponse
            , ExpectedTimeAssessed
            , ItemText
            , MaxRawScore
            , Nomenclature
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, AssessmentItemCategoryDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.AssessmentItem
    
    INSERT INTO edfi.AssessmentItemLearningStandard (
        HashKey
        -- Identifying references (for aggregate child entity)
        , LearningStandardHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            AssessmentIdentifier
                    + '|' + IdentificationCode
                    + '|' + LearningStandardId
                    + '|' + Namespace
        )
        , HASHBYTES('sha1', 
            LearningStandardId
        )
    FROM EdFi_Ods_Populated_Template.edfi.AssessmentItemLearningStandard
    -- GO

    INSERT INTO edfi.AssessmentItemPossibleResponse (
        HashKey
        -- Identifying references (for aggregate child entity)
        -- Contextual primary key
        , ResponseValue
    )
    SELECT
        HASHBYTES('sha1', 
            AssessmentIdentifier
                    + '|' + IdentificationCode
                    + '|' + Namespace
        )
            , ResponseValue
    FROM EdFi_Ods_Populated_Template.edfi.AssessmentItemPossibleResponse
    -- GO

        INSERT INTO edfi.AssessmentItemPossibleResponse_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            -- Contextual primary key
            , ResponseValue
            -- Attributes
            , CorrectResponse
            , ResponseDescription
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            AssessmentIdentifier
                    + '|' + IdentificationCode
                    + '|' + Namespace
                    + '|' + ResponseValue
        )
            , @schoolYearContext
            -- Identifying references
            -- Contextual primary key
            , ResponseValue
            -- Attributes
            , CorrectResponse
            , ResponseDescription
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.AssessmentItemPossibleResponse
    INSERT INTO edfi.AssessmentItemCategoryDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , AssessmentItemCategoryDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, AssessmentItemCategoryDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, AssessmentItemCategoryDescriptorId)
        )
        , AssessmentItemCategoryDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.AssessmentItemCategoryDescriptor
    -- GO


    
    INSERT INTO edfi.AssessmentItemResultDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , AssessmentItemResultDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, AssessmentItemResultDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, AssessmentItemResultDescriptorId)
        )
        , AssessmentItemResultDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.AssessmentItemResultDescriptor
    -- GO


    
    INSERT INTO edfi.AssessmentPeriodDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , AssessmentPeriodDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, AssessmentPeriodDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, AssessmentPeriodDescriptorId)
        )
        , AssessmentPeriodDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.AssessmentPeriodDescriptor
    -- GO


    
    INSERT INTO edfi.AssessmentReportingMethodDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , AssessmentReportingMethodDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, AssessmentReportingMethodDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, AssessmentReportingMethodDescriptorId)
        )
        , AssessmentReportingMethodDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.AssessmentReportingMethodDescriptor
    -- GO


    
    INSERT INTO edfi.AttemptStatusDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , AttemptStatusDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, AttemptStatusDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, AttemptStatusDescriptorId)
        )
        , AttemptStatusDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.AttemptStatusDescriptor
    -- GO


    
    INSERT INTO edfi.AttendanceEventCategoryDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , AttendanceEventCategoryDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, AttendanceEventCategoryDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, AttendanceEventCategoryDescriptorId)
        )
        , AttendanceEventCategoryDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.AttendanceEventCategoryDescriptor
    -- GO


    
    INSERT INTO edfi.BehaviorDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , BehaviorDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, BehaviorDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, BehaviorDescriptorId)
        )
        , BehaviorDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.BehaviorDescriptor
    -- GO


    
    INSERT INTO edfi.BellSchedule (
        HashKey
        -- Identifying references (for aggregate root entity)
        , SchoolHashKey
        -- Primary key columns
        , BellScheduleName
                , SchoolId
        )
    SELECT 
        HASHBYTES('sha1', 
            BellScheduleName
                    + '|' + CONVERT(nvarchar, SchoolId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, SchoolId)
        )
        , BellScheduleName
        , SchoolId
    FROM EdFi_Ods_Populated_Template.edfi.BellSchedule
    -- GO

        INSERT INTO edfi.BellSchedule_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , AlternateDayName
            , EndTime
            , StartTime
            , TotalInstructionalTime
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            BellScheduleName
                    + '|' + CONVERT(nvarchar, SchoolId)
        )
            , @schoolYearContext
            -- Attributes
            , AlternateDayName
            , EndTime
            , StartTime
            , TotalInstructionalTime
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.BellSchedule
    
    INSERT INTO edfi.BellScheduleClassPeriod (
        HashKey
        -- Identifying references (for aggregate child entity)
        , ClassPeriodHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            BellScheduleName
                    + '|' + ClassPeriodName
                    + '|' + CONVERT(nvarchar, SchoolId)
        )
        , HASHBYTES('sha1', 
            ClassPeriodName
            + '|' + CONVERT(nvarchar, SchoolId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.BellScheduleClassPeriod
    -- GO

    INSERT INTO edfi.BellScheduleDate (
        HashKey
        -- Identifying references (for aggregate child entity)
        -- Contextual primary key
        , Date
    )
    SELECT
        HASHBYTES('sha1', 
            BellScheduleName
                    + '|' + CONVERT(nvarchar, SchoolId)
        )
            , Date
    FROM EdFi_Ods_Populated_Template.edfi.BellScheduleDate
    -- GO

    INSERT INTO edfi.BellScheduleGradeLevel (
        HashKey
        -- Identifying references (for aggregate child entity)
        , GradeLevelDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            BellScheduleName
                    + '|' + CONVERT(nvarchar, GradeLevelDescriptorId)
                    + '|' + CONVERT(nvarchar, SchoolId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, GradeLevelDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.BellScheduleGradeLevel
    -- GO

    INSERT INTO edfi.Budget (
        HashKey
        -- Identifying references (for aggregate root entity)
        , AccountHashKey
        -- Primary key columns
        , AccountIdentifier
                , AsOfDate
                , EducationOrganizationId
                , FiscalYear
        )
    SELECT 
        HASHBYTES('sha1', 
            AccountIdentifier
                    + '|' + CONVERT(nvarchar, AsOfDate, 23)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, FiscalYear)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            AccountIdentifier
            + '|' + CONVERT(nvarchar, EducationOrganizationId)
            + '|' + CONVERT(nvarchar, FiscalYear)
        )
        , AccountIdentifier
        , AsOfDate
        , EducationOrganizationId
        , FiscalYear
    FROM EdFi_Ods_Populated_Template.edfi.Budget
    -- GO

        INSERT INTO edfi.Budget_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , Amount
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            AccountIdentifier
                    + '|' + CONVERT(nvarchar, AsOfDate, 23)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, FiscalYear)
        )
            , @schoolYearContext
            -- Attributes
            , Amount
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.Budget
    
    INSERT INTO edfi.Calendar (
        HashKey
        -- Identifying references (for aggregate root entity)
        , SchoolHashKey
        , SchoolYearTypeHashKey
        -- Primary key columns
        , CalendarCode
                , SchoolId
                , SchoolYear
        )
    SELECT 
        HASHBYTES('sha1', 
            CalendarCode
                    + '|' + CONVERT(nvarchar, SchoolId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, SchoolId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, SchoolYear)
        )
        , CalendarCode
        , SchoolId
        , SchoolYear
    FROM EdFi_Ods_Populated_Template.edfi.Calendar
    -- GO

        INSERT INTO edfi.Calendar_Attributes (
            HashKey
            , SchoolYearContext
            -- References
            , CalendarTypeDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            CalendarCode
                    + '|' + CONVERT(nvarchar, SchoolId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
        )
            , @schoolYearContext
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, CalendarTypeDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.Calendar
    
    INSERT INTO edfi.CalendarGradeLevel (
        HashKey
        -- Identifying references (for aggregate child entity)
        , GradeLevelDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CalendarCode
                    + '|' + CONVERT(nvarchar, GradeLevelDescriptorId)
                    + '|' + CONVERT(nvarchar, SchoolId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, GradeLevelDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.CalendarGradeLevel
    -- GO

    INSERT INTO edfi.CalendarDate (
        HashKey
        -- Identifying references (for aggregate root entity)
        , CalendarHashKey
        -- Primary key columns
        , CalendarCode
                , Date
                , SchoolId
                , SchoolYear
        )
    SELECT 
        HASHBYTES('sha1', 
            CalendarCode
                    + '|' + CONVERT(nvarchar, Date, 23)
                    + '|' + CONVERT(nvarchar, SchoolId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CalendarCode
            + '|' + CONVERT(nvarchar, SchoolId)
            + '|' + CONVERT(nvarchar, SchoolYear)
        )
        , CalendarCode
        , Date
        , SchoolId
        , SchoolYear
    FROM EdFi_Ods_Populated_Template.edfi.CalendarDate
    -- GO


    
    INSERT INTO edfi.CalendarDateCalendarEvent (
        HashKey
        -- Identifying references (for aggregate child entity)
        , CalendarEventDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CalendarCode
                    + '|' + CONVERT(nvarchar, CalendarEventDescriptorId)
                    + '|' + CONVERT(nvarchar, Date, 23)
                    + '|' + CONVERT(nvarchar, SchoolId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, CalendarEventDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.CalendarDateCalendarEvent
    -- GO

    INSERT INTO edfi.CalendarEventDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , CalendarEventDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, CalendarEventDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, CalendarEventDescriptorId)
        )
        , CalendarEventDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.CalendarEventDescriptor
    -- GO


    
    INSERT INTO edfi.CalendarTypeDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , CalendarTypeDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, CalendarTypeDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, CalendarTypeDescriptorId)
        )
        , CalendarTypeDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.CalendarTypeDescriptor
    -- GO


    
    INSERT INTO edfi.CareerPathwayDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , CareerPathwayDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, CareerPathwayDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, CareerPathwayDescriptorId)
        )
        , CareerPathwayDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.CareerPathwayDescriptor
    -- GO


    
    INSERT INTO edfi.CharterApprovalAgencyTypeDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , CharterApprovalAgencyTypeDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, CharterApprovalAgencyTypeDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, CharterApprovalAgencyTypeDescriptorId)
        )
        , CharterApprovalAgencyTypeDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.CharterApprovalAgencyTypeDescriptor
    -- GO


    
    INSERT INTO edfi.CharterStatusDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , CharterStatusDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, CharterStatusDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, CharterStatusDescriptorId)
        )
        , CharterStatusDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.CharterStatusDescriptor
    -- GO


    
    INSERT INTO edfi.CitizenshipStatusDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , CitizenshipStatusDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, CitizenshipStatusDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, CitizenshipStatusDescriptorId)
        )
        , CitizenshipStatusDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.CitizenshipStatusDescriptor
    -- GO


    
    INSERT INTO edfi.ClassPeriod (
        HashKey
        -- Identifying references (for aggregate root entity)
        , SchoolHashKey
        -- Primary key columns
        , ClassPeriodName
                , SchoolId
        )
    SELECT 
        HASHBYTES('sha1', 
            ClassPeriodName
                    + '|' + CONVERT(nvarchar, SchoolId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, SchoolId)
        )
        , ClassPeriodName
        , SchoolId
    FROM EdFi_Ods_Populated_Template.edfi.ClassPeriod
    -- GO

        INSERT INTO edfi.ClassPeriod_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , OfficialAttendancePeriod
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            ClassPeriodName
                    + '|' + CONVERT(nvarchar, SchoolId)
        )
            , @schoolYearContext
            -- Attributes
            , OfficialAttendancePeriod
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.ClassPeriod
    
    INSERT INTO edfi.ClassPeriodMeetingTime (
        HashKey
        -- Identifying references (for aggregate child entity)
        -- Contextual primary key
        , EndTime
        , StartTime
    )
    SELECT
        HASHBYTES('sha1', 
            ClassPeriodName
                    + '|' + CONVERT(nvarchar, SchoolId)
        )
            , EndTime
            , StartTime
    FROM EdFi_Ods_Populated_Template.edfi.ClassPeriodMeetingTime
    -- GO

    INSERT INTO edfi.ClassroomPositionDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , ClassroomPositionDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, ClassroomPositionDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, ClassroomPositionDescriptorId)
        )
        , ClassroomPositionDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.ClassroomPositionDescriptor
    -- GO


    
    INSERT INTO edfi.Cohort (
        HashKey
        -- Identifying references (for aggregate root entity)
        , EducationOrganizationHashKey
        -- Primary key columns
        , CohortIdentifier
                , EducationOrganizationId
        )
    SELECT 
        HASHBYTES('sha1', 
            CohortIdentifier
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
        )
        , CohortIdentifier
        , EducationOrganizationId
    FROM EdFi_Ods_Populated_Template.edfi.Cohort
    -- GO

        INSERT INTO edfi.Cohort_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , CohortDescription
            -- References
            , AcademicSubjectDescriptorHashKey
            , CohortScopeDescriptorHashKey
            , CohortTypeDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            CohortIdentifier
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
        )
            , @schoolYearContext
            -- Attributes
            , CohortDescription
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, AcademicSubjectDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, CohortScopeDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, CohortTypeDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.Cohort
    
    INSERT INTO edfi.CohortProgram (
        HashKey
        -- Identifying references (for aggregate child entity)
        , ProgramHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CohortIdentifier
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, ProgramEducationOrganizationId)
            + '|' + ProgramName
            + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.CohortProgram
    -- GO

    INSERT INTO edfi.CohortScopeDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , CohortScopeDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, CohortScopeDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, CohortScopeDescriptorId)
        )
        , CohortScopeDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.CohortScopeDescriptor
    -- GO


    
    INSERT INTO edfi.CohortTypeDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , CohortTypeDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, CohortTypeDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, CohortTypeDescriptorId)
        )
        , CohortTypeDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.CohortTypeDescriptor
    -- GO


    
    INSERT INTO edfi.CohortYearTypeDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , CohortYearTypeDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, CohortYearTypeDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, CohortYearTypeDescriptorId)
        )
        , CohortYearTypeDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.CohortYearTypeDescriptor
    -- GO


    
    INSERT INTO edfi.CommunityOrganization (
        HashKey
        -- Identifying references (for aggregate root entity)
        , EducationOrganizationHashKey
        -- Primary key columns
        , CommunityOrganizationId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, CommunityOrganizationId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, CommunityOrganizationId)
        )
        , CommunityOrganizationId
    FROM EdFi_Ods_Populated_Template.edfi.CommunityOrganization
    -- GO


    
    INSERT INTO edfi.CommunityProvider (
        HashKey
        -- Identifying references (for aggregate root entity)
        , EducationOrganizationHashKey
        -- Primary key columns
        , CommunityProviderId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, CommunityProviderId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, CommunityProviderId)
        )
        , CommunityProviderId
    FROM EdFi_Ods_Populated_Template.edfi.CommunityProvider
    -- GO

        INSERT INTO edfi.CommunityProvider_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , LicenseExemptIndicator
            , SchoolIndicator
            -- References
            , CommunityOrganizationHashKey
            , ProviderCategoryDescriptorHashKey
            , ProviderProfitabilityDescriptorHashKey
            , ProviderStatusDescriptorHashKey
            -- Boilerplate columns
)
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, CommunityProviderId)
        )
            , @schoolYearContext
            -- Attributes
            , LicenseExemptIndicator
            , SchoolIndicator
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, CommunityOrganizationId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, ProviderCategoryDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, ProviderProfitabilityDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, ProviderStatusDescriptorId)
            )
            -- Boilerplate columns
        FROM EdFi_Ods_Populated_Template.edfi.CommunityProvider
    
    INSERT INTO edfi.CommunityProviderLicense (
        HashKey
        -- Identifying references (for aggregate root entity)
        , CommunityProviderHashKey
        -- Primary key columns
        , CommunityProviderId
                , LicenseIdentifier
                , LicensingOrganization
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, CommunityProviderId)
                    + '|' + LicenseIdentifier
                    + '|' + LicensingOrganization
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, CommunityProviderId)
        )
        , CommunityProviderId
        , LicenseIdentifier
        , LicensingOrganization
    FROM EdFi_Ods_Populated_Template.edfi.CommunityProviderLicense
    -- GO

        INSERT INTO edfi.CommunityProviderLicense_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , AuthorizedFacilityCapacity
            , LicenseEffectiveDate
            , LicenseExpirationDate
            , LicenseIssueDate
            , OldestAgeAuthorizedToServe
            , YoungestAgeAuthorizedToServe
            -- References
            , LicenseStatusDescriptorHashKey
            , LicenseTypeDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, CommunityProviderId)
                    + '|' + LicenseIdentifier
                    + '|' + LicensingOrganization
        )
            , @schoolYearContext
            -- Attributes
            , AuthorizedFacilityCapacity
            , LicenseEffectiveDate
            , LicenseExpirationDate
            , LicenseIssueDate
            , OldestAgeAuthorizedToServe
            , YoungestAgeAuthorizedToServe
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, LicenseStatusDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, LicenseTypeDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.CommunityProviderLicense
    
    INSERT INTO edfi.CompetencyLevelDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , CompetencyLevelDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, CompetencyLevelDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, CompetencyLevelDescriptorId)
        )
        , CompetencyLevelDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.CompetencyLevelDescriptor
    -- GO


    
    INSERT INTO edfi.CompetencyObjective (
        HashKey
        -- Identifying references (for aggregate root entity)
        , EducationOrganizationHashKey
        , ObjectiveGradeLevelDescriptorHashKey
        -- Primary key columns
        , EducationOrganizationId
                , Objective
                , ObjectiveGradeLevelDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + Objective
                    + '|' + CONVERT(nvarchar, ObjectiveGradeLevelDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, ObjectiveGradeLevelDescriptorId)
        )
        , EducationOrganizationId
        , Objective
        , ObjectiveGradeLevelDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.CompetencyObjective
    -- GO

        INSERT INTO edfi.CompetencyObjective_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , CompetencyObjectiveId
            , Description
            , SuccessCriteria
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + Objective
                    + '|' + CONVERT(nvarchar, ObjectiveGradeLevelDescriptorId)
        )
            , @schoolYearContext
            -- Attributes
            , CompetencyObjectiveId
            , Description
            , SuccessCriteria
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.CompetencyObjective
    
    INSERT INTO edfi.ContactTypeDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , ContactTypeDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, ContactTypeDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, ContactTypeDescriptorId)
        )
        , ContactTypeDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.ContactTypeDescriptor
    -- GO


    
    INSERT INTO edfi.ContentClassDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , ContentClassDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, ContentClassDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, ContentClassDescriptorId)
        )
        , ContentClassDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.ContentClassDescriptor
    -- GO


    
    INSERT INTO edfi.ContinuationOfServicesReasonDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , ContinuationOfServicesReasonDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, ContinuationOfServicesReasonDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, ContinuationOfServicesReasonDescriptorId)
        )
        , ContinuationOfServicesReasonDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.ContinuationOfServicesReasonDescriptor
    -- GO


    
    INSERT INTO edfi.ContractedStaff (
        HashKey
        -- Identifying references (for aggregate root entity)
        , AccountHashKey
        , StaffHashKey
        -- Primary key columns
        , AccountIdentifier
                , AsOfDate
                , EducationOrganizationId
                , FiscalYear
                , StaffUSI
        )
    SELECT 
        HASHBYTES('sha1', 
            AccountIdentifier
                    + '|' + CONVERT(nvarchar, AsOfDate, 23)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, FiscalYear)
                    + '|' + CONVERT(nvarchar, StaffUSI)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            AccountIdentifier
            + '|' + CONVERT(nvarchar, EducationOrganizationId)
            + '|' + CONVERT(nvarchar, FiscalYear)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, StaffUSI)
        )
        , AccountIdentifier
        , AsOfDate
        , EducationOrganizationId
        , FiscalYear
        , StaffUSI
    FROM EdFi_Ods_Populated_Template.edfi.ContractedStaff
    -- GO

        INSERT INTO edfi.ContractedStaff_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , AmountToDate
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            AccountIdentifier
                    + '|' + CONVERT(nvarchar, AsOfDate, 23)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, FiscalYear)
                    + '|' + CONVERT(nvarchar, StaffUSI)
        )
            , @schoolYearContext
            -- Attributes
            , AmountToDate
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.ContractedStaff
    
    INSERT INTO edfi.CostRateDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , CostRateDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, CostRateDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, CostRateDescriptorId)
        )
        , CostRateDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.CostRateDescriptor
    -- GO


    
    INSERT INTO edfi.CountryDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , CountryDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, CountryDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, CountryDescriptorId)
        )
        , CountryDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.CountryDescriptor
    -- GO


    
    INSERT INTO edfi.Course (
        HashKey
        -- Identifying references (for aggregate root entity)
        , EducationOrganizationHashKey
        -- Primary key columns
        , CourseCode
                , EducationOrganizationId
        )
    SELECT 
        HASHBYTES('sha1', 
            CourseCode
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
        )
        , CourseCode
        , EducationOrganizationId
    FROM EdFi_Ods_Populated_Template.edfi.Course
    -- GO

        INSERT INTO edfi.Course_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , CourseDescription
            , CourseTitle
            , DateCourseAdopted
            , HighSchoolCourseRequirement
            , MaxCompletionsForCredit
            , MaximumAvailableCreditConversion
            , MaximumAvailableCredits
            , MinimumAvailableCreditConversion
            , MinimumAvailableCredits
            , NumberOfParts
            , TimeRequiredForCompletion
            -- References
            , AcademicSubjectDescriptorHashKey
            , CareerPathwayDescriptorHashKey
            , CourseDefinedByDescriptorHashKey
            , CourseGPAApplicabilityDescriptorHashKey
            , MinimumAvailableCreditTypeDescriptorHashKey
            , MaximumAvailableCreditTypeDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            CourseCode
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
        )
            , @schoolYearContext
            -- Attributes
            , CourseDescription
            , CourseTitle
            , DateCourseAdopted
            , HighSchoolCourseRequirement
            , MaxCompletionsForCredit
            , MaximumAvailableCreditConversion
            , MaximumAvailableCredits
            , MinimumAvailableCreditConversion
            , MinimumAvailableCredits
            , NumberOfParts
            , TimeRequiredForCompletion
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, AcademicSubjectDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, CareerPathwayDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, CourseDefinedByDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, CourseGPAApplicabilityDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, MinimumAvailableCreditTypeDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, MaximumAvailableCreditTypeDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.Course
    
    INSERT INTO edfi.CourseCompetencyLevel (
        HashKey
        -- Identifying references (for aggregate child entity)
        , CompetencyLevelDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, CompetencyLevelDescriptorId)
                    + '|' + CourseCode
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, CompetencyLevelDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.CourseCompetencyLevel
    -- GO

    INSERT INTO edfi.CourseIdentificationCode (
        HashKey
        -- Identifying references (for aggregate child entity)
        , CourseIdentificationSystemDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CourseCode
                    + '|' + CONVERT(nvarchar, CourseIdentificationSystemDescriptorId)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, CourseIdentificationSystemDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.CourseIdentificationCode
    -- GO

        INSERT INTO edfi.CourseIdentificationCode_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , CourseIdentificationSystemDescriptorHashKey
            -- Attributes
            , AssigningOrganizationIdentificationCode
            , CourseCatalogURL
            , IdentificationCode
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CourseCode
                    + '|' + CONVERT(nvarchar, CourseIdentificationSystemDescriptorId)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, CourseIdentificationSystemDescriptorId)
            )
            -- Attributes
            , AssigningOrganizationIdentificationCode
            , CourseCatalogURL
            , IdentificationCode
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.CourseIdentificationCode
    INSERT INTO edfi.CourseLearningObjective (
        HashKey
        -- Identifying references (for aggregate child entity)
        , LearningObjectiveHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CourseCode
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + LearningObjectiveId
                    + '|' + Namespace
        )
        , HASHBYTES('sha1', 
            LearningObjectiveId
            + '|' + Namespace
        )
    FROM EdFi_Ods_Populated_Template.edfi.CourseLearningObjective
    -- GO

    INSERT INTO edfi.CourseLearningStandard (
        HashKey
        -- Identifying references (for aggregate child entity)
        , LearningStandardHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CourseCode
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + LearningStandardId
        )
        , HASHBYTES('sha1', 
            LearningStandardId
        )
    FROM EdFi_Ods_Populated_Template.edfi.CourseLearningStandard
    -- GO

    INSERT INTO edfi.CourseLevelCharacteristic (
        HashKey
        -- Identifying references (for aggregate child entity)
        , CourseLevelCharacteristicDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CourseCode
                    + '|' + CONVERT(nvarchar, CourseLevelCharacteristicDescriptorId)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, CourseLevelCharacteristicDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.CourseLevelCharacteristic
    -- GO

    INSERT INTO edfi.CourseOfferedGradeLevel (
        HashKey
        -- Identifying references (for aggregate child entity)
        , GradeLevelDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CourseCode
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, GradeLevelDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, GradeLevelDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.CourseOfferedGradeLevel
    -- GO

    INSERT INTO edfi.CourseAttemptResultDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , CourseAttemptResultDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, CourseAttemptResultDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, CourseAttemptResultDescriptorId)
        )
        , CourseAttemptResultDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.CourseAttemptResultDescriptor
    -- GO


    
    INSERT INTO edfi.CourseDefinedByDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , CourseDefinedByDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, CourseDefinedByDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, CourseDefinedByDescriptorId)
        )
        , CourseDefinedByDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.CourseDefinedByDescriptor
    -- GO


    
    INSERT INTO edfi.CourseGPAApplicabilityDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , CourseGPAApplicabilityDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, CourseGPAApplicabilityDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, CourseGPAApplicabilityDescriptorId)
        )
        , CourseGPAApplicabilityDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.CourseGPAApplicabilityDescriptor
    -- GO


    
    INSERT INTO edfi.CourseIdentificationSystemDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , CourseIdentificationSystemDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, CourseIdentificationSystemDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, CourseIdentificationSystemDescriptorId)
        )
        , CourseIdentificationSystemDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.CourseIdentificationSystemDescriptor
    -- GO


    
    INSERT INTO edfi.CourseLevelCharacteristicDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , CourseLevelCharacteristicDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, CourseLevelCharacteristicDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, CourseLevelCharacteristicDescriptorId)
        )
        , CourseLevelCharacteristicDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.CourseLevelCharacteristicDescriptor
    -- GO


    
    INSERT INTO edfi.CourseOffering (
        HashKey
        -- Identifying references (for aggregate root entity)
        , SchoolHashKey
        , SessionHashKey
        -- Primary key columns
        , LocalCourseCode
                , SchoolId
                , SchoolYear
                , SessionName
        )
    SELECT 
        HASHBYTES('sha1', 
            LocalCourseCode
                    + '|' + CONVERT(nvarchar, SchoolId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
                    + '|' + SessionName
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, SchoolId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, SchoolId)
            + '|' + CONVERT(nvarchar, SchoolYear)
            + '|' + SessionName
        )
        , LocalCourseCode
        , SchoolId
        , SchoolYear
        , SessionName
    FROM EdFi_Ods_Populated_Template.edfi.CourseOffering
    -- GO

        INSERT INTO edfi.CourseOffering_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , InstructionalTimePlanned
            , LocalCourseTitle
            -- References
            , CourseHashKey
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            LocalCourseCode
                    + '|' + CONVERT(nvarchar, SchoolId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
                    + '|' + SessionName
        )
            , @schoolYearContext
            -- Attributes
            , InstructionalTimePlanned
            , LocalCourseTitle
            -- References
            , HASHBYTES('sha1', 
            CourseCode
            + '|' + CONVERT(nvarchar, EducationOrganizationId)
            )
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.CourseOffering
    
    INSERT INTO edfi.CourseOfferingCourseLevelCharacteristic (
        HashKey
        -- Identifying references (for aggregate child entity)
        , CourseLevelCharacteristicDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, CourseLevelCharacteristicDescriptorId)
                    + '|' + LocalCourseCode
                    + '|' + CONVERT(nvarchar, SchoolId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
                    + '|' + SessionName
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, CourseLevelCharacteristicDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.CourseOfferingCourseLevelCharacteristic
    -- GO

    INSERT INTO edfi.CourseOfferingCurriculumUsed (
        HashKey
        -- Identifying references (for aggregate child entity)
        , CurriculumUsedDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, CurriculumUsedDescriptorId)
                    + '|' + LocalCourseCode
                    + '|' + CONVERT(nvarchar, SchoolId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
                    + '|' + SessionName
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, CurriculumUsedDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.CourseOfferingCurriculumUsed
    -- GO

    INSERT INTO edfi.CourseOfferingOfferedGradeLevel (
        HashKey
        -- Identifying references (for aggregate child entity)
        , GradeLevelDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, GradeLevelDescriptorId)
                    + '|' + LocalCourseCode
                    + '|' + CONVERT(nvarchar, SchoolId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
                    + '|' + SessionName
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, GradeLevelDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.CourseOfferingOfferedGradeLevel
    -- GO

    INSERT INTO edfi.CourseRepeatCodeDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , CourseRepeatCodeDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, CourseRepeatCodeDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, CourseRepeatCodeDescriptorId)
        )
        , CourseRepeatCodeDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.CourseRepeatCodeDescriptor
    -- GO


    
    INSERT INTO edfi.CourseTranscript (
        HashKey
        -- Identifying references (for aggregate root entity)
        , CourseHashKey
        , CourseAttemptResultDescriptorHashKey
        , StudentAcademicRecordHashKey
        -- Primary key columns
        , CourseAttemptResultDescriptorId
                , CourseCode
                , CourseEducationOrganizationId
                , EducationOrganizationId
                , SchoolYear
                , StudentUSI
                , TermDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, CourseAttemptResultDescriptorId)
                    + '|' + CourseCode
                    + '|' + CONVERT(nvarchar, CourseEducationOrganizationId)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
                    + '|' + CONVERT(nvarchar, StudentUSI)
                    + '|' + CONVERT(nvarchar, TermDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CourseCode
            + '|' + CONVERT(nvarchar, CourseEducationOrganizationId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, CourseAttemptResultDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
            + '|' + CONVERT(nvarchar, SchoolYear)
            + '|' + CONVERT(nvarchar, StudentUSI)
            + '|' + CONVERT(nvarchar, TermDescriptorId)
        )
        , CourseAttemptResultDescriptorId
        , CourseCode
        , CourseEducationOrganizationId
        , EducationOrganizationId
        , SchoolYear
        , StudentUSI
        , TermDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.CourseTranscript
    -- GO

        INSERT INTO edfi.CourseTranscript_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , AlternativeCourseCode
            , AlternativeCourseTitle
            , AssigningOrganizationIdentificationCode
            , AttemptedCreditConversion
            , AttemptedCredits
            , CourseCatalogURL
            , CourseTitle
            , EarnedCreditConversion
            , EarnedCredits
            , FinalLetterGradeEarned
            , FinalNumericGradeEarned
            -- References
            , CourseRepeatCodeDescriptorHashKey
            , AttemptedCreditTypeDescriptorHashKey
            , EarnedCreditTypeDescriptorHashKey
            , ExternalEducationOrganizationHashKey
            , WhenTakenGradeLevelDescriptorHashKey
            , MethodCreditEarnedDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, CourseAttemptResultDescriptorId)
                    + '|' + CourseCode
                    + '|' + CONVERT(nvarchar, CourseEducationOrganizationId)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
                    + '|' + CONVERT(nvarchar, StudentUSI)
                    + '|' + CONVERT(nvarchar, TermDescriptorId)
        )
            , @schoolYearContext
            -- Attributes
            , AlternativeCourseCode
            , AlternativeCourseTitle
            , AssigningOrganizationIdentificationCode
            , AttemptedCreditConversion
            , AttemptedCredits
            , CourseCatalogURL
            , CourseTitle
            , EarnedCreditConversion
            , EarnedCredits
            , FinalLetterGradeEarned
            , FinalNumericGradeEarned
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, CourseRepeatCodeDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, AttemptedCreditTypeDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, EarnedCreditTypeDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, ExternalEducationOrganizationId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, WhenTakenGradeLevelDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, MethodCreditEarnedDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.CourseTranscript
    
    INSERT INTO edfi.CourseTranscriptAcademicSubject (
        HashKey
        -- Identifying references (for aggregate child entity)
        , AcademicSubjectDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, AcademicSubjectDescriptorId)
                    + '|' + CONVERT(nvarchar, CourseAttemptResultDescriptorId)
                    + '|' + CourseCode
                    + '|' + CONVERT(nvarchar, CourseEducationOrganizationId)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
                    + '|' + CONVERT(nvarchar, StudentUSI)
                    + '|' + CONVERT(nvarchar, TermDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, AcademicSubjectDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.CourseTranscriptAcademicSubject
    -- GO

    INSERT INTO edfi.CourseTranscriptAlternativeCourseIdentificationCode (
        HashKey
        -- Identifying references (for aggregate child entity)
        , CourseIdentificationSystemDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, CourseAttemptResultDescriptorId)
                    + '|' + CourseCode
                    + '|' + CONVERT(nvarchar, CourseEducationOrganizationId)
                    + '|' + CONVERT(nvarchar, CourseIdentificationSystemDescriptorId)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
                    + '|' + CONVERT(nvarchar, StudentUSI)
                    + '|' + CONVERT(nvarchar, TermDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, CourseIdentificationSystemDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.CourseTranscriptAlternativeCourseIdentificationCode
    -- GO

        INSERT INTO edfi.CourseTranscriptAlternativeCourseIdentificationCode_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , CourseIdentificationSystemDescriptorHashKey
            -- Attributes
            , AssigningOrganizationIdentificationCode
            , CourseCatalogURL
            , IdentificationCode
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, CourseAttemptResultDescriptorId)
                    + '|' + CourseCode
                    + '|' + CONVERT(nvarchar, CourseEducationOrganizationId)
                    + '|' + CONVERT(nvarchar, CourseIdentificationSystemDescriptorId)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
                    + '|' + CONVERT(nvarchar, StudentUSI)
                    + '|' + CONVERT(nvarchar, TermDescriptorId)
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, CourseIdentificationSystemDescriptorId)
            )
            -- Attributes
            , AssigningOrganizationIdentificationCode
            , CourseCatalogURL
            , IdentificationCode
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.CourseTranscriptAlternativeCourseIdentificationCode
    INSERT INTO edfi.CourseTranscriptCreditCategory (
        HashKey
        -- Identifying references (for aggregate child entity)
        , CreditCategoryDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, CourseAttemptResultDescriptorId)
                    + '|' + CourseCode
                    + '|' + CONVERT(nvarchar, CourseEducationOrganizationId)
                    + '|' + CONVERT(nvarchar, CreditCategoryDescriptorId)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
                    + '|' + CONVERT(nvarchar, StudentUSI)
                    + '|' + CONVERT(nvarchar, TermDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, CreditCategoryDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.CourseTranscriptCreditCategory
    -- GO

    INSERT INTO edfi.CourseTranscriptEarnedAdditionalCredits (
        HashKey
        -- Identifying references (for aggregate child entity)
        , AdditionalCreditTypeDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, AdditionalCreditTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, CourseAttemptResultDescriptorId)
                    + '|' + CourseCode
                    + '|' + CONVERT(nvarchar, CourseEducationOrganizationId)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
                    + '|' + CONVERT(nvarchar, StudentUSI)
                    + '|' + CONVERT(nvarchar, TermDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, AdditionalCreditTypeDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.CourseTranscriptEarnedAdditionalCredits
    -- GO

        INSERT INTO edfi.CourseTranscriptEarnedAdditionalCredits_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , AdditionalCreditTypeDescriptorHashKey
            -- Attributes
            , Credits
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, AdditionalCreditTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, CourseAttemptResultDescriptorId)
                    + '|' + CourseCode
                    + '|' + CONVERT(nvarchar, CourseEducationOrganizationId)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
                    + '|' + CONVERT(nvarchar, StudentUSI)
                    + '|' + CONVERT(nvarchar, TermDescriptorId)
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, AdditionalCreditTypeDescriptorId)
            )
            -- Attributes
            , Credits
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.CourseTranscriptEarnedAdditionalCredits
    INSERT INTO edfi.Credential (
        HashKey
        -- Identifying references (for aggregate root entity)
        , StateOfIssueStateAbbreviationDescriptorHashKey
        -- Primary key columns
        , CredentialIdentifier
                , StateOfIssueStateAbbreviationDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CredentialIdentifier
                    + '|' + CONVERT(nvarchar, StateOfIssueStateAbbreviationDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, StateOfIssueStateAbbreviationDescriptorId)
        )
        , CredentialIdentifier
        , StateOfIssueStateAbbreviationDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.Credential
    -- GO

        INSERT INTO edfi.Credential_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , EffectiveDate
            , ExpirationDate
            , IssuanceDate
            , Namespace
            -- References
            , CredentialFieldDescriptorHashKey
            , CredentialTypeDescriptorHashKey
            , TeachingCredentialBasisDescriptorHashKey
            , TeachingCredentialDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            CredentialIdentifier
                    + '|' + CONVERT(nvarchar, StateOfIssueStateAbbreviationDescriptorId)
        )
            , @schoolYearContext
            -- Attributes
            , EffectiveDate
            , ExpirationDate
            , IssuanceDate
            , Namespace
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, CredentialFieldDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, CredentialTypeDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, TeachingCredentialBasisDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, TeachingCredentialDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.Credential
    
    INSERT INTO edfi.CredentialAcademicSubject (
        HashKey
        -- Identifying references (for aggregate child entity)
        , AcademicSubjectDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, AcademicSubjectDescriptorId)
                    + '|' + CredentialIdentifier
                    + '|' + CONVERT(nvarchar, StateOfIssueStateAbbreviationDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, AcademicSubjectDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.CredentialAcademicSubject
    -- GO

    INSERT INTO edfi.CredentialEndorsement (
        HashKey
        -- Identifying references (for aggregate child entity)
        -- Contextual primary key
        , CredentialEndorsement
    )
    SELECT
        HASHBYTES('sha1', 
            + '|' + CredentialIdentifier
                    + '|' + CONVERT(nvarchar, StateOfIssueStateAbbreviationDescriptorId)
        )
            , CredentialEndorsement
    FROM EdFi_Ods_Populated_Template.edfi.CredentialEndorsement
    -- GO

    INSERT INTO edfi.CredentialGradeLevel (
        HashKey
        -- Identifying references (for aggregate child entity)
        , GradeLevelDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CredentialIdentifier
                    + '|' + CONVERT(nvarchar, GradeLevelDescriptorId)
                    + '|' + CONVERT(nvarchar, StateOfIssueStateAbbreviationDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, GradeLevelDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.CredentialGradeLevel
    -- GO

    INSERT INTO edfi.CredentialFieldDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , CredentialFieldDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, CredentialFieldDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, CredentialFieldDescriptorId)
        )
        , CredentialFieldDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.CredentialFieldDescriptor
    -- GO


    
    INSERT INTO edfi.CredentialTypeDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , CredentialTypeDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, CredentialTypeDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, CredentialTypeDescriptorId)
        )
        , CredentialTypeDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.CredentialTypeDescriptor
    -- GO


    
    INSERT INTO edfi.CreditCategoryDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , CreditCategoryDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, CreditCategoryDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, CreditCategoryDescriptorId)
        )
        , CreditCategoryDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.CreditCategoryDescriptor
    -- GO


    
    INSERT INTO edfi.CreditTypeDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , CreditTypeDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, CreditTypeDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, CreditTypeDescriptorId)
        )
        , CreditTypeDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.CreditTypeDescriptor
    -- GO


    
    INSERT INTO edfi.CTEProgramServiceDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , CTEProgramServiceDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, CTEProgramServiceDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, CTEProgramServiceDescriptorId)
        )
        , CTEProgramServiceDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.CTEProgramServiceDescriptor
    -- GO


    
    INSERT INTO edfi.CurriculumUsedDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , CurriculumUsedDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, CurriculumUsedDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, CurriculumUsedDescriptorId)
        )
        , CurriculumUsedDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.CurriculumUsedDescriptor
    -- GO


    
    INSERT INTO edfi.DeliveryMethodDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , DeliveryMethodDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, DeliveryMethodDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, DeliveryMethodDescriptorId)
        )
        , DeliveryMethodDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.DeliveryMethodDescriptor
    -- GO


    
    INSERT INTO edfi.Descriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        -- Primary key columns
        , DescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, DescriptorId)
        )
        -- Identifying references
        , DescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.Descriptor
    -- GO

        INSERT INTO edfi.Descriptor_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , CodeValue
            , Description
            , EffectiveBeginDate
            , EffectiveEndDate
            , Namespace
            , PriorDescriptorId
            , ShortDescription
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, DescriptorId)
        )
            , @schoolYearContext
            -- Attributes
            , CodeValue
            , Description
            , EffectiveBeginDate
            , EffectiveEndDate
            , Namespace
            , PriorDescriptorId
            , ShortDescription
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.Descriptor
    
    INSERT INTO edfi.DiagnosisDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , DiagnosisDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, DiagnosisDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, DiagnosisDescriptorId)
        )
        , DiagnosisDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.DiagnosisDescriptor
    -- GO


    
    INSERT INTO edfi.DiplomaLevelDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , DiplomaLevelDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, DiplomaLevelDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, DiplomaLevelDescriptorId)
        )
        , DiplomaLevelDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.DiplomaLevelDescriptor
    -- GO


    
    INSERT INTO edfi.DiplomaTypeDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , DiplomaTypeDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, DiplomaTypeDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, DiplomaTypeDescriptorId)
        )
        , DiplomaTypeDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.DiplomaTypeDescriptor
    -- GO


    
    INSERT INTO edfi.DisabilityDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , DisabilityDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, DisabilityDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, DisabilityDescriptorId)
        )
        , DisabilityDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.DisabilityDescriptor
    -- GO


    
    INSERT INTO edfi.DisabilityDesignationDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , DisabilityDesignationDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, DisabilityDesignationDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, DisabilityDesignationDescriptorId)
        )
        , DisabilityDesignationDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.DisabilityDesignationDescriptor
    -- GO


    
    INSERT INTO edfi.DisabilityDeterminationSourceTypeDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , DisabilityDeterminationSourceTypeDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, DisabilityDeterminationSourceTypeDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, DisabilityDeterminationSourceTypeDescriptorId)
        )
        , DisabilityDeterminationSourceTypeDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.DisabilityDeterminationSourceTypeDescriptor
    -- GO


    
    INSERT INTO edfi.DisciplineAction (
        HashKey
        -- Identifying references (for aggregate root entity)
        , StudentHashKey
        -- Primary key columns
        , DisciplineActionIdentifier
                , DisciplineDate
                , StudentUSI
        )
    SELECT 
        HASHBYTES('sha1', 
            DisciplineActionIdentifier
                    + '|' + CONVERT(nvarchar, DisciplineDate, 23)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, StudentUSI)
        )
        , DisciplineActionIdentifier
        , DisciplineDate
        , StudentUSI
    FROM EdFi_Ods_Populated_Template.edfi.DisciplineAction
    -- GO

        INSERT INTO edfi.DisciplineAction_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , ActualDisciplineActionLength
            , DisciplineActionLength
            , IEPPlacementMeetingIndicator
            , ReceivedEducationServicesDuringExpulsion
            , RelatedToZeroTolerancePolicy
            -- References
            , DisciplineActionLengthDifferenceReasonDescriptorHashKey
            , ResponsibilitySchoolHashKey
            , AssignmentSchoolHashKey
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            DisciplineActionIdentifier
                    + '|' + CONVERT(nvarchar, DisciplineDate, 23)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- Attributes
            , ActualDisciplineActionLength
            , DisciplineActionLength
            , IEPPlacementMeetingIndicator
            , ReceivedEducationServicesDuringExpulsion
            , RelatedToZeroTolerancePolicy
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, DisciplineActionLengthDifferenceReasonDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, ResponsibilitySchoolId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, AssignmentSchoolId)
            )
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.DisciplineAction
    
    INSERT INTO edfi.DisciplineActionDiscipline (
        HashKey
        -- Identifying references (for aggregate child entity)
        , DisciplineDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            DisciplineActionIdentifier
                    + '|' + CONVERT(nvarchar, DisciplineDate, 23)
                    + '|' + CONVERT(nvarchar, DisciplineDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, DisciplineDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.DisciplineActionDiscipline
    -- GO

    INSERT INTO edfi.DisciplineActionStaff (
        HashKey
        -- Identifying references (for aggregate child entity)
        , StaffHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            DisciplineActionIdentifier
                    + '|' + CONVERT(nvarchar, DisciplineDate, 23)
                    + '|' + CONVERT(nvarchar, StaffUSI)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, StaffUSI)
        )
    FROM EdFi_Ods_Populated_Template.edfi.DisciplineActionStaff
    -- GO

    INSERT INTO edfi.DisciplineActionStudentDisciplineIncidentAssociation (
        HashKey
        -- Identifying references (for aggregate child entity)
        , StudentDisciplineIncidentAssociationHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            DisciplineActionIdentifier
                    + '|' + CONVERT(nvarchar, DisciplineDate, 23)
                    + '|' + IncidentIdentifier
                    + '|' + CONVERT(nvarchar, SchoolId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        , HASHBYTES('sha1', 
            IncidentIdentifier
            + '|' + CONVERT(nvarchar, SchoolId)
            + '|' + CONVERT(nvarchar, StudentUSI)
        )
    FROM EdFi_Ods_Populated_Template.edfi.DisciplineActionStudentDisciplineIncidentAssociation
    -- GO

    INSERT INTO edfi.DisciplineActionLengthDifferenceReasonDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , DisciplineActionLengthDifferenceReasonDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, DisciplineActionLengthDifferenceReasonDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, DisciplineActionLengthDifferenceReasonDescriptorId)
        )
        , DisciplineActionLengthDifferenceReasonDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.DisciplineActionLengthDifferenceReasonDescriptor
    -- GO


    
    INSERT INTO edfi.DisciplineDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , DisciplineDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, DisciplineDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, DisciplineDescriptorId)
        )
        , DisciplineDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.DisciplineDescriptor
    -- GO


    
    INSERT INTO edfi.DisciplineIncident (
        HashKey
        -- Identifying references (for aggregate root entity)
        , SchoolHashKey
        -- Primary key columns
        , IncidentIdentifier
                , SchoolId
        )
    SELECT 
        HASHBYTES('sha1', 
            IncidentIdentifier
                    + '|' + CONVERT(nvarchar, SchoolId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, SchoolId)
        )
        , IncidentIdentifier
        , SchoolId
    FROM EdFi_Ods_Populated_Template.edfi.DisciplineIncident
    -- GO

        INSERT INTO edfi.DisciplineIncident_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , CaseNumber
            , IncidentCost
            , IncidentDate
            , IncidentDescription
            , IncidentTime
            , ReportedToLawEnforcement
            , ReporterName
            -- References
            , IncidentLocationDescriptorHashKey
            , ReporterDescriptionDescriptorHashKey
            , StaffHashKey
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            IncidentIdentifier
                    + '|' + CONVERT(nvarchar, SchoolId)
        )
            , @schoolYearContext
            -- Attributes
            , CaseNumber
            , IncidentCost
            , IncidentDate
            , IncidentDescription
            , IncidentTime
            , ReportedToLawEnforcement
            , ReporterName
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, IncidentLocationDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, ReporterDescriptionDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, StaffUSI)
            )
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.DisciplineIncident
    
    INSERT INTO edfi.DisciplineIncidentBehavior (
        HashKey
        -- Identifying references (for aggregate child entity)
        , BehaviorDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, BehaviorDescriptorId)
                    + '|' + IncidentIdentifier
                    + '|' + CONVERT(nvarchar, SchoolId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, BehaviorDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.DisciplineIncidentBehavior
    -- GO

        INSERT INTO edfi.DisciplineIncidentBehavior_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , BehaviorDescriptorHashKey
            -- Attributes
            , BehaviorDetailedDescription
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, BehaviorDescriptorId)
                    + '|' + IncidentIdentifier
                    + '|' + CONVERT(nvarchar, SchoolId)
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, BehaviorDescriptorId)
            )
            -- Attributes
            , BehaviorDetailedDescription
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.DisciplineIncidentBehavior
    INSERT INTO edfi.DisciplineIncidentExternalParticipant (
        HashKey
        -- Identifying references (for aggregate child entity)
        , DisciplineIncidentParticipationCodeDescriptorHashKey
        -- Contextual primary key
        , FirstName
        , LastSurname
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, DisciplineIncidentParticipationCodeDescriptorId)
                    + '|' + IncidentIdentifier
                    + '|' + CONVERT(nvarchar, SchoolId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, DisciplineIncidentParticipationCodeDescriptorId)
        )
            , FirstName
            , LastSurname
    FROM EdFi_Ods_Populated_Template.edfi.DisciplineIncidentExternalParticipant
    -- GO

    INSERT INTO edfi.DisciplineIncidentWeapon (
        HashKey
        -- Identifying references (for aggregate child entity)
        , WeaponDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            IncidentIdentifier
                    + '|' + CONVERT(nvarchar, SchoolId)
                    + '|' + CONVERT(nvarchar, WeaponDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, WeaponDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.DisciplineIncidentWeapon
    -- GO

    INSERT INTO edfi.DisciplineIncidentParticipationCodeDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , DisciplineIncidentParticipationCodeDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, DisciplineIncidentParticipationCodeDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, DisciplineIncidentParticipationCodeDescriptorId)
        )
        , DisciplineIncidentParticipationCodeDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.DisciplineIncidentParticipationCodeDescriptor
    -- GO


    
    INSERT INTO edfi.EducationalEnvironmentDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , EducationalEnvironmentDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationalEnvironmentDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationalEnvironmentDescriptorId)
        )
        , EducationalEnvironmentDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.EducationalEnvironmentDescriptor
    -- GO


    
    INSERT INTO edfi.EducationContent (
        HashKey
        -- Identifying references (for aggregate root entity)
        -- Primary key columns
        , ContentIdentifier
        )
    SELECT 
        HASHBYTES('sha1', 
            ContentIdentifier
        )
        -- Identifying references
        , ContentIdentifier
    FROM EdFi_Ods_Populated_Template.edfi.EducationContent
    -- GO

        INSERT INTO edfi.EducationContent_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , AdditionalAuthorsIndicator
            , Cost
            , Description
            , LearningResourceMetadataURI
            , Namespace
            , PublicationDate
            , PublicationYear
            , Publisher
            , ShortDescription
            , TimeRequired
            , UseRightsURL
            , Version
            -- References
            , ContentClassDescriptorHashKey
            , CostRateDescriptorHashKey
            , InteractivityStyleDescriptorHashKey
            , LearningStandardHashKey
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            ContentIdentifier
        )
            , @schoolYearContext
            -- Attributes
            , AdditionalAuthorsIndicator
            , Cost
            , Description
            , LearningResourceMetadataURI
            , Namespace
            , PublicationDate
            , PublicationYear
            , Publisher
            , ShortDescription
            , TimeRequired
            , UseRightsURL
            , Version
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, ContentClassDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, CostRateDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, InteractivityStyleDescriptorId)
            )
            , HASHBYTES('sha1', 
            LearningStandardId
            )
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.EducationContent
    
    INSERT INTO edfi.EducationContentAppropriateGradeLevel (
        HashKey
        -- Identifying references (for aggregate child entity)
        , GradeLevelDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            ContentIdentifier
                    + '|' + CONVERT(nvarchar, GradeLevelDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, GradeLevelDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.EducationContentAppropriateGradeLevel
    -- GO

    INSERT INTO edfi.EducationContentAppropriateSex (
        HashKey
        -- Identifying references (for aggregate child entity)
        , SexDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            ContentIdentifier
                    + '|' + CONVERT(nvarchar, SexDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, SexDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.EducationContentAppropriateSex
    -- GO

    INSERT INTO edfi.EducationContentAuthor (
        HashKey
        -- Identifying references (for aggregate child entity)
        -- Contextual primary key
        , Author
    )
    SELECT
        HASHBYTES('sha1', 
            + '|' + ContentIdentifier
        )
            , Author
    FROM EdFi_Ods_Populated_Template.edfi.EducationContentAuthor
    -- GO

    INSERT INTO edfi.EducationContentDerivativeSourceEducationContent (
        HashKey
        -- Identifying references (for aggregate child entity)
    )
    SELECT
        HASHBYTES('sha1', 
            ContentIdentifier
                    + '|' + DerivativeSourceContentIdentifier
        )
    FROM EdFi_Ods_Populated_Template.edfi.EducationContentDerivativeSourceEducationContent
    -- GO

    INSERT INTO edfi.EducationContentDerivativeSourceLearningResourceMetadataURI (
        HashKey
        -- Identifying references (for aggregate child entity)
        -- Contextual primary key
        , DerivativeSourceLearningResourceMetadataURI
    )
    SELECT
        HASHBYTES('sha1', 
            ContentIdentifier
        )
            , DerivativeSourceLearningResourceMetadataURI
    FROM EdFi_Ods_Populated_Template.edfi.EducationContentDerivativeSourceLearningResourceMetadataURI
    -- GO

    INSERT INTO edfi.EducationContentDerivativeSourceURI (
        HashKey
        -- Identifying references (for aggregate child entity)
        -- Contextual primary key
        , DerivativeSourceURI
    )
    SELECT
        HASHBYTES('sha1', 
            ContentIdentifier
        )
            , DerivativeSourceURI
    FROM EdFi_Ods_Populated_Template.edfi.EducationContentDerivativeSourceURI
    -- GO

    INSERT INTO edfi.EducationContentLanguage (
        HashKey
        -- Identifying references (for aggregate child entity)
        , LanguageDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            ContentIdentifier
                    + '|' + CONVERT(nvarchar, LanguageDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, LanguageDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.EducationContentLanguage
    -- GO

    INSERT INTO edfi.EducationOrganization (
        HashKey
        -- Identifying references (for aggregate root entity)
        -- Primary key columns
        , EducationOrganizationId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
        )
        -- Identifying references
        , EducationOrganizationId
    FROM EdFi_Ods_Populated_Template.edfi.EducationOrganization
    -- GO

        INSERT INTO edfi.EducationOrganization_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , NameOfInstitution
            , ShortNameOfInstitution
            , WebSite
            -- References
            , OperationalStatusDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
        )
            , @schoolYearContext
            -- Attributes
            , NameOfInstitution
            , ShortNameOfInstitution
            , WebSite
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, OperationalStatusDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.EducationOrganization
    
    INSERT INTO edfi.EducationOrganizationAddress (
        HashKey
        -- Identifying references (for aggregate child entity)
        , AddressTypeDescriptorHashKey
        , StateAbbreviationDescriptorHashKey
        -- Contextual primary key
        , City
        , PostalCode
        , StreetNumberName
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, AddressTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, StateAbbreviationDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, AddressTypeDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, StateAbbreviationDescriptorId)
        )
            , City
            , PostalCode
            , StreetNumberName
    FROM EdFi_Ods_Populated_Template.edfi.EducationOrganizationAddress
    -- GO

        INSERT INTO edfi.EducationOrganizationAddress_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , AddressTypeDescriptorHashKey
            , StateAbbreviationDescriptorHashKey
            -- Contextual primary key
            , City
            , PostalCode
            , StreetNumberName
            -- Attributes
            , ApartmentRoomSuiteNumber
            , BuildingSiteNumber
            , CongressionalDistrict
            , CountyFIPSCode
            , DoNotPublishIndicator
            , Latitude
            , Longitude
            , NameOfCounty
            -- References
            , LocaleDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, AddressTypeDescriptorId)
                    + '|' + City
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + PostalCode
                    + '|' + CONVERT(nvarchar, StateAbbreviationDescriptorId)
                    + '|' + StreetNumberName
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, AddressTypeDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, StateAbbreviationDescriptorId)
            )
            -- Contextual primary key
            , City
            , PostalCode
            , StreetNumberName
            -- Attributes
            , ApartmentRoomSuiteNumber
            , BuildingSiteNumber
            , CongressionalDistrict
            , CountyFIPSCode
            , DoNotPublishIndicator
            , Latitude
            , Longitude
            , NameOfCounty
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, LocaleDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.EducationOrganizationAddress
    INSERT INTO edfi.EducationOrganizationAddressPeriod (
        HashKey
        -- Identifying references (for aggregate child entity)
        -- Contextual primary key
        , BeginDate
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, AddressTypeDescriptorId)
                    + '|' + City
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + PostalCode
                    + '|' + CONVERT(nvarchar, StateAbbreviationDescriptorId)
                    + '|' + StreetNumberName
        )
            , BeginDate
    FROM EdFi_Ods_Populated_Template.edfi.EducationOrganizationAddressPeriod
    -- GO

        INSERT INTO edfi.EducationOrganizationAddressPeriod_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            -- Contextual primary key
            , BeginDate
            -- Attributes
            , EndDate
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, AddressTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, BeginDate, 23)
                    + '|' + City
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + PostalCode
                    + '|' + CONVERT(nvarchar, StateAbbreviationDescriptorId)
                    + '|' + StreetNumberName
        )
            , @schoolYearContext
            -- Identifying references
            -- Contextual primary key
            , BeginDate
            -- Attributes
            , EndDate
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.EducationOrganizationAddressPeriod
    INSERT INTO edfi.EducationOrganizationCategory (
        HashKey
        -- Identifying references (for aggregate child entity)
        , EducationOrganizationCategoryDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationCategoryDescriptorId)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationCategoryDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.EducationOrganizationCategory
    -- GO

    INSERT INTO edfi.EducationOrganizationIdentificationCode (
        HashKey
        -- Identifying references (for aggregate child entity)
        , EducationOrganizationIdentificationSystemDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, EducationOrganizationIdentificationSystemDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationIdentificationSystemDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.EducationOrganizationIdentificationCode
    -- GO

        INSERT INTO edfi.EducationOrganizationIdentificationCode_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , EducationOrganizationIdentificationSystemDescriptorHashKey
            -- Attributes
            , IdentificationCode
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, EducationOrganizationIdentificationSystemDescriptorId)
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationIdentificationSystemDescriptorId)
            )
            -- Attributes
            , IdentificationCode
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.EducationOrganizationIdentificationCode
    INSERT INTO edfi.EducationOrganizationIndicator (
        HashKey
        -- Identifying references (for aggregate child entity)
        , IndicatorDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, IndicatorDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, IndicatorDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.EducationOrganizationIndicator
    -- GO

        INSERT INTO edfi.EducationOrganizationIndicator_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , IndicatorDescriptorHashKey
            -- Attributes
            , DesignatedBy
            , IndicatorValue
            -- References
            , IndicatorGroupDescriptorHashKey
            , IndicatorLevelDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, IndicatorDescriptorId)
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, IndicatorDescriptorId)
            )
            -- Attributes
            , DesignatedBy
            , IndicatorValue
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, IndicatorGroupDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, IndicatorLevelDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.EducationOrganizationIndicator
    INSERT INTO edfi.EducationOrganizationIndicatorPeriod (
        HashKey
        -- Identifying references (for aggregate child entity)
        -- Contextual primary key
        , BeginDate
    )
    SELECT
        HASHBYTES('sha1', 
            + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, IndicatorDescriptorId)
        )
            , BeginDate
    FROM EdFi_Ods_Populated_Template.edfi.EducationOrganizationIndicatorPeriod
    -- GO

        INSERT INTO edfi.EducationOrganizationIndicatorPeriod_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            -- Contextual primary key
            , BeginDate
            -- Attributes
            , EndDate
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, IndicatorDescriptorId)
        )
            , @schoolYearContext
            -- Identifying references
            -- Contextual primary key
            , BeginDate
            -- Attributes
            , EndDate
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.EducationOrganizationIndicatorPeriod
    INSERT INTO edfi.EducationOrganizationInstitutionTelephone (
        HashKey
        -- Identifying references (for aggregate child entity)
        , InstitutionTelephoneNumberTypeDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, InstitutionTelephoneNumberTypeDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, InstitutionTelephoneNumberTypeDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.EducationOrganizationInstitutionTelephone
    -- GO

        INSERT INTO edfi.EducationOrganizationInstitutionTelephone_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , InstitutionTelephoneNumberTypeDescriptorHashKey
            -- Attributes
            , TelephoneNumber
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, InstitutionTelephoneNumberTypeDescriptorId)
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, InstitutionTelephoneNumberTypeDescriptorId)
            )
            -- Attributes
            , TelephoneNumber
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.EducationOrganizationInstitutionTelephone
    INSERT INTO edfi.EducationOrganizationInternationalAddress (
        HashKey
        -- Identifying references (for aggregate child entity)
        , AddressTypeDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, AddressTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, AddressTypeDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.EducationOrganizationInternationalAddress
    -- GO

        INSERT INTO edfi.EducationOrganizationInternationalAddress_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , AddressTypeDescriptorHashKey
            -- Attributes
            , AddressLine1
            , AddressLine2
            , AddressLine3
            , AddressLine4
            , BeginDate
            , EndDate
            , Latitude
            , Longitude
            -- References
            , CountryDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, AddressTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, AddressTypeDescriptorId)
            )
            -- Attributes
            , AddressLine1
            , AddressLine2
            , AddressLine3
            , AddressLine4
            , BeginDate
            , EndDate
            , Latitude
            , Longitude
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, CountryDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.EducationOrganizationInternationalAddress
    INSERT INTO edfi.EducationOrganizationCategoryDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , EducationOrganizationCategoryDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationCategoryDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationCategoryDescriptorId)
        )
        , EducationOrganizationCategoryDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.EducationOrganizationCategoryDescriptor
    -- GO


    
    INSERT INTO edfi.EducationOrganizationIdentificationSystemDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , EducationOrganizationIdentificationSystemDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationIdentificationSystemDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationIdentificationSystemDescriptorId)
        )
        , EducationOrganizationIdentificationSystemDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.EducationOrganizationIdentificationSystemDescriptor
    -- GO


    
    INSERT INTO edfi.EducationOrganizationInterventionPrescriptionAssociation (
        HashKey
        -- Identifying references (for aggregate root entity)
        , EducationOrganizationHashKey
        , InterventionPrescriptionHashKey
        -- Primary key columns
        , EducationOrganizationId
                , InterventionPrescriptionEducationOrganizationId
                , InterventionPrescriptionIdentificationCode
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, InterventionPrescriptionEducationOrganizationId)
                    + '|' + InterventionPrescriptionIdentificationCode
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, InterventionPrescriptionEducationOrganizationId)
            + '|' + InterventionPrescriptionIdentificationCode
        )
        , EducationOrganizationId
        , InterventionPrescriptionEducationOrganizationId
        , InterventionPrescriptionIdentificationCode
    FROM EdFi_Ods_Populated_Template.edfi.EducationOrganizationInterventionPrescriptionAssociation
    -- GO

        INSERT INTO edfi.EducationOrganizationInterventionPrescriptionAssociation_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , BeginDate
            , EndDate
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, InterventionPrescriptionEducationOrganizationId)
                    + '|' + InterventionPrescriptionIdentificationCode
        )
            , @schoolYearContext
            -- Attributes
            , BeginDate
            , EndDate
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.EducationOrganizationInterventionPrescriptionAssociation
    
    INSERT INTO edfi.EducationOrganizationNetwork (
        HashKey
        -- Identifying references (for aggregate root entity)
        , EducationOrganizationHashKey
        -- Primary key columns
        , EducationOrganizationNetworkId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationNetworkId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationNetworkId)
        )
        , EducationOrganizationNetworkId
    FROM EdFi_Ods_Populated_Template.edfi.EducationOrganizationNetwork
    -- GO

        INSERT INTO edfi.EducationOrganizationNetwork_Attributes (
            HashKey
            , SchoolYearContext
            -- References
            , NetworkPurposeDescriptorHashKey
            -- Boilerplate columns
)
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationNetworkId)
        )
            , @schoolYearContext
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, NetworkPurposeDescriptorId)
            )
            -- Boilerplate columns
        FROM EdFi_Ods_Populated_Template.edfi.EducationOrganizationNetwork
    
    INSERT INTO edfi.EducationOrganizationNetworkAssociation (
        HashKey
        -- Identifying references (for aggregate root entity)
        , MemberEducationOrganizationHashKey
        , EducationOrganizationNetworkHashKey
        -- Primary key columns
        , EducationOrganizationNetworkId
                , MemberEducationOrganizationId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationNetworkId)
                    + '|' + CONVERT(nvarchar, MemberEducationOrganizationId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, MemberEducationOrganizationId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationNetworkId)
        )
        , EducationOrganizationNetworkId
        , MemberEducationOrganizationId
    FROM EdFi_Ods_Populated_Template.edfi.EducationOrganizationNetworkAssociation
    -- GO

        INSERT INTO edfi.EducationOrganizationNetworkAssociation_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , BeginDate
            , EndDate
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationNetworkId)
                    + '|' + CONVERT(nvarchar, MemberEducationOrganizationId)
        )
            , @schoolYearContext
            -- Attributes
            , BeginDate
            , EndDate
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.EducationOrganizationNetworkAssociation
    
    INSERT INTO edfi.EducationOrganizationPeerAssociation (
        HashKey
        -- Identifying references (for aggregate root entity)
        , EducationOrganizationHashKey
        , PeerEducationOrganizationHashKey
        -- Primary key columns
        , EducationOrganizationId
                , PeerEducationOrganizationId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, PeerEducationOrganizationId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, PeerEducationOrganizationId)
        )
        , EducationOrganizationId
        , PeerEducationOrganizationId
    FROM EdFi_Ods_Populated_Template.edfi.EducationOrganizationPeerAssociation
    -- GO


    
    INSERT INTO edfi.EducationPlanDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , EducationPlanDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationPlanDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationPlanDescriptorId)
        )
        , EducationPlanDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.EducationPlanDescriptor
    -- GO


    
    INSERT INTO edfi.EducationServiceCenter (
        HashKey
        -- Identifying references (for aggregate root entity)
        , EducationOrganizationHashKey
        -- Primary key columns
        , EducationServiceCenterId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationServiceCenterId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationServiceCenterId)
        )
        , EducationServiceCenterId
    FROM EdFi_Ods_Populated_Template.edfi.EducationServiceCenter
    -- GO

        INSERT INTO edfi.EducationServiceCenter_Attributes (
            HashKey
            , SchoolYearContext
            -- References
            , StateEducationAgencyHashKey
            -- Boilerplate columns
)
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationServiceCenterId)
        )
            , @schoolYearContext
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, StateEducationAgencyId)
            )
            -- Boilerplate columns
        FROM EdFi_Ods_Populated_Template.edfi.EducationServiceCenter
    
    INSERT INTO edfi.ElectronicMailTypeDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , ElectronicMailTypeDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, ElectronicMailTypeDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, ElectronicMailTypeDescriptorId)
        )
        , ElectronicMailTypeDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.ElectronicMailTypeDescriptor
    -- GO


    
    INSERT INTO edfi.EmploymentStatusDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , EmploymentStatusDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EmploymentStatusDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, EmploymentStatusDescriptorId)
        )
        , EmploymentStatusDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.EmploymentStatusDescriptor
    -- GO


    
    INSERT INTO edfi.EntryGradeLevelReasonDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , EntryGradeLevelReasonDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EntryGradeLevelReasonDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, EntryGradeLevelReasonDescriptorId)
        )
        , EntryGradeLevelReasonDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.EntryGradeLevelReasonDescriptor
    -- GO


    
    INSERT INTO edfi.EntryTypeDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , EntryTypeDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EntryTypeDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, EntryTypeDescriptorId)
        )
        , EntryTypeDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.EntryTypeDescriptor
    -- GO


    
    INSERT INTO edfi.EventCircumstanceDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , EventCircumstanceDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EventCircumstanceDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, EventCircumstanceDescriptorId)
        )
        , EventCircumstanceDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.EventCircumstanceDescriptor
    -- GO


    
    INSERT INTO edfi.ExitWithdrawTypeDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , ExitWithdrawTypeDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, ExitWithdrawTypeDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, ExitWithdrawTypeDescriptorId)
        )
        , ExitWithdrawTypeDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.ExitWithdrawTypeDescriptor
    -- GO


    
    INSERT INTO edfi.FeederSchoolAssociation (
        HashKey
        -- Identifying references (for aggregate root entity)
        , FeederSchoolHashKey
        , SchoolHashKey
        -- Primary key columns
        , BeginDate
                , FeederSchoolId
                , SchoolId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, FeederSchoolId)
                    + '|' + CONVERT(nvarchar, SchoolId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, FeederSchoolId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, SchoolId)
        )
        , BeginDate
        , FeederSchoolId
        , SchoolId
    FROM EdFi_Ods_Populated_Template.edfi.FeederSchoolAssociation
    -- GO

        INSERT INTO edfi.FeederSchoolAssociation_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , EndDate
            , FeederRelationshipDescription
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, FeederSchoolId)
                    + '|' + CONVERT(nvarchar, SchoolId)
        )
            , @schoolYearContext
            -- Attributes
            , EndDate
            , FeederRelationshipDescription
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.FeederSchoolAssociation
    
    INSERT INTO edfi.GeneralStudentProgramAssociation (
        HashKey
        -- Identifying references (for aggregate root entity)
        , EducationOrganizationHashKey
        , ProgramHashKey
        , StudentHashKey
        -- Primary key columns
        , BeginDate
                , EducationOrganizationId
                , ProgramEducationOrganizationId
                , ProgramName
                , ProgramTypeDescriptorId
                , StudentUSI
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, ProgramEducationOrganizationId)
            + '|' + ProgramName
            + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, StudentUSI)
        )
        , BeginDate
        , EducationOrganizationId
        , ProgramEducationOrganizationId
        , ProgramName
        , ProgramTypeDescriptorId
        , StudentUSI
    FROM EdFi_Ods_Populated_Template.edfi.GeneralStudentProgramAssociation
    -- GO

        INSERT INTO edfi.GeneralStudentProgramAssociation_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , EndDate
            , ServedOutsideOfRegularSession
            -- References
            , ReasonExitedDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- Attributes
            , EndDate
            , ServedOutsideOfRegularSession
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, ReasonExitedDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.GeneralStudentProgramAssociation
    
    INSERT INTO edfi.GeneralStudentProgramAssociationParticipationStatus (
        HashKey
        -- Identifying references (for aggregate child entity)
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
    FROM EdFi_Ods_Populated_Template.edfi.GeneralStudentProgramAssociationParticipationStatus
    -- GO

        INSERT INTO edfi.GeneralStudentProgramAssociationParticipationStatus_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            -- Attributes
            , DesignatedBy
            , StatusBeginDate
            , StatusEndDate
            -- References
            , ParticipationStatusDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- Identifying references
            -- Attributes
            , DesignatedBy
            , StatusBeginDate
            , StatusEndDate
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, ParticipationStatusDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.GeneralStudentProgramAssociationParticipationStatus
    INSERT INTO edfi.Grade (
        HashKey
        -- Identifying references (for aggregate root entity)
        , GradeTypeDescriptorHashKey
        , GradingPeriodHashKey
        , StudentSectionAssociationHashKey
        -- Primary key columns
        , BeginDate
                , GradeTypeDescriptorId
                , GradingPeriodDescriptorId
                , GradingPeriodSchoolYear
                , GradingPeriodSequence
                , LocalCourseCode
                , SchoolId
                , SchoolYear
                , SectionIdentifier
                , SessionName
                , StudentUSI
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, GradeTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, GradingPeriodDescriptorId)
                    + '|' + CONVERT(nvarchar, GradingPeriodSchoolYear)
                    + '|' + CONVERT(nvarchar, GradingPeriodSequence)
                    + '|' + LocalCourseCode
                    + '|' + CONVERT(nvarchar, SchoolId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
                    + '|' + SectionIdentifier
                    + '|' + SessionName
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, GradeTypeDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, GradingPeriodDescriptorId)
            + '|' + CONVERT(nvarchar, GradingPeriodSequence)
            + '|' + CONVERT(nvarchar, SchoolId)
            + '|' + CONVERT(nvarchar, GradingPeriodSchoolYear)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
            + '|' + LocalCourseCode
            + '|' + CONVERT(nvarchar, SchoolId)
            + '|' + CONVERT(nvarchar, SchoolYear)
            + '|' + SectionIdentifier
            + '|' + SessionName
            + '|' + CONVERT(nvarchar, StudentUSI)
        )
        , BeginDate
        , GradeTypeDescriptorId
        , GradingPeriodDescriptorId
        , GradingPeriodSchoolYear
        , GradingPeriodSequence
        , LocalCourseCode
        , SchoolId
        , SchoolYear
        , SectionIdentifier
        , SessionName
        , StudentUSI
    FROM EdFi_Ods_Populated_Template.edfi.Grade
    -- GO

        INSERT INTO edfi.Grade_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , DiagnosticStatement
            , LetterGradeEarned
            , NumericGradeEarned
            -- References
            , PerformanceBaseConversionDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, GradeTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, GradingPeriodDescriptorId)
                    + '|' + CONVERT(nvarchar, GradingPeriodSchoolYear)
                    + '|' + CONVERT(nvarchar, GradingPeriodSequence)
                    + '|' + LocalCourseCode
                    + '|' + CONVERT(nvarchar, SchoolId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
                    + '|' + SectionIdentifier
                    + '|' + SessionName
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- Attributes
            , DiagnosticStatement
            , LetterGradeEarned
            , NumericGradeEarned
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, PerformanceBaseConversionDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.Grade
    
    INSERT INTO edfi.GradeLearningStandardGrade (
        HashKey
        -- Identifying references (for aggregate child entity)
        , LearningStandardHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, GradeTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, GradingPeriodDescriptorId)
                    + '|' + CONVERT(nvarchar, GradingPeriodSchoolYear)
                    + '|' + CONVERT(nvarchar, GradingPeriodSequence)
                    + '|' + LearningStandardId
                    + '|' + LocalCourseCode
                    + '|' + CONVERT(nvarchar, SchoolId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
                    + '|' + SectionIdentifier
                    + '|' + SessionName
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        , HASHBYTES('sha1', 
            LearningStandardId
        )
    FROM EdFi_Ods_Populated_Template.edfi.GradeLearningStandardGrade
    -- GO

        INSERT INTO edfi.GradeLearningStandardGrade_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , LearningStandardHashKey
            -- Attributes
            , DiagnosticStatement
            , LetterGradeEarned
            , NumericGradeEarned
            -- References
            , PerformanceBaseConversionDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, GradeTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, GradingPeriodDescriptorId)
                    + '|' + CONVERT(nvarchar, GradingPeriodSchoolYear)
                    + '|' + CONVERT(nvarchar, GradingPeriodSequence)
                    + '|' + LearningStandardId
                    + '|' + LocalCourseCode
                    + '|' + CONVERT(nvarchar, SchoolId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
                    + '|' + SectionIdentifier
                    + '|' + SessionName
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            LearningStandardId
            )
            -- Attributes
            , DiagnosticStatement
            , LetterGradeEarned
            , NumericGradeEarned
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, PerformanceBaseConversionDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.GradeLearningStandardGrade
    INSERT INTO edfi.GradebookEntry (
        HashKey
        -- Identifying references (for aggregate root entity)
        , SectionHashKey
        -- Primary key columns
        , DateAssigned
                , GradebookEntryTitle
                , LocalCourseCode
                , SchoolId
                , SchoolYear
                , SectionIdentifier
                , SessionName
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, DateAssigned, 23)
                    + '|' + GradebookEntryTitle
                    + '|' + LocalCourseCode
                    + '|' + CONVERT(nvarchar, SchoolId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
                    + '|' + SectionIdentifier
                    + '|' + SessionName
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            LocalCourseCode
            + '|' + CONVERT(nvarchar, SchoolId)
            + '|' + CONVERT(nvarchar, SchoolYear)
            + '|' + SectionIdentifier
            + '|' + SessionName
        )
        , DateAssigned
        , GradebookEntryTitle
        , LocalCourseCode
        , SchoolId
        , SchoolYear
        , SectionIdentifier
        , SessionName
    FROM EdFi_Ods_Populated_Template.edfi.GradebookEntry
    -- GO

        INSERT INTO edfi.GradebookEntry_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , Description
            , DueDate
            -- References
            , GradebookEntryTypeDescriptorHashKey
            , GradingPeriodHashKey
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, DateAssigned, 23)
                    + '|' + GradebookEntryTitle
                    + '|' + LocalCourseCode
                    + '|' + CONVERT(nvarchar, SchoolId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
                    + '|' + SectionIdentifier
                    + '|' + SessionName
        )
            , @schoolYearContext
            -- Attributes
            , Description
            , DueDate
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, GradebookEntryTypeDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, GradingPeriodDescriptorId)
            + '|' + CONVERT(nvarchar, PeriodSequence)
            + '|' + CONVERT(nvarchar, SchoolId)
            + '|' + CONVERT(nvarchar, SchoolYear)
            )
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.GradebookEntry
    
    INSERT INTO edfi.GradebookEntryLearningObjective (
        HashKey
        -- Identifying references (for aggregate child entity)
        , LearningObjectiveHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, DateAssigned, 23)
                    + '|' + GradebookEntryTitle
                    + '|' + LearningObjectiveId
                    + '|' + LocalCourseCode
                    + '|' + Namespace
                    + '|' + CONVERT(nvarchar, SchoolId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
                    + '|' + SectionIdentifier
                    + '|' + SessionName
        )
        , HASHBYTES('sha1', 
            LearningObjectiveId
            + '|' + Namespace
        )
    FROM EdFi_Ods_Populated_Template.edfi.GradebookEntryLearningObjective
    -- GO

    INSERT INTO edfi.GradebookEntryLearningStandard (
        HashKey
        -- Identifying references (for aggregate child entity)
        , LearningStandardHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, DateAssigned, 23)
                    + '|' + GradebookEntryTitle
                    + '|' + LearningStandardId
                    + '|' + LocalCourseCode
                    + '|' + CONVERT(nvarchar, SchoolId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
                    + '|' + SectionIdentifier
                    + '|' + SessionName
        )
        , HASHBYTES('sha1', 
            LearningStandardId
        )
    FROM EdFi_Ods_Populated_Template.edfi.GradebookEntryLearningStandard
    -- GO

    INSERT INTO edfi.GradebookEntryTypeDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , GradebookEntryTypeDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, GradebookEntryTypeDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, GradebookEntryTypeDescriptorId)
        )
        , GradebookEntryTypeDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.GradebookEntryTypeDescriptor
    -- GO


    
    INSERT INTO edfi.GradeLevelDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , GradeLevelDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, GradeLevelDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, GradeLevelDescriptorId)
        )
        , GradeLevelDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.GradeLevelDescriptor
    -- GO


    
    INSERT INTO edfi.GradePointAverageTypeDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , GradePointAverageTypeDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, GradePointAverageTypeDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, GradePointAverageTypeDescriptorId)
        )
        , GradePointAverageTypeDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.GradePointAverageTypeDescriptor
    -- GO


    
    INSERT INTO edfi.GradeTypeDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , GradeTypeDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, GradeTypeDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, GradeTypeDescriptorId)
        )
        , GradeTypeDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.GradeTypeDescriptor
    -- GO


    
    INSERT INTO edfi.GradingPeriod (
        HashKey
        -- Identifying references (for aggregate root entity)
        , GradingPeriodDescriptorHashKey
        , SchoolHashKey
        , SchoolYearTypeHashKey
        -- Primary key columns
        , GradingPeriodDescriptorId
                , PeriodSequence
                , SchoolId
                , SchoolYear
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, GradingPeriodDescriptorId)
                    + '|' + CONVERT(nvarchar, PeriodSequence)
                    + '|' + CONVERT(nvarchar, SchoolId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, GradingPeriodDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, SchoolId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, SchoolYear)
        )
        , GradingPeriodDescriptorId
        , PeriodSequence
        , SchoolId
        , SchoolYear
    FROM EdFi_Ods_Populated_Template.edfi.GradingPeriod
    -- GO

        INSERT INTO edfi.GradingPeriod_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , BeginDate
            , EndDate
            , TotalInstructionalDays
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, GradingPeriodDescriptorId)
                    + '|' + CONVERT(nvarchar, PeriodSequence)
                    + '|' + CONVERT(nvarchar, SchoolId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
        )
            , @schoolYearContext
            -- Attributes
            , BeginDate
            , EndDate
            , TotalInstructionalDays
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.GradingPeriod
    
    INSERT INTO edfi.GradingPeriodDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , GradingPeriodDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, GradingPeriodDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, GradingPeriodDescriptorId)
        )
        , GradingPeriodDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.GradingPeriodDescriptor
    -- GO


    
    INSERT INTO edfi.GraduationPlan (
        HashKey
        -- Identifying references (for aggregate root entity)
        , EducationOrganizationHashKey
        , GraduationPlanTypeDescriptorHashKey
        , GraduationSchoolYearTypeHashKey
        -- Primary key columns
        , EducationOrganizationId
                , GraduationPlanTypeDescriptorId
                , GraduationSchoolYear
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, GraduationPlanTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, GraduationSchoolYear)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, GraduationPlanTypeDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, GraduationSchoolYear)
        )
        , EducationOrganizationId
        , GraduationPlanTypeDescriptorId
        , GraduationSchoolYear
    FROM EdFi_Ods_Populated_Template.edfi.GraduationPlan
    -- GO

        INSERT INTO edfi.GraduationPlan_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , IndividualPlan
            , TotalRequiredCreditConversion
            , TotalRequiredCredits
            -- References
            , TotalRequiredCreditTypeDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, GraduationPlanTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, GraduationSchoolYear)
        )
            , @schoolYearContext
            -- Attributes
            , IndividualPlan
            , TotalRequiredCreditConversion
            , TotalRequiredCredits
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, TotalRequiredCreditTypeDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.GraduationPlan
    
    INSERT INTO edfi.GraduationPlanCreditsByCourse (
        HashKey
        -- Identifying references (for aggregate child entity)
        -- Contextual primary key
        , CourseSetName
    )
    SELECT
        HASHBYTES('sha1', 
            + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, GraduationPlanTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, GraduationSchoolYear)
        )
            , CourseSetName
    FROM EdFi_Ods_Populated_Template.edfi.GraduationPlanCreditsByCourse
    -- GO

        INSERT INTO edfi.GraduationPlanCreditsByCourse_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            -- Contextual primary key
            , CourseSetName
            -- Attributes
            , CreditConversion
            , Credits
            -- References
            , CreditTypeDescriptorHashKey
            , WhenTakenGradeLevelDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CourseSetName
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, GraduationPlanTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, GraduationSchoolYear)
        )
            , @schoolYearContext
            -- Identifying references
            -- Contextual primary key
            , CourseSetName
            -- Attributes
            , CreditConversion
            , Credits
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, CreditTypeDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, WhenTakenGradeLevelDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.GraduationPlanCreditsByCourse
    INSERT INTO edfi.GraduationPlanCreditsByCourseCourse (
        HashKey
        -- Identifying references (for aggregate child entity)
        , CourseHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CourseCode
                    + '|' + CONVERT(nvarchar, CourseEducationOrganizationId)
                    + '|' + CourseSetName
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, GraduationPlanTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, GraduationSchoolYear)
        )
        , HASHBYTES('sha1', 
            CourseCode
            + '|' + CONVERT(nvarchar, CourseEducationOrganizationId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.GraduationPlanCreditsByCourseCourse
    -- GO

    INSERT INTO edfi.GraduationPlanCreditsByCreditCategory (
        HashKey
        -- Identifying references (for aggregate child entity)
        , CreditCategoryDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, CreditCategoryDescriptorId)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, GraduationPlanTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, GraduationSchoolYear)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, CreditCategoryDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.GraduationPlanCreditsByCreditCategory
    -- GO

        INSERT INTO edfi.GraduationPlanCreditsByCreditCategory_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , CreditCategoryDescriptorHashKey
            -- Attributes
            , CreditConversion
            , Credits
            -- References
            , CreditTypeDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, CreditCategoryDescriptorId)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, GraduationPlanTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, GraduationSchoolYear)
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, CreditCategoryDescriptorId)
            )
            -- Attributes
            , CreditConversion
            , Credits
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, CreditTypeDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.GraduationPlanCreditsByCreditCategory
    INSERT INTO edfi.GraduationPlanCreditsBySubject (
        HashKey
        -- Identifying references (for aggregate child entity)
        , AcademicSubjectDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, AcademicSubjectDescriptorId)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, GraduationPlanTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, GraduationSchoolYear)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, AcademicSubjectDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.GraduationPlanCreditsBySubject
    -- GO

        INSERT INTO edfi.GraduationPlanCreditsBySubject_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , AcademicSubjectDescriptorHashKey
            -- Attributes
            , CreditConversion
            , Credits
            -- References
            , CreditTypeDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, AcademicSubjectDescriptorId)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, GraduationPlanTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, GraduationSchoolYear)
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, AcademicSubjectDescriptorId)
            )
            -- Attributes
            , CreditConversion
            , Credits
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, CreditTypeDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.GraduationPlanCreditsBySubject
    INSERT INTO edfi.GraduationPlanRequiredAssessment (
        HashKey
        -- Identifying references (for aggregate child entity)
        , AssessmentHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            AssessmentIdentifier
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, GraduationPlanTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, GraduationSchoolYear)
                    + '|' + Namespace
        )
        , HASHBYTES('sha1', 
            AssessmentIdentifier
            + '|' + Namespace
        )
    FROM EdFi_Ods_Populated_Template.edfi.GraduationPlanRequiredAssessment
    -- GO

    INSERT INTO edfi.GraduationPlanRequiredAssessmentPerformanceLevel (
        HashKey
        -- Identifying references (for aggregate child entity)
    )
    SELECT
        HASHBYTES('sha1', 
            AssessmentIdentifier
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, GraduationPlanTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, GraduationSchoolYear)
                    + '|' + Namespace
        )
    FROM EdFi_Ods_Populated_Template.edfi.GraduationPlanRequiredAssessmentPerformanceLevel
    -- GO

        INSERT INTO edfi.GraduationPlanRequiredAssessmentPerformanceLevel_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            -- Attributes
            , MaximumScore
            , MinimumScore
            -- References
            , AssessmentReportingMethodDescriptorHashKey
            , PerformanceLevelDescriptorHashKey
            , ResultDatatypeTypeDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            AssessmentIdentifier
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, GraduationPlanTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, GraduationSchoolYear)
                    + '|' + Namespace
        )
            , @schoolYearContext
            -- Identifying references
            -- Attributes
            , MaximumScore
            , MinimumScore
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, AssessmentReportingMethodDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, PerformanceLevelDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, ResultDatatypeTypeDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.GraduationPlanRequiredAssessmentPerformanceLevel
    INSERT INTO edfi.GraduationPlanRequiredAssessmentScore (
        HashKey
        -- Identifying references (for aggregate child entity)
        , AssessmentReportingMethodDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            AssessmentIdentifier
                    + '|' + CONVERT(nvarchar, AssessmentReportingMethodDescriptorId)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, GraduationPlanTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, GraduationSchoolYear)
                    + '|' + Namespace
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, AssessmentReportingMethodDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.GraduationPlanRequiredAssessmentScore
    -- GO

        INSERT INTO edfi.GraduationPlanRequiredAssessmentScore_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , AssessmentReportingMethodDescriptorHashKey
            -- Attributes
            , MaximumScore
            , MinimumScore
            -- References
            , ResultDatatypeTypeDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            AssessmentIdentifier
                    + '|' + CONVERT(nvarchar, AssessmentReportingMethodDescriptorId)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, GraduationPlanTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, GraduationSchoolYear)
                    + '|' + Namespace
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, AssessmentReportingMethodDescriptorId)
            )
            -- Attributes
            , MaximumScore
            , MinimumScore
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, ResultDatatypeTypeDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.GraduationPlanRequiredAssessmentScore
    INSERT INTO edfi.GraduationPlanTypeDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , GraduationPlanTypeDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, GraduationPlanTypeDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, GraduationPlanTypeDescriptorId)
        )
        , GraduationPlanTypeDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.GraduationPlanTypeDescriptor
    -- GO


    
    INSERT INTO edfi.GunFreeSchoolsActReportingStatusDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , GunFreeSchoolsActReportingStatusDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, GunFreeSchoolsActReportingStatusDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, GunFreeSchoolsActReportingStatusDescriptorId)
        )
        , GunFreeSchoolsActReportingStatusDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.GunFreeSchoolsActReportingStatusDescriptor
    -- GO


    
    INSERT INTO edfi.HomelessPrimaryNighttimeResidenceDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , HomelessPrimaryNighttimeResidenceDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, HomelessPrimaryNighttimeResidenceDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, HomelessPrimaryNighttimeResidenceDescriptorId)
        )
        , HomelessPrimaryNighttimeResidenceDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.HomelessPrimaryNighttimeResidenceDescriptor
    -- GO


    
    INSERT INTO edfi.HomelessProgramServiceDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , HomelessProgramServiceDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, HomelessProgramServiceDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, HomelessProgramServiceDescriptorId)
        )
        , HomelessProgramServiceDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.HomelessProgramServiceDescriptor
    -- GO


    
    INSERT INTO edfi.IdentificationDocumentUseDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , IdentificationDocumentUseDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, IdentificationDocumentUseDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, IdentificationDocumentUseDescriptorId)
        )
        , IdentificationDocumentUseDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.IdentificationDocumentUseDescriptor
    -- GO


    
    INSERT INTO edfi.IncidentLocationDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , IncidentLocationDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, IncidentLocationDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, IncidentLocationDescriptorId)
        )
        , IncidentLocationDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.IncidentLocationDescriptor
    -- GO


    
    INSERT INTO edfi.IndicatorDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , IndicatorDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, IndicatorDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, IndicatorDescriptorId)
        )
        , IndicatorDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.IndicatorDescriptor
    -- GO


    
    INSERT INTO edfi.IndicatorGroupDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , IndicatorGroupDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, IndicatorGroupDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, IndicatorGroupDescriptorId)
        )
        , IndicatorGroupDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.IndicatorGroupDescriptor
    -- GO


    
    INSERT INTO edfi.IndicatorLevelDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , IndicatorLevelDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, IndicatorLevelDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, IndicatorLevelDescriptorId)
        )
        , IndicatorLevelDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.IndicatorLevelDescriptor
    -- GO


    
    INSERT INTO edfi.InstitutionTelephoneNumberTypeDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , InstitutionTelephoneNumberTypeDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, InstitutionTelephoneNumberTypeDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, InstitutionTelephoneNumberTypeDescriptorId)
        )
        , InstitutionTelephoneNumberTypeDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.InstitutionTelephoneNumberTypeDescriptor
    -- GO


    
    INSERT INTO edfi.InteractivityStyleDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , InteractivityStyleDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, InteractivityStyleDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, InteractivityStyleDescriptorId)
        )
        , InteractivityStyleDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.InteractivityStyleDescriptor
    -- GO


    
    INSERT INTO edfi.InternetAccessDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , InternetAccessDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, InternetAccessDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, InternetAccessDescriptorId)
        )
        , InternetAccessDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.InternetAccessDescriptor
    -- GO


    
    INSERT INTO edfi.Intervention (
        HashKey
        -- Identifying references (for aggregate root entity)
        , EducationOrganizationHashKey
        -- Primary key columns
        , EducationOrganizationId
                , InterventionIdentificationCode
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + InterventionIdentificationCode
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
        )
        , EducationOrganizationId
        , InterventionIdentificationCode
    FROM EdFi_Ods_Populated_Template.edfi.Intervention
    -- GO

        INSERT INTO edfi.Intervention_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , BeginDate
            , EndDate
            , MaxDosage
            , MinDosage
            -- References
            , DeliveryMethodDescriptorHashKey
            , InterventionClassDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + InterventionIdentificationCode
        )
            , @schoolYearContext
            -- Attributes
            , BeginDate
            , EndDate
            , MaxDosage
            , MinDosage
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, DeliveryMethodDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, InterventionClassDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.Intervention
    
    INSERT INTO edfi.InterventionAppropriateGradeLevel (
        HashKey
        -- Identifying references (for aggregate child entity)
        , GradeLevelDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, GradeLevelDescriptorId)
                    + '|' + InterventionIdentificationCode
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, GradeLevelDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.InterventionAppropriateGradeLevel
    -- GO

    INSERT INTO edfi.InterventionAppropriateSex (
        HashKey
        -- Identifying references (for aggregate child entity)
        , SexDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + InterventionIdentificationCode
                    + '|' + CONVERT(nvarchar, SexDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, SexDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.InterventionAppropriateSex
    -- GO

    INSERT INTO edfi.InterventionDiagnosis (
        HashKey
        -- Identifying references (for aggregate child entity)
        , DiagnosisDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, DiagnosisDescriptorId)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + InterventionIdentificationCode
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, DiagnosisDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.InterventionDiagnosis
    -- GO

    INSERT INTO edfi.InterventionEducationContent (
        HashKey
        -- Identifying references (for aggregate child entity)
        , EducationContentHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            ContentIdentifier
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + InterventionIdentificationCode
        )
        , HASHBYTES('sha1', 
            ContentIdentifier
        )
    FROM EdFi_Ods_Populated_Template.edfi.InterventionEducationContent
    -- GO

    INSERT INTO edfi.InterventionInterventionPrescription (
        HashKey
        -- Identifying references (for aggregate child entity)
        , InterventionPrescriptionHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + InterventionIdentificationCode
                    + '|' + CONVERT(nvarchar, InterventionPrescriptionEducationOrganizationId)
                    + '|' + InterventionPrescriptionIdentificationCode
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, InterventionPrescriptionEducationOrganizationId)
            + '|' + InterventionPrescriptionIdentificationCode
        )
    FROM EdFi_Ods_Populated_Template.edfi.InterventionInterventionPrescription
    -- GO

    INSERT INTO edfi.InterventionLearningResourceMetadataURI (
        HashKey
        -- Identifying references (for aggregate child entity)
        -- Contextual primary key
        , LearningResourceMetadataURI
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + InterventionIdentificationCode
        )
            , LearningResourceMetadataURI
    FROM EdFi_Ods_Populated_Template.edfi.InterventionLearningResourceMetadataURI
    -- GO

    INSERT INTO edfi.InterventionMeetingTime (
        HashKey
        -- Identifying references (for aggregate child entity)
        -- Contextual primary key
        , EndTime
        , StartTime
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + InterventionIdentificationCode
        )
            , EndTime
            , StartTime
    FROM EdFi_Ods_Populated_Template.edfi.InterventionMeetingTime
    -- GO

    INSERT INTO edfi.InterventionPopulationServed (
        HashKey
        -- Identifying references (for aggregate child entity)
        , PopulationServedDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + InterventionIdentificationCode
                    + '|' + CONVERT(nvarchar, PopulationServedDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, PopulationServedDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.InterventionPopulationServed
    -- GO

    INSERT INTO edfi.InterventionStaff (
        HashKey
        -- Identifying references (for aggregate child entity)
        , StaffHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + InterventionIdentificationCode
                    + '|' + CONVERT(nvarchar, StaffUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, StaffUSI)
        )
    FROM EdFi_Ods_Populated_Template.edfi.InterventionStaff
    -- GO

    INSERT INTO edfi.InterventionURI (
        HashKey
        -- Identifying references (for aggregate child entity)
        -- Contextual primary key
        , URI
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + InterventionIdentificationCode
        )
            , URI
    FROM EdFi_Ods_Populated_Template.edfi.InterventionURI
    -- GO

    INSERT INTO edfi.InterventionClassDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , InterventionClassDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, InterventionClassDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, InterventionClassDescriptorId)
        )
        , InterventionClassDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.InterventionClassDescriptor
    -- GO


    
    INSERT INTO edfi.InterventionEffectivenessRatingDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , InterventionEffectivenessRatingDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, InterventionEffectivenessRatingDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, InterventionEffectivenessRatingDescriptorId)
        )
        , InterventionEffectivenessRatingDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.InterventionEffectivenessRatingDescriptor
    -- GO


    
    INSERT INTO edfi.InterventionPrescription (
        HashKey
        -- Identifying references (for aggregate root entity)
        , EducationOrganizationHashKey
        -- Primary key columns
        , EducationOrganizationId
                , InterventionPrescriptionIdentificationCode
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + InterventionPrescriptionIdentificationCode
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
        )
        , EducationOrganizationId
        , InterventionPrescriptionIdentificationCode
    FROM EdFi_Ods_Populated_Template.edfi.InterventionPrescription
    -- GO

        INSERT INTO edfi.InterventionPrescription_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , MaxDosage
            , MinDosage
            -- References
            , DeliveryMethodDescriptorHashKey
            , InterventionClassDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + InterventionPrescriptionIdentificationCode
        )
            , @schoolYearContext
            -- Attributes
            , MaxDosage
            , MinDosage
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, DeliveryMethodDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, InterventionClassDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.InterventionPrescription
    
    INSERT INTO edfi.InterventionPrescriptionAppropriateGradeLevel (
        HashKey
        -- Identifying references (for aggregate child entity)
        , GradeLevelDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, GradeLevelDescriptorId)
                    + '|' + InterventionPrescriptionIdentificationCode
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, GradeLevelDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.InterventionPrescriptionAppropriateGradeLevel
    -- GO

    INSERT INTO edfi.InterventionPrescriptionAppropriateSex (
        HashKey
        -- Identifying references (for aggregate child entity)
        , SexDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + InterventionPrescriptionIdentificationCode
                    + '|' + CONVERT(nvarchar, SexDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, SexDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.InterventionPrescriptionAppropriateSex
    -- GO

    INSERT INTO edfi.InterventionPrescriptionDiagnosis (
        HashKey
        -- Identifying references (for aggregate child entity)
        , DiagnosisDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, DiagnosisDescriptorId)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + InterventionPrescriptionIdentificationCode
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, DiagnosisDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.InterventionPrescriptionDiagnosis
    -- GO

    INSERT INTO edfi.InterventionPrescriptionEducationContent (
        HashKey
        -- Identifying references (for aggregate child entity)
        , EducationContentHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            ContentIdentifier
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + InterventionPrescriptionIdentificationCode
        )
        , HASHBYTES('sha1', 
            ContentIdentifier
        )
    FROM EdFi_Ods_Populated_Template.edfi.InterventionPrescriptionEducationContent
    -- GO

    INSERT INTO edfi.InterventionPrescriptionLearningResourceMetadataURI (
        HashKey
        -- Identifying references (for aggregate child entity)
        -- Contextual primary key
        , LearningResourceMetadataURI
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + InterventionPrescriptionIdentificationCode
        )
            , LearningResourceMetadataURI
    FROM EdFi_Ods_Populated_Template.edfi.InterventionPrescriptionLearningResourceMetadataURI
    -- GO

    INSERT INTO edfi.InterventionPrescriptionPopulationServed (
        HashKey
        -- Identifying references (for aggregate child entity)
        , PopulationServedDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + InterventionPrescriptionIdentificationCode
                    + '|' + CONVERT(nvarchar, PopulationServedDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, PopulationServedDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.InterventionPrescriptionPopulationServed
    -- GO

    INSERT INTO edfi.InterventionPrescriptionURI (
        HashKey
        -- Identifying references (for aggregate child entity)
        -- Contextual primary key
        , URI
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + InterventionPrescriptionIdentificationCode
        )
            , URI
    FROM EdFi_Ods_Populated_Template.edfi.InterventionPrescriptionURI
    -- GO

    INSERT INTO edfi.InterventionStudy (
        HashKey
        -- Identifying references (for aggregate root entity)
        , EducationOrganizationHashKey
        -- Primary key columns
        , EducationOrganizationId
                , InterventionStudyIdentificationCode
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + InterventionStudyIdentificationCode
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
        )
        , EducationOrganizationId
        , InterventionStudyIdentificationCode
    FROM EdFi_Ods_Populated_Template.edfi.InterventionStudy
    -- GO

        INSERT INTO edfi.InterventionStudy_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , Participants
            -- References
            , DeliveryMethodDescriptorHashKey
            , InterventionClassDescriptorHashKey
            , InterventionPrescriptionHashKey
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + InterventionStudyIdentificationCode
        )
            , @schoolYearContext
            -- Attributes
            , Participants
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, DeliveryMethodDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, InterventionClassDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, InterventionPrescriptionEducationOrganizationId)
            + '|' + InterventionPrescriptionIdentificationCode
            )
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.InterventionStudy
    
    INSERT INTO edfi.InterventionStudyAppropriateGradeLevel (
        HashKey
        -- Identifying references (for aggregate child entity)
        , GradeLevelDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, GradeLevelDescriptorId)
                    + '|' + InterventionStudyIdentificationCode
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, GradeLevelDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.InterventionStudyAppropriateGradeLevel
    -- GO

    INSERT INTO edfi.InterventionStudyAppropriateSex (
        HashKey
        -- Identifying references (for aggregate child entity)
        , SexDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + InterventionStudyIdentificationCode
                    + '|' + CONVERT(nvarchar, SexDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, SexDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.InterventionStudyAppropriateSex
    -- GO

    INSERT INTO edfi.InterventionStudyEducationContent (
        HashKey
        -- Identifying references (for aggregate child entity)
        , EducationContentHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            ContentIdentifier
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + InterventionStudyIdentificationCode
        )
        , HASHBYTES('sha1', 
            ContentIdentifier
        )
    FROM EdFi_Ods_Populated_Template.edfi.InterventionStudyEducationContent
    -- GO

    INSERT INTO edfi.InterventionStudyInterventionEffectiveness (
        HashKey
        -- Identifying references (for aggregate child entity)
        , DiagnosisDescriptorHashKey
        , GradeLevelDescriptorHashKey
        , PopulationServedDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, DiagnosisDescriptorId)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, GradeLevelDescriptorId)
                    + '|' + InterventionStudyIdentificationCode
                    + '|' + CONVERT(nvarchar, PopulationServedDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, DiagnosisDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, GradeLevelDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, PopulationServedDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.InterventionStudyInterventionEffectiveness
    -- GO

        INSERT INTO edfi.InterventionStudyInterventionEffectiveness_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , DiagnosisDescriptorHashKey
            , GradeLevelDescriptorHashKey
            , PopulationServedDescriptorHashKey
            -- Attributes
            , ImprovementIndex
            -- References
            , InterventionEffectivenessRatingDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, DiagnosisDescriptorId)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, GradeLevelDescriptorId)
                    + '|' + InterventionStudyIdentificationCode
                    + '|' + CONVERT(nvarchar, PopulationServedDescriptorId)
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, DiagnosisDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, GradeLevelDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, PopulationServedDescriptorId)
            )
            -- Attributes
            , ImprovementIndex
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, InterventionEffectivenessRatingDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.InterventionStudyInterventionEffectiveness
    INSERT INTO edfi.InterventionStudyLearningResourceMetadataURI (
        HashKey
        -- Identifying references (for aggregate child entity)
        -- Contextual primary key
        , LearningResourceMetadataURI
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + InterventionStudyIdentificationCode
        )
            , LearningResourceMetadataURI
    FROM EdFi_Ods_Populated_Template.edfi.InterventionStudyLearningResourceMetadataURI
    -- GO

    INSERT INTO edfi.InterventionStudyPopulationServed (
        HashKey
        -- Identifying references (for aggregate child entity)
        , PopulationServedDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + InterventionStudyIdentificationCode
                    + '|' + CONVERT(nvarchar, PopulationServedDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, PopulationServedDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.InterventionStudyPopulationServed
    -- GO

    INSERT INTO edfi.InterventionStudyStateAbbreviation (
        HashKey
        -- Identifying references (for aggregate child entity)
        , StateAbbreviationDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + InterventionStudyIdentificationCode
                    + '|' + CONVERT(nvarchar, StateAbbreviationDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, StateAbbreviationDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.InterventionStudyStateAbbreviation
    -- GO

    INSERT INTO edfi.InterventionStudyURI (
        HashKey
        -- Identifying references (for aggregate child entity)
        -- Contextual primary key
        , URI
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + InterventionStudyIdentificationCode
        )
            , URI
    FROM EdFi_Ods_Populated_Template.edfi.InterventionStudyURI
    -- GO

    INSERT INTO edfi.LanguageDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , LanguageDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, LanguageDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, LanguageDescriptorId)
        )
        , LanguageDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.LanguageDescriptor
    -- GO


    
    INSERT INTO edfi.LanguageInstructionProgramServiceDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , LanguageInstructionProgramServiceDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, LanguageInstructionProgramServiceDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, LanguageInstructionProgramServiceDescriptorId)
        )
        , LanguageInstructionProgramServiceDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.LanguageInstructionProgramServiceDescriptor
    -- GO


    
    INSERT INTO edfi.LanguageUseDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , LanguageUseDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, LanguageUseDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, LanguageUseDescriptorId)
        )
        , LanguageUseDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.LanguageUseDescriptor
    -- GO


    
    INSERT INTO edfi.LearningObjective (
        HashKey
        -- Identifying references (for aggregate root entity)
        -- Primary key columns
        , LearningObjectiveId
                , Namespace
        )
    SELECT 
        HASHBYTES('sha1', 
            LearningObjectiveId
                    + '|' + Namespace
        )
        -- Identifying references
        , LearningObjectiveId
        , Namespace
    FROM EdFi_Ods_Populated_Template.edfi.LearningObjective
    -- GO

        INSERT INTO edfi.LearningObjective_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , Description
            , Nomenclature
            , Objective
            , SuccessCriteria
            -- References
            , ParentLearningObjectiveHashKey
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            LearningObjectiveId
                    + '|' + Namespace
        )
            , @schoolYearContext
            -- Attributes
            , Description
            , Nomenclature
            , Objective
            , SuccessCriteria
            -- References
            , HASHBYTES('sha1', 
            ParentLearningObjectiveId
            + '|' + ParentNamespace
            )
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.LearningObjective
    
    INSERT INTO edfi.LearningObjectiveAcademicSubject (
        HashKey
        -- Identifying references (for aggregate child entity)
        , AcademicSubjectDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, AcademicSubjectDescriptorId)
                    + '|' + LearningObjectiveId
                    + '|' + Namespace
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, AcademicSubjectDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.LearningObjectiveAcademicSubject
    -- GO

    INSERT INTO edfi.LearningObjectiveContentStandard (
        HashKey
        -- Identifying references (for aggregate child entity)
    )
    SELECT
        HASHBYTES('sha1', 
            LearningObjectiveId
                    + '|' + Namespace
        )
    FROM EdFi_Ods_Populated_Template.edfi.LearningObjectiveContentStandard
    -- GO

        INSERT INTO edfi.LearningObjectiveContentStandard_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            -- Attributes
            , BeginDate
            , EndDate
            , PublicationDate
            , PublicationYear
            , Title
            , URI
            , Version
            -- References
            , MandatingEducationOrganizationHashKey
            , PublicationStatusDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            LearningObjectiveId
                    + '|' + Namespace
        )
            , @schoolYearContext
            -- Identifying references
            -- Attributes
            , BeginDate
            , EndDate
            , PublicationDate
            , PublicationYear
            , Title
            , URI
            , Version
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, MandatingEducationOrganizationId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, PublicationStatusDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.LearningObjectiveContentStandard
    INSERT INTO edfi.LearningObjectiveContentStandardAuthor (
        HashKey
        -- Identifying references (for aggregate child entity)
        -- Contextual primary key
        , Author
    )
    SELECT
        HASHBYTES('sha1', 
            + '|' + LearningObjectiveId
                    + '|' + Namespace
        )
            , Author
    FROM EdFi_Ods_Populated_Template.edfi.LearningObjectiveContentStandardAuthor
    -- GO

    INSERT INTO edfi.LearningObjectiveGradeLevel (
        HashKey
        -- Identifying references (for aggregate child entity)
        , GradeLevelDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, GradeLevelDescriptorId)
                    + '|' + LearningObjectiveId
                    + '|' + Namespace
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, GradeLevelDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.LearningObjectiveGradeLevel
    -- GO

    INSERT INTO edfi.LearningObjectiveLearningStandard (
        HashKey
        -- Identifying references (for aggregate child entity)
        , LearningStandardHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            LearningObjectiveId
                    + '|' + LearningStandardId
                    + '|' + Namespace
        )
        , HASHBYTES('sha1', 
            LearningStandardId
        )
    FROM EdFi_Ods_Populated_Template.edfi.LearningObjectiveLearningStandard
    -- GO

    INSERT INTO edfi.LearningStandard (
        HashKey
        -- Identifying references (for aggregate root entity)
        -- Primary key columns
        , LearningStandardId
        )
    SELECT 
        HASHBYTES('sha1', 
            LearningStandardId
        )
        -- Identifying references
        , LearningStandardId
    FROM EdFi_Ods_Populated_Template.edfi.LearningStandard
    -- GO

        INSERT INTO edfi.LearningStandard_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , CourseTitle
            , Description
            , LearningStandardItemCode
            , Namespace
            , SuccessCriteria
            , URI
            -- References
            , ParentLearningStandardHashKey
            , LearningStandardCategoryDescriptorHashKey
            , LearningStandardScopeDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            LearningStandardId
        )
            , @schoolYearContext
            -- Attributes
            , CourseTitle
            , Description
            , LearningStandardItemCode
            , Namespace
            , SuccessCriteria
            , URI
            -- References
            , HASHBYTES('sha1', 
            ParentLearningStandardId
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, LearningStandardCategoryDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, LearningStandardScopeDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.LearningStandard
    
    INSERT INTO edfi.LearningStandardAcademicSubject (
        HashKey
        -- Identifying references (for aggregate child entity)
        , AcademicSubjectDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, AcademicSubjectDescriptorId)
                    + '|' + LearningStandardId
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, AcademicSubjectDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.LearningStandardAcademicSubject
    -- GO

    INSERT INTO edfi.LearningStandardContentStandard (
        HashKey
        -- Identifying references (for aggregate child entity)
    )
    SELECT
        HASHBYTES('sha1', 
            LearningStandardId
        )
    FROM EdFi_Ods_Populated_Template.edfi.LearningStandardContentStandard
    -- GO

        INSERT INTO edfi.LearningStandardContentStandard_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            -- Attributes
            , BeginDate
            , EndDate
            , PublicationDate
            , PublicationYear
            , Title
            , URI
            , Version
            -- References
            , MandatingEducationOrganizationHashKey
            , PublicationStatusDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            LearningStandardId
        )
            , @schoolYearContext
            -- Identifying references
            -- Attributes
            , BeginDate
            , EndDate
            , PublicationDate
            , PublicationYear
            , Title
            , URI
            , Version
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, MandatingEducationOrganizationId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, PublicationStatusDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.LearningStandardContentStandard
    INSERT INTO edfi.LearningStandardContentStandardAuthor (
        HashKey
        -- Identifying references (for aggregate child entity)
        -- Contextual primary key
        , Author
    )
    SELECT
        HASHBYTES('sha1', 
            + '|' + LearningStandardId
        )
            , Author
    FROM EdFi_Ods_Populated_Template.edfi.LearningStandardContentStandardAuthor
    -- GO

    INSERT INTO edfi.LearningStandardGradeLevel (
        HashKey
        -- Identifying references (for aggregate child entity)
        , GradeLevelDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, GradeLevelDescriptorId)
                    + '|' + LearningStandardId
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, GradeLevelDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.LearningStandardGradeLevel
    -- GO

    INSERT INTO edfi.LearningStandardIdentificationCode (
        HashKey
        -- Identifying references (for aggregate child entity)
        -- Contextual primary key
        , ContentStandardName
        , IdentificationCode
    )
    SELECT
        HASHBYTES('sha1', 
            + '|' + LearningStandardId
        )
            , ContentStandardName
            , IdentificationCode
    FROM EdFi_Ods_Populated_Template.edfi.LearningStandardIdentificationCode
    -- GO

    INSERT INTO edfi.LearningStandardPrerequisiteLearningStandard (
        HashKey
        -- Identifying references (for aggregate child entity)
    )
    SELECT
        HASHBYTES('sha1', 
            LearningStandardId
                    + '|' + PrerequisiteLearningStandardId
        )
    FROM EdFi_Ods_Populated_Template.edfi.LearningStandardPrerequisiteLearningStandard
    -- GO

    INSERT INTO edfi.LearningStandardCategoryDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , LearningStandardCategoryDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, LearningStandardCategoryDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, LearningStandardCategoryDescriptorId)
        )
        , LearningStandardCategoryDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.LearningStandardCategoryDescriptor
    -- GO


    
    INSERT INTO edfi.LearningStandardEquivalenceAssociation (
        HashKey
        -- Identifying references (for aggregate root entity)
        , SourceLearningStandardHashKey
        , TargetLearningStandardHashKey
        -- Primary key columns
        , Namespace
                , SourceLearningStandardId
                , TargetLearningStandardId
        )
    SELECT 
        HASHBYTES('sha1', 
            Namespace
                    + '|' + SourceLearningStandardId
                    + '|' + TargetLearningStandardId
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            SourceLearningStandardId
        )
        , HASHBYTES('sha1', 
            TargetLearningStandardId
        )
        , Namespace
        , SourceLearningStandardId
        , TargetLearningStandardId
    FROM EdFi_Ods_Populated_Template.edfi.LearningStandardEquivalenceAssociation
    -- GO

        INSERT INTO edfi.LearningStandardEquivalenceAssociation_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , EffectiveDate
            , LearningStandardEquivalenceStrengthDescription
            -- References
            , LearningStandardEquivalenceStrengthDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            Namespace
                    + '|' + SourceLearningStandardId
                    + '|' + TargetLearningStandardId
        )
            , @schoolYearContext
            -- Attributes
            , EffectiveDate
            , LearningStandardEquivalenceStrengthDescription
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, LearningStandardEquivalenceStrengthDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.LearningStandardEquivalenceAssociation
    
    INSERT INTO edfi.LearningStandardEquivalenceStrengthDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , LearningStandardEquivalenceStrengthDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, LearningStandardEquivalenceStrengthDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, LearningStandardEquivalenceStrengthDescriptorId)
        )
        , LearningStandardEquivalenceStrengthDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.LearningStandardEquivalenceStrengthDescriptor
    -- GO


    
    INSERT INTO edfi.LearningStandardScopeDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , LearningStandardScopeDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, LearningStandardScopeDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, LearningStandardScopeDescriptorId)
        )
        , LearningStandardScopeDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.LearningStandardScopeDescriptor
    -- GO


    
    INSERT INTO edfi.LevelOfEducationDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , LevelOfEducationDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, LevelOfEducationDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, LevelOfEducationDescriptorId)
        )
        , LevelOfEducationDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.LevelOfEducationDescriptor
    -- GO


    
    INSERT INTO edfi.LicenseStatusDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , LicenseStatusDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, LicenseStatusDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, LicenseStatusDescriptorId)
        )
        , LicenseStatusDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.LicenseStatusDescriptor
    -- GO


    
    INSERT INTO edfi.LicenseTypeDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , LicenseTypeDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, LicenseTypeDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, LicenseTypeDescriptorId)
        )
        , LicenseTypeDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.LicenseTypeDescriptor
    -- GO


    
    INSERT INTO edfi.LimitedEnglishProficiencyDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , LimitedEnglishProficiencyDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, LimitedEnglishProficiencyDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, LimitedEnglishProficiencyDescriptorId)
        )
        , LimitedEnglishProficiencyDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.LimitedEnglishProficiencyDescriptor
    -- GO


    
    INSERT INTO edfi.LocaleDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , LocaleDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, LocaleDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, LocaleDescriptorId)
        )
        , LocaleDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.LocaleDescriptor
    -- GO


    
    INSERT INTO edfi.LocalEducationAgency (
        HashKey
        -- Identifying references (for aggregate root entity)
        , EducationOrganizationHashKey
        -- Primary key columns
        , LocalEducationAgencyId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, LocalEducationAgencyId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, LocalEducationAgencyId)
        )
        , LocalEducationAgencyId
    FROM EdFi_Ods_Populated_Template.edfi.LocalEducationAgency
    -- GO

        INSERT INTO edfi.LocalEducationAgency_Attributes (
            HashKey
            , SchoolYearContext
            -- References
            , ParentLocalEducationAgencyHashKey
            , CharterStatusDescriptorHashKey
            , EducationServiceCenterHashKey
            , LocalEducationAgencyCategoryDescriptorHashKey
            , StateEducationAgencyHashKey
            -- Boilerplate columns
)
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, LocalEducationAgencyId)
        )
            , @schoolYearContext
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, ParentLocalEducationAgencyId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, CharterStatusDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationServiceCenterId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, LocalEducationAgencyCategoryDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, StateEducationAgencyId)
            )
            -- Boilerplate columns
        FROM EdFi_Ods_Populated_Template.edfi.LocalEducationAgency
    
    INSERT INTO edfi.LocalEducationAgencyAccountability (
        HashKey
        -- Identifying references (for aggregate child entity)
        , SchoolYearTypeHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, LocalEducationAgencyId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, SchoolYear)
        )
    FROM EdFi_Ods_Populated_Template.edfi.LocalEducationAgencyAccountability
    -- GO

        INSERT INTO edfi.LocalEducationAgencyAccountability_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , SchoolYearTypeHashKey
            -- References
            , GunFreeSchoolsActReportingStatusDescriptorHashKey
            , SchoolChoiceImplementStatusDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, LocalEducationAgencyId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, SchoolYear)
            )
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, GunFreeSchoolsActReportingStatusDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, SchoolChoiceImplementStatusDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.LocalEducationAgencyAccountability
    INSERT INTO edfi.LocalEducationAgencyFederalFunds (
        HashKey
        -- Identifying references (for aggregate child entity)
        -- Contextual primary key
        , FiscalYear
    )
    SELECT
        HASHBYTES('sha1', 
            + '|' + CONVERT(nvarchar, LocalEducationAgencyId)
        )
            , FiscalYear
    FROM EdFi_Ods_Populated_Template.edfi.LocalEducationAgencyFederalFunds
    -- GO

        INSERT INTO edfi.LocalEducationAgencyFederalFunds_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            -- Contextual primary key
            , FiscalYear
            -- Attributes
            , InnovativeDollarsSpent
            , InnovativeDollarsSpentStrategicPriorities
            , InnovativeProgramsFundsReceived
            , SchoolImprovementAllocation
            , SchoolImprovementReservedFundsPercentage
            , StateAssessmentAdministrationFunding
            , SupplementalEducationalServicesFundsSpent
            , SupplementalEducationalServicesPerPupilExpenditure
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, FiscalYear)
                    + '|' + CONVERT(nvarchar, LocalEducationAgencyId)
        )
            , @schoolYearContext
            -- Identifying references
            -- Contextual primary key
            , FiscalYear
            -- Attributes
            , InnovativeDollarsSpent
            , InnovativeDollarsSpentStrategicPriorities
            , InnovativeProgramsFundsReceived
            , SchoolImprovementAllocation
            , SchoolImprovementReservedFundsPercentage
            , StateAssessmentAdministrationFunding
            , SupplementalEducationalServicesFundsSpent
            , SupplementalEducationalServicesPerPupilExpenditure
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.LocalEducationAgencyFederalFunds
    INSERT INTO edfi.LocalEducationAgencyCategoryDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , LocalEducationAgencyCategoryDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, LocalEducationAgencyCategoryDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, LocalEducationAgencyCategoryDescriptorId)
        )
        , LocalEducationAgencyCategoryDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.LocalEducationAgencyCategoryDescriptor
    -- GO


    
    INSERT INTO edfi.Location (
        HashKey
        -- Identifying references (for aggregate root entity)
        , SchoolHashKey
        -- Primary key columns
        , ClassroomIdentificationCode
                , SchoolId
        )
    SELECT 
        HASHBYTES('sha1', 
            ClassroomIdentificationCode
                    + '|' + CONVERT(nvarchar, SchoolId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, SchoolId)
        )
        , ClassroomIdentificationCode
        , SchoolId
    FROM EdFi_Ods_Populated_Template.edfi.Location
    -- GO

        INSERT INTO edfi.Location_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , MaximumNumberOfSeats
            , OptimalNumberOfSeats
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            ClassroomIdentificationCode
                    + '|' + CONVERT(nvarchar, SchoolId)
        )
            , @schoolYearContext
            -- Attributes
            , MaximumNumberOfSeats
            , OptimalNumberOfSeats
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.Location
    
    INSERT INTO edfi.MagnetSpecialProgramEmphasisSchoolDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , MagnetSpecialProgramEmphasisSchoolDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, MagnetSpecialProgramEmphasisSchoolDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, MagnetSpecialProgramEmphasisSchoolDescriptorId)
        )
        , MagnetSpecialProgramEmphasisSchoolDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.MagnetSpecialProgramEmphasisSchoolDescriptor
    -- GO


    
    INSERT INTO edfi.MediumOfInstructionDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , MediumOfInstructionDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, MediumOfInstructionDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, MediumOfInstructionDescriptorId)
        )
        , MediumOfInstructionDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.MediumOfInstructionDescriptor
    -- GO


    
    INSERT INTO edfi.MethodCreditEarnedDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , MethodCreditEarnedDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, MethodCreditEarnedDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, MethodCreditEarnedDescriptorId)
        )
        , MethodCreditEarnedDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.MethodCreditEarnedDescriptor
    -- GO


    
    INSERT INTO edfi.MigrantEducationProgramServiceDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , MigrantEducationProgramServiceDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, MigrantEducationProgramServiceDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, MigrantEducationProgramServiceDescriptorId)
        )
        , MigrantEducationProgramServiceDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.MigrantEducationProgramServiceDescriptor
    -- GO


    
    INSERT INTO edfi.MonitoredDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , MonitoredDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, MonitoredDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, MonitoredDescriptorId)
        )
        , MonitoredDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.MonitoredDescriptor
    -- GO


    
    INSERT INTO edfi.NeglectedOrDelinquentProgramDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , NeglectedOrDelinquentProgramDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, NeglectedOrDelinquentProgramDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, NeglectedOrDelinquentProgramDescriptorId)
        )
        , NeglectedOrDelinquentProgramDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.NeglectedOrDelinquentProgramDescriptor
    -- GO


    
    INSERT INTO edfi.NeglectedOrDelinquentProgramServiceDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , NeglectedOrDelinquentProgramServiceDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, NeglectedOrDelinquentProgramServiceDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, NeglectedOrDelinquentProgramServiceDescriptorId)
        )
        , NeglectedOrDelinquentProgramServiceDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.NeglectedOrDelinquentProgramServiceDescriptor
    -- GO


    
    INSERT INTO edfi.NetworkPurposeDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , NetworkPurposeDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, NetworkPurposeDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, NetworkPurposeDescriptorId)
        )
        , NetworkPurposeDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.NetworkPurposeDescriptor
    -- GO


    
    INSERT INTO edfi.ObjectiveAssessment (
        HashKey
        -- Identifying references (for aggregate root entity)
        , AssessmentHashKey
        -- Primary key columns
        , AssessmentIdentifier
                , IdentificationCode
                , Namespace
        )
    SELECT 
        HASHBYTES('sha1', 
            AssessmentIdentifier
                    + '|' + IdentificationCode
                    + '|' + Namespace
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            AssessmentIdentifier
            + '|' + Namespace
        )
        , AssessmentIdentifier
        , IdentificationCode
        , Namespace
    FROM EdFi_Ods_Populated_Template.edfi.ObjectiveAssessment
    -- GO

        INSERT INTO edfi.ObjectiveAssessment_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , Description
            , MaxRawScore
            , Nomenclature
            , PercentOfAssessment
            -- References
            , ParentObjectiveAssessmentHashKey
            , AcademicSubjectDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            AssessmentIdentifier
                    + '|' + IdentificationCode
                    + '|' + Namespace
        )
            , @schoolYearContext
            -- Attributes
            , Description
            , MaxRawScore
            , Nomenclature
            , PercentOfAssessment
            -- References
            , HASHBYTES('sha1', 
            AssessmentIdentifier
            + '|' + ParentIdentificationCode
            + '|' + Namespace
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, AcademicSubjectDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.ObjectiveAssessment
    
    INSERT INTO edfi.ObjectiveAssessmentAssessmentItem (
        HashKey
        -- Identifying references (for aggregate child entity)
        , AssessmentItemHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            AssessmentIdentifier
                    + '|' + AssessmentItemIdentificationCode
                    + '|' + IdentificationCode
                    + '|' + Namespace
        )
        , HASHBYTES('sha1', 
            AssessmentIdentifier
            + '|' + AssessmentItemIdentificationCode
            + '|' + Namespace
        )
    FROM EdFi_Ods_Populated_Template.edfi.ObjectiveAssessmentAssessmentItem
    -- GO

    INSERT INTO edfi.ObjectiveAssessmentLearningObjective (
        HashKey
        -- Identifying references (for aggregate child entity)
        , LearningObjectiveHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            AssessmentIdentifier
                    + '|' + IdentificationCode
                    + '|' + LearningObjectiveId
                    + '|' + LearningObjectiveNamespace
                    + '|' + Namespace
        )
        , HASHBYTES('sha1', 
            LearningObjectiveId
            + '|' + LearningObjectiveNamespace
        )
    FROM EdFi_Ods_Populated_Template.edfi.ObjectiveAssessmentLearningObjective
    -- GO

    INSERT INTO edfi.ObjectiveAssessmentLearningStandard (
        HashKey
        -- Identifying references (for aggregate child entity)
        , LearningStandardHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            AssessmentIdentifier
                    + '|' + IdentificationCode
                    + '|' + LearningStandardId
                    + '|' + Namespace
        )
        , HASHBYTES('sha1', 
            LearningStandardId
        )
    FROM EdFi_Ods_Populated_Template.edfi.ObjectiveAssessmentLearningStandard
    -- GO

    INSERT INTO edfi.ObjectiveAssessmentPerformanceLevel (
        HashKey
        -- Identifying references (for aggregate child entity)
        , AssessmentReportingMethodDescriptorHashKey
        , PerformanceLevelDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            AssessmentIdentifier
                    + '|' + CONVERT(nvarchar, AssessmentReportingMethodDescriptorId)
                    + '|' + IdentificationCode
                    + '|' + Namespace
                    + '|' + CONVERT(nvarchar, PerformanceLevelDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, AssessmentReportingMethodDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, PerformanceLevelDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.ObjectiveAssessmentPerformanceLevel
    -- GO

        INSERT INTO edfi.ObjectiveAssessmentPerformanceLevel_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , AssessmentReportingMethodDescriptorHashKey
            , PerformanceLevelDescriptorHashKey
            -- Attributes
            , MaximumScore
            , MinimumScore
            -- References
            , ResultDatatypeTypeDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            AssessmentIdentifier
                    + '|' + CONVERT(nvarchar, AssessmentReportingMethodDescriptorId)
                    + '|' + IdentificationCode
                    + '|' + Namespace
                    + '|' + CONVERT(nvarchar, PerformanceLevelDescriptorId)
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, AssessmentReportingMethodDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, PerformanceLevelDescriptorId)
            )
            -- Attributes
            , MaximumScore
            , MinimumScore
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, ResultDatatypeTypeDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.ObjectiveAssessmentPerformanceLevel
    INSERT INTO edfi.ObjectiveAssessmentScore (
        HashKey
        -- Identifying references (for aggregate child entity)
        , AssessmentReportingMethodDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            AssessmentIdentifier
                    + '|' + CONVERT(nvarchar, AssessmentReportingMethodDescriptorId)
                    + '|' + IdentificationCode
                    + '|' + Namespace
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, AssessmentReportingMethodDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.ObjectiveAssessmentScore
    -- GO

        INSERT INTO edfi.ObjectiveAssessmentScore_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , AssessmentReportingMethodDescriptorHashKey
            -- Attributes
            , MaximumScore
            , MinimumScore
            -- References
            , ResultDatatypeTypeDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            AssessmentIdentifier
                    + '|' + CONVERT(nvarchar, AssessmentReportingMethodDescriptorId)
                    + '|' + IdentificationCode
                    + '|' + Namespace
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, AssessmentReportingMethodDescriptorId)
            )
            -- Attributes
            , MaximumScore
            , MinimumScore
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, ResultDatatypeTypeDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.ObjectiveAssessmentScore
    INSERT INTO edfi.OldEthnicityDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , OldEthnicityDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, OldEthnicityDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, OldEthnicityDescriptorId)
        )
        , OldEthnicityDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.OldEthnicityDescriptor
    -- GO


    
    INSERT INTO edfi.OpenStaffPosition (
        HashKey
        -- Identifying references (for aggregate root entity)
        , EducationOrganizationHashKey
        -- Primary key columns
        , EducationOrganizationId
                , RequisitionNumber
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + RequisitionNumber
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
        )
        , EducationOrganizationId
        , RequisitionNumber
    FROM EdFi_Ods_Populated_Template.edfi.OpenStaffPosition
    -- GO

        INSERT INTO edfi.OpenStaffPosition_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , DatePosted
            , DatePostingRemoved
            , PositionTitle
            -- References
            , EmploymentStatusDescriptorHashKey
            , PostingResultDescriptorHashKey
            , ProgramAssignmentDescriptorHashKey
            , StaffClassificationDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + RequisitionNumber
        )
            , @schoolYearContext
            -- Attributes
            , DatePosted
            , DatePostingRemoved
            , PositionTitle
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, EmploymentStatusDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, PostingResultDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, ProgramAssignmentDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, StaffClassificationDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.OpenStaffPosition
    
    INSERT INTO edfi.OpenStaffPositionAcademicSubject (
        HashKey
        -- Identifying references (for aggregate child entity)
        , AcademicSubjectDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, AcademicSubjectDescriptorId)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + RequisitionNumber
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, AcademicSubjectDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.OpenStaffPositionAcademicSubject
    -- GO

    INSERT INTO edfi.OpenStaffPositionInstructionalGradeLevel (
        HashKey
        -- Identifying references (for aggregate child entity)
        , GradeLevelDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, GradeLevelDescriptorId)
                    + '|' + RequisitionNumber
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, GradeLevelDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.OpenStaffPositionInstructionalGradeLevel
    -- GO

    INSERT INTO edfi.OperationalStatusDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , OperationalStatusDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, OperationalStatusDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, OperationalStatusDescriptorId)
        )
        , OperationalStatusDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.OperationalStatusDescriptor
    -- GO


    
    INSERT INTO edfi.OtherNameTypeDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , OtherNameTypeDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, OtherNameTypeDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, OtherNameTypeDescriptorId)
        )
        , OtherNameTypeDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.OtherNameTypeDescriptor
    -- GO


    
    INSERT INTO edfi.Parent (
        HashKey
        -- Identifying references (for aggregate root entity)
        -- Primary key columns
        , ParentUSI
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, ParentUSI)
        )
        -- Identifying references
        , ParentUSI
    FROM EdFi_Ods_Populated_Template.edfi.Parent
    -- GO

        INSERT INTO edfi.Parent_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , FirstName
            , GenerationCodeSuffix
            , LastSurname
            , LoginId
            , MaidenName
            , MiddleName
            , ParentUniqueId
            , PersonalTitlePrefix
            -- References
            , PersonHashKey
            , SexDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, ParentUSI)
        )
            , @schoolYearContext
            -- Attributes
            , FirstName
            , GenerationCodeSuffix
            , LastSurname
            , LoginId
            , MaidenName
            , MiddleName
            , ParentUniqueId
            , PersonalTitlePrefix
            -- References
            , HASHBYTES('sha1', 
            PersonId
            + '|' + CONVERT(nvarchar, SourceSystemDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, SexDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.Parent
    
    INSERT INTO edfi.ParentAddress (
        HashKey
        -- Identifying references (for aggregate child entity)
        , AddressTypeDescriptorHashKey
        , StateAbbreviationDescriptorHashKey
        -- Contextual primary key
        , City
        , PostalCode
        , StreetNumberName
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, AddressTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, ParentUSI)
                    + '|' + CONVERT(nvarchar, StateAbbreviationDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, AddressTypeDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, StateAbbreviationDescriptorId)
        )
            , City
            , PostalCode
            , StreetNumberName
    FROM EdFi_Ods_Populated_Template.edfi.ParentAddress
    -- GO

        INSERT INTO edfi.ParentAddress_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , AddressTypeDescriptorHashKey
            , StateAbbreviationDescriptorHashKey
            -- Contextual primary key
            , City
            , PostalCode
            , StreetNumberName
            -- Attributes
            , ApartmentRoomSuiteNumber
            , BuildingSiteNumber
            , CongressionalDistrict
            , CountyFIPSCode
            , DoNotPublishIndicator
            , Latitude
            , Longitude
            , NameOfCounty
            -- References
            , LocaleDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, AddressTypeDescriptorId)
                    + '|' + City
                    + '|' + CONVERT(nvarchar, ParentUSI)
                    + '|' + PostalCode
                    + '|' + CONVERT(nvarchar, StateAbbreviationDescriptorId)
                    + '|' + StreetNumberName
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, AddressTypeDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, StateAbbreviationDescriptorId)
            )
            -- Contextual primary key
            , City
            , PostalCode
            , StreetNumberName
            -- Attributes
            , ApartmentRoomSuiteNumber
            , BuildingSiteNumber
            , CongressionalDistrict
            , CountyFIPSCode
            , DoNotPublishIndicator
            , Latitude
            , Longitude
            , NameOfCounty
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, LocaleDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.ParentAddress
    INSERT INTO edfi.ParentAddressPeriod (
        HashKey
        -- Identifying references (for aggregate child entity)
        -- Contextual primary key
        , BeginDate
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, AddressTypeDescriptorId)
                    + '|' + City
                    + '|' + CONVERT(nvarchar, ParentUSI)
                    + '|' + PostalCode
                    + '|' + CONVERT(nvarchar, StateAbbreviationDescriptorId)
                    + '|' + StreetNumberName
        )
            , BeginDate
    FROM EdFi_Ods_Populated_Template.edfi.ParentAddressPeriod
    -- GO

        INSERT INTO edfi.ParentAddressPeriod_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            -- Contextual primary key
            , BeginDate
            -- Attributes
            , EndDate
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, AddressTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, BeginDate, 23)
                    + '|' + City
                    + '|' + CONVERT(nvarchar, ParentUSI)
                    + '|' + PostalCode
                    + '|' + CONVERT(nvarchar, StateAbbreviationDescriptorId)
                    + '|' + StreetNumberName
        )
            , @schoolYearContext
            -- Identifying references
            -- Contextual primary key
            , BeginDate
            -- Attributes
            , EndDate
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.ParentAddressPeriod
    INSERT INTO edfi.ParentElectronicMail (
        HashKey
        -- Identifying references (for aggregate child entity)
        , ElectronicMailTypeDescriptorHashKey
        -- Contextual primary key
        , ElectronicMailAddress
    )
    SELECT
        HASHBYTES('sha1', 
            + '|' + CONVERT(nvarchar, ElectronicMailTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, ParentUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, ElectronicMailTypeDescriptorId)
        )
            , ElectronicMailAddress
    FROM EdFi_Ods_Populated_Template.edfi.ParentElectronicMail
    -- GO

        INSERT INTO edfi.ParentElectronicMail_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , ElectronicMailTypeDescriptorHashKey
            -- Contextual primary key
            , ElectronicMailAddress
            -- Attributes
            , DoNotPublishIndicator
            , PrimaryEmailAddressIndicator
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            ElectronicMailAddress
                    + '|' + CONVERT(nvarchar, ElectronicMailTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, ParentUSI)
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, ElectronicMailTypeDescriptorId)
            )
            -- Contextual primary key
            , ElectronicMailAddress
            -- Attributes
            , DoNotPublishIndicator
            , PrimaryEmailAddressIndicator
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.ParentElectronicMail
    INSERT INTO edfi.ParentInternationalAddress (
        HashKey
        -- Identifying references (for aggregate child entity)
        , AddressTypeDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, AddressTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, ParentUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, AddressTypeDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.ParentInternationalAddress
    -- GO

        INSERT INTO edfi.ParentInternationalAddress_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , AddressTypeDescriptorHashKey
            -- Attributes
            , AddressLine1
            , AddressLine2
            , AddressLine3
            , AddressLine4
            , BeginDate
            , EndDate
            , Latitude
            , Longitude
            -- References
            , CountryDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, AddressTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, ParentUSI)
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, AddressTypeDescriptorId)
            )
            -- Attributes
            , AddressLine1
            , AddressLine2
            , AddressLine3
            , AddressLine4
            , BeginDate
            , EndDate
            , Latitude
            , Longitude
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, CountryDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.ParentInternationalAddress
    INSERT INTO edfi.ParentLanguage (
        HashKey
        -- Identifying references (for aggregate child entity)
        , LanguageDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, LanguageDescriptorId)
                    + '|' + CONVERT(nvarchar, ParentUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, LanguageDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.ParentLanguage
    -- GO

    INSERT INTO edfi.ParentLanguageUse (
        HashKey
        -- Identifying references (for aggregate child entity)
        , LanguageUseDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, LanguageDescriptorId)
                    + '|' + CONVERT(nvarchar, LanguageUseDescriptorId)
                    + '|' + CONVERT(nvarchar, ParentUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, LanguageUseDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.ParentLanguageUse
    -- GO

    INSERT INTO edfi.ParentOtherName (
        HashKey
        -- Identifying references (for aggregate child entity)
        , OtherNameTypeDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, OtherNameTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, ParentUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, OtherNameTypeDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.ParentOtherName
    -- GO

        INSERT INTO edfi.ParentOtherName_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , OtherNameTypeDescriptorHashKey
            -- Attributes
            , FirstName
            , GenerationCodeSuffix
            , LastSurname
            , MiddleName
            , PersonalTitlePrefix
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, OtherNameTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, ParentUSI)
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, OtherNameTypeDescriptorId)
            )
            -- Attributes
            , FirstName
            , GenerationCodeSuffix
            , LastSurname
            , MiddleName
            , PersonalTitlePrefix
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.ParentOtherName
    INSERT INTO edfi.ParentPersonalIdentificationDocument (
        HashKey
        -- Identifying references (for aggregate child entity)
        , IdentificationDocumentUseDescriptorHashKey
        , PersonalInformationVerificationDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, IdentificationDocumentUseDescriptorId)
                    + '|' + CONVERT(nvarchar, ParentUSI)
                    + '|' + CONVERT(nvarchar, PersonalInformationVerificationDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, IdentificationDocumentUseDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, PersonalInformationVerificationDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.ParentPersonalIdentificationDocument
    -- GO

        INSERT INTO edfi.ParentPersonalIdentificationDocument_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , IdentificationDocumentUseDescriptorHashKey
            , PersonalInformationVerificationDescriptorHashKey
            -- Attributes
            , DocumentExpirationDate
            , DocumentTitle
            , IssuerDocumentIdentificationCode
            , IssuerName
            -- References
            , IssuerCountryDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, IdentificationDocumentUseDescriptorId)
                    + '|' + CONVERT(nvarchar, ParentUSI)
                    + '|' + CONVERT(nvarchar, PersonalInformationVerificationDescriptorId)
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, IdentificationDocumentUseDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, PersonalInformationVerificationDescriptorId)
            )
            -- Attributes
            , DocumentExpirationDate
            , DocumentTitle
            , IssuerDocumentIdentificationCode
            , IssuerName
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, IssuerCountryDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.ParentPersonalIdentificationDocument
    INSERT INTO edfi.ParentTelephone (
        HashKey
        -- Identifying references (for aggregate child entity)
        , TelephoneNumberTypeDescriptorHashKey
        -- Contextual primary key
        , TelephoneNumber
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, ParentUSI)
                    + '|' + CONVERT(nvarchar, TelephoneNumberTypeDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, TelephoneNumberTypeDescriptorId)
        )
            , TelephoneNumber
    FROM EdFi_Ods_Populated_Template.edfi.ParentTelephone
    -- GO

        INSERT INTO edfi.ParentTelephone_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , TelephoneNumberTypeDescriptorHashKey
            -- Contextual primary key
            , TelephoneNumber
            -- Attributes
            , DoNotPublishIndicator
            , OrderOfPriority
            , TextMessageCapabilityIndicator
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, ParentUSI)
                    + '|' + TelephoneNumber
                    + '|' + CONVERT(nvarchar, TelephoneNumberTypeDescriptorId)
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, TelephoneNumberTypeDescriptorId)
            )
            -- Contextual primary key
            , TelephoneNumber
            -- Attributes
            , DoNotPublishIndicator
            , OrderOfPriority
            , TextMessageCapabilityIndicator
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.ParentTelephone
    INSERT INTO edfi.ParticipationDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , ParticipationDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, ParticipationDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, ParticipationDescriptorId)
        )
        , ParticipationDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.ParticipationDescriptor
    -- GO


    
    INSERT INTO edfi.ParticipationStatusDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , ParticipationStatusDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, ParticipationStatusDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, ParticipationStatusDescriptorId)
        )
        , ParticipationStatusDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.ParticipationStatusDescriptor
    -- GO


    
    INSERT INTO edfi.Payroll (
        HashKey
        -- Identifying references (for aggregate root entity)
        , AccountHashKey
        , StaffHashKey
        -- Primary key columns
        , AccountIdentifier
                , AsOfDate
                , EducationOrganizationId
                , FiscalYear
                , StaffUSI
        )
    SELECT 
        HASHBYTES('sha1', 
            AccountIdentifier
                    + '|' + CONVERT(nvarchar, AsOfDate, 23)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, FiscalYear)
                    + '|' + CONVERT(nvarchar, StaffUSI)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            AccountIdentifier
            + '|' + CONVERT(nvarchar, EducationOrganizationId)
            + '|' + CONVERT(nvarchar, FiscalYear)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, StaffUSI)
        )
        , AccountIdentifier
        , AsOfDate
        , EducationOrganizationId
        , FiscalYear
        , StaffUSI
    FROM EdFi_Ods_Populated_Template.edfi.Payroll
    -- GO

        INSERT INTO edfi.Payroll_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , AmountToDate
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            AccountIdentifier
                    + '|' + CONVERT(nvarchar, AsOfDate, 23)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, FiscalYear)
                    + '|' + CONVERT(nvarchar, StaffUSI)
        )
            , @schoolYearContext
            -- Attributes
            , AmountToDate
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.Payroll
    
    INSERT INTO edfi.PerformanceBaseConversionDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , PerformanceBaseConversionDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, PerformanceBaseConversionDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, PerformanceBaseConversionDescriptorId)
        )
        , PerformanceBaseConversionDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.PerformanceBaseConversionDescriptor
    -- GO


    
    INSERT INTO edfi.PerformanceLevelDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , PerformanceLevelDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, PerformanceLevelDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, PerformanceLevelDescriptorId)
        )
        , PerformanceLevelDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.PerformanceLevelDescriptor
    -- GO


    
    INSERT INTO edfi.Person (
        HashKey
        -- Identifying references (for aggregate root entity)
        , SourceSystemDescriptorHashKey
        -- Primary key columns
        , PersonId
                , SourceSystemDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            PersonId
                    + '|' + CONVERT(nvarchar, SourceSystemDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, SourceSystemDescriptorId)
        )
        , PersonId
        , SourceSystemDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.Person
    -- GO


    
    INSERT INTO edfi.PersonalInformationVerificationDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , PersonalInformationVerificationDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, PersonalInformationVerificationDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, PersonalInformationVerificationDescriptorId)
        )
        , PersonalInformationVerificationDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.PersonalInformationVerificationDescriptor
    -- GO


    
    INSERT INTO edfi.PlatformTypeDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , PlatformTypeDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, PlatformTypeDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, PlatformTypeDescriptorId)
        )
        , PlatformTypeDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.PlatformTypeDescriptor
    -- GO


    
    INSERT INTO edfi.PopulationServedDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , PopulationServedDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, PopulationServedDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, PopulationServedDescriptorId)
        )
        , PopulationServedDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.PopulationServedDescriptor
    -- GO


    
    INSERT INTO edfi.PostingResultDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , PostingResultDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, PostingResultDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, PostingResultDescriptorId)
        )
        , PostingResultDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.PostingResultDescriptor
    -- GO


    
    INSERT INTO edfi.PostSecondaryEvent (
        HashKey
        -- Identifying references (for aggregate root entity)
        , PostSecondaryEventCategoryDescriptorHashKey
        , StudentHashKey
        -- Primary key columns
        , EventDate
                , PostSecondaryEventCategoryDescriptorId
                , StudentUSI
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EventDate, 23)
                    + '|' + CONVERT(nvarchar, PostSecondaryEventCategoryDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, PostSecondaryEventCategoryDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, StudentUSI)
        )
        , EventDate
        , PostSecondaryEventCategoryDescriptorId
        , StudentUSI
    FROM EdFi_Ods_Populated_Template.edfi.PostSecondaryEvent
    -- GO

        INSERT INTO edfi.PostSecondaryEvent_Attributes (
            HashKey
            , SchoolYearContext
            -- References
            , PostSecondaryInstitutionHashKey
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, EventDate, 23)
                    + '|' + CONVERT(nvarchar, PostSecondaryEventCategoryDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, PostSecondaryInstitutionId)
            )
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.PostSecondaryEvent
    
    INSERT INTO edfi.PostSecondaryEventCategoryDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , PostSecondaryEventCategoryDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, PostSecondaryEventCategoryDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, PostSecondaryEventCategoryDescriptorId)
        )
        , PostSecondaryEventCategoryDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.PostSecondaryEventCategoryDescriptor
    -- GO


    
    INSERT INTO edfi.PostSecondaryInstitution (
        HashKey
        -- Identifying references (for aggregate root entity)
        , EducationOrganizationHashKey
        -- Primary key columns
        , PostSecondaryInstitutionId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, PostSecondaryInstitutionId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, PostSecondaryInstitutionId)
        )
        , PostSecondaryInstitutionId
    FROM EdFi_Ods_Populated_Template.edfi.PostSecondaryInstitution
    -- GO

        INSERT INTO edfi.PostSecondaryInstitution_Attributes (
            HashKey
            , SchoolYearContext
            -- References
            , AdministrativeFundingControlDescriptorHashKey
            , PostSecondaryInstitutionLevelDescriptorHashKey
            -- Boilerplate columns
)
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, PostSecondaryInstitutionId)
        )
            , @schoolYearContext
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, AdministrativeFundingControlDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, PostSecondaryInstitutionLevelDescriptorId)
            )
            -- Boilerplate columns
        FROM EdFi_Ods_Populated_Template.edfi.PostSecondaryInstitution
    
    INSERT INTO edfi.PostSecondaryInstitutionMediumOfInstruction (
        HashKey
        -- Identifying references (for aggregate child entity)
        , MediumOfInstructionDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, MediumOfInstructionDescriptorId)
                    + '|' + CONVERT(nvarchar, PostSecondaryInstitutionId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, MediumOfInstructionDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.PostSecondaryInstitutionMediumOfInstruction
    -- GO

    INSERT INTO edfi.PostSecondaryInstitutionLevelDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , PostSecondaryInstitutionLevelDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, PostSecondaryInstitutionLevelDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, PostSecondaryInstitutionLevelDescriptorId)
        )
        , PostSecondaryInstitutionLevelDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.PostSecondaryInstitutionLevelDescriptor
    -- GO


    
    INSERT INTO edfi.ProficiencyDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , ProficiencyDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, ProficiencyDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, ProficiencyDescriptorId)
        )
        , ProficiencyDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.ProficiencyDescriptor
    -- GO


    
    INSERT INTO edfi.Program (
        HashKey
        -- Identifying references (for aggregate root entity)
        , EducationOrganizationHashKey
        , ProgramTypeDescriptorHashKey
        -- Primary key columns
        , EducationOrganizationId
                , ProgramName
                , ProgramTypeDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, ProgramTypeDescriptorId)
        )
        , EducationOrganizationId
        , ProgramName
        , ProgramTypeDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.Program
    -- GO

        INSERT INTO edfi.Program_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , ProgramId
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
        )
            , @schoolYearContext
            -- Attributes
            , ProgramId
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.Program
    
    INSERT INTO edfi.ProgramCharacteristic (
        HashKey
        -- Identifying references (for aggregate child entity)
        , ProgramCharacteristicDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, ProgramCharacteristicDescriptorId)
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, ProgramCharacteristicDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.ProgramCharacteristic
    -- GO

    INSERT INTO edfi.ProgramLearningObjective (
        HashKey
        -- Identifying references (for aggregate child entity)
        , LearningObjectiveHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + LearningObjectiveId
                    + '|' + Namespace
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
        )
        , HASHBYTES('sha1', 
            LearningObjectiveId
            + '|' + Namespace
        )
    FROM EdFi_Ods_Populated_Template.edfi.ProgramLearningObjective
    -- GO

    INSERT INTO edfi.ProgramLearningStandard (
        HashKey
        -- Identifying references (for aggregate child entity)
        , LearningStandardHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + LearningStandardId
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
        )
        , HASHBYTES('sha1', 
            LearningStandardId
        )
    FROM EdFi_Ods_Populated_Template.edfi.ProgramLearningStandard
    -- GO

    INSERT INTO edfi.ProgramService (
        HashKey
        -- Identifying references (for aggregate child entity)
        , ServiceDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, ServiceDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, ServiceDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.ProgramService
    -- GO

    INSERT INTO edfi.ProgramSponsor (
        HashKey
        -- Identifying references (for aggregate child entity)
        , ProgramSponsorDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramSponsorDescriptorId)
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, ProgramSponsorDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.ProgramSponsor
    -- GO

    INSERT INTO edfi.ProgramAssignmentDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , ProgramAssignmentDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, ProgramAssignmentDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, ProgramAssignmentDescriptorId)
        )
        , ProgramAssignmentDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.ProgramAssignmentDescriptor
    -- GO


    
    INSERT INTO edfi.ProgramCharacteristicDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , ProgramCharacteristicDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, ProgramCharacteristicDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, ProgramCharacteristicDescriptorId)
        )
        , ProgramCharacteristicDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.ProgramCharacteristicDescriptor
    -- GO


    
    INSERT INTO edfi.ProgramSponsorDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , ProgramSponsorDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, ProgramSponsorDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, ProgramSponsorDescriptorId)
        )
        , ProgramSponsorDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.ProgramSponsorDescriptor
    -- GO


    
    INSERT INTO edfi.ProgramTypeDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , ProgramTypeDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, ProgramTypeDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, ProgramTypeDescriptorId)
        )
        , ProgramTypeDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.ProgramTypeDescriptor
    -- GO


    
    INSERT INTO edfi.ProgressDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , ProgressDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, ProgressDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, ProgressDescriptorId)
        )
        , ProgressDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.ProgressDescriptor
    -- GO


    
    INSERT INTO edfi.ProgressLevelDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , ProgressLevelDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, ProgressLevelDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, ProgressLevelDescriptorId)
        )
        , ProgressLevelDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.ProgressLevelDescriptor
    -- GO


    
    INSERT INTO edfi.ProviderCategoryDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , ProviderCategoryDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, ProviderCategoryDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, ProviderCategoryDescriptorId)
        )
        , ProviderCategoryDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.ProviderCategoryDescriptor
    -- GO


    
    INSERT INTO edfi.ProviderProfitabilityDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , ProviderProfitabilityDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, ProviderProfitabilityDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, ProviderProfitabilityDescriptorId)
        )
        , ProviderProfitabilityDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.ProviderProfitabilityDescriptor
    -- GO


    
    INSERT INTO edfi.ProviderStatusDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , ProviderStatusDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, ProviderStatusDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, ProviderStatusDescriptorId)
        )
        , ProviderStatusDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.ProviderStatusDescriptor
    -- GO


    
    INSERT INTO edfi.PublicationStatusDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , PublicationStatusDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, PublicationStatusDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, PublicationStatusDescriptorId)
        )
        , PublicationStatusDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.PublicationStatusDescriptor
    -- GO


    
    INSERT INTO edfi.QuestionFormDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , QuestionFormDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, QuestionFormDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, QuestionFormDescriptorId)
        )
        , QuestionFormDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.QuestionFormDescriptor
    -- GO


    
    INSERT INTO edfi.RaceDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , RaceDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, RaceDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, RaceDescriptorId)
        )
        , RaceDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.RaceDescriptor
    -- GO


    
    INSERT INTO edfi.ReasonExitedDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , ReasonExitedDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, ReasonExitedDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, ReasonExitedDescriptorId)
        )
        , ReasonExitedDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.ReasonExitedDescriptor
    -- GO


    
    INSERT INTO edfi.ReasonNotTestedDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , ReasonNotTestedDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, ReasonNotTestedDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, ReasonNotTestedDescriptorId)
        )
        , ReasonNotTestedDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.ReasonNotTestedDescriptor
    -- GO


    
    INSERT INTO edfi.RecognitionTypeDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , RecognitionTypeDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, RecognitionTypeDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, RecognitionTypeDescriptorId)
        )
        , RecognitionTypeDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.RecognitionTypeDescriptor
    -- GO


    
    INSERT INTO edfi.RelationDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , RelationDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, RelationDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, RelationDescriptorId)
        )
        , RelationDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.RelationDescriptor
    -- GO


    
    INSERT INTO edfi.RepeatIdentifierDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , RepeatIdentifierDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, RepeatIdentifierDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, RepeatIdentifierDescriptorId)
        )
        , RepeatIdentifierDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.RepeatIdentifierDescriptor
    -- GO


    
    INSERT INTO edfi.ReportCard (
        HashKey
        -- Identifying references (for aggregate root entity)
        , EducationOrganizationHashKey
        , GradingPeriodHashKey
        , StudentHashKey
        -- Primary key columns
        , EducationOrganizationId
                , GradingPeriodDescriptorId
                , GradingPeriodSchoolId
                , GradingPeriodSchoolYear
                , GradingPeriodSequence
                , StudentUSI
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, GradingPeriodDescriptorId)
                    + '|' + CONVERT(nvarchar, GradingPeriodSchoolId)
                    + '|' + CONVERT(nvarchar, GradingPeriodSchoolYear)
                    + '|' + CONVERT(nvarchar, GradingPeriodSequence)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, GradingPeriodDescriptorId)
            + '|' + CONVERT(nvarchar, GradingPeriodSequence)
            + '|' + CONVERT(nvarchar, GradingPeriodSchoolId)
            + '|' + CONVERT(nvarchar, GradingPeriodSchoolYear)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, StudentUSI)
        )
        , EducationOrganizationId
        , GradingPeriodDescriptorId
        , GradingPeriodSchoolId
        , GradingPeriodSchoolYear
        , GradingPeriodSequence
        , StudentUSI
    FROM EdFi_Ods_Populated_Template.edfi.ReportCard
    -- GO

        INSERT INTO edfi.ReportCard_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , GPACumulative
            , GPAGivenGradingPeriod
            , NumberOfDaysAbsent
            , NumberOfDaysInAttendance
            , NumberOfDaysTardy
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, GradingPeriodDescriptorId)
                    + '|' + CONVERT(nvarchar, GradingPeriodSchoolId)
                    + '|' + CONVERT(nvarchar, GradingPeriodSchoolYear)
                    + '|' + CONVERT(nvarchar, GradingPeriodSequence)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- Attributes
            , GPACumulative
            , GPAGivenGradingPeriod
            , NumberOfDaysAbsent
            , NumberOfDaysInAttendance
            , NumberOfDaysTardy
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.ReportCard
    
    INSERT INTO edfi.ReportCardGrade (
        HashKey
        -- Identifying references (for aggregate child entity)
        , GradeHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, GradeTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, GradingPeriodDescriptorId)
                    + '|' + CONVERT(nvarchar, GradingPeriodSchoolId)
                    + '|' + CONVERT(nvarchar, GradingPeriodSchoolYear)
                    + '|' + CONVERT(nvarchar, GradingPeriodSequence)
                    + '|' + LocalCourseCode
                    + '|' + CONVERT(nvarchar, SchoolId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
                    + '|' + SectionIdentifier
                    + '|' + SessionName
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
            + '|' + CONVERT(nvarchar, GradeTypeDescriptorId)
            + '|' + CONVERT(nvarchar, GradingPeriodDescriptorId)
            + '|' + CONVERT(nvarchar, GradingPeriodSchoolYear)
            + '|' + CONVERT(nvarchar, GradingPeriodSequence)
            + '|' + LocalCourseCode
            + '|' + CONVERT(nvarchar, SchoolId)
            + '|' + CONVERT(nvarchar, SchoolYear)
            + '|' + SectionIdentifier
            + '|' + SessionName
            + '|' + CONVERT(nvarchar, StudentUSI)
        )
    FROM EdFi_Ods_Populated_Template.edfi.ReportCardGrade
    -- GO

    INSERT INTO edfi.ReportCardGradePointAverage (
        HashKey
        -- Identifying references (for aggregate child entity)
        , GradePointAverageTypeDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, GradePointAverageTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, GradingPeriodDescriptorId)
                    + '|' + CONVERT(nvarchar, GradingPeriodSchoolId)
                    + '|' + CONVERT(nvarchar, GradingPeriodSchoolYear)
                    + '|' + CONVERT(nvarchar, GradingPeriodSequence)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, GradePointAverageTypeDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.ReportCardGradePointAverage
    -- GO

        INSERT INTO edfi.ReportCardGradePointAverage_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , GradePointAverageTypeDescriptorHashKey
            -- Attributes
            , GradePointAverageValue
            , IsCumulative
            , MaxGradePointAverageValue
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, GradePointAverageTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, GradingPeriodDescriptorId)
                    + '|' + CONVERT(nvarchar, GradingPeriodSchoolId)
                    + '|' + CONVERT(nvarchar, GradingPeriodSchoolYear)
                    + '|' + CONVERT(nvarchar, GradingPeriodSequence)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, GradePointAverageTypeDescriptorId)
            )
            -- Attributes
            , GradePointAverageValue
            , IsCumulative
            , MaxGradePointAverageValue
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.ReportCardGradePointAverage
    INSERT INTO edfi.ReportCardStudentCompetencyObjective (
        HashKey
        -- Identifying references (for aggregate child entity)
        , StudentCompetencyObjectiveHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, GradingPeriodDescriptorId)
                    + '|' + CONVERT(nvarchar, GradingPeriodSchoolId)
                    + '|' + CONVERT(nvarchar, GradingPeriodSchoolYear)
                    + '|' + CONVERT(nvarchar, GradingPeriodSequence)
                    + '|' + Objective
                    + '|' + CONVERT(nvarchar, ObjectiveEducationOrganizationId)
                    + '|' + CONVERT(nvarchar, ObjectiveGradeLevelDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, GradingPeriodDescriptorId)
            + '|' + CONVERT(nvarchar, GradingPeriodSchoolId)
            + '|' + CONVERT(nvarchar, GradingPeriodSchoolYear)
            + '|' + CONVERT(nvarchar, GradingPeriodSequence)
            + '|' + Objective
            + '|' + CONVERT(nvarchar, ObjectiveEducationOrganizationId)
            + '|' + CONVERT(nvarchar, ObjectiveGradeLevelDescriptorId)
            + '|' + CONVERT(nvarchar, StudentUSI)
        )
    FROM EdFi_Ods_Populated_Template.edfi.ReportCardStudentCompetencyObjective
    -- GO

    INSERT INTO edfi.ReportCardStudentLearningObjective (
        HashKey
        -- Identifying references (for aggregate child entity)
        , StudentLearningObjectiveHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, GradingPeriodDescriptorId)
                    + '|' + CONVERT(nvarchar, GradingPeriodSchoolId)
                    + '|' + CONVERT(nvarchar, GradingPeriodSchoolYear)
                    + '|' + CONVERT(nvarchar, GradingPeriodSequence)
                    + '|' + LearningObjectiveId
                    + '|' + Namespace
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, GradingPeriodDescriptorId)
            + '|' + CONVERT(nvarchar, GradingPeriodSchoolId)
            + '|' + CONVERT(nvarchar, GradingPeriodSchoolYear)
            + '|' + CONVERT(nvarchar, GradingPeriodSequence)
            + '|' + LearningObjectiveId
            + '|' + Namespace
            + '|' + CONVERT(nvarchar, StudentUSI)
        )
    FROM EdFi_Ods_Populated_Template.edfi.ReportCardStudentLearningObjective
    -- GO

    INSERT INTO edfi.ReporterDescriptionDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , ReporterDescriptionDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, ReporterDescriptionDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, ReporterDescriptionDescriptorId)
        )
        , ReporterDescriptionDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.ReporterDescriptionDescriptor
    -- GO


    
    INSERT INTO edfi.ResidencyStatusDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , ResidencyStatusDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, ResidencyStatusDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, ResidencyStatusDescriptorId)
        )
        , ResidencyStatusDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.ResidencyStatusDescriptor
    -- GO


    
    INSERT INTO edfi.ResponseIndicatorDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , ResponseIndicatorDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, ResponseIndicatorDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, ResponseIndicatorDescriptorId)
        )
        , ResponseIndicatorDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.ResponseIndicatorDescriptor
    -- GO


    
    INSERT INTO edfi.ResponsibilityDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , ResponsibilityDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, ResponsibilityDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, ResponsibilityDescriptorId)
        )
        , ResponsibilityDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.ResponsibilityDescriptor
    -- GO


    
    INSERT INTO edfi.RestraintEvent (
        HashKey
        -- Identifying references (for aggregate root entity)
        , SchoolHashKey
        , StudentHashKey
        -- Primary key columns
        , RestraintEventIdentifier
                , SchoolId
                , StudentUSI
        )
    SELECT 
        HASHBYTES('sha1', 
            RestraintEventIdentifier
                    + '|' + CONVERT(nvarchar, SchoolId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, SchoolId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, StudentUSI)
        )
        , RestraintEventIdentifier
        , SchoolId
        , StudentUSI
    FROM EdFi_Ods_Populated_Template.edfi.RestraintEvent
    -- GO

        INSERT INTO edfi.RestraintEvent_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , EventDate
            -- References
            , EducationalEnvironmentDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            RestraintEventIdentifier
                    + '|' + CONVERT(nvarchar, SchoolId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- Attributes
            , EventDate
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationalEnvironmentDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.RestraintEvent
    
    INSERT INTO edfi.RestraintEventProgram (
        HashKey
        -- Identifying references (for aggregate child entity)
        , ProgramHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
                    + '|' + RestraintEventIdentifier
                    + '|' + CONVERT(nvarchar, SchoolId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
            + '|' + ProgramName
            + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.RestraintEventProgram
    -- GO

    INSERT INTO edfi.RestraintEventReason (
        HashKey
        -- Identifying references (for aggregate child entity)
        , RestraintEventReasonDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            RestraintEventIdentifier
                    + '|' + CONVERT(nvarchar, RestraintEventReasonDescriptorId)
                    + '|' + CONVERT(nvarchar, SchoolId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, RestraintEventReasonDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.RestraintEventReason
    -- GO

    INSERT INTO edfi.RestraintEventReasonDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , RestraintEventReasonDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, RestraintEventReasonDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, RestraintEventReasonDescriptorId)
        )
        , RestraintEventReasonDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.RestraintEventReasonDescriptor
    -- GO


    
    INSERT INTO edfi.ResultDatatypeTypeDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , ResultDatatypeTypeDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, ResultDatatypeTypeDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, ResultDatatypeTypeDescriptorId)
        )
        , ResultDatatypeTypeDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.ResultDatatypeTypeDescriptor
    -- GO


    
    INSERT INTO edfi.RetestIndicatorDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , RetestIndicatorDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, RetestIndicatorDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, RetestIndicatorDescriptorId)
        )
        , RetestIndicatorDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.RetestIndicatorDescriptor
    -- GO


    
    INSERT INTO edfi.School (
        HashKey
        -- Identifying references (for aggregate root entity)
        , EducationOrganizationHashKey
        -- Primary key columns
        , SchoolId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, SchoolId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, SchoolId)
        )
        , SchoolId
    FROM EdFi_Ods_Populated_Template.edfi.School
    -- GO

        INSERT INTO edfi.School_Attributes (
            HashKey
            , SchoolYearContext
            -- References
            , AdministrativeFundingControlDescriptorHashKey
            , CharterApprovalAgencyTypeDescriptorHashKey
            , CharterStatusDescriptorHashKey
            , InternetAccessDescriptorHashKey
            , LocalEducationAgencyHashKey
            , MagnetSpecialProgramEmphasisSchoolDescriptorHashKey
            , SchoolTypeDescriptorHashKey
            , CharterApprovalSchoolYearTypeHashKey
            , TitleIPartASchoolDesignationDescriptorHashKey
            -- Boilerplate columns
)
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, SchoolId)
        )
            , @schoolYearContext
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, AdministrativeFundingControlDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, CharterApprovalAgencyTypeDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, CharterStatusDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, InternetAccessDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, LocalEducationAgencyId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, MagnetSpecialProgramEmphasisSchoolDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, SchoolTypeDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, CharterApprovalSchoolYear)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, TitleIPartASchoolDesignationDescriptorId)
            )
            -- Boilerplate columns
        FROM EdFi_Ods_Populated_Template.edfi.School
    
    INSERT INTO edfi.SchoolCategory (
        HashKey
        -- Identifying references (for aggregate child entity)
        , SchoolCategoryDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, SchoolCategoryDescriptorId)
                    + '|' + CONVERT(nvarchar, SchoolId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, SchoolCategoryDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.SchoolCategory
    -- GO

    INSERT INTO edfi.SchoolGradeLevel (
        HashKey
        -- Identifying references (for aggregate child entity)
        , GradeLevelDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, GradeLevelDescriptorId)
                    + '|' + CONVERT(nvarchar, SchoolId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, GradeLevelDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.SchoolGradeLevel
    -- GO

    INSERT INTO edfi.SchoolCategoryDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , SchoolCategoryDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, SchoolCategoryDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, SchoolCategoryDescriptorId)
        )
        , SchoolCategoryDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.SchoolCategoryDescriptor
    -- GO


    
    INSERT INTO edfi.SchoolChoiceImplementStatusDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , SchoolChoiceImplementStatusDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, SchoolChoiceImplementStatusDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, SchoolChoiceImplementStatusDescriptorId)
        )
        , SchoolChoiceImplementStatusDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.SchoolChoiceImplementStatusDescriptor
    -- GO


    
    INSERT INTO edfi.SchoolFoodServiceProgramServiceDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , SchoolFoodServiceProgramServiceDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, SchoolFoodServiceProgramServiceDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, SchoolFoodServiceProgramServiceDescriptorId)
        )
        , SchoolFoodServiceProgramServiceDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.SchoolFoodServiceProgramServiceDescriptor
    -- GO


    
    INSERT INTO edfi.SchoolTypeDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , SchoolTypeDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, SchoolTypeDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, SchoolTypeDescriptorId)
        )
        , SchoolTypeDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.SchoolTypeDescriptor
    -- GO


    
    INSERT INTO edfi.SchoolYearType (
        HashKey
        -- Identifying references (for aggregate root entity)
        -- Primary key columns
        , SchoolYear
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, SchoolYear)
        )
        -- Identifying references
        , SchoolYear
    FROM EdFi_Ods_Populated_Template.edfi.SchoolYearType
    -- GO

        INSERT INTO edfi.SchoolYearType_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , CurrentSchoolYear
            , SchoolYearDescription
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, SchoolYear)
        )
            , @schoolYearContext
            -- Attributes
            , CurrentSchoolYear
            , SchoolYearDescription
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.SchoolYearType
    
    INSERT INTO edfi.Section (
        HashKey
        -- Identifying references (for aggregate root entity)
        , CourseOfferingHashKey
        -- Primary key columns
        , LocalCourseCode
                , SchoolId
                , SchoolYear
                , SectionIdentifier
                , SessionName
        )
    SELECT 
        HASHBYTES('sha1', 
            LocalCourseCode
                    + '|' + CONVERT(nvarchar, SchoolId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
                    + '|' + SectionIdentifier
                    + '|' + SessionName
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            LocalCourseCode
            + '|' + CONVERT(nvarchar, SchoolId)
            + '|' + CONVERT(nvarchar, SchoolYear)
            + '|' + SessionName
        )
        , LocalCourseCode
        , SchoolId
        , SchoolYear
        , SectionIdentifier
        , SessionName
    FROM EdFi_Ods_Populated_Template.edfi.Section
    -- GO

        INSERT INTO edfi.Section_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , AvailableCreditConversion
            , AvailableCredits
            , OfficialAttendancePeriod
            , SectionName
            , SequenceOfCourse
            -- References
            , AvailableCreditTypeDescriptorHashKey
            , EducationalEnvironmentDescriptorHashKey
            , InstructionLanguageDescriptorHashKey
            , LocationHashKey
            , MediumOfInstructionDescriptorHashKey
            , PopulationServedDescriptorHashKey
            , LocationSchoolHashKey
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            LocalCourseCode
                    + '|' + CONVERT(nvarchar, SchoolId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
                    + '|' + SectionIdentifier
                    + '|' + SessionName
        )
            , @schoolYearContext
            -- Attributes
            , AvailableCreditConversion
            , AvailableCredits
            , OfficialAttendancePeriod
            , SectionName
            , SequenceOfCourse
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, AvailableCreditTypeDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationalEnvironmentDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, InstructionLanguageDescriptorId)
            )
            , HASHBYTES('sha1', 
            LocationClassroomIdentificationCode
            + '|' + CONVERT(nvarchar, LocationSchoolId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, MediumOfInstructionDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, PopulationServedDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, LocationSchoolId)
            )
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.Section
    
    INSERT INTO edfi.SectionCharacteristic (
        HashKey
        -- Identifying references (for aggregate child entity)
        , SectionCharacteristicDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            LocalCourseCode
                    + '|' + CONVERT(nvarchar, SchoolId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
                    + '|' + CONVERT(nvarchar, SectionCharacteristicDescriptorId)
                    + '|' + SectionIdentifier
                    + '|' + SessionName
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, SectionCharacteristicDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.SectionCharacteristic
    -- GO

    INSERT INTO edfi.SectionClassPeriod (
        HashKey
        -- Identifying references (for aggregate child entity)
        , ClassPeriodHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            ClassPeriodName
                    + '|' + LocalCourseCode
                    + '|' + CONVERT(nvarchar, SchoolId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
                    + '|' + SectionIdentifier
                    + '|' + SessionName
        )
        , HASHBYTES('sha1', 
            ClassPeriodName
            + '|' + CONVERT(nvarchar, SchoolId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.SectionClassPeriod
    -- GO

    INSERT INTO edfi.SectionCourseLevelCharacteristic (
        HashKey
        -- Identifying references (for aggregate child entity)
        , CourseLevelCharacteristicDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, CourseLevelCharacteristicDescriptorId)
                    + '|' + LocalCourseCode
                    + '|' + CONVERT(nvarchar, SchoolId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
                    + '|' + SectionIdentifier
                    + '|' + SessionName
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, CourseLevelCharacteristicDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.SectionCourseLevelCharacteristic
    -- GO

    INSERT INTO edfi.SectionOfferedGradeLevel (
        HashKey
        -- Identifying references (for aggregate child entity)
        , GradeLevelDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, GradeLevelDescriptorId)
                    + '|' + LocalCourseCode
                    + '|' + CONVERT(nvarchar, SchoolId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
                    + '|' + SectionIdentifier
                    + '|' + SessionName
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, GradeLevelDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.SectionOfferedGradeLevel
    -- GO

    INSERT INTO edfi.SectionProgram (
        HashKey
        -- Identifying references (for aggregate child entity)
        , ProgramHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + LocalCourseCode
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, SchoolId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
                    + '|' + SectionIdentifier
                    + '|' + SessionName
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
            + '|' + ProgramName
            + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.SectionProgram
    -- GO

    INSERT INTO edfi.SectionAttendanceTakenEvent (
        HashKey
        -- Identifying references (for aggregate root entity)
        , CalendarDateHashKey
        , SectionHashKey
        -- Primary key columns
        , CalendarCode
                , Date
                , LocalCourseCode
                , SchoolId
                , SchoolYear
                , SectionIdentifier
                , SessionName
        )
    SELECT 
        HASHBYTES('sha1', 
            CalendarCode
                    + '|' + CONVERT(nvarchar, Date, 23)
                    + '|' + LocalCourseCode
                    + '|' + CONVERT(nvarchar, SchoolId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
                    + '|' + SectionIdentifier
                    + '|' + SessionName
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CalendarCode
            + '|' + CONVERT(nvarchar, Date, 23)
            + '|' + CONVERT(nvarchar, SchoolId)
            + '|' + CONVERT(nvarchar, SchoolYear)
        )
        , HASHBYTES('sha1', 
            LocalCourseCode
            + '|' + CONVERT(nvarchar, SchoolId)
            + '|' + CONVERT(nvarchar, SchoolYear)
            + '|' + SectionIdentifier
            + '|' + SessionName
        )
        , CalendarCode
        , Date
        , LocalCourseCode
        , SchoolId
        , SchoolYear
        , SectionIdentifier
        , SessionName
    FROM EdFi_Ods_Populated_Template.edfi.SectionAttendanceTakenEvent
    -- GO

        INSERT INTO edfi.SectionAttendanceTakenEvent_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , EventDate
            -- References
            , StaffHashKey
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            CalendarCode
                    + '|' + CONVERT(nvarchar, Date, 23)
                    + '|' + LocalCourseCode
                    + '|' + CONVERT(nvarchar, SchoolId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
                    + '|' + SectionIdentifier
                    + '|' + SessionName
        )
            , @schoolYearContext
            -- Attributes
            , EventDate
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, StaffUSI)
            )
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.SectionAttendanceTakenEvent
    
    INSERT INTO edfi.SectionCharacteristicDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , SectionCharacteristicDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, SectionCharacteristicDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, SectionCharacteristicDescriptorId)
        )
        , SectionCharacteristicDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.SectionCharacteristicDescriptor
    -- GO


    
    INSERT INTO edfi.SeparationDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , SeparationDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, SeparationDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, SeparationDescriptorId)
        )
        , SeparationDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.SeparationDescriptor
    -- GO


    
    INSERT INTO edfi.SeparationReasonDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , SeparationReasonDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, SeparationReasonDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, SeparationReasonDescriptorId)
        )
        , SeparationReasonDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.SeparationReasonDescriptor
    -- GO


    
    INSERT INTO edfi.ServiceDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , ServiceDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, ServiceDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, ServiceDescriptorId)
        )
        , ServiceDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.ServiceDescriptor
    -- GO


    
    INSERT INTO edfi.Session (
        HashKey
        -- Identifying references (for aggregate root entity)
        , SchoolHashKey
        , SchoolYearTypeHashKey
        -- Primary key columns
        , SchoolId
                , SchoolYear
                , SessionName
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, SchoolId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
                    + '|' + SessionName
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, SchoolId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, SchoolYear)
        )
        , SchoolId
        , SchoolYear
        , SessionName
    FROM EdFi_Ods_Populated_Template.edfi.Session
    -- GO

        INSERT INTO edfi.Session_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , BeginDate
            , EndDate
            , TotalInstructionalDays
            -- References
            , TermDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, SchoolId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
                    + '|' + SessionName
        )
            , @schoolYearContext
            -- Attributes
            , BeginDate
            , EndDate
            , TotalInstructionalDays
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, TermDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.Session
    
    INSERT INTO edfi.SessionAcademicWeek (
        HashKey
        -- Identifying references (for aggregate child entity)
        , AcademicWeekHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, SchoolId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
                    + '|' + SessionName
                    + '|' + WeekIdentifier
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, SchoolId)
            + '|' + WeekIdentifier
        )
    FROM EdFi_Ods_Populated_Template.edfi.SessionAcademicWeek
    -- GO

    INSERT INTO edfi.SessionGradingPeriod (
        HashKey
        -- Identifying references (for aggregate child entity)
        , GradingPeriodHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, GradingPeriodDescriptorId)
                    + '|' + CONVERT(nvarchar, PeriodSequence)
                    + '|' + CONVERT(nvarchar, SchoolId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
                    + '|' + SessionName
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, GradingPeriodDescriptorId)
            + '|' + CONVERT(nvarchar, PeriodSequence)
            + '|' + CONVERT(nvarchar, SchoolId)
            + '|' + CONVERT(nvarchar, SchoolYear)
        )
    FROM EdFi_Ods_Populated_Template.edfi.SessionGradingPeriod
    -- GO

    INSERT INTO edfi.SexDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , SexDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, SexDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, SexDescriptorId)
        )
        , SexDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.SexDescriptor
    -- GO


    
    INSERT INTO edfi.SourceSystemDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , SourceSystemDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, SourceSystemDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, SourceSystemDescriptorId)
        )
        , SourceSystemDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.SourceSystemDescriptor
    -- GO


    
    INSERT INTO edfi.SpecialEducationProgramServiceDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , SpecialEducationProgramServiceDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, SpecialEducationProgramServiceDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, SpecialEducationProgramServiceDescriptorId)
        )
        , SpecialEducationProgramServiceDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.SpecialEducationProgramServiceDescriptor
    -- GO


    
    INSERT INTO edfi.SpecialEducationSettingDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , SpecialEducationSettingDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, SpecialEducationSettingDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, SpecialEducationSettingDescriptorId)
        )
        , SpecialEducationSettingDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.SpecialEducationSettingDescriptor
    -- GO


    
    INSERT INTO edfi.Staff (
        HashKey
        -- Identifying references (for aggregate root entity)
        -- Primary key columns
        , StaffUSI
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, StaffUSI)
        )
        -- Identifying references
        , StaffUSI
    FROM EdFi_Ods_Populated_Template.edfi.Staff
    -- GO

        INSERT INTO edfi.Staff_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , BirthDate
            , FirstName
            , GenerationCodeSuffix
            , HighlyQualifiedTeacher
            , HispanicLatinoEthnicity
            , LastSurname
            , LoginId
            , MaidenName
            , MiddleName
            , PersonalTitlePrefix
            , StaffUniqueId
            , YearsOfPriorProfessionalExperience
            , YearsOfPriorTeachingExperience
            -- References
            , CitizenshipStatusDescriptorHashKey
            , HighestCompletedLevelOfEducationDescriptorHashKey
            , OldEthnicityDescriptorHashKey
            , PersonHashKey
            , SexDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, StaffUSI)
        )
            , @schoolYearContext
            -- Attributes
            , BirthDate
            , FirstName
            , GenerationCodeSuffix
            , HighlyQualifiedTeacher
            , HispanicLatinoEthnicity
            , LastSurname
            , LoginId
            , MaidenName
            , MiddleName
            , PersonalTitlePrefix
            , StaffUniqueId
            , YearsOfPriorProfessionalExperience
            , YearsOfPriorTeachingExperience
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, CitizenshipStatusDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, HighestCompletedLevelOfEducationDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, OldEthnicityDescriptorId)
            )
            , HASHBYTES('sha1', 
            PersonId
            + '|' + CONVERT(nvarchar, SourceSystemDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, SexDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.Staff
    
    INSERT INTO edfi.StaffAddress (
        HashKey
        -- Identifying references (for aggregate child entity)
        , AddressTypeDescriptorHashKey
        , StateAbbreviationDescriptorHashKey
        -- Contextual primary key
        , City
        , PostalCode
        , StreetNumberName
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, AddressTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, StaffUSI)
                    + '|' + CONVERT(nvarchar, StateAbbreviationDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, AddressTypeDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, StateAbbreviationDescriptorId)
        )
            , City
            , PostalCode
            , StreetNumberName
    FROM EdFi_Ods_Populated_Template.edfi.StaffAddress
    -- GO

        INSERT INTO edfi.StaffAddress_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , AddressTypeDescriptorHashKey
            , StateAbbreviationDescriptorHashKey
            -- Contextual primary key
            , City
            , PostalCode
            , StreetNumberName
            -- Attributes
            , ApartmentRoomSuiteNumber
            , BuildingSiteNumber
            , CongressionalDistrict
            , CountyFIPSCode
            , DoNotPublishIndicator
            , Latitude
            , Longitude
            , NameOfCounty
            -- References
            , LocaleDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, AddressTypeDescriptorId)
                    + '|' + City
                    + '|' + PostalCode
                    + '|' + CONVERT(nvarchar, StaffUSI)
                    + '|' + CONVERT(nvarchar, StateAbbreviationDescriptorId)
                    + '|' + StreetNumberName
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, AddressTypeDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, StateAbbreviationDescriptorId)
            )
            -- Contextual primary key
            , City
            , PostalCode
            , StreetNumberName
            -- Attributes
            , ApartmentRoomSuiteNumber
            , BuildingSiteNumber
            , CongressionalDistrict
            , CountyFIPSCode
            , DoNotPublishIndicator
            , Latitude
            , Longitude
            , NameOfCounty
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, LocaleDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.StaffAddress
    INSERT INTO edfi.StaffAddressPeriod (
        HashKey
        -- Identifying references (for aggregate child entity)
        -- Contextual primary key
        , BeginDate
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, AddressTypeDescriptorId)
                    + '|' + City
                    + '|' + PostalCode
                    + '|' + CONVERT(nvarchar, StaffUSI)
                    + '|' + CONVERT(nvarchar, StateAbbreviationDescriptorId)
                    + '|' + StreetNumberName
        )
            , BeginDate
    FROM EdFi_Ods_Populated_Template.edfi.StaffAddressPeriod
    -- GO

        INSERT INTO edfi.StaffAddressPeriod_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            -- Contextual primary key
            , BeginDate
            -- Attributes
            , EndDate
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, AddressTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, BeginDate, 23)
                    + '|' + City
                    + '|' + PostalCode
                    + '|' + CONVERT(nvarchar, StaffUSI)
                    + '|' + CONVERT(nvarchar, StateAbbreviationDescriptorId)
                    + '|' + StreetNumberName
        )
            , @schoolYearContext
            -- Identifying references
            -- Contextual primary key
            , BeginDate
            -- Attributes
            , EndDate
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.StaffAddressPeriod
    INSERT INTO edfi.StaffCredential (
        HashKey
        -- Identifying references (for aggregate child entity)
        , CredentialHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CredentialIdentifier
                    + '|' + CONVERT(nvarchar, StaffUSI)
                    + '|' + CONVERT(nvarchar, StateOfIssueStateAbbreviationDescriptorId)
        )
        , HASHBYTES('sha1', 
            CredentialIdentifier
            + '|' + CONVERT(nvarchar, StateOfIssueStateAbbreviationDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.StaffCredential
    -- GO

    INSERT INTO edfi.StaffElectronicMail (
        HashKey
        -- Identifying references (for aggregate child entity)
        , ElectronicMailTypeDescriptorHashKey
        -- Contextual primary key
        , ElectronicMailAddress
    )
    SELECT
        HASHBYTES('sha1', 
            + '|' + CONVERT(nvarchar, ElectronicMailTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, StaffUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, ElectronicMailTypeDescriptorId)
        )
            , ElectronicMailAddress
    FROM EdFi_Ods_Populated_Template.edfi.StaffElectronicMail
    -- GO

        INSERT INTO edfi.StaffElectronicMail_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , ElectronicMailTypeDescriptorHashKey
            -- Contextual primary key
            , ElectronicMailAddress
            -- Attributes
            , DoNotPublishIndicator
            , PrimaryEmailAddressIndicator
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            ElectronicMailAddress
                    + '|' + CONVERT(nvarchar, ElectronicMailTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, StaffUSI)
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, ElectronicMailTypeDescriptorId)
            )
            -- Contextual primary key
            , ElectronicMailAddress
            -- Attributes
            , DoNotPublishIndicator
            , PrimaryEmailAddressIndicator
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.StaffElectronicMail
    INSERT INTO edfi.StaffIdentificationCode (
        HashKey
        -- Identifying references (for aggregate child entity)
        , StaffIdentificationSystemDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, StaffIdentificationSystemDescriptorId)
                    + '|' + CONVERT(nvarchar, StaffUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, StaffIdentificationSystemDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.StaffIdentificationCode
    -- GO

        INSERT INTO edfi.StaffIdentificationCode_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , StaffIdentificationSystemDescriptorHashKey
            -- Attributes
            , AssigningOrganizationIdentificationCode
            , IdentificationCode
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, StaffIdentificationSystemDescriptorId)
                    + '|' + CONVERT(nvarchar, StaffUSI)
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, StaffIdentificationSystemDescriptorId)
            )
            -- Attributes
            , AssigningOrganizationIdentificationCode
            , IdentificationCode
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.StaffIdentificationCode
    INSERT INTO edfi.StaffIdentificationDocument (
        HashKey
        -- Identifying references (for aggregate child entity)
        , IdentificationDocumentUseDescriptorHashKey
        , PersonalInformationVerificationDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, IdentificationDocumentUseDescriptorId)
                    + '|' + CONVERT(nvarchar, PersonalInformationVerificationDescriptorId)
                    + '|' + CONVERT(nvarchar, StaffUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, IdentificationDocumentUseDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, PersonalInformationVerificationDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.StaffIdentificationDocument
    -- GO

        INSERT INTO edfi.StaffIdentificationDocument_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , IdentificationDocumentUseDescriptorHashKey
            , PersonalInformationVerificationDescriptorHashKey
            -- Attributes
            , DocumentExpirationDate
            , DocumentTitle
            , IssuerDocumentIdentificationCode
            , IssuerName
            -- References
            , IssuerCountryDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, IdentificationDocumentUseDescriptorId)
                    + '|' + CONVERT(nvarchar, PersonalInformationVerificationDescriptorId)
                    + '|' + CONVERT(nvarchar, StaffUSI)
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, IdentificationDocumentUseDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, PersonalInformationVerificationDescriptorId)
            )
            -- Attributes
            , DocumentExpirationDate
            , DocumentTitle
            , IssuerDocumentIdentificationCode
            , IssuerName
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, IssuerCountryDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.StaffIdentificationDocument
    INSERT INTO edfi.StaffInternationalAddress (
        HashKey
        -- Identifying references (for aggregate child entity)
        , AddressTypeDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, AddressTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, StaffUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, AddressTypeDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.StaffInternationalAddress
    -- GO

        INSERT INTO edfi.StaffInternationalAddress_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , AddressTypeDescriptorHashKey
            -- Attributes
            , AddressLine1
            , AddressLine2
            , AddressLine3
            , AddressLine4
            , BeginDate
            , EndDate
            , Latitude
            , Longitude
            -- References
            , CountryDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, AddressTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, StaffUSI)
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, AddressTypeDescriptorId)
            )
            -- Attributes
            , AddressLine1
            , AddressLine2
            , AddressLine3
            , AddressLine4
            , BeginDate
            , EndDate
            , Latitude
            , Longitude
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, CountryDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.StaffInternationalAddress
    INSERT INTO edfi.StaffLanguage (
        HashKey
        -- Identifying references (for aggregate child entity)
        , LanguageDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, LanguageDescriptorId)
                    + '|' + CONVERT(nvarchar, StaffUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, LanguageDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.StaffLanguage
    -- GO

    INSERT INTO edfi.StaffLanguageUse (
        HashKey
        -- Identifying references (for aggregate child entity)
        , LanguageUseDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, LanguageDescriptorId)
                    + '|' + CONVERT(nvarchar, LanguageUseDescriptorId)
                    + '|' + CONVERT(nvarchar, StaffUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, LanguageUseDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.StaffLanguageUse
    -- GO

    INSERT INTO edfi.StaffOtherName (
        HashKey
        -- Identifying references (for aggregate child entity)
        , OtherNameTypeDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, OtherNameTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, StaffUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, OtherNameTypeDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.StaffOtherName
    -- GO

        INSERT INTO edfi.StaffOtherName_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , OtherNameTypeDescriptorHashKey
            -- Attributes
            , FirstName
            , GenerationCodeSuffix
            , LastSurname
            , MiddleName
            , PersonalTitlePrefix
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, OtherNameTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, StaffUSI)
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, OtherNameTypeDescriptorId)
            )
            -- Attributes
            , FirstName
            , GenerationCodeSuffix
            , LastSurname
            , MiddleName
            , PersonalTitlePrefix
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.StaffOtherName
    INSERT INTO edfi.StaffPersonalIdentificationDocument (
        HashKey
        -- Identifying references (for aggregate child entity)
        , IdentificationDocumentUseDescriptorHashKey
        , PersonalInformationVerificationDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, IdentificationDocumentUseDescriptorId)
                    + '|' + CONVERT(nvarchar, PersonalInformationVerificationDescriptorId)
                    + '|' + CONVERT(nvarchar, StaffUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, IdentificationDocumentUseDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, PersonalInformationVerificationDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.StaffPersonalIdentificationDocument
    -- GO

        INSERT INTO edfi.StaffPersonalIdentificationDocument_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , IdentificationDocumentUseDescriptorHashKey
            , PersonalInformationVerificationDescriptorHashKey
            -- Attributes
            , DocumentExpirationDate
            , DocumentTitle
            , IssuerDocumentIdentificationCode
            , IssuerName
            -- References
            , IssuerCountryDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, IdentificationDocumentUseDescriptorId)
                    + '|' + CONVERT(nvarchar, PersonalInformationVerificationDescriptorId)
                    + '|' + CONVERT(nvarchar, StaffUSI)
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, IdentificationDocumentUseDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, PersonalInformationVerificationDescriptorId)
            )
            -- Attributes
            , DocumentExpirationDate
            , DocumentTitle
            , IssuerDocumentIdentificationCode
            , IssuerName
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, IssuerCountryDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.StaffPersonalIdentificationDocument
    INSERT INTO edfi.StaffRace (
        HashKey
        -- Identifying references (for aggregate child entity)
        , RaceDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, RaceDescriptorId)
                    + '|' + CONVERT(nvarchar, StaffUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, RaceDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.StaffRace
    -- GO

    INSERT INTO edfi.StaffRecognition (
        HashKey
        -- Identifying references (for aggregate child entity)
        , RecognitionTypeDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, RecognitionTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, StaffUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, RecognitionTypeDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.StaffRecognition
    -- GO

        INSERT INTO edfi.StaffRecognition_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , RecognitionTypeDescriptorHashKey
            -- Attributes
            , AchievementCategorySystem
            , AchievementTitle
            , Criteria
            , CriteriaURL
            , EvidenceStatement
            , ImageURL
            , IssuerName
            , IssuerOriginURL
            , RecognitionAwardDate
            , RecognitionAwardExpiresDate
            , RecognitionDescription
            -- References
            , AchievementCategoryDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, RecognitionTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, StaffUSI)
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, RecognitionTypeDescriptorId)
            )
            -- Attributes
            , AchievementCategorySystem
            , AchievementTitle
            , Criteria
            , CriteriaURL
            , EvidenceStatement
            , ImageURL
            , IssuerName
            , IssuerOriginURL
            , RecognitionAwardDate
            , RecognitionAwardExpiresDate
            , RecognitionDescription
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, AchievementCategoryDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.StaffRecognition
    INSERT INTO edfi.StaffTelephone (
        HashKey
        -- Identifying references (for aggregate child entity)
        , TelephoneNumberTypeDescriptorHashKey
        -- Contextual primary key
        , TelephoneNumber
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, StaffUSI)
                    + '|' + CONVERT(nvarchar, TelephoneNumberTypeDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, TelephoneNumberTypeDescriptorId)
        )
            , TelephoneNumber
    FROM EdFi_Ods_Populated_Template.edfi.StaffTelephone
    -- GO

        INSERT INTO edfi.StaffTelephone_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , TelephoneNumberTypeDescriptorHashKey
            -- Contextual primary key
            , TelephoneNumber
            -- Attributes
            , DoNotPublishIndicator
            , OrderOfPriority
            , TextMessageCapabilityIndicator
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, StaffUSI)
                    + '|' + TelephoneNumber
                    + '|' + CONVERT(nvarchar, TelephoneNumberTypeDescriptorId)
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, TelephoneNumberTypeDescriptorId)
            )
            -- Contextual primary key
            , TelephoneNumber
            -- Attributes
            , DoNotPublishIndicator
            , OrderOfPriority
            , TextMessageCapabilityIndicator
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.StaffTelephone
    INSERT INTO edfi.StaffTribalAffiliation (
        HashKey
        -- Identifying references (for aggregate child entity)
        , TribalAffiliationDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, StaffUSI)
                    + '|' + CONVERT(nvarchar, TribalAffiliationDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, TribalAffiliationDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.StaffTribalAffiliation
    -- GO

    INSERT INTO edfi.StaffVisa (
        HashKey
        -- Identifying references (for aggregate child entity)
        , VisaDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, StaffUSI)
                    + '|' + CONVERT(nvarchar, VisaDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, VisaDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.StaffVisa
    -- GO

    INSERT INTO edfi.StaffAbsenceEvent (
        HashKey
        -- Identifying references (for aggregate root entity)
        , AbsenceEventCategoryDescriptorHashKey
        , StaffHashKey
        -- Primary key columns
        , AbsenceEventCategoryDescriptorId
                , EventDate
                , StaffUSI
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, AbsenceEventCategoryDescriptorId)
                    + '|' + CONVERT(nvarchar, EventDate, 23)
                    + '|' + CONVERT(nvarchar, StaffUSI)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, AbsenceEventCategoryDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, StaffUSI)
        )
        , AbsenceEventCategoryDescriptorId
        , EventDate
        , StaffUSI
    FROM EdFi_Ods_Populated_Template.edfi.StaffAbsenceEvent
    -- GO

        INSERT INTO edfi.StaffAbsenceEvent_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , AbsenceEventReason
            , HoursAbsent
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, AbsenceEventCategoryDescriptorId)
                    + '|' + CONVERT(nvarchar, EventDate, 23)
                    + '|' + CONVERT(nvarchar, StaffUSI)
        )
            , @schoolYearContext
            -- Attributes
            , AbsenceEventReason
            , HoursAbsent
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.StaffAbsenceEvent
    
    INSERT INTO edfi.StaffClassificationDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , StaffClassificationDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, StaffClassificationDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, StaffClassificationDescriptorId)
        )
        , StaffClassificationDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.StaffClassificationDescriptor
    -- GO


    
    INSERT INTO edfi.StaffCohortAssociation (
        HashKey
        -- Identifying references (for aggregate root entity)
        , CohortHashKey
        , StaffHashKey
        -- Primary key columns
        , BeginDate
                , CohortIdentifier
                , EducationOrganizationId
                , StaffUSI
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CohortIdentifier
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, StaffUSI)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CohortIdentifier
            + '|' + CONVERT(nvarchar, EducationOrganizationId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, StaffUSI)
        )
        , BeginDate
        , CohortIdentifier
        , EducationOrganizationId
        , StaffUSI
    FROM EdFi_Ods_Populated_Template.edfi.StaffCohortAssociation
    -- GO

        INSERT INTO edfi.StaffCohortAssociation_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , EndDate
            , StudentRecordAccess
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CohortIdentifier
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, StaffUSI)
        )
            , @schoolYearContext
            -- Attributes
            , EndDate
            , StudentRecordAccess
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.StaffCohortAssociation
    
    INSERT INTO edfi.StaffDisciplineIncidentAssociation (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DisciplineIncidentHashKey
        , StaffHashKey
        -- Primary key columns
        , IncidentIdentifier
                , SchoolId
                , StaffUSI
        )
    SELECT 
        HASHBYTES('sha1', 
            IncidentIdentifier
                    + '|' + CONVERT(nvarchar, SchoolId)
                    + '|' + CONVERT(nvarchar, StaffUSI)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            IncidentIdentifier
            + '|' + CONVERT(nvarchar, SchoolId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, StaffUSI)
        )
        , IncidentIdentifier
        , SchoolId
        , StaffUSI
    FROM EdFi_Ods_Populated_Template.edfi.StaffDisciplineIncidentAssociation
    -- GO


    
    INSERT INTO edfi.StaffDisciplineIncidentAssociationDisciplineIncidentParticipationCode (
        HashKey
        -- Identifying references (for aggregate child entity)
        , DisciplineIncidentParticipationCodeDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, DisciplineIncidentParticipationCodeDescriptorId)
                    + '|' + IncidentIdentifier
                    + '|' + CONVERT(nvarchar, SchoolId)
                    + '|' + CONVERT(nvarchar, StaffUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, DisciplineIncidentParticipationCodeDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.StaffDisciplineIncidentAssociationDisciplineIncidentParticipationCode
    -- GO

    INSERT INTO edfi.StaffEducationOrganizationAssignmentAssociation (
        HashKey
        -- Identifying references (for aggregate root entity)
        , EducationOrganizationHashKey
        , StaffHashKey
        , StaffClassificationDescriptorHashKey
        -- Primary key columns
        , BeginDate
                , EducationOrganizationId
                , StaffClassificationDescriptorId
                , StaffUSI
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, StaffClassificationDescriptorId)
                    + '|' + CONVERT(nvarchar, StaffUSI)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, StaffUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, StaffClassificationDescriptorId)
        )
        , BeginDate
        , EducationOrganizationId
        , StaffClassificationDescriptorId
        , StaffUSI
    FROM EdFi_Ods_Populated_Template.edfi.StaffEducationOrganizationAssignmentAssociation
    -- GO

        INSERT INTO edfi.StaffEducationOrganizationAssignmentAssociation_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , EndDate
            , OrderOfAssignment
            , PositionTitle
            -- References
            , CredentialHashKey
            , EmploymentStaffEducationOrganizationEmploymentAssociationHashKey
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, StaffClassificationDescriptorId)
                    + '|' + CONVERT(nvarchar, StaffUSI)
        )
            , @schoolYearContext
            -- Attributes
            , EndDate
            , OrderOfAssignment
            , PositionTitle
            -- References
            , HASHBYTES('sha1', 
            CredentialIdentifier
            + '|' + CONVERT(nvarchar, StateOfIssueStateAbbreviationDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, EmploymentEducationOrganizationId)
            + '|' + CONVERT(nvarchar, EmploymentStatusDescriptorId)
            + '|' + CONVERT(nvarchar, EmploymentHireDate, 23)
            + '|' + CONVERT(nvarchar, StaffUSI)
            )
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.StaffEducationOrganizationAssignmentAssociation
    
    INSERT INTO edfi.StaffEducationOrganizationContactAssociation (
        HashKey
        -- Identifying references (for aggregate root entity)
        , EducationOrganizationHashKey
        , StaffHashKey
        -- Primary key columns
        , ContactTitle
                , EducationOrganizationId
                , StaffUSI
        )
    SELECT 
        HASHBYTES('sha1', 
            ContactTitle
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, StaffUSI)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, StaffUSI)
        )
        , ContactTitle
        , EducationOrganizationId
        , StaffUSI
    FROM EdFi_Ods_Populated_Template.edfi.StaffEducationOrganizationContactAssociation
    -- GO

        INSERT INTO edfi.StaffEducationOrganizationContactAssociation_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , ElectronicMailAddress
            -- References
            , ContactTypeDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            ContactTitle
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, StaffUSI)
        )
            , @schoolYearContext
            -- Attributes
            , ElectronicMailAddress
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, ContactTypeDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.StaffEducationOrganizationContactAssociation
    
    INSERT INTO edfi.StaffEducationOrganizationContactAssociationAddress (
        HashKey
        -- Identifying references (for aggregate child entity)
    )
    SELECT
        HASHBYTES('sha1', 
            ContactTitle
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, StaffUSI)
        )
    FROM EdFi_Ods_Populated_Template.edfi.StaffEducationOrganizationContactAssociationAddress
    -- GO

        INSERT INTO edfi.StaffEducationOrganizationContactAssociationAddress_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            -- Attributes
            , ApartmentRoomSuiteNumber
            , BuildingSiteNumber
            , City
            , CongressionalDistrict
            , CountyFIPSCode
            , DoNotPublishIndicator
            , Latitude
            , Longitude
            , NameOfCounty
            , PostalCode
            , StreetNumberName
            -- References
            , AddressTypeDescriptorHashKey
            , LocaleDescriptorHashKey
            , StateAbbreviationDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            ContactTitle
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, StaffUSI)
        )
            , @schoolYearContext
            -- Identifying references
            -- Attributes
            , ApartmentRoomSuiteNumber
            , BuildingSiteNumber
            , City
            , CongressionalDistrict
            , CountyFIPSCode
            , DoNotPublishIndicator
            , Latitude
            , Longitude
            , NameOfCounty
            , PostalCode
            , StreetNumberName
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, AddressTypeDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, LocaleDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, StateAbbreviationDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.StaffEducationOrganizationContactAssociationAddress
    INSERT INTO edfi.StaffEducationOrganizationContactAssociationAddressPeriod (
        HashKey
        -- Identifying references (for aggregate child entity)
        -- Contextual primary key
        , BeginDate
    )
    SELECT
        HASHBYTES('sha1', 
            + '|' + ContactTitle
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, StaffUSI)
        )
            , BeginDate
    FROM EdFi_Ods_Populated_Template.edfi.StaffEducationOrganizationContactAssociationAddressPeriod
    -- GO

        INSERT INTO edfi.StaffEducationOrganizationContactAssociationAddressPeriod_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            -- Contextual primary key
            , BeginDate
            -- Attributes
            , EndDate
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + ContactTitle
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, StaffUSI)
        )
            , @schoolYearContext
            -- Identifying references
            -- Contextual primary key
            , BeginDate
            -- Attributes
            , EndDate
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.StaffEducationOrganizationContactAssociationAddressPeriod
    INSERT INTO edfi.StaffEducationOrganizationContactAssociationTelephone (
        HashKey
        -- Identifying references (for aggregate child entity)
        , TelephoneNumberTypeDescriptorHashKey
        -- Contextual primary key
        , TelephoneNumber
    )
    SELECT
        HASHBYTES('sha1', 
            ContactTitle
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, StaffUSI)
                    + '|' + CONVERT(nvarchar, TelephoneNumberTypeDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, TelephoneNumberTypeDescriptorId)
        )
            , TelephoneNumber
    FROM EdFi_Ods_Populated_Template.edfi.StaffEducationOrganizationContactAssociationTelephone
    -- GO

        INSERT INTO edfi.StaffEducationOrganizationContactAssociationTelephone_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , TelephoneNumberTypeDescriptorHashKey
            -- Contextual primary key
            , TelephoneNumber
            -- Attributes
            , DoNotPublishIndicator
            , OrderOfPriority
            , TextMessageCapabilityIndicator
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            ContactTitle
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, StaffUSI)
                    + '|' + TelephoneNumber
                    + '|' + CONVERT(nvarchar, TelephoneNumberTypeDescriptorId)
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, TelephoneNumberTypeDescriptorId)
            )
            -- Contextual primary key
            , TelephoneNumber
            -- Attributes
            , DoNotPublishIndicator
            , OrderOfPriority
            , TextMessageCapabilityIndicator
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.StaffEducationOrganizationContactAssociationTelephone
    INSERT INTO edfi.StaffEducationOrganizationEmploymentAssociation (
        HashKey
        -- Identifying references (for aggregate root entity)
        , EducationOrganizationHashKey
        , EmploymentStatusDescriptorHashKey
        , StaffHashKey
        -- Primary key columns
        , EducationOrganizationId
                , EmploymentStatusDescriptorId
                , HireDate
                , StaffUSI
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, EmploymentStatusDescriptorId)
                    + '|' + CONVERT(nvarchar, HireDate, 23)
                    + '|' + CONVERT(nvarchar, StaffUSI)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, EmploymentStatusDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, StaffUSI)
        )
        , EducationOrganizationId
        , EmploymentStatusDescriptorId
        , HireDate
        , StaffUSI
    FROM EdFi_Ods_Populated_Template.edfi.StaffEducationOrganizationEmploymentAssociation
    -- GO

        INSERT INTO edfi.StaffEducationOrganizationEmploymentAssociation_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , Department
            , EndDate
            , FullTimeEquivalency
            , HourlyWage
            , OfferDate
            -- References
            , CredentialHashKey
            , SeparationDescriptorHashKey
            , SeparationReasonDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, EmploymentStatusDescriptorId)
                    + '|' + CONVERT(nvarchar, HireDate, 23)
                    + '|' + CONVERT(nvarchar, StaffUSI)
        )
            , @schoolYearContext
            -- Attributes
            , Department
            , EndDate
            , FullTimeEquivalency
            , HourlyWage
            , OfferDate
            -- References
            , HASHBYTES('sha1', 
            CredentialIdentifier
            + '|' + CONVERT(nvarchar, StateOfIssueStateAbbreviationDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, SeparationDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, SeparationReasonDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.StaffEducationOrganizationEmploymentAssociation
    
    INSERT INTO edfi.StaffIdentificationSystemDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , StaffIdentificationSystemDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, StaffIdentificationSystemDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, StaffIdentificationSystemDescriptorId)
        )
        , StaffIdentificationSystemDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.StaffIdentificationSystemDescriptor
    -- GO


    
    INSERT INTO edfi.StaffLeave (
        HashKey
        -- Identifying references (for aggregate root entity)
        , StaffHashKey
        , StaffLeaveEventCategoryDescriptorHashKey
        -- Primary key columns
        , BeginDate
                , StaffLeaveEventCategoryDescriptorId
                , StaffUSI
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, StaffLeaveEventCategoryDescriptorId)
                    + '|' + CONVERT(nvarchar, StaffUSI)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, StaffUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, StaffLeaveEventCategoryDescriptorId)
        )
        , BeginDate
        , StaffLeaveEventCategoryDescriptorId
        , StaffUSI
    FROM EdFi_Ods_Populated_Template.edfi.StaffLeave
    -- GO

        INSERT INTO edfi.StaffLeave_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , EndDate
            , Reason
            , SubstituteAssigned
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, StaffLeaveEventCategoryDescriptorId)
                    + '|' + CONVERT(nvarchar, StaffUSI)
        )
            , @schoolYearContext
            -- Attributes
            , EndDate
            , Reason
            , SubstituteAssigned
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.StaffLeave
    
    INSERT INTO edfi.StaffLeaveEventCategoryDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , StaffLeaveEventCategoryDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, StaffLeaveEventCategoryDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, StaffLeaveEventCategoryDescriptorId)
        )
        , StaffLeaveEventCategoryDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.StaffLeaveEventCategoryDescriptor
    -- GO


    
    INSERT INTO edfi.StaffProgramAssociation (
        HashKey
        -- Identifying references (for aggregate root entity)
        , ProgramHashKey
        , StaffHashKey
        -- Primary key columns
        , BeginDate
                , ProgramEducationOrganizationId
                , ProgramName
                , ProgramTypeDescriptorId
                , StaffUSI
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, StaffUSI)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, ProgramEducationOrganizationId)
            + '|' + ProgramName
            + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, StaffUSI)
        )
        , BeginDate
        , ProgramEducationOrganizationId
        , ProgramName
        , ProgramTypeDescriptorId
        , StaffUSI
    FROM EdFi_Ods_Populated_Template.edfi.StaffProgramAssociation
    -- GO

        INSERT INTO edfi.StaffProgramAssociation_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , EndDate
            , StudentRecordAccess
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, StaffUSI)
        )
            , @schoolYearContext
            -- Attributes
            , EndDate
            , StudentRecordAccess
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.StaffProgramAssociation
    
    INSERT INTO edfi.StaffSchoolAssociation (
        HashKey
        -- Identifying references (for aggregate root entity)
        , ProgramAssignmentDescriptorHashKey
        , SchoolHashKey
        , StaffHashKey
        -- Primary key columns
        , ProgramAssignmentDescriptorId
                , SchoolId
                , StaffUSI
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, ProgramAssignmentDescriptorId)
                    + '|' + CONVERT(nvarchar, SchoolId)
                    + '|' + CONVERT(nvarchar, StaffUSI)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, ProgramAssignmentDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, SchoolId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, StaffUSI)
        )
        , ProgramAssignmentDescriptorId
        , SchoolId
        , StaffUSI
    FROM EdFi_Ods_Populated_Template.edfi.StaffSchoolAssociation
    -- GO

        INSERT INTO edfi.StaffSchoolAssociation_Attributes (
            HashKey
            , SchoolYearContext
            -- References
            , CalendarHashKey
            , SchoolYearTypeHashKey
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, ProgramAssignmentDescriptorId)
                    + '|' + CONVERT(nvarchar, SchoolId)
                    + '|' + CONVERT(nvarchar, StaffUSI)
        )
            , @schoolYearContext
            -- References
            , HASHBYTES('sha1', 
            CalendarCode
            + '|' + CONVERT(nvarchar, SchoolId)
            + '|' + CONVERT(nvarchar, SchoolYear)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, SchoolYear)
            )
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.StaffSchoolAssociation
    
    INSERT INTO edfi.StaffSchoolAssociationAcademicSubject (
        HashKey
        -- Identifying references (for aggregate child entity)
        , AcademicSubjectDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, AcademicSubjectDescriptorId)
                    + '|' + CONVERT(nvarchar, ProgramAssignmentDescriptorId)
                    + '|' + CONVERT(nvarchar, SchoolId)
                    + '|' + CONVERT(nvarchar, StaffUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, AcademicSubjectDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.StaffSchoolAssociationAcademicSubject
    -- GO

    INSERT INTO edfi.StaffSchoolAssociationGradeLevel (
        HashKey
        -- Identifying references (for aggregate child entity)
        , GradeLevelDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, GradeLevelDescriptorId)
                    + '|' + CONVERT(nvarchar, ProgramAssignmentDescriptorId)
                    + '|' + CONVERT(nvarchar, SchoolId)
                    + '|' + CONVERT(nvarchar, StaffUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, GradeLevelDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.StaffSchoolAssociationGradeLevel
    -- GO

    INSERT INTO edfi.StaffSectionAssociation (
        HashKey
        -- Identifying references (for aggregate root entity)
        , SectionHashKey
        , StaffHashKey
        -- Primary key columns
        , LocalCourseCode
                , SchoolId
                , SchoolYear
                , SectionIdentifier
                , SessionName
                , StaffUSI
        )
    SELECT 
        HASHBYTES('sha1', 
            LocalCourseCode
                    + '|' + CONVERT(nvarchar, SchoolId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
                    + '|' + SectionIdentifier
                    + '|' + SessionName
                    + '|' + CONVERT(nvarchar, StaffUSI)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            LocalCourseCode
            + '|' + CONVERT(nvarchar, SchoolId)
            + '|' + CONVERT(nvarchar, SchoolYear)
            + '|' + SectionIdentifier
            + '|' + SessionName
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, StaffUSI)
        )
        , LocalCourseCode
        , SchoolId
        , SchoolYear
        , SectionIdentifier
        , SessionName
        , StaffUSI
    FROM EdFi_Ods_Populated_Template.edfi.StaffSectionAssociation
    -- GO

        INSERT INTO edfi.StaffSectionAssociation_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , BeginDate
            , EndDate
            , HighlyQualifiedTeacher
            , PercentageContribution
            , TeacherStudentDataLinkExclusion
            -- References
            , ClassroomPositionDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            LocalCourseCode
                    + '|' + CONVERT(nvarchar, SchoolId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
                    + '|' + SectionIdentifier
                    + '|' + SessionName
                    + '|' + CONVERT(nvarchar, StaffUSI)
        )
            , @schoolYearContext
            -- Attributes
            , BeginDate
            , EndDate
            , HighlyQualifiedTeacher
            , PercentageContribution
            , TeacherStudentDataLinkExclusion
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, ClassroomPositionDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.StaffSectionAssociation
    
    INSERT INTO edfi.StateAbbreviationDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , StateAbbreviationDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, StateAbbreviationDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, StateAbbreviationDescriptorId)
        )
        , StateAbbreviationDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.StateAbbreviationDescriptor
    -- GO


    
    INSERT INTO edfi.StateEducationAgency (
        HashKey
        -- Identifying references (for aggregate root entity)
        , EducationOrganizationHashKey
        -- Primary key columns
        , StateEducationAgencyId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, StateEducationAgencyId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, StateEducationAgencyId)
        )
        , StateEducationAgencyId
    FROM EdFi_Ods_Populated_Template.edfi.StateEducationAgency
    -- GO


    
    INSERT INTO edfi.StateEducationAgencyAccountability (
        HashKey
        -- Identifying references (for aggregate child entity)
        , SchoolYearTypeHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, SchoolYear)
                    + '|' + CONVERT(nvarchar, StateEducationAgencyId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, SchoolYear)
        )
    FROM EdFi_Ods_Populated_Template.edfi.StateEducationAgencyAccountability
    -- GO

        INSERT INTO edfi.StateEducationAgencyAccountability_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , SchoolYearTypeHashKey
            -- Attributes
            , CTEGraduationRateInclusion
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, SchoolYear)
                    + '|' + CONVERT(nvarchar, StateEducationAgencyId)
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, SchoolYear)
            )
            -- Attributes
            , CTEGraduationRateInclusion
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.StateEducationAgencyAccountability
    INSERT INTO edfi.StateEducationAgencyFederalFunds (
        HashKey
        -- Identifying references (for aggregate child entity)
        -- Contextual primary key
        , FiscalYear
    )
    SELECT
        HASHBYTES('sha1', 
            + '|' + CONVERT(nvarchar, StateEducationAgencyId)
        )
            , FiscalYear
    FROM EdFi_Ods_Populated_Template.edfi.StateEducationAgencyFederalFunds
    -- GO

        INSERT INTO edfi.StateEducationAgencyFederalFunds_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            -- Contextual primary key
            , FiscalYear
            -- Attributes
            , FederalProgramsFundingAllocation
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, FiscalYear)
                    + '|' + CONVERT(nvarchar, StateEducationAgencyId)
        )
            , @schoolYearContext
            -- Identifying references
            -- Contextual primary key
            , FiscalYear
            -- Attributes
            , FederalProgramsFundingAllocation
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.StateEducationAgencyFederalFunds
    INSERT INTO edfi.Student (
        HashKey
        -- Identifying references (for aggregate root entity)
        -- Primary key columns
        , StudentUSI
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, StudentUSI)
        )
        -- Identifying references
        , StudentUSI
    FROM EdFi_Ods_Populated_Template.edfi.Student
    -- GO

        INSERT INTO edfi.Student_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , BirthCity
            , BirthDate
            , BirthInternationalProvince
            , DateEnteredUS
            , FirstName
            , GenerationCodeSuffix
            , LastSurname
            , MaidenName
            , MiddleName
            , MultipleBirthStatus
            , PersonalTitlePrefix
            , StudentUniqueId
            -- References
            , CitizenshipStatusDescriptorHashKey
            , BirthCountryDescriptorHashKey
            , PersonHashKey
            , BirthSexDescriptorHashKey
            , BirthStateAbbreviationDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- Attributes
            , BirthCity
            , BirthDate
            , BirthInternationalProvince
            , DateEnteredUS
            , FirstName
            , GenerationCodeSuffix
            , LastSurname
            , MaidenName
            , MiddleName
            , MultipleBirthStatus
            , PersonalTitlePrefix
            , StudentUniqueId
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, CitizenshipStatusDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, BirthCountryDescriptorId)
            )
            , HASHBYTES('sha1', 
            PersonId
            + '|' + CONVERT(nvarchar, SourceSystemDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, BirthSexDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, BirthStateAbbreviationDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.Student
    
    INSERT INTO edfi.StudentIdentificationDocument (
        HashKey
        -- Identifying references (for aggregate child entity)
        , IdentificationDocumentUseDescriptorHashKey
        , PersonalInformationVerificationDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, IdentificationDocumentUseDescriptorId)
                    + '|' + CONVERT(nvarchar, PersonalInformationVerificationDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, IdentificationDocumentUseDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, PersonalInformationVerificationDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.StudentIdentificationDocument
    -- GO

        INSERT INTO edfi.StudentIdentificationDocument_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , IdentificationDocumentUseDescriptorHashKey
            , PersonalInformationVerificationDescriptorHashKey
            -- Attributes
            , DocumentExpirationDate
            , DocumentTitle
            , IssuerDocumentIdentificationCode
            , IssuerName
            -- References
            , IssuerCountryDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, IdentificationDocumentUseDescriptorId)
                    + '|' + CONVERT(nvarchar, PersonalInformationVerificationDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, IdentificationDocumentUseDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, PersonalInformationVerificationDescriptorId)
            )
            -- Attributes
            , DocumentExpirationDate
            , DocumentTitle
            , IssuerDocumentIdentificationCode
            , IssuerName
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, IssuerCountryDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.StudentIdentificationDocument
    INSERT INTO edfi.StudentOtherName (
        HashKey
        -- Identifying references (for aggregate child entity)
        , OtherNameTypeDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, OtherNameTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, OtherNameTypeDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.StudentOtherName
    -- GO

        INSERT INTO edfi.StudentOtherName_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , OtherNameTypeDescriptorHashKey
            -- Attributes
            , FirstName
            , GenerationCodeSuffix
            , LastSurname
            , MiddleName
            , PersonalTitlePrefix
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, OtherNameTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, OtherNameTypeDescriptorId)
            )
            -- Attributes
            , FirstName
            , GenerationCodeSuffix
            , LastSurname
            , MiddleName
            , PersonalTitlePrefix
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.StudentOtherName
    INSERT INTO edfi.StudentPersonalIdentificationDocument (
        HashKey
        -- Identifying references (for aggregate child entity)
        , IdentificationDocumentUseDescriptorHashKey
        , PersonalInformationVerificationDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, IdentificationDocumentUseDescriptorId)
                    + '|' + CONVERT(nvarchar, PersonalInformationVerificationDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, IdentificationDocumentUseDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, PersonalInformationVerificationDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.StudentPersonalIdentificationDocument
    -- GO

        INSERT INTO edfi.StudentPersonalIdentificationDocument_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , IdentificationDocumentUseDescriptorHashKey
            , PersonalInformationVerificationDescriptorHashKey
            -- Attributes
            , DocumentExpirationDate
            , DocumentTitle
            , IssuerDocumentIdentificationCode
            , IssuerName
            -- References
            , IssuerCountryDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, IdentificationDocumentUseDescriptorId)
                    + '|' + CONVERT(nvarchar, PersonalInformationVerificationDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, IdentificationDocumentUseDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, PersonalInformationVerificationDescriptorId)
            )
            -- Attributes
            , DocumentExpirationDate
            , DocumentTitle
            , IssuerDocumentIdentificationCode
            , IssuerName
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, IssuerCountryDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.StudentPersonalIdentificationDocument
    INSERT INTO edfi.StudentVisa (
        HashKey
        -- Identifying references (for aggregate child entity)
        , VisaDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, StudentUSI)
                    + '|' + CONVERT(nvarchar, VisaDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, VisaDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.StudentVisa
    -- GO

    INSERT INTO edfi.StudentAcademicRecord (
        HashKey
        -- Identifying references (for aggregate root entity)
        , EducationOrganizationHashKey
        , SchoolYearTypeHashKey
        , StudentHashKey
        , TermDescriptorHashKey
        -- Primary key columns
        , EducationOrganizationId
                , SchoolYear
                , StudentUSI
                , TermDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
                    + '|' + CONVERT(nvarchar, StudentUSI)
                    + '|' + CONVERT(nvarchar, TermDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, SchoolYear)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, StudentUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, TermDescriptorId)
        )
        , EducationOrganizationId
        , SchoolYear
        , StudentUSI
        , TermDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.StudentAcademicRecord
    -- GO

        INSERT INTO edfi.StudentAcademicRecord_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , CumulativeAttemptedCreditConversion
            , CumulativeAttemptedCredits
            , CumulativeEarnedCreditConversion
            , CumulativeEarnedCredits
            , CumulativeGradePointAverage
            , CumulativeGradePointsEarned
            , GradeValueQualifier
            , ProjectedGraduationDate
            , SessionAttemptedCreditConversion
            , SessionAttemptedCredits
            , SessionEarnedCreditConversion
            , SessionEarnedCredits
            , SessionGradePointAverage
            , SessionGradePointsEarned
            -- References
            , CumulativeEarnedCreditTypeDescriptorHashKey
            , CumulativeAttemptedCreditTypeDescriptorHashKey
            , SessionEarnedCreditTypeDescriptorHashKey
            , SessionAttemptedCreditTypeDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
                    + '|' + CONVERT(nvarchar, StudentUSI)
                    + '|' + CONVERT(nvarchar, TermDescriptorId)
        )
            , @schoolYearContext
            -- Attributes
            , CumulativeAttemptedCreditConversion
            , CumulativeAttemptedCredits
            , CumulativeEarnedCreditConversion
            , CumulativeEarnedCredits
            , CumulativeGradePointAverage
            , CumulativeGradePointsEarned
            , GradeValueQualifier
            , ProjectedGraduationDate
            , SessionAttemptedCreditConversion
            , SessionAttemptedCredits
            , SessionEarnedCreditConversion
            , SessionEarnedCredits
            , SessionGradePointAverage
            , SessionGradePointsEarned
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, CumulativeEarnedCreditTypeDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, CumulativeAttemptedCreditTypeDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, SessionEarnedCreditTypeDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, SessionAttemptedCreditTypeDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.StudentAcademicRecord
    
    INSERT INTO edfi.StudentAcademicRecordAcademicHonor (
        HashKey
        -- Identifying references (for aggregate child entity)
        , AcademicHonorCategoryDescriptorHashKey
        -- Contextual primary key
        , HonorDescription
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, AcademicHonorCategoryDescriptorId)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
                    + '|' + CONVERT(nvarchar, StudentUSI)
                    + '|' + CONVERT(nvarchar, TermDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, AcademicHonorCategoryDescriptorId)
        )
            , HonorDescription
    FROM EdFi_Ods_Populated_Template.edfi.StudentAcademicRecordAcademicHonor
    -- GO

        INSERT INTO edfi.StudentAcademicRecordAcademicHonor_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , AcademicHonorCategoryDescriptorHashKey
            -- Contextual primary key
            , HonorDescription
            -- Attributes
            , AchievementCategorySystem
            , AchievementTitle
            , Criteria
            , CriteriaURL
            , EvidenceStatement
            , HonorAwardDate
            , HonorAwardExpiresDate
            , ImageURL
            , IssuerName
            , IssuerOriginURL
            -- References
            , AchievementCategoryDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, AcademicHonorCategoryDescriptorId)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + HonorDescription
                    + '|' + CONVERT(nvarchar, SchoolYear)
                    + '|' + CONVERT(nvarchar, StudentUSI)
                    + '|' + CONVERT(nvarchar, TermDescriptorId)
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, AcademicHonorCategoryDescriptorId)
            )
            -- Contextual primary key
            , HonorDescription
            -- Attributes
            , AchievementCategorySystem
            , AchievementTitle
            , Criteria
            , CriteriaURL
            , EvidenceStatement
            , HonorAwardDate
            , HonorAwardExpiresDate
            , ImageURL
            , IssuerName
            , IssuerOriginURL
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, AchievementCategoryDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.StudentAcademicRecordAcademicHonor
    INSERT INTO edfi.StudentAcademicRecordClassRanking (
        HashKey
        -- Identifying references (for aggregate child entity)
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
                    + '|' + CONVERT(nvarchar, StudentUSI)
                    + '|' + CONVERT(nvarchar, TermDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.StudentAcademicRecordClassRanking
    -- GO

        INSERT INTO edfi.StudentAcademicRecordClassRanking_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            -- Attributes
            , ClassRank
            , ClassRankingDate
            , PercentageRanking
            , TotalNumberInClass
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
                    + '|' + CONVERT(nvarchar, StudentUSI)
                    + '|' + CONVERT(nvarchar, TermDescriptorId)
        )
            , @schoolYearContext
            -- Identifying references
            -- Attributes
            , ClassRank
            , ClassRankingDate
            , PercentageRanking
            , TotalNumberInClass
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.StudentAcademicRecordClassRanking
    INSERT INTO edfi.StudentAcademicRecordDiploma (
        HashKey
        -- Identifying references (for aggregate child entity)
        , DiplomaTypeDescriptorHashKey
        -- Contextual primary key
        , DiplomaAwardDate
    )
    SELECT
        HASHBYTES('sha1', 
            + '|' + CONVERT(nvarchar, DiplomaTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
                    + '|' + CONVERT(nvarchar, StudentUSI)
                    + '|' + CONVERT(nvarchar, TermDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, DiplomaTypeDescriptorId)
        )
            , DiplomaAwardDate
    FROM EdFi_Ods_Populated_Template.edfi.StudentAcademicRecordDiploma
    -- GO

        INSERT INTO edfi.StudentAcademicRecordDiploma_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , DiplomaTypeDescriptorHashKey
            -- Contextual primary key
            , DiplomaAwardDate
            -- Attributes
            , AchievementCategorySystem
            , AchievementTitle
            , Criteria
            , CriteriaURL
            , CTECompleter
            , DiplomaAwardExpiresDate
            , DiplomaDescription
            , EvidenceStatement
            , ImageURL
            , IssuerName
            , IssuerOriginURL
            -- References
            , AchievementCategoryDescriptorHashKey
            , DiplomaLevelDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, DiplomaAwardDate, 23)
                    + '|' + CONVERT(nvarchar, DiplomaTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
                    + '|' + CONVERT(nvarchar, StudentUSI)
                    + '|' + CONVERT(nvarchar, TermDescriptorId)
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, DiplomaTypeDescriptorId)
            )
            -- Contextual primary key
            , DiplomaAwardDate
            -- Attributes
            , AchievementCategorySystem
            , AchievementTitle
            , Criteria
            , CriteriaURL
            , CTECompleter
            , DiplomaAwardExpiresDate
            , DiplomaDescription
            , EvidenceStatement
            , ImageURL
            , IssuerName
            , IssuerOriginURL
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, AchievementCategoryDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, DiplomaLevelDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.StudentAcademicRecordDiploma
    INSERT INTO edfi.StudentAcademicRecordGradePointAverage (
        HashKey
        -- Identifying references (for aggregate child entity)
        , GradePointAverageTypeDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, GradePointAverageTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
                    + '|' + CONVERT(nvarchar, StudentUSI)
                    + '|' + CONVERT(nvarchar, TermDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, GradePointAverageTypeDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.StudentAcademicRecordGradePointAverage
    -- GO

        INSERT INTO edfi.StudentAcademicRecordGradePointAverage_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , GradePointAverageTypeDescriptorHashKey
            -- Attributes
            , GradePointAverageValue
            , IsCumulative
            , MaxGradePointAverageValue
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, GradePointAverageTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
                    + '|' + CONVERT(nvarchar, StudentUSI)
                    + '|' + CONVERT(nvarchar, TermDescriptorId)
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, GradePointAverageTypeDescriptorId)
            )
            -- Attributes
            , GradePointAverageValue
            , IsCumulative
            , MaxGradePointAverageValue
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.StudentAcademicRecordGradePointAverage
    INSERT INTO edfi.StudentAcademicRecordRecognition (
        HashKey
        -- Identifying references (for aggregate child entity)
        , RecognitionTypeDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, RecognitionTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
                    + '|' + CONVERT(nvarchar, StudentUSI)
                    + '|' + CONVERT(nvarchar, TermDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, RecognitionTypeDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.StudentAcademicRecordRecognition
    -- GO

        INSERT INTO edfi.StudentAcademicRecordRecognition_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , RecognitionTypeDescriptorHashKey
            -- Attributes
            , AchievementCategorySystem
            , AchievementTitle
            , Criteria
            , CriteriaURL
            , EvidenceStatement
            , ImageURL
            , IssuerName
            , IssuerOriginURL
            , RecognitionAwardDate
            , RecognitionAwardExpiresDate
            , RecognitionDescription
            -- References
            , AchievementCategoryDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, RecognitionTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
                    + '|' + CONVERT(nvarchar, StudentUSI)
                    + '|' + CONVERT(nvarchar, TermDescriptorId)
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, RecognitionTypeDescriptorId)
            )
            -- Attributes
            , AchievementCategorySystem
            , AchievementTitle
            , Criteria
            , CriteriaURL
            , EvidenceStatement
            , ImageURL
            , IssuerName
            , IssuerOriginURL
            , RecognitionAwardDate
            , RecognitionAwardExpiresDate
            , RecognitionDescription
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, AchievementCategoryDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.StudentAcademicRecordRecognition
    INSERT INTO edfi.StudentAcademicRecordReportCard (
        HashKey
        -- Identifying references (for aggregate child entity)
        , ReportCardHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, GradingPeriodDescriptorId)
                    + '|' + CONVERT(nvarchar, GradingPeriodSchoolId)
                    + '|' + CONVERT(nvarchar, GradingPeriodSchoolYear)
                    + '|' + CONVERT(nvarchar, GradingPeriodSequence)
                    + '|' + CONVERT(nvarchar, SchoolYear)
                    + '|' + CONVERT(nvarchar, StudentUSI)
                    + '|' + CONVERT(nvarchar, TermDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
            + '|' + CONVERT(nvarchar, GradingPeriodDescriptorId)
            + '|' + CONVERT(nvarchar, GradingPeriodSchoolId)
            + '|' + CONVERT(nvarchar, GradingPeriodSchoolYear)
            + '|' + CONVERT(nvarchar, GradingPeriodSequence)
            + '|' + CONVERT(nvarchar, StudentUSI)
        )
    FROM EdFi_Ods_Populated_Template.edfi.StudentAcademicRecordReportCard
    -- GO

    INSERT INTO edfi.StudentAssessment (
        HashKey
        -- Identifying references (for aggregate root entity)
        , AssessmentHashKey
        , StudentHashKey
        -- Primary key columns
        , AssessmentIdentifier
                , Namespace
                , StudentAssessmentIdentifier
                , StudentUSI
        )
    SELECT 
        HASHBYTES('sha1', 
            AssessmentIdentifier
                    + '|' + Namespace
                    + '|' + StudentAssessmentIdentifier
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            AssessmentIdentifier
            + '|' + Namespace
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, StudentUSI)
        )
        , AssessmentIdentifier
        , Namespace
        , StudentAssessmentIdentifier
        , StudentUSI
    FROM EdFi_Ods_Populated_Template.edfi.StudentAssessment
    -- GO

        INSERT INTO edfi.StudentAssessment_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , AdministrationDate
            , AdministrationEndDate
            , EventDescription
            , SerialNumber
            -- References
            , AdministrationEnvironmentDescriptorHashKey
            , EventCircumstanceDescriptorHashKey
            , WhenAssessedGradeLevelDescriptorHashKey
            , AdministrationLanguageDescriptorHashKey
            , PlatformTypeDescriptorHashKey
            , ReasonNotTestedDescriptorHashKey
            , RetestIndicatorDescriptorHashKey
            , SchoolYearTypeHashKey
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            AssessmentIdentifier
                    + '|' + Namespace
                    + '|' + StudentAssessmentIdentifier
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- Attributes
            , AdministrationDate
            , AdministrationEndDate
            , EventDescription
            , SerialNumber
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, AdministrationEnvironmentDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, EventCircumstanceDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, WhenAssessedGradeLevelDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, AdministrationLanguageDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, PlatformTypeDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, ReasonNotTestedDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, RetestIndicatorDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, SchoolYear)
            )
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.StudentAssessment
    
    INSERT INTO edfi.StudentAssessmentAccommodation (
        HashKey
        -- Identifying references (for aggregate child entity)
        , AccommodationDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, AccommodationDescriptorId)
                    + '|' + AssessmentIdentifier
                    + '|' + Namespace
                    + '|' + StudentAssessmentIdentifier
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, AccommodationDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.StudentAssessmentAccommodation
    -- GO

    INSERT INTO edfi.StudentAssessmentItem (
        HashKey
        -- Identifying references (for aggregate child entity)
        , AssessmentItemHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            AssessmentIdentifier
                    + '|' + IdentificationCode
                    + '|' + Namespace
                    + '|' + StudentAssessmentIdentifier
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        , HASHBYTES('sha1', 
            AssessmentIdentifier
            + '|' + IdentificationCode
            + '|' + Namespace
        )
    FROM EdFi_Ods_Populated_Template.edfi.StudentAssessmentItem
    -- GO

        INSERT INTO edfi.StudentAssessmentItem_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , AssessmentItemHashKey
            -- Attributes
            , AssessmentResponse
            , DescriptiveFeedback
            , RawScoreResult
            , TimeAssessed
            -- References
            , AssessmentItemResultDescriptorHashKey
            , ResponseIndicatorDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            AssessmentIdentifier
                    + '|' + IdentificationCode
                    + '|' + Namespace
                    + '|' + StudentAssessmentIdentifier
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            AssessmentIdentifier
            + '|' + IdentificationCode
            + '|' + Namespace
            )
            -- Attributes
            , AssessmentResponse
            , DescriptiveFeedback
            , RawScoreResult
            , TimeAssessed
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, AssessmentItemResultDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, ResponseIndicatorDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.StudentAssessmentItem
    INSERT INTO edfi.StudentAssessmentPerformanceLevel (
        HashKey
        -- Identifying references (for aggregate child entity)
        , AssessmentReportingMethodDescriptorHashKey
        , PerformanceLevelDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            AssessmentIdentifier
                    + '|' + CONVERT(nvarchar, AssessmentReportingMethodDescriptorId)
                    + '|' + Namespace
                    + '|' + CONVERT(nvarchar, PerformanceLevelDescriptorId)
                    + '|' + StudentAssessmentIdentifier
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, AssessmentReportingMethodDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, PerformanceLevelDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.StudentAssessmentPerformanceLevel
    -- GO

        INSERT INTO edfi.StudentAssessmentPerformanceLevel_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , AssessmentReportingMethodDescriptorHashKey
            , PerformanceLevelDescriptorHashKey
            -- Attributes
            , PerformanceLevelMet
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            AssessmentIdentifier
                    + '|' + CONVERT(nvarchar, AssessmentReportingMethodDescriptorId)
                    + '|' + Namespace
                    + '|' + CONVERT(nvarchar, PerformanceLevelDescriptorId)
                    + '|' + StudentAssessmentIdentifier
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, AssessmentReportingMethodDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, PerformanceLevelDescriptorId)
            )
            -- Attributes
            , PerformanceLevelMet
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.StudentAssessmentPerformanceLevel
    INSERT INTO edfi.StudentAssessmentScoreResult (
        HashKey
        -- Identifying references (for aggregate child entity)
        , AssessmentReportingMethodDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            AssessmentIdentifier
                    + '|' + CONVERT(nvarchar, AssessmentReportingMethodDescriptorId)
                    + '|' + Namespace
                    + '|' + StudentAssessmentIdentifier
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, AssessmentReportingMethodDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.StudentAssessmentScoreResult
    -- GO

        INSERT INTO edfi.StudentAssessmentScoreResult_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , AssessmentReportingMethodDescriptorHashKey
            -- Attributes
            , Result
            -- References
            , ResultDatatypeTypeDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            AssessmentIdentifier
                    + '|' + CONVERT(nvarchar, AssessmentReportingMethodDescriptorId)
                    + '|' + Namespace
                    + '|' + StudentAssessmentIdentifier
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, AssessmentReportingMethodDescriptorId)
            )
            -- Attributes
            , Result
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, ResultDatatypeTypeDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.StudentAssessmentScoreResult
    INSERT INTO edfi.StudentAssessmentStudentObjectiveAssessment (
        HashKey
        -- Identifying references (for aggregate child entity)
        , ObjectiveAssessmentHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            AssessmentIdentifier
                    + '|' + IdentificationCode
                    + '|' + Namespace
                    + '|' + StudentAssessmentIdentifier
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        , HASHBYTES('sha1', 
            AssessmentIdentifier
            + '|' + IdentificationCode
            + '|' + Namespace
        )
    FROM EdFi_Ods_Populated_Template.edfi.StudentAssessmentStudentObjectiveAssessment
    -- GO

    INSERT INTO edfi.StudentAssessmentStudentObjectiveAssessmentPerformanceLevel (
        HashKey
        -- Identifying references (for aggregate child entity)
        , AssessmentReportingMethodDescriptorHashKey
        , PerformanceLevelDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            AssessmentIdentifier
                    + '|' + CONVERT(nvarchar, AssessmentReportingMethodDescriptorId)
                    + '|' + IdentificationCode
                    + '|' + Namespace
                    + '|' + CONVERT(nvarchar, PerformanceLevelDescriptorId)
                    + '|' + StudentAssessmentIdentifier
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, AssessmentReportingMethodDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, PerformanceLevelDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.StudentAssessmentStudentObjectiveAssessmentPerformanceLevel
    -- GO

        INSERT INTO edfi.StudentAssessmentStudentObjectiveAssessmentPerformanceLevel_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , AssessmentReportingMethodDescriptorHashKey
            , PerformanceLevelDescriptorHashKey
            -- Attributes
            , PerformanceLevelMet
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            AssessmentIdentifier
                    + '|' + CONVERT(nvarchar, AssessmentReportingMethodDescriptorId)
                    + '|' + IdentificationCode
                    + '|' + Namespace
                    + '|' + CONVERT(nvarchar, PerformanceLevelDescriptorId)
                    + '|' + StudentAssessmentIdentifier
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, AssessmentReportingMethodDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, PerformanceLevelDescriptorId)
            )
            -- Attributes
            , PerformanceLevelMet
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.StudentAssessmentStudentObjectiveAssessmentPerformanceLevel
    INSERT INTO edfi.StudentAssessmentStudentObjectiveAssessmentScoreResult (
        HashKey
        -- Identifying references (for aggregate child entity)
        , AssessmentReportingMethodDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            AssessmentIdentifier
                    + '|' + CONVERT(nvarchar, AssessmentReportingMethodDescriptorId)
                    + '|' + IdentificationCode
                    + '|' + Namespace
                    + '|' + StudentAssessmentIdentifier
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, AssessmentReportingMethodDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.StudentAssessmentStudentObjectiveAssessmentScoreResult
    -- GO

        INSERT INTO edfi.StudentAssessmentStudentObjectiveAssessmentScoreResult_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , AssessmentReportingMethodDescriptorHashKey
            -- Attributes
            , Result
            -- References
            , ResultDatatypeTypeDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            AssessmentIdentifier
                    + '|' + CONVERT(nvarchar, AssessmentReportingMethodDescriptorId)
                    + '|' + IdentificationCode
                    + '|' + Namespace
                    + '|' + StudentAssessmentIdentifier
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, AssessmentReportingMethodDescriptorId)
            )
            -- Attributes
            , Result
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, ResultDatatypeTypeDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.StudentAssessmentStudentObjectiveAssessmentScoreResult
    INSERT INTO edfi.StudentCharacteristicDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , StudentCharacteristicDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, StudentCharacteristicDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, StudentCharacteristicDescriptorId)
        )
        , StudentCharacteristicDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.StudentCharacteristicDescriptor
    -- GO


    
    INSERT INTO edfi.StudentCohortAssociation (
        HashKey
        -- Identifying references (for aggregate root entity)
        , CohortHashKey
        , StudentHashKey
        -- Primary key columns
        , BeginDate
                , CohortIdentifier
                , EducationOrganizationId
                , StudentUSI
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CohortIdentifier
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CohortIdentifier
            + '|' + CONVERT(nvarchar, EducationOrganizationId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, StudentUSI)
        )
        , BeginDate
        , CohortIdentifier
        , EducationOrganizationId
        , StudentUSI
    FROM EdFi_Ods_Populated_Template.edfi.StudentCohortAssociation
    -- GO

        INSERT INTO edfi.StudentCohortAssociation_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , EndDate
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CohortIdentifier
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- Attributes
            , EndDate
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.StudentCohortAssociation
    
    INSERT INTO edfi.StudentCohortAssociationSection (
        HashKey
        -- Identifying references (for aggregate child entity)
        , SectionHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CohortIdentifier
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + LocalCourseCode
                    + '|' + CONVERT(nvarchar, SchoolId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
                    + '|' + SectionIdentifier
                    + '|' + SessionName
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        , HASHBYTES('sha1', 
            LocalCourseCode
            + '|' + CONVERT(nvarchar, SchoolId)
            + '|' + CONVERT(nvarchar, SchoolYear)
            + '|' + SectionIdentifier
            + '|' + SessionName
        )
    FROM EdFi_Ods_Populated_Template.edfi.StudentCohortAssociationSection
    -- GO

    INSERT INTO edfi.StudentCompetencyObjective (
        HashKey
        -- Identifying references (for aggregate root entity)
        , ObjectiveCompetencyObjectiveHashKey
        , GradingPeriodHashKey
        , StudentHashKey
        -- Primary key columns
        , GradingPeriodDescriptorId
                , GradingPeriodSchoolId
                , GradingPeriodSchoolYear
                , GradingPeriodSequence
                , Objective
                , ObjectiveEducationOrganizationId
                , ObjectiveGradeLevelDescriptorId
                , StudentUSI
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, GradingPeriodDescriptorId)
                    + '|' + CONVERT(nvarchar, GradingPeriodSchoolId)
                    + '|' + CONVERT(nvarchar, GradingPeriodSchoolYear)
                    + '|' + CONVERT(nvarchar, GradingPeriodSequence)
                    + '|' + Objective
                    + '|' + CONVERT(nvarchar, ObjectiveEducationOrganizationId)
                    + '|' + CONVERT(nvarchar, ObjectiveGradeLevelDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, ObjectiveEducationOrganizationId)
            + '|' + Objective
            + '|' + CONVERT(nvarchar, ObjectiveGradeLevelDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, GradingPeriodDescriptorId)
            + '|' + CONVERT(nvarchar, GradingPeriodSequence)
            + '|' + CONVERT(nvarchar, GradingPeriodSchoolId)
            + '|' + CONVERT(nvarchar, GradingPeriodSchoolYear)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, StudentUSI)
        )
        , GradingPeriodDescriptorId
        , GradingPeriodSchoolId
        , GradingPeriodSchoolYear
        , GradingPeriodSequence
        , Objective
        , ObjectiveEducationOrganizationId
        , ObjectiveGradeLevelDescriptorId
        , StudentUSI
    FROM EdFi_Ods_Populated_Template.edfi.StudentCompetencyObjective
    -- GO

        INSERT INTO edfi.StudentCompetencyObjective_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , DiagnosticStatement
            -- References
            , CompetencyLevelDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, GradingPeriodDescriptorId)
                    + '|' + CONVERT(nvarchar, GradingPeriodSchoolId)
                    + '|' + CONVERT(nvarchar, GradingPeriodSchoolYear)
                    + '|' + CONVERT(nvarchar, GradingPeriodSequence)
                    + '|' + Objective
                    + '|' + CONVERT(nvarchar, ObjectiveEducationOrganizationId)
                    + '|' + CONVERT(nvarchar, ObjectiveGradeLevelDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- Attributes
            , DiagnosticStatement
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, CompetencyLevelDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.StudentCompetencyObjective
    
    INSERT INTO edfi.StudentCompetencyObjectiveGeneralStudentProgramAssociation (
        HashKey
        -- Identifying references (for aggregate child entity)
        , GeneralStudentProgramAssociationHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, GradingPeriodDescriptorId)
                    + '|' + CONVERT(nvarchar, GradingPeriodSchoolId)
                    + '|' + CONVERT(nvarchar, GradingPeriodSchoolYear)
                    + '|' + CONVERT(nvarchar, GradingPeriodSequence)
                    + '|' + Objective
                    + '|' + CONVERT(nvarchar, ObjectiveEducationOrganizationId)
                    + '|' + CONVERT(nvarchar, ObjectiveGradeLevelDescriptorId)
                    + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
            + '|' + CONVERT(nvarchar, EducationOrganizationId)
            + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
            + '|' + ProgramName
            + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
            + '|' + CONVERT(nvarchar, StudentUSI)
        )
    FROM EdFi_Ods_Populated_Template.edfi.StudentCompetencyObjectiveGeneralStudentProgramAssociation
    -- GO

    INSERT INTO edfi.StudentCompetencyObjectiveStudentSectionAssociation (
        HashKey
        -- Identifying references (for aggregate child entity)
        , StudentSectionAssociationHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, GradingPeriodDescriptorId)
                    + '|' + CONVERT(nvarchar, GradingPeriodSchoolId)
                    + '|' + CONVERT(nvarchar, GradingPeriodSchoolYear)
                    + '|' + CONVERT(nvarchar, GradingPeriodSequence)
                    + '|' + LocalCourseCode
                    + '|' + Objective
                    + '|' + CONVERT(nvarchar, ObjectiveEducationOrganizationId)
                    + '|' + CONVERT(nvarchar, ObjectiveGradeLevelDescriptorId)
                    + '|' + CONVERT(nvarchar, SchoolId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
                    + '|' + SectionIdentifier
                    + '|' + SessionName
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
            + '|' + LocalCourseCode
            + '|' + CONVERT(nvarchar, SchoolId)
            + '|' + CONVERT(nvarchar, SchoolYear)
            + '|' + SectionIdentifier
            + '|' + SessionName
            + '|' + CONVERT(nvarchar, StudentUSI)
        )
    FROM EdFi_Ods_Populated_Template.edfi.StudentCompetencyObjectiveStudentSectionAssociation
    -- GO

    INSERT INTO edfi.StudentCTEProgramAssociation (
        HashKey
        -- Identifying references (for aggregate root entity)
        , GeneralStudentProgramAssociationHashKey
        -- Primary key columns
        , BeginDate
                , EducationOrganizationId
                , ProgramEducationOrganizationId
                , ProgramName
                , ProgramTypeDescriptorId
                , StudentUSI
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
            + '|' + CONVERT(nvarchar, EducationOrganizationId)
            + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
            + '|' + ProgramName
            + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
            + '|' + CONVERT(nvarchar, StudentUSI)
        )
        , BeginDate
        , EducationOrganizationId
        , ProgramEducationOrganizationId
        , ProgramName
        , ProgramTypeDescriptorId
        , StudentUSI
    FROM EdFi_Ods_Populated_Template.edfi.StudentCTEProgramAssociation
    -- GO

        INSERT INTO edfi.StudentCTEProgramAssociation_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , NonTraditionalGenderStatus
            , PrivateCTEProgram
            -- References
            , TechnicalSkillsAssessmentDescriptorHashKey
            -- Boilerplate columns
)
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- Attributes
            , NonTraditionalGenderStatus
            , PrivateCTEProgram
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, TechnicalSkillsAssessmentDescriptorId)
            )
            -- Boilerplate columns
        FROM EdFi_Ods_Populated_Template.edfi.StudentCTEProgramAssociation
    
    INSERT INTO edfi.StudentCTEProgramAssociationCTEProgram (
        HashKey
        -- Identifying references (for aggregate child entity)
        , CareerPathwayDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, CareerPathwayDescriptorId)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, CareerPathwayDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.StudentCTEProgramAssociationCTEProgram
    -- GO

        INSERT INTO edfi.StudentCTEProgramAssociationCTEProgram_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , CareerPathwayDescriptorHashKey
            -- Attributes
            , CIPCode
            , CTEProgramCompletionIndicator
            , PrimaryCTEProgramIndicator
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, CareerPathwayDescriptorId)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, CareerPathwayDescriptorId)
            )
            -- Attributes
            , CIPCode
            , CTEProgramCompletionIndicator
            , PrimaryCTEProgramIndicator
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.StudentCTEProgramAssociationCTEProgram
    INSERT INTO edfi.StudentCTEProgramAssociationCTEProgramService (
        HashKey
        -- Identifying references (for aggregate child entity)
        , CTEProgramServiceDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, CTEProgramServiceDescriptorId)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, CTEProgramServiceDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.StudentCTEProgramAssociationCTEProgramService
    -- GO

        INSERT INTO edfi.StudentCTEProgramAssociationCTEProgramService_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , CTEProgramServiceDescriptorHashKey
            -- Attributes
            , CIPCode
            , PrimaryIndicator
            , ServiceBeginDate
            , ServiceEndDate
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, CTEProgramServiceDescriptorId)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, CTEProgramServiceDescriptorId)
            )
            -- Attributes
            , CIPCode
            , PrimaryIndicator
            , ServiceBeginDate
            , ServiceEndDate
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.StudentCTEProgramAssociationCTEProgramService
    INSERT INTO edfi.StudentCTEProgramAssociationService (
        HashKey
        -- Identifying references (for aggregate child entity)
        , ServiceDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, ServiceDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, ServiceDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.StudentCTEProgramAssociationService
    -- GO

        INSERT INTO edfi.StudentCTEProgramAssociationService_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , ServiceDescriptorHashKey
            -- Attributes
            , PrimaryIndicator
            , ServiceBeginDate
            , ServiceEndDate
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, ServiceDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, ServiceDescriptorId)
            )
            -- Attributes
            , PrimaryIndicator
            , ServiceBeginDate
            , ServiceEndDate
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.StudentCTEProgramAssociationService
    INSERT INTO edfi.StudentDisciplineIncidentAssociation (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DisciplineIncidentHashKey
        , StudentHashKey
        -- Primary key columns
        , IncidentIdentifier
                , SchoolId
                , StudentUSI
        )
    SELECT 
        HASHBYTES('sha1', 
            IncidentIdentifier
                    + '|' + CONVERT(nvarchar, SchoolId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            IncidentIdentifier
            + '|' + CONVERT(nvarchar, SchoolId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, StudentUSI)
        )
        , IncidentIdentifier
        , SchoolId
        , StudentUSI
    FROM EdFi_Ods_Populated_Template.edfi.StudentDisciplineIncidentAssociation
    -- GO

        INSERT INTO edfi.StudentDisciplineIncidentAssociation_Attributes (
            HashKey
            , SchoolYearContext
            -- References
            , StudentParticipationCodeDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            IncidentIdentifier
                    + '|' + CONVERT(nvarchar, SchoolId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, StudentParticipationCodeDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.StudentDisciplineIncidentAssociation
    
    INSERT INTO edfi.StudentDisciplineIncidentAssociationBehavior (
        HashKey
        -- Identifying references (for aggregate child entity)
        , BehaviorDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, BehaviorDescriptorId)
                    + '|' + IncidentIdentifier
                    + '|' + CONVERT(nvarchar, SchoolId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, BehaviorDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.StudentDisciplineIncidentAssociationBehavior
    -- GO

        INSERT INTO edfi.StudentDisciplineIncidentAssociationBehavior_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , BehaviorDescriptorHashKey
            -- Attributes
            , BehaviorDetailedDescription
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, BehaviorDescriptorId)
                    + '|' + IncidentIdentifier
                    + '|' + CONVERT(nvarchar, SchoolId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, BehaviorDescriptorId)
            )
            -- Attributes
            , BehaviorDetailedDescription
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.StudentDisciplineIncidentAssociationBehavior
    INSERT INTO edfi.StudentEducationOrganizationAssociation (
        HashKey
        -- Identifying references (for aggregate root entity)
        , EducationOrganizationHashKey
        , StudentHashKey
        -- Primary key columns
        , EducationOrganizationId
                , StudentUSI
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, StudentUSI)
        )
        , EducationOrganizationId
        , StudentUSI
    FROM EdFi_Ods_Populated_Template.edfi.StudentEducationOrganizationAssociation
    -- GO

        INSERT INTO edfi.StudentEducationOrganizationAssociation_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , HispanicLatinoEthnicity
            , LoginId
            , ProfileThumbnail
            -- References
            , LimitedEnglishProficiencyDescriptorHashKey
            , OldEthnicityDescriptorHashKey
            , SexDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- Attributes
            , HispanicLatinoEthnicity
            , LoginId
            , ProfileThumbnail
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, LimitedEnglishProficiencyDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, OldEthnicityDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, SexDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.StudentEducationOrganizationAssociation
    
    INSERT INTO edfi.StudentEducationOrganizationAssociationAddress (
        HashKey
        -- Identifying references (for aggregate child entity)
        , AddressTypeDescriptorHashKey
        , StateAbbreviationDescriptorHashKey
        -- Contextual primary key
        , City
        , PostalCode
        , StreetNumberName
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, AddressTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, StateAbbreviationDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, AddressTypeDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, StateAbbreviationDescriptorId)
        )
            , City
            , PostalCode
            , StreetNumberName
    FROM EdFi_Ods_Populated_Template.edfi.StudentEducationOrganizationAssociationAddress
    -- GO

        INSERT INTO edfi.StudentEducationOrganizationAssociationAddress_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , AddressTypeDescriptorHashKey
            , StateAbbreviationDescriptorHashKey
            -- Contextual primary key
            , City
            , PostalCode
            , StreetNumberName
            -- Attributes
            , ApartmentRoomSuiteNumber
            , BuildingSiteNumber
            , CongressionalDistrict
            , CountyFIPSCode
            , DoNotPublishIndicator
            , Latitude
            , Longitude
            , NameOfCounty
            -- References
            , LocaleDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, AddressTypeDescriptorId)
                    + '|' + City
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + PostalCode
                    + '|' + CONVERT(nvarchar, StateAbbreviationDescriptorId)
                    + '|' + StreetNumberName
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, AddressTypeDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, StateAbbreviationDescriptorId)
            )
            -- Contextual primary key
            , City
            , PostalCode
            , StreetNumberName
            -- Attributes
            , ApartmentRoomSuiteNumber
            , BuildingSiteNumber
            , CongressionalDistrict
            , CountyFIPSCode
            , DoNotPublishIndicator
            , Latitude
            , Longitude
            , NameOfCounty
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, LocaleDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.StudentEducationOrganizationAssociationAddress
    INSERT INTO edfi.StudentEducationOrganizationAssociationAddressPeriod (
        HashKey
        -- Identifying references (for aggregate child entity)
        -- Contextual primary key
        , BeginDate
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, AddressTypeDescriptorId)
                    + '|' + City
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + PostalCode
                    + '|' + CONVERT(nvarchar, StateAbbreviationDescriptorId)
                    + '|' + StreetNumberName
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , BeginDate
    FROM EdFi_Ods_Populated_Template.edfi.StudentEducationOrganizationAssociationAddressPeriod
    -- GO

        INSERT INTO edfi.StudentEducationOrganizationAssociationAddressPeriod_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            -- Contextual primary key
            , BeginDate
            -- Attributes
            , EndDate
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, AddressTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, BeginDate, 23)
                    + '|' + City
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + PostalCode
                    + '|' + CONVERT(nvarchar, StateAbbreviationDescriptorId)
                    + '|' + StreetNumberName
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- Identifying references
            -- Contextual primary key
            , BeginDate
            -- Attributes
            , EndDate
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.StudentEducationOrganizationAssociationAddressPeriod
    INSERT INTO edfi.StudentEducationOrganizationAssociationCohortYear (
        HashKey
        -- Identifying references (for aggregate child entity)
        , CohortYearTypeDescriptorHashKey
        , SchoolYearTypeHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, CohortYearTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, CohortYearTypeDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, SchoolYear)
        )
    FROM EdFi_Ods_Populated_Template.edfi.StudentEducationOrganizationAssociationCohortYear
    -- GO

    INSERT INTO edfi.StudentEducationOrganizationAssociationDisability (
        HashKey
        -- Identifying references (for aggregate child entity)
        , DisabilityDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, DisabilityDescriptorId)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, DisabilityDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.StudentEducationOrganizationAssociationDisability
    -- GO

        INSERT INTO edfi.StudentEducationOrganizationAssociationDisability_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , DisabilityDescriptorHashKey
            -- Attributes
            , DisabilityDiagnosis
            , OrderOfDisability
            -- References
            , DisabilityDeterminationSourceTypeDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, DisabilityDescriptorId)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, DisabilityDescriptorId)
            )
            -- Attributes
            , DisabilityDiagnosis
            , OrderOfDisability
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, DisabilityDeterminationSourceTypeDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.StudentEducationOrganizationAssociationDisability
    INSERT INTO edfi.StudentEducationOrganizationAssociationDisabilityDesignation (
        HashKey
        -- Identifying references (for aggregate child entity)
        , DisabilityDesignationDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, DisabilityDescriptorId)
                    + '|' + CONVERT(nvarchar, DisabilityDesignationDescriptorId)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, DisabilityDesignationDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.StudentEducationOrganizationAssociationDisabilityDesignation
    -- GO

    INSERT INTO edfi.StudentEducationOrganizationAssociationElectronicMail (
        HashKey
        -- Identifying references (for aggregate child entity)
        , ElectronicMailTypeDescriptorHashKey
        -- Contextual primary key
        , ElectronicMailAddress
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, ElectronicMailTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, ElectronicMailTypeDescriptorId)
        )
            , ElectronicMailAddress
    FROM EdFi_Ods_Populated_Template.edfi.StudentEducationOrganizationAssociationElectronicMail
    -- GO

        INSERT INTO edfi.StudentEducationOrganizationAssociationElectronicMail_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , ElectronicMailTypeDescriptorHashKey
            -- Contextual primary key
            , ElectronicMailAddress
            -- Attributes
            , DoNotPublishIndicator
            , PrimaryEmailAddressIndicator
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + ElectronicMailAddress
                    + '|' + CONVERT(nvarchar, ElectronicMailTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, ElectronicMailTypeDescriptorId)
            )
            -- Contextual primary key
            , ElectronicMailAddress
            -- Attributes
            , DoNotPublishIndicator
            , PrimaryEmailAddressIndicator
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.StudentEducationOrganizationAssociationElectronicMail
    INSERT INTO edfi.StudentEducationOrganizationAssociationInternationalAddress (
        HashKey
        -- Identifying references (for aggregate child entity)
        , AddressTypeDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, AddressTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, AddressTypeDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.StudentEducationOrganizationAssociationInternationalAddress
    -- GO

        INSERT INTO edfi.StudentEducationOrganizationAssociationInternationalAddress_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , AddressTypeDescriptorHashKey
            -- Attributes
            , AddressLine1
            , AddressLine2
            , AddressLine3
            , AddressLine4
            , BeginDate
            , EndDate
            , Latitude
            , Longitude
            -- References
            , CountryDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, AddressTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, AddressTypeDescriptorId)
            )
            -- Attributes
            , AddressLine1
            , AddressLine2
            , AddressLine3
            , AddressLine4
            , BeginDate
            , EndDate
            , Latitude
            , Longitude
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, CountryDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.StudentEducationOrganizationAssociationInternationalAddress
    INSERT INTO edfi.StudentEducationOrganizationAssociationLanguage (
        HashKey
        -- Identifying references (for aggregate child entity)
        , LanguageDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, LanguageDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, LanguageDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.StudentEducationOrganizationAssociationLanguage
    -- GO

    INSERT INTO edfi.StudentEducationOrganizationAssociationLanguageUse (
        HashKey
        -- Identifying references (for aggregate child entity)
        , LanguageUseDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, LanguageDescriptorId)
                    + '|' + CONVERT(nvarchar, LanguageUseDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, LanguageUseDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.StudentEducationOrganizationAssociationLanguageUse
    -- GO

    INSERT INTO edfi.StudentEducationOrganizationAssociationProgramParticipation (
        HashKey
        -- Identifying references (for aggregate child entity)
        , ProgramTypeDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, ProgramTypeDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.StudentEducationOrganizationAssociationProgramParticipation
    -- GO

        INSERT INTO edfi.StudentEducationOrganizationAssociationProgramParticipation_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , ProgramTypeDescriptorHashKey
            -- Attributes
            , BeginDate
            , DesignatedBy
            , EndDate
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, ProgramTypeDescriptorId)
            )
            -- Attributes
            , BeginDate
            , DesignatedBy
            , EndDate
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.StudentEducationOrganizationAssociationProgramParticipation
    INSERT INTO edfi.StudentEducationOrganizationAssociationProgramParticipationProgramCharacteristic (
        HashKey
        -- Identifying references (for aggregate child entity)
        , ProgramCharacteristicDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, ProgramCharacteristicDescriptorId)
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, ProgramCharacteristicDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.StudentEducationOrganizationAssociationProgramParticipationProgramCharacteristic
    -- GO

    INSERT INTO edfi.StudentEducationOrganizationAssociationRace (
        HashKey
        -- Identifying references (for aggregate child entity)
        , RaceDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, RaceDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, RaceDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.StudentEducationOrganizationAssociationRace
    -- GO

    INSERT INTO edfi.StudentEducationOrganizationAssociationStudentCharacteristic (
        HashKey
        -- Identifying references (for aggregate child entity)
        , StudentCharacteristicDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, StudentCharacteristicDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, StudentCharacteristicDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.StudentEducationOrganizationAssociationStudentCharacteristic
    -- GO

        INSERT INTO edfi.StudentEducationOrganizationAssociationStudentCharacteristic_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , StudentCharacteristicDescriptorHashKey
            -- Attributes
            , DesignatedBy
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, StudentCharacteristicDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, StudentCharacteristicDescriptorId)
            )
            -- Attributes
            , DesignatedBy
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.StudentEducationOrganizationAssociationStudentCharacteristic
    INSERT INTO edfi.StudentEducationOrganizationAssociationStudentCharacteristicPeriod (
        HashKey
        -- Identifying references (for aggregate child entity)
        -- Contextual primary key
        , BeginDate
    )
    SELECT
        HASHBYTES('sha1', 
            + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, StudentCharacteristicDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , BeginDate
    FROM EdFi_Ods_Populated_Template.edfi.StudentEducationOrganizationAssociationStudentCharacteristicPeriod
    -- GO

        INSERT INTO edfi.StudentEducationOrganizationAssociationStudentCharacteristicPeriod_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            -- Contextual primary key
            , BeginDate
            -- Attributes
            , EndDate
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, StudentCharacteristicDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- Identifying references
            -- Contextual primary key
            , BeginDate
            -- Attributes
            , EndDate
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.StudentEducationOrganizationAssociationStudentCharacteristicPeriod
    INSERT INTO edfi.StudentEducationOrganizationAssociationStudentIdentificationCode (
        HashKey
        -- Identifying references (for aggregate child entity)
        , StudentIdentificationSystemDescriptorHashKey
        -- Contextual primary key
        , AssigningOrganizationIdentificationCode
    )
    SELECT
        HASHBYTES('sha1', 
            + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, StudentIdentificationSystemDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, StudentIdentificationSystemDescriptorId)
        )
            , AssigningOrganizationIdentificationCode
    FROM EdFi_Ods_Populated_Template.edfi.StudentEducationOrganizationAssociationStudentIdentificationCode
    -- GO

        INSERT INTO edfi.StudentEducationOrganizationAssociationStudentIdentificationCode_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , StudentIdentificationSystemDescriptorHashKey
            -- Contextual primary key
            , AssigningOrganizationIdentificationCode
            -- Attributes
            , IdentificationCode
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            AssigningOrganizationIdentificationCode
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, StudentIdentificationSystemDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, StudentIdentificationSystemDescriptorId)
            )
            -- Contextual primary key
            , AssigningOrganizationIdentificationCode
            -- Attributes
            , IdentificationCode
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.StudentEducationOrganizationAssociationStudentIdentificationCode
    INSERT INTO edfi.StudentEducationOrganizationAssociationStudentIndicator (
        HashKey
        -- Identifying references (for aggregate child entity)
        -- Contextual primary key
        , IndicatorName
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , IndicatorName
    FROM EdFi_Ods_Populated_Template.edfi.StudentEducationOrganizationAssociationStudentIndicator
    -- GO

        INSERT INTO edfi.StudentEducationOrganizationAssociationStudentIndicator_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            -- Contextual primary key
            , IndicatorName
            -- Attributes
            , DesignatedBy
            , Indicator
            , IndicatorGroup
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + IndicatorName
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- Identifying references
            -- Contextual primary key
            , IndicatorName
            -- Attributes
            , DesignatedBy
            , Indicator
            , IndicatorGroup
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.StudentEducationOrganizationAssociationStudentIndicator
    INSERT INTO edfi.StudentEducationOrganizationAssociationStudentIndicatorPeriod (
        HashKey
        -- Identifying references (for aggregate child entity)
        -- Contextual primary key
        , BeginDate
    )
    SELECT
        HASHBYTES('sha1', 
            + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + IndicatorName
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , BeginDate
    FROM EdFi_Ods_Populated_Template.edfi.StudentEducationOrganizationAssociationStudentIndicatorPeriod
    -- GO

        INSERT INTO edfi.StudentEducationOrganizationAssociationStudentIndicatorPeriod_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            -- Contextual primary key
            , BeginDate
            -- Attributes
            , EndDate
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + IndicatorName
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- Identifying references
            -- Contextual primary key
            , BeginDate
            -- Attributes
            , EndDate
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.StudentEducationOrganizationAssociationStudentIndicatorPeriod
    INSERT INTO edfi.StudentEducationOrganizationAssociationTelephone (
        HashKey
        -- Identifying references (for aggregate child entity)
        , TelephoneNumberTypeDescriptorHashKey
        -- Contextual primary key
        , TelephoneNumber
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
                    + '|' + CONVERT(nvarchar, TelephoneNumberTypeDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, TelephoneNumberTypeDescriptorId)
        )
            , TelephoneNumber
    FROM EdFi_Ods_Populated_Template.edfi.StudentEducationOrganizationAssociationTelephone
    -- GO

        INSERT INTO edfi.StudentEducationOrganizationAssociationTelephone_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , TelephoneNumberTypeDescriptorHashKey
            -- Contextual primary key
            , TelephoneNumber
            -- Attributes
            , DoNotPublishIndicator
            , OrderOfPriority
            , TextMessageCapabilityIndicator
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
                    + '|' + TelephoneNumber
                    + '|' + CONVERT(nvarchar, TelephoneNumberTypeDescriptorId)
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, TelephoneNumberTypeDescriptorId)
            )
            -- Contextual primary key
            , TelephoneNumber
            -- Attributes
            , DoNotPublishIndicator
            , OrderOfPriority
            , TextMessageCapabilityIndicator
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.StudentEducationOrganizationAssociationTelephone
    INSERT INTO edfi.StudentEducationOrganizationAssociationTribalAffiliation (
        HashKey
        -- Identifying references (for aggregate child entity)
        , TribalAffiliationDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
                    + '|' + CONVERT(nvarchar, TribalAffiliationDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, TribalAffiliationDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.StudentEducationOrganizationAssociationTribalAffiliation
    -- GO

    INSERT INTO edfi.StudentEducationOrganizationResponsibilityAssociation (
        HashKey
        -- Identifying references (for aggregate root entity)
        , EducationOrganizationHashKey
        , ResponsibilityDescriptorHashKey
        , StudentHashKey
        -- Primary key columns
        , BeginDate
                , EducationOrganizationId
                , ResponsibilityDescriptorId
                , StudentUSI
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, ResponsibilityDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, ResponsibilityDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, StudentUSI)
        )
        , BeginDate
        , EducationOrganizationId
        , ResponsibilityDescriptorId
        , StudentUSI
    FROM EdFi_Ods_Populated_Template.edfi.StudentEducationOrganizationResponsibilityAssociation
    -- GO

        INSERT INTO edfi.StudentEducationOrganizationResponsibilityAssociation_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , EndDate
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, ResponsibilityDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- Attributes
            , EndDate
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.StudentEducationOrganizationResponsibilityAssociation
    
    INSERT INTO edfi.StudentGradebookEntry (
        HashKey
        -- Identifying references (for aggregate root entity)
        , GradebookEntryHashKey
        , StudentSectionAssociationHashKey
        -- Primary key columns
        , BeginDate
                , DateAssigned
                , GradebookEntryTitle
                , LocalCourseCode
                , SchoolId
                , SchoolYear
                , SectionIdentifier
                , SessionName
                , StudentUSI
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, DateAssigned, 23)
                    + '|' + GradebookEntryTitle
                    + '|' + LocalCourseCode
                    + '|' + CONVERT(nvarchar, SchoolId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
                    + '|' + SectionIdentifier
                    + '|' + SessionName
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, DateAssigned, 23)
            + '|' + GradebookEntryTitle
            + '|' + LocalCourseCode
            + '|' + CONVERT(nvarchar, SchoolId)
            + '|' + CONVERT(nvarchar, SchoolYear)
            + '|' + SectionIdentifier
            + '|' + SessionName
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
            + '|' + LocalCourseCode
            + '|' + CONVERT(nvarchar, SchoolId)
            + '|' + CONVERT(nvarchar, SchoolYear)
            + '|' + SectionIdentifier
            + '|' + SessionName
            + '|' + CONVERT(nvarchar, StudentUSI)
        )
        , BeginDate
        , DateAssigned
        , GradebookEntryTitle
        , LocalCourseCode
        , SchoolId
        , SchoolYear
        , SectionIdentifier
        , SessionName
        , StudentUSI
    FROM EdFi_Ods_Populated_Template.edfi.StudentGradebookEntry
    -- GO

        INSERT INTO edfi.StudentGradebookEntry_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , DateFulfilled
            , DiagnosticStatement
            , LetterGradeEarned
            , NumericGradeEarned
            -- References
            , CompetencyLevelDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, DateAssigned, 23)
                    + '|' + GradebookEntryTitle
                    + '|' + LocalCourseCode
                    + '|' + CONVERT(nvarchar, SchoolId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
                    + '|' + SectionIdentifier
                    + '|' + SessionName
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- Attributes
            , DateFulfilled
            , DiagnosticStatement
            , LetterGradeEarned
            , NumericGradeEarned
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, CompetencyLevelDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.StudentGradebookEntry
    
    INSERT INTO edfi.StudentHomelessProgramAssociation (
        HashKey
        -- Identifying references (for aggregate root entity)
        , GeneralStudentProgramAssociationHashKey
        -- Primary key columns
        , BeginDate
                , EducationOrganizationId
                , ProgramEducationOrganizationId
                , ProgramName
                , ProgramTypeDescriptorId
                , StudentUSI
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
            + '|' + CONVERT(nvarchar, EducationOrganizationId)
            + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
            + '|' + ProgramName
            + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
            + '|' + CONVERT(nvarchar, StudentUSI)
        )
        , BeginDate
        , EducationOrganizationId
        , ProgramEducationOrganizationId
        , ProgramName
        , ProgramTypeDescriptorId
        , StudentUSI
    FROM EdFi_Ods_Populated_Template.edfi.StudentHomelessProgramAssociation
    -- GO

        INSERT INTO edfi.StudentHomelessProgramAssociation_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , AwaitingFosterCare
            , HomelessUnaccompaniedYouth
            -- References
            , HomelessPrimaryNighttimeResidenceDescriptorHashKey
            -- Boilerplate columns
)
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- Attributes
            , AwaitingFosterCare
            , HomelessUnaccompaniedYouth
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, HomelessPrimaryNighttimeResidenceDescriptorId)
            )
            -- Boilerplate columns
        FROM EdFi_Ods_Populated_Template.edfi.StudentHomelessProgramAssociation
    
    INSERT INTO edfi.StudentHomelessProgramAssociationHomelessProgramService (
        HashKey
        -- Identifying references (for aggregate child entity)
        , HomelessProgramServiceDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, HomelessProgramServiceDescriptorId)
                    + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, HomelessProgramServiceDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.StudentHomelessProgramAssociationHomelessProgramService
    -- GO

        INSERT INTO edfi.StudentHomelessProgramAssociationHomelessProgramService_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , HomelessProgramServiceDescriptorHashKey
            -- Attributes
            , PrimaryIndicator
            , ServiceBeginDate
            , ServiceEndDate
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, HomelessProgramServiceDescriptorId)
                    + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, HomelessProgramServiceDescriptorId)
            )
            -- Attributes
            , PrimaryIndicator
            , ServiceBeginDate
            , ServiceEndDate
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.StudentHomelessProgramAssociationHomelessProgramService
    INSERT INTO edfi.StudentIdentificationSystemDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , StudentIdentificationSystemDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, StudentIdentificationSystemDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, StudentIdentificationSystemDescriptorId)
        )
        , StudentIdentificationSystemDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.StudentIdentificationSystemDescriptor
    -- GO


    
    INSERT INTO edfi.StudentInterventionAssociation (
        HashKey
        -- Identifying references (for aggregate root entity)
        , InterventionHashKey
        , StudentHashKey
        -- Primary key columns
        , EducationOrganizationId
                , InterventionIdentificationCode
                , StudentUSI
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + InterventionIdentificationCode
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
            + '|' + InterventionIdentificationCode
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, StudentUSI)
        )
        , EducationOrganizationId
        , InterventionIdentificationCode
        , StudentUSI
    FROM EdFi_Ods_Populated_Template.edfi.StudentInterventionAssociation
    -- GO

        INSERT INTO edfi.StudentInterventionAssociation_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , DiagnosticStatement
            , Dosage
            -- References
            , CohortHashKey
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + InterventionIdentificationCode
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- Attributes
            , DiagnosticStatement
            , Dosage
            -- References
            , HASHBYTES('sha1', 
            CohortIdentifier
            + '|' + CONVERT(nvarchar, CohortEducationOrganizationId)
            )
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.StudentInterventionAssociation
    
    INSERT INTO edfi.StudentInterventionAssociationInterventionEffectiveness (
        HashKey
        -- Identifying references (for aggregate child entity)
        , DiagnosisDescriptorHashKey
        , GradeLevelDescriptorHashKey
        , PopulationServedDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, DiagnosisDescriptorId)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, GradeLevelDescriptorId)
                    + '|' + InterventionIdentificationCode
                    + '|' + CONVERT(nvarchar, PopulationServedDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, DiagnosisDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, GradeLevelDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, PopulationServedDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.StudentInterventionAssociationInterventionEffectiveness
    -- GO

        INSERT INTO edfi.StudentInterventionAssociationInterventionEffectiveness_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , DiagnosisDescriptorHashKey
            , GradeLevelDescriptorHashKey
            , PopulationServedDescriptorHashKey
            -- Attributes
            , ImprovementIndex
            -- References
            , InterventionEffectivenessRatingDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, DiagnosisDescriptorId)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, GradeLevelDescriptorId)
                    + '|' + InterventionIdentificationCode
                    + '|' + CONVERT(nvarchar, PopulationServedDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, DiagnosisDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, GradeLevelDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, PopulationServedDescriptorId)
            )
            -- Attributes
            , ImprovementIndex
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, InterventionEffectivenessRatingDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.StudentInterventionAssociationInterventionEffectiveness
    INSERT INTO edfi.StudentInterventionAttendanceEvent (
        HashKey
        -- Identifying references (for aggregate root entity)
        , AttendanceEventCategoryDescriptorHashKey
        , InterventionHashKey
        , StudentHashKey
        -- Primary key columns
        , AttendanceEventCategoryDescriptorId
                , EducationOrganizationId
                , EventDate
                , InterventionIdentificationCode
                , StudentUSI
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, AttendanceEventCategoryDescriptorId)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, EventDate, 23)
                    + '|' + InterventionIdentificationCode
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, AttendanceEventCategoryDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
            + '|' + InterventionIdentificationCode
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, StudentUSI)
        )
        , AttendanceEventCategoryDescriptorId
        , EducationOrganizationId
        , EventDate
        , InterventionIdentificationCode
        , StudentUSI
    FROM EdFi_Ods_Populated_Template.edfi.StudentInterventionAttendanceEvent
    -- GO

        INSERT INTO edfi.StudentInterventionAttendanceEvent_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , AttendanceEventReason
            , EventDuration
            , InterventionDuration
            -- References
            , EducationalEnvironmentDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, AttendanceEventCategoryDescriptorId)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, EventDate, 23)
                    + '|' + InterventionIdentificationCode
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- Attributes
            , AttendanceEventReason
            , EventDuration
            , InterventionDuration
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationalEnvironmentDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.StudentInterventionAttendanceEvent
    
    INSERT INTO edfi.StudentLanguageInstructionProgramAssociation (
        HashKey
        -- Identifying references (for aggregate root entity)
        , GeneralStudentProgramAssociationHashKey
        -- Primary key columns
        , BeginDate
                , EducationOrganizationId
                , ProgramEducationOrganizationId
                , ProgramName
                , ProgramTypeDescriptorId
                , StudentUSI
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
            + '|' + CONVERT(nvarchar, EducationOrganizationId)
            + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
            + '|' + ProgramName
            + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
            + '|' + CONVERT(nvarchar, StudentUSI)
        )
        , BeginDate
        , EducationOrganizationId
        , ProgramEducationOrganizationId
        , ProgramName
        , ProgramTypeDescriptorId
        , StudentUSI
    FROM EdFi_Ods_Populated_Template.edfi.StudentLanguageInstructionProgramAssociation
    -- GO

        INSERT INTO edfi.StudentLanguageInstructionProgramAssociation_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , Dosage
            , EnglishLearnerParticipation
            -- Boilerplate columns
)
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- Attributes
            , Dosage
            , EnglishLearnerParticipation
            -- Boilerplate columns
        FROM EdFi_Ods_Populated_Template.edfi.StudentLanguageInstructionProgramAssociation
    
    INSERT INTO edfi.StudentLanguageInstructionProgramAssociationEnglishLanguageProficiencyAssessment (
        HashKey
        -- Identifying references (for aggregate child entity)
        , SchoolYearTypeHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, SchoolYear)
        )
    FROM EdFi_Ods_Populated_Template.edfi.StudentLanguageInstructionProgramAssociationEnglishLanguageProficiencyAssessment
    -- GO

        INSERT INTO edfi.StudentLanguageInstructionProgramAssociationEnglishLanguageProficiencyAssessment_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , SchoolYearTypeHashKey
            -- References
            , MonitoredDescriptorHashKey
            , ParticipationDescriptorHashKey
            , ProficiencyDescriptorHashKey
            , ProgressDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, SchoolYear)
            )
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, MonitoredDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, ParticipationDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, ProficiencyDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, ProgressDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.StudentLanguageInstructionProgramAssociationEnglishLanguageProficiencyAssessment
    INSERT INTO edfi.StudentLanguageInstructionProgramAssociationLanguageInstructionProgramService (
        HashKey
        -- Identifying references (for aggregate child entity)
        , LanguageInstructionProgramServiceDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, LanguageInstructionProgramServiceDescriptorId)
                    + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, LanguageInstructionProgramServiceDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.StudentLanguageInstructionProgramAssociationLanguageInstructionProgramService
    -- GO

        INSERT INTO edfi.StudentLanguageInstructionProgramAssociationLanguageInstructionProgramService_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , LanguageInstructionProgramServiceDescriptorHashKey
            -- Attributes
            , PrimaryIndicator
            , ServiceBeginDate
            , ServiceEndDate
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, LanguageInstructionProgramServiceDescriptorId)
                    + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, LanguageInstructionProgramServiceDescriptorId)
            )
            -- Attributes
            , PrimaryIndicator
            , ServiceBeginDate
            , ServiceEndDate
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.StudentLanguageInstructionProgramAssociationLanguageInstructionProgramService
    INSERT INTO edfi.StudentLearningObjective (
        HashKey
        -- Identifying references (for aggregate root entity)
        , GradingPeriodHashKey
        , LearningObjectiveHashKey
        , StudentHashKey
        -- Primary key columns
        , GradingPeriodDescriptorId
                , GradingPeriodSchoolId
                , GradingPeriodSchoolYear
                , GradingPeriodSequence
                , LearningObjectiveId
                , Namespace
                , StudentUSI
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, GradingPeriodDescriptorId)
                    + '|' + CONVERT(nvarchar, GradingPeriodSchoolId)
                    + '|' + CONVERT(nvarchar, GradingPeriodSchoolYear)
                    + '|' + CONVERT(nvarchar, GradingPeriodSequence)
                    + '|' + LearningObjectiveId
                    + '|' + Namespace
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, GradingPeriodDescriptorId)
            + '|' + CONVERT(nvarchar, GradingPeriodSequence)
            + '|' + CONVERT(nvarchar, GradingPeriodSchoolId)
            + '|' + CONVERT(nvarchar, GradingPeriodSchoolYear)
        )
        , HASHBYTES('sha1', 
            LearningObjectiveId
            + '|' + Namespace
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, StudentUSI)
        )
        , GradingPeriodDescriptorId
        , GradingPeriodSchoolId
        , GradingPeriodSchoolYear
        , GradingPeriodSequence
        , LearningObjectiveId
        , Namespace
        , StudentUSI
    FROM EdFi_Ods_Populated_Template.edfi.StudentLearningObjective
    -- GO

        INSERT INTO edfi.StudentLearningObjective_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , DiagnosticStatement
            -- References
            , CompetencyLevelDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, GradingPeriodDescriptorId)
                    + '|' + CONVERT(nvarchar, GradingPeriodSchoolId)
                    + '|' + CONVERT(nvarchar, GradingPeriodSchoolYear)
                    + '|' + CONVERT(nvarchar, GradingPeriodSequence)
                    + '|' + LearningObjectiveId
                    + '|' + Namespace
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- Attributes
            , DiagnosticStatement
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, CompetencyLevelDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.StudentLearningObjective
    
    INSERT INTO edfi.StudentLearningObjectiveGeneralStudentProgramAssociation (
        HashKey
        -- Identifying references (for aggregate child entity)
        , GeneralStudentProgramAssociationHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, GradingPeriodDescriptorId)
                    + '|' + CONVERT(nvarchar, GradingPeriodSchoolId)
                    + '|' + CONVERT(nvarchar, GradingPeriodSchoolYear)
                    + '|' + CONVERT(nvarchar, GradingPeriodSequence)
                    + '|' + LearningObjectiveId
                    + '|' + Namespace
                    + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
            + '|' + CONVERT(nvarchar, EducationOrganizationId)
            + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
            + '|' + ProgramName
            + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
            + '|' + CONVERT(nvarchar, StudentUSI)
        )
    FROM EdFi_Ods_Populated_Template.edfi.StudentLearningObjectiveGeneralStudentProgramAssociation
    -- GO

    INSERT INTO edfi.StudentLearningObjectiveStudentSectionAssociation (
        HashKey
        -- Identifying references (for aggregate child entity)
        , StudentSectionAssociationHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, GradingPeriodDescriptorId)
                    + '|' + CONVERT(nvarchar, GradingPeriodSchoolId)
                    + '|' + CONVERT(nvarchar, GradingPeriodSchoolYear)
                    + '|' + CONVERT(nvarchar, GradingPeriodSequence)
                    + '|' + LearningObjectiveId
                    + '|' + LocalCourseCode
                    + '|' + Namespace
                    + '|' + CONVERT(nvarchar, SchoolId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
                    + '|' + SectionIdentifier
                    + '|' + SessionName
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
            + '|' + LocalCourseCode
            + '|' + CONVERT(nvarchar, SchoolId)
            + '|' + CONVERT(nvarchar, SchoolYear)
            + '|' + SectionIdentifier
            + '|' + SessionName
            + '|' + CONVERT(nvarchar, StudentUSI)
        )
    FROM EdFi_Ods_Populated_Template.edfi.StudentLearningObjectiveStudentSectionAssociation
    -- GO

    INSERT INTO edfi.StudentMigrantEducationProgramAssociation (
        HashKey
        -- Identifying references (for aggregate root entity)
        , GeneralStudentProgramAssociationHashKey
        -- Primary key columns
        , BeginDate
                , EducationOrganizationId
                , ProgramEducationOrganizationId
                , ProgramName
                , ProgramTypeDescriptorId
                , StudentUSI
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
            + '|' + CONVERT(nvarchar, EducationOrganizationId)
            + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
            + '|' + ProgramName
            + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
            + '|' + CONVERT(nvarchar, StudentUSI)
        )
        , BeginDate
        , EducationOrganizationId
        , ProgramEducationOrganizationId
        , ProgramName
        , ProgramTypeDescriptorId
        , StudentUSI
    FROM EdFi_Ods_Populated_Template.edfi.StudentMigrantEducationProgramAssociation
    -- GO

        INSERT INTO edfi.StudentMigrantEducationProgramAssociation_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , EligibilityExpirationDate
            , LastQualifyingMove
            , PriorityForServices
            , QualifyingArrivalDate
            , StateResidencyDate
            , USInitialEntry
            , USInitialSchoolEntry
            , USMostRecentEntry
            -- References
            , ContinuationOfServicesReasonDescriptorHashKey
            -- Boilerplate columns
)
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- Attributes
            , EligibilityExpirationDate
            , LastQualifyingMove
            , PriorityForServices
            , QualifyingArrivalDate
            , StateResidencyDate
            , USInitialEntry
            , USInitialSchoolEntry
            , USMostRecentEntry
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, ContinuationOfServicesReasonDescriptorId)
            )
            -- Boilerplate columns
        FROM EdFi_Ods_Populated_Template.edfi.StudentMigrantEducationProgramAssociation
    
    INSERT INTO edfi.StudentMigrantEducationProgramAssociationMigrantEducationProgramService (
        HashKey
        -- Identifying references (for aggregate child entity)
        , MigrantEducationProgramServiceDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, MigrantEducationProgramServiceDescriptorId)
                    + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, MigrantEducationProgramServiceDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.StudentMigrantEducationProgramAssociationMigrantEducationProgramService
    -- GO

        INSERT INTO edfi.StudentMigrantEducationProgramAssociationMigrantEducationProgramService_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , MigrantEducationProgramServiceDescriptorHashKey
            -- Attributes
            , PrimaryIndicator
            , ServiceBeginDate
            , ServiceEndDate
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, MigrantEducationProgramServiceDescriptorId)
                    + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, MigrantEducationProgramServiceDescriptorId)
            )
            -- Attributes
            , PrimaryIndicator
            , ServiceBeginDate
            , ServiceEndDate
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.StudentMigrantEducationProgramAssociationMigrantEducationProgramService
    INSERT INTO edfi.StudentNeglectedOrDelinquentProgramAssociation (
        HashKey
        -- Identifying references (for aggregate root entity)
        , GeneralStudentProgramAssociationHashKey
        -- Primary key columns
        , BeginDate
                , EducationOrganizationId
                , ProgramEducationOrganizationId
                , ProgramName
                , ProgramTypeDescriptorId
                , StudentUSI
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
            + '|' + CONVERT(nvarchar, EducationOrganizationId)
            + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
            + '|' + ProgramName
            + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
            + '|' + CONVERT(nvarchar, StudentUSI)
        )
        , BeginDate
        , EducationOrganizationId
        , ProgramEducationOrganizationId
        , ProgramName
        , ProgramTypeDescriptorId
        , StudentUSI
    FROM EdFi_Ods_Populated_Template.edfi.StudentNeglectedOrDelinquentProgramAssociation
    -- GO

        INSERT INTO edfi.StudentNeglectedOrDelinquentProgramAssociation_Attributes (
            HashKey
            , SchoolYearContext
            -- References
            , NeglectedOrDelinquentProgramDescriptorHashKey
            , ELAProgressLevelDescriptorHashKey
            , MathematicsProgressLevelDescriptorHashKey
            -- Boilerplate columns
)
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, NeglectedOrDelinquentProgramDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, ELAProgressLevelDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, MathematicsProgressLevelDescriptorId)
            )
            -- Boilerplate columns
        FROM EdFi_Ods_Populated_Template.edfi.StudentNeglectedOrDelinquentProgramAssociation
    
    INSERT INTO edfi.StudentNeglectedOrDelinquentProgramAssociationNeglectedOrDelinquentProgramService (
        HashKey
        -- Identifying references (for aggregate child entity)
        , NeglectedOrDelinquentProgramServiceDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, NeglectedOrDelinquentProgramServiceDescriptorId)
                    + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, NeglectedOrDelinquentProgramServiceDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.StudentNeglectedOrDelinquentProgramAssociationNeglectedOrDelinquentProgramService
    -- GO

        INSERT INTO edfi.StudentNeglectedOrDelinquentProgramAssociationNeglectedOrDelinquentProgramService_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , NeglectedOrDelinquentProgramServiceDescriptorHashKey
            -- Attributes
            , PrimaryIndicator
            , ServiceBeginDate
            , ServiceEndDate
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, NeglectedOrDelinquentProgramServiceDescriptorId)
                    + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, NeglectedOrDelinquentProgramServiceDescriptorId)
            )
            -- Attributes
            , PrimaryIndicator
            , ServiceBeginDate
            , ServiceEndDate
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.StudentNeglectedOrDelinquentProgramAssociationNeglectedOrDelinquentProgramService
    INSERT INTO edfi.StudentParentAssociation (
        HashKey
        -- Identifying references (for aggregate root entity)
        , ParentHashKey
        , StudentHashKey
        -- Primary key columns
        , ParentUSI
                , StudentUSI
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, ParentUSI)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, ParentUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, StudentUSI)
        )
        , ParentUSI
        , StudentUSI
    FROM EdFi_Ods_Populated_Template.edfi.StudentParentAssociation
    -- GO

        INSERT INTO edfi.StudentParentAssociation_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , ContactPriority
            , ContactRestrictions
            , EmergencyContactStatus
            , LivesWith
            , PrimaryContactStatus
            -- References
            , RelationDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, ParentUSI)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- Attributes
            , ContactPriority
            , ContactRestrictions
            , EmergencyContactStatus
            , LivesWith
            , PrimaryContactStatus
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, RelationDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.StudentParentAssociation
    
    INSERT INTO edfi.StudentParticipationCodeDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , StudentParticipationCodeDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, StudentParticipationCodeDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, StudentParticipationCodeDescriptorId)
        )
        , StudentParticipationCodeDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.StudentParticipationCodeDescriptor
    -- GO


    
    INSERT INTO edfi.StudentProgramAssociation (
        HashKey
        -- Identifying references (for aggregate root entity)
        , GeneralStudentProgramAssociationHashKey
        -- Primary key columns
        , BeginDate
                , EducationOrganizationId
                , ProgramEducationOrganizationId
                , ProgramName
                , ProgramTypeDescriptorId
                , StudentUSI
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
            + '|' + CONVERT(nvarchar, EducationOrganizationId)
            + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
            + '|' + ProgramName
            + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
            + '|' + CONVERT(nvarchar, StudentUSI)
        )
        , BeginDate
        , EducationOrganizationId
        , ProgramEducationOrganizationId
        , ProgramName
        , ProgramTypeDescriptorId
        , StudentUSI
    FROM EdFi_Ods_Populated_Template.edfi.StudentProgramAssociation
    -- GO


    
    INSERT INTO edfi.StudentProgramAssociationService (
        HashKey
        -- Identifying references (for aggregate child entity)
        , ServiceDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, ServiceDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, ServiceDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.StudentProgramAssociationService
    -- GO

        INSERT INTO edfi.StudentProgramAssociationService_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , ServiceDescriptorHashKey
            -- Attributes
            , PrimaryIndicator
            , ServiceBeginDate
            , ServiceEndDate
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, ServiceDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, ServiceDescriptorId)
            )
            -- Attributes
            , PrimaryIndicator
            , ServiceBeginDate
            , ServiceEndDate
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.StudentProgramAssociationService
    INSERT INTO edfi.StudentProgramAttendanceEvent (
        HashKey
        -- Identifying references (for aggregate root entity)
        , AttendanceEventCategoryDescriptorHashKey
        , EducationOrganizationHashKey
        , ProgramHashKey
        , StudentHashKey
        -- Primary key columns
        , AttendanceEventCategoryDescriptorId
                , EducationOrganizationId
                , EventDate
                , ProgramEducationOrganizationId
                , ProgramName
                , ProgramTypeDescriptorId
                , StudentUSI
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, AttendanceEventCategoryDescriptorId)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, EventDate, 23)
                    + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, AttendanceEventCategoryDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, ProgramEducationOrganizationId)
            + '|' + ProgramName
            + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, StudentUSI)
        )
        , AttendanceEventCategoryDescriptorId
        , EducationOrganizationId
        , EventDate
        , ProgramEducationOrganizationId
        , ProgramName
        , ProgramTypeDescriptorId
        , StudentUSI
    FROM EdFi_Ods_Populated_Template.edfi.StudentProgramAttendanceEvent
    -- GO

        INSERT INTO edfi.StudentProgramAttendanceEvent_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , AttendanceEventReason
            , EventDuration
            , ProgramAttendanceDuration
            -- References
            , EducationalEnvironmentDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, AttendanceEventCategoryDescriptorId)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, EventDate, 23)
                    + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- Attributes
            , AttendanceEventReason
            , EventDuration
            , ProgramAttendanceDuration
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationalEnvironmentDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.StudentProgramAttendanceEvent
    
    INSERT INTO edfi.StudentSchoolAssociation (
        HashKey
        -- Identifying references (for aggregate root entity)
        , SchoolHashKey
        , StudentHashKey
        -- Primary key columns
        , EntryDate
                , SchoolId
                , StudentUSI
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EntryDate, 23)
                    + '|' + CONVERT(nvarchar, SchoolId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, SchoolId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, StudentUSI)
        )
        , EntryDate
        , SchoolId
        , StudentUSI
    FROM EdFi_Ods_Populated_Template.edfi.StudentSchoolAssociation
    -- GO

        INSERT INTO edfi.StudentSchoolAssociation_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , EmployedWhileEnrolled
            , ExitWithdrawDate
            , FullTimeEquivalency
            , PrimarySchool
            , RepeatGradeIndicator
            , SchoolChoiceTransfer
            , TermCompletionIndicator
            -- References
            , CalendarHashKey
            , EntryGradeLevelReasonDescriptorHashKey
            , EntryTypeDescriptorHashKey
            , ExitWithdrawTypeDescriptorHashKey
            , EntryGradeLevelDescriptorHashKey
            , GraduationPlanHashKey
            , ResidencyStatusDescriptorHashKey
            , SchoolYearTypeHashKey
            , ClassOfSchoolYearTypeHashKey
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, EntryDate, 23)
                    + '|' + CONVERT(nvarchar, SchoolId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- Attributes
            , EmployedWhileEnrolled
            , ExitWithdrawDate
            , FullTimeEquivalency
            , PrimarySchool
            , RepeatGradeIndicator
            , SchoolChoiceTransfer
            , TermCompletionIndicator
            -- References
            , HASHBYTES('sha1', 
            CalendarCode
            + '|' + CONVERT(nvarchar, SchoolId)
            + '|' + CONVERT(nvarchar, SchoolYear)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, EntryGradeLevelReasonDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, EntryTypeDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, ExitWithdrawTypeDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, EntryGradeLevelDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
            + '|' + CONVERT(nvarchar, GraduationPlanTypeDescriptorId)
            + '|' + CONVERT(nvarchar, GraduationSchoolYear)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, ResidencyStatusDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, SchoolYear)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, ClassOfSchoolYear)
            )
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.StudentSchoolAssociation
    
    INSERT INTO edfi.StudentSchoolAssociationAlternativeGraduationPlan (
        HashKey
        -- Identifying references (for aggregate child entity)
        , AlternativeGraduationPlanHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, AlternativeEducationOrganizationId)
                    + '|' + CONVERT(nvarchar, AlternativeGraduationPlanTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, AlternativeGraduationSchoolYear)
                    + '|' + CONVERT(nvarchar, EntryDate, 23)
                    + '|' + CONVERT(nvarchar, SchoolId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, AlternativeEducationOrganizationId)
            + '|' + CONVERT(nvarchar, AlternativeGraduationPlanTypeDescriptorId)
            + '|' + CONVERT(nvarchar, AlternativeGraduationSchoolYear)
        )
    FROM EdFi_Ods_Populated_Template.edfi.StudentSchoolAssociationAlternativeGraduationPlan
    -- GO

    INSERT INTO edfi.StudentSchoolAssociationEducationPlan (
        HashKey
        -- Identifying references (for aggregate child entity)
        , EducationPlanDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationPlanDescriptorId)
                    + '|' + CONVERT(nvarchar, EntryDate, 23)
                    + '|' + CONVERT(nvarchar, SchoolId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationPlanDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.StudentSchoolAssociationEducationPlan
    -- GO

    INSERT INTO edfi.StudentSchoolAttendanceEvent (
        HashKey
        -- Identifying references (for aggregate root entity)
        , AttendanceEventCategoryDescriptorHashKey
        , SchoolHashKey
        , SessionHashKey
        , StudentHashKey
        -- Primary key columns
        , AttendanceEventCategoryDescriptorId
                , EventDate
                , SchoolId
                , SchoolYear
                , SessionName
                , StudentUSI
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, AttendanceEventCategoryDescriptorId)
                    + '|' + CONVERT(nvarchar, EventDate, 23)
                    + '|' + CONVERT(nvarchar, SchoolId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
                    + '|' + SessionName
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, AttendanceEventCategoryDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, SchoolId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, SchoolId)
            + '|' + CONVERT(nvarchar, SchoolYear)
            + '|' + SessionName
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, StudentUSI)
        )
        , AttendanceEventCategoryDescriptorId
        , EventDate
        , SchoolId
        , SchoolYear
        , SessionName
        , StudentUSI
    FROM EdFi_Ods_Populated_Template.edfi.StudentSchoolAttendanceEvent
    -- GO

        INSERT INTO edfi.StudentSchoolAttendanceEvent_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , ArrivalTime
            , AttendanceEventReason
            , DepartureTime
            , EventDuration
            , SchoolAttendanceDuration
            -- References
            , EducationalEnvironmentDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, AttendanceEventCategoryDescriptorId)
                    + '|' + CONVERT(nvarchar, EventDate, 23)
                    + '|' + CONVERT(nvarchar, SchoolId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
                    + '|' + SessionName
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- Attributes
            , ArrivalTime
            , AttendanceEventReason
            , DepartureTime
            , EventDuration
            , SchoolAttendanceDuration
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationalEnvironmentDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.StudentSchoolAttendanceEvent
    
    INSERT INTO edfi.StudentSchoolFoodServiceProgramAssociation (
        HashKey
        -- Identifying references (for aggregate root entity)
        , GeneralStudentProgramAssociationHashKey
        -- Primary key columns
        , BeginDate
                , EducationOrganizationId
                , ProgramEducationOrganizationId
                , ProgramName
                , ProgramTypeDescriptorId
                , StudentUSI
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
            + '|' + CONVERT(nvarchar, EducationOrganizationId)
            + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
            + '|' + ProgramName
            + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
            + '|' + CONVERT(nvarchar, StudentUSI)
        )
        , BeginDate
        , EducationOrganizationId
        , ProgramEducationOrganizationId
        , ProgramName
        , ProgramTypeDescriptorId
        , StudentUSI
    FROM EdFi_Ods_Populated_Template.edfi.StudentSchoolFoodServiceProgramAssociation
    -- GO

        INSERT INTO edfi.StudentSchoolFoodServiceProgramAssociation_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , DirectCertification
            -- Boilerplate columns
)
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- Attributes
            , DirectCertification
            -- Boilerplate columns
        FROM EdFi_Ods_Populated_Template.edfi.StudentSchoolFoodServiceProgramAssociation
    
    INSERT INTO edfi.StudentSchoolFoodServiceProgramAssociationSchoolFoodServiceProgramService (
        HashKey
        -- Identifying references (for aggregate child entity)
        , SchoolFoodServiceProgramServiceDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, SchoolFoodServiceProgramServiceDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, SchoolFoodServiceProgramServiceDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.StudentSchoolFoodServiceProgramAssociationSchoolFoodServiceProgramService
    -- GO

        INSERT INTO edfi.StudentSchoolFoodServiceProgramAssociationSchoolFoodServiceProgramService_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , SchoolFoodServiceProgramServiceDescriptorHashKey
            -- Attributes
            , PrimaryIndicator
            , ServiceBeginDate
            , ServiceEndDate
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, SchoolFoodServiceProgramServiceDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, SchoolFoodServiceProgramServiceDescriptorId)
            )
            -- Attributes
            , PrimaryIndicator
            , ServiceBeginDate
            , ServiceEndDate
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.StudentSchoolFoodServiceProgramAssociationSchoolFoodServiceProgramService
    INSERT INTO edfi.StudentSectionAssociation (
        HashKey
        -- Identifying references (for aggregate root entity)
        , SectionHashKey
        , StudentHashKey
        -- Primary key columns
        , BeginDate
                , LocalCourseCode
                , SchoolId
                , SchoolYear
                , SectionIdentifier
                , SessionName
                , StudentUSI
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + LocalCourseCode
                    + '|' + CONVERT(nvarchar, SchoolId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
                    + '|' + SectionIdentifier
                    + '|' + SessionName
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            LocalCourseCode
            + '|' + CONVERT(nvarchar, SchoolId)
            + '|' + CONVERT(nvarchar, SchoolYear)
            + '|' + SectionIdentifier
            + '|' + SessionName
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, StudentUSI)
        )
        , BeginDate
        , LocalCourseCode
        , SchoolId
        , SchoolYear
        , SectionIdentifier
        , SessionName
        , StudentUSI
    FROM EdFi_Ods_Populated_Template.edfi.StudentSectionAssociation
    -- GO

        INSERT INTO edfi.StudentSectionAssociation_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , EndDate
            , HomeroomIndicator
            , TeacherStudentDataLinkExclusion
            -- References
            , AttemptStatusDescriptorHashKey
            , RepeatIdentifierDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + LocalCourseCode
                    + '|' + CONVERT(nvarchar, SchoolId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
                    + '|' + SectionIdentifier
                    + '|' + SessionName
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- Attributes
            , EndDate
            , HomeroomIndicator
            , TeacherStudentDataLinkExclusion
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, AttemptStatusDescriptorId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, RepeatIdentifierDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.StudentSectionAssociation
    
    INSERT INTO edfi.StudentSectionAttendanceEvent (
        HashKey
        -- Identifying references (for aggregate root entity)
        , AttendanceEventCategoryDescriptorHashKey
        , SectionHashKey
        , StudentHashKey
        -- Primary key columns
        , AttendanceEventCategoryDescriptorId
                , EventDate
                , LocalCourseCode
                , SchoolId
                , SchoolYear
                , SectionIdentifier
                , SessionName
                , StudentUSI
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, AttendanceEventCategoryDescriptorId)
                    + '|' + CONVERT(nvarchar, EventDate, 23)
                    + '|' + LocalCourseCode
                    + '|' + CONVERT(nvarchar, SchoolId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
                    + '|' + SectionIdentifier
                    + '|' + SessionName
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, AttendanceEventCategoryDescriptorId)
        )
        , HASHBYTES('sha1', 
            LocalCourseCode
            + '|' + CONVERT(nvarchar, SchoolId)
            + '|' + CONVERT(nvarchar, SchoolYear)
            + '|' + SectionIdentifier
            + '|' + SessionName
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, StudentUSI)
        )
        , AttendanceEventCategoryDescriptorId
        , EventDate
        , LocalCourseCode
        , SchoolId
        , SchoolYear
        , SectionIdentifier
        , SessionName
        , StudentUSI
    FROM EdFi_Ods_Populated_Template.edfi.StudentSectionAttendanceEvent
    -- GO

        INSERT INTO edfi.StudentSectionAttendanceEvent_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , ArrivalTime
            , AttendanceEventReason
            , DepartureTime
            , EventDuration
            , SectionAttendanceDuration
            -- References
            , EducationalEnvironmentDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, AttendanceEventCategoryDescriptorId)
                    + '|' + CONVERT(nvarchar, EventDate, 23)
                    + '|' + LocalCourseCode
                    + '|' + CONVERT(nvarchar, SchoolId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
                    + '|' + SectionIdentifier
                    + '|' + SessionName
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- Attributes
            , ArrivalTime
            , AttendanceEventReason
            , DepartureTime
            , EventDuration
            , SectionAttendanceDuration
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationalEnvironmentDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.StudentSectionAttendanceEvent
    
    INSERT INTO edfi.StudentSpecialEducationProgramAssociation (
        HashKey
        -- Identifying references (for aggregate root entity)
        , GeneralStudentProgramAssociationHashKey
        -- Primary key columns
        , BeginDate
                , EducationOrganizationId
                , ProgramEducationOrganizationId
                , ProgramName
                , ProgramTypeDescriptorId
                , StudentUSI
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
            + '|' + CONVERT(nvarchar, EducationOrganizationId)
            + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
            + '|' + ProgramName
            + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
            + '|' + CONVERT(nvarchar, StudentUSI)
        )
        , BeginDate
        , EducationOrganizationId
        , ProgramEducationOrganizationId
        , ProgramName
        , ProgramTypeDescriptorId
        , StudentUSI
    FROM EdFi_Ods_Populated_Template.edfi.StudentSpecialEducationProgramAssociation
    -- GO

        INSERT INTO edfi.StudentSpecialEducationProgramAssociation_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , IdeaEligibility
            , IEPBeginDate
            , IEPEndDate
            , IEPReviewDate
            , LastEvaluationDate
            , MedicallyFragile
            , MultiplyDisabled
            , SchoolHoursPerWeek
            , SpecialEducationHoursPerWeek
            -- References
            , SpecialEducationSettingDescriptorHashKey
            -- Boilerplate columns
)
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- Attributes
            , IdeaEligibility
            , IEPBeginDate
            , IEPEndDate
            , IEPReviewDate
            , LastEvaluationDate
            , MedicallyFragile
            , MultiplyDisabled
            , SchoolHoursPerWeek
            , SpecialEducationHoursPerWeek
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, SpecialEducationSettingDescriptorId)
            )
            -- Boilerplate columns
        FROM EdFi_Ods_Populated_Template.edfi.StudentSpecialEducationProgramAssociation
    
    INSERT INTO edfi.StudentSpecialEducationProgramAssociationDisability (
        HashKey
        -- Identifying references (for aggregate child entity)
        , DisabilityDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, DisabilityDescriptorId)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, DisabilityDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.StudentSpecialEducationProgramAssociationDisability
    -- GO

        INSERT INTO edfi.StudentSpecialEducationProgramAssociationDisability_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , DisabilityDescriptorHashKey
            -- Attributes
            , DisabilityDiagnosis
            , OrderOfDisability
            -- References
            , DisabilityDeterminationSourceTypeDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, DisabilityDescriptorId)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, DisabilityDescriptorId)
            )
            -- Attributes
            , DisabilityDiagnosis
            , OrderOfDisability
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, DisabilityDeterminationSourceTypeDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.StudentSpecialEducationProgramAssociationDisability
    INSERT INTO edfi.StudentSpecialEducationProgramAssociationDisabilityDesignation (
        HashKey
        -- Identifying references (for aggregate child entity)
        , DisabilityDesignationDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, DisabilityDescriptorId)
                    + '|' + CONVERT(nvarchar, DisabilityDesignationDescriptorId)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, DisabilityDesignationDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.StudentSpecialEducationProgramAssociationDisabilityDesignation
    -- GO

    INSERT INTO edfi.StudentSpecialEducationProgramAssociationServiceProvider (
        HashKey
        -- Identifying references (for aggregate child entity)
        , StaffHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, StaffUSI)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, StaffUSI)
        )
    FROM EdFi_Ods_Populated_Template.edfi.StudentSpecialEducationProgramAssociationServiceProvider
    -- GO

        INSERT INTO edfi.StudentSpecialEducationProgramAssociationServiceProvider_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , StaffHashKey
            -- Attributes
            , PrimaryProvider
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, StaffUSI)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, StaffUSI)
            )
            -- Attributes
            , PrimaryProvider
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.StudentSpecialEducationProgramAssociationServiceProvider
    INSERT INTO edfi.StudentSpecialEducationProgramAssociationSpecialEducationProgramService (
        HashKey
        -- Identifying references (for aggregate child entity)
        , SpecialEducationProgramServiceDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, SpecialEducationProgramServiceDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, SpecialEducationProgramServiceDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.StudentSpecialEducationProgramAssociationSpecialEducationProgramService
    -- GO

        INSERT INTO edfi.StudentSpecialEducationProgramAssociationSpecialEducationProgramService_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , SpecialEducationProgramServiceDescriptorHashKey
            -- Attributes
            , PrimaryIndicator
            , ServiceBeginDate
            , ServiceEndDate
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, SpecialEducationProgramServiceDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, SpecialEducationProgramServiceDescriptorId)
            )
            -- Attributes
            , PrimaryIndicator
            , ServiceBeginDate
            , ServiceEndDate
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.StudentSpecialEducationProgramAssociationSpecialEducationProgramService
    INSERT INTO edfi.StudentSpecialEducationProgramAssociationSpecialEducationProgramServiceProvider (
        HashKey
        -- Identifying references (for aggregate child entity)
        , StaffHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, SpecialEducationProgramServiceDescriptorId)
                    + '|' + CONVERT(nvarchar, StaffUSI)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, StaffUSI)
        )
    FROM EdFi_Ods_Populated_Template.edfi.StudentSpecialEducationProgramAssociationSpecialEducationProgramServiceProvider
    -- GO

        INSERT INTO edfi.StudentSpecialEducationProgramAssociationSpecialEducationProgramServiceProvider_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , StaffHashKey
            -- Attributes
            , PrimaryProvider
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, SpecialEducationProgramServiceDescriptorId)
                    + '|' + CONVERT(nvarchar, StaffUSI)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, StaffUSI)
            )
            -- Attributes
            , PrimaryProvider
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.StudentSpecialEducationProgramAssociationSpecialEducationProgramServiceProvider
    INSERT INTO edfi.StudentTitleIPartAProgramAssociation (
        HashKey
        -- Identifying references (for aggregate root entity)
        , GeneralStudentProgramAssociationHashKey
        -- Primary key columns
        , BeginDate
                , EducationOrganizationId
                , ProgramEducationOrganizationId
                , ProgramName
                , ProgramTypeDescriptorId
                , StudentUSI
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
            + '|' + CONVERT(nvarchar, EducationOrganizationId)
            + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
            + '|' + ProgramName
            + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
            + '|' + CONVERT(nvarchar, StudentUSI)
        )
        , BeginDate
        , EducationOrganizationId
        , ProgramEducationOrganizationId
        , ProgramName
        , ProgramTypeDescriptorId
        , StudentUSI
    FROM EdFi_Ods_Populated_Template.edfi.StudentTitleIPartAProgramAssociation
    -- GO

        INSERT INTO edfi.StudentTitleIPartAProgramAssociation_Attributes (
            HashKey
            , SchoolYearContext
            -- References
            , TitleIPartAParticipantDescriptorHashKey
            -- Boilerplate columns
)
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, TitleIPartAParticipantDescriptorId)
            )
            -- Boilerplate columns
        FROM EdFi_Ods_Populated_Template.edfi.StudentTitleIPartAProgramAssociation
    
    INSERT INTO edfi.StudentTitleIPartAProgramAssociationService (
        HashKey
        -- Identifying references (for aggregate child entity)
        , ServiceDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, ServiceDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, ServiceDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.StudentTitleIPartAProgramAssociationService
    -- GO

        INSERT INTO edfi.StudentTitleIPartAProgramAssociationService_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , ServiceDescriptorHashKey
            -- Attributes
            , PrimaryIndicator
            , ServiceBeginDate
            , ServiceEndDate
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, ServiceDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, ServiceDescriptorId)
            )
            -- Attributes
            , PrimaryIndicator
            , ServiceBeginDate
            , ServiceEndDate
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.StudentTitleIPartAProgramAssociationService
    INSERT INTO edfi.StudentTitleIPartAProgramAssociationTitleIPartAProgramService (
        HashKey
        -- Identifying references (for aggregate child entity)
        , TitleIPartAProgramServiceDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
                    + '|' + CONVERT(nvarchar, TitleIPartAProgramServiceDescriptorId)
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, TitleIPartAProgramServiceDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.StudentTitleIPartAProgramAssociationTitleIPartAProgramService
    -- GO

        INSERT INTO edfi.StudentTitleIPartAProgramAssociationTitleIPartAProgramService_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            , TitleIPartAProgramServiceDescriptorHashKey
            -- Attributes
            , PrimaryIndicator
            , ServiceBeginDate
            , ServiceEndDate
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            CONVERT(nvarchar, BeginDate, 23)
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + CONVERT(nvarchar, ProgramEducationOrganizationId)
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
                    + '|' + CONVERT(nvarchar, StudentUSI)
                    + '|' + CONVERT(nvarchar, TitleIPartAProgramServiceDescriptorId)
        )
            , @schoolYearContext
            -- Identifying references
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, TitleIPartAProgramServiceDescriptorId)
            )
            -- Attributes
            , PrimaryIndicator
            , ServiceBeginDate
            , ServiceEndDate
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.StudentTitleIPartAProgramAssociationTitleIPartAProgramService
    INSERT INTO edfi.Survey (
        HashKey
        -- Identifying references (for aggregate root entity)
        -- Primary key columns
        , Namespace
                , SurveyIdentifier
        )
    SELECT 
        HASHBYTES('sha1', 
            Namespace
                    + '|' + SurveyIdentifier
        )
        -- Identifying references
        , Namespace
        , SurveyIdentifier
    FROM EdFi_Ods_Populated_Template.edfi.Survey
    -- GO

        INSERT INTO edfi.Survey_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , NumberAdministered
            , SurveyTitle
            -- References
            , EducationOrganizationHashKey
            , SchoolYearTypeHashKey
            , SessionHashKey
            , SurveyCategoryDescriptorHashKey
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            Namespace
                    + '|' + SurveyIdentifier
        )
            , @schoolYearContext
            -- Attributes
            , NumberAdministered
            , SurveyTitle
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, SchoolYear)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, SchoolId)
            + '|' + CONVERT(nvarchar, SchoolYear)
            + '|' + SessionName
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, SurveyCategoryDescriptorId)
            )
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.Survey
    
    INSERT INTO edfi.SurveyCategoryDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , SurveyCategoryDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, SurveyCategoryDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, SurveyCategoryDescriptorId)
        )
        , SurveyCategoryDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.SurveyCategoryDescriptor
    -- GO


    
    INSERT INTO edfi.SurveyCourseAssociation (
        HashKey
        -- Identifying references (for aggregate root entity)
        , CourseHashKey
        , SurveyHashKey
        -- Primary key columns
        , CourseCode
                , EducationOrganizationId
                , Namespace
                , SurveyIdentifier
        )
    SELECT 
        HASHBYTES('sha1', 
            CourseCode
                    + '|' + CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + Namespace
                    + '|' + SurveyIdentifier
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CourseCode
            + '|' + CONVERT(nvarchar, EducationOrganizationId)
        )
        , HASHBYTES('sha1', 
            Namespace
            + '|' + SurveyIdentifier
        )
        , CourseCode
        , EducationOrganizationId
        , Namespace
        , SurveyIdentifier
    FROM EdFi_Ods_Populated_Template.edfi.SurveyCourseAssociation
    -- GO


    
    INSERT INTO edfi.SurveyLevelDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , SurveyLevelDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, SurveyLevelDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, SurveyLevelDescriptorId)
        )
        , SurveyLevelDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.SurveyLevelDescriptor
    -- GO


    
    INSERT INTO edfi.SurveyProgramAssociation (
        HashKey
        -- Identifying references (for aggregate root entity)
        , ProgramHashKey
        , SurveyHashKey
        -- Primary key columns
        , EducationOrganizationId
                , Namespace
                , ProgramName
                , ProgramTypeDescriptorId
                , SurveyIdentifier
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + Namespace
                    + '|' + ProgramName
                    + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
                    + '|' + SurveyIdentifier
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
            + '|' + ProgramName
            + '|' + CONVERT(nvarchar, ProgramTypeDescriptorId)
        )
        , HASHBYTES('sha1', 
            Namespace
            + '|' + SurveyIdentifier
        )
        , EducationOrganizationId
        , Namespace
        , ProgramName
        , ProgramTypeDescriptorId
        , SurveyIdentifier
    FROM EdFi_Ods_Populated_Template.edfi.SurveyProgramAssociation
    -- GO


    
    INSERT INTO edfi.SurveyQuestion (
        HashKey
        -- Identifying references (for aggregate root entity)
        , SurveyHashKey
        -- Primary key columns
        , Namespace
                , QuestionCode
                , SurveyIdentifier
        )
    SELECT 
        HASHBYTES('sha1', 
            Namespace
                    + '|' + QuestionCode
                    + '|' + SurveyIdentifier
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            Namespace
            + '|' + SurveyIdentifier
        )
        , Namespace
        , QuestionCode
        , SurveyIdentifier
    FROM EdFi_Ods_Populated_Template.edfi.SurveyQuestion
    -- GO

        INSERT INTO edfi.SurveyQuestion_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , QuestionText
            -- References
            , QuestionFormDescriptorHashKey
            , SurveySectionHashKey
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            Namespace
                    + '|' + QuestionCode
                    + '|' + SurveyIdentifier
        )
            , @schoolYearContext
            -- Attributes
            , QuestionText
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, QuestionFormDescriptorId)
            )
            , HASHBYTES('sha1', 
            Namespace
            + '|' + SurveyIdentifier
            + '|' + SurveySectionTitle
            )
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.SurveyQuestion
    
    INSERT INTO edfi.SurveyQuestionMatrix (
        HashKey
        -- Identifying references (for aggregate child entity)
        -- Contextual primary key
        , MatrixElement
    )
    SELECT
        HASHBYTES('sha1', 
            + '|' + Namespace
                    + '|' + QuestionCode
                    + '|' + SurveyIdentifier
        )
            , MatrixElement
    FROM EdFi_Ods_Populated_Template.edfi.SurveyQuestionMatrix
    -- GO

        INSERT INTO edfi.SurveyQuestionMatrix_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            -- Contextual primary key
            , MatrixElement
            -- Attributes
            , MaxRawScore
            , MinRawScore
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            MatrixElement
                    + '|' + Namespace
                    + '|' + QuestionCode
                    + '|' + SurveyIdentifier
        )
            , @schoolYearContext
            -- Identifying references
            -- Contextual primary key
            , MatrixElement
            -- Attributes
            , MaxRawScore
            , MinRawScore
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.SurveyQuestionMatrix
    INSERT INTO edfi.SurveyQuestionResponseChoice (
        HashKey
        -- Identifying references (for aggregate child entity)
        -- Contextual primary key
        , SortOrder
    )
    SELECT
        HASHBYTES('sha1', 
            Namespace
                    + '|' + QuestionCode
                    + '|' + SurveyIdentifier
        )
            , SortOrder
    FROM EdFi_Ods_Populated_Template.edfi.SurveyQuestionResponseChoice
    -- GO

        INSERT INTO edfi.SurveyQuestionResponseChoice_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            -- Contextual primary key
            , SortOrder
            -- Attributes
            , NumericValue
            , TextValue
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            Namespace
                    + '|' + QuestionCode
                    + '|' + CONVERT(nvarchar, SortOrder)
                    + '|' + SurveyIdentifier
        )
            , @schoolYearContext
            -- Identifying references
            -- Contextual primary key
            , SortOrder
            -- Attributes
            , NumericValue
            , TextValue
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.SurveyQuestionResponseChoice
    INSERT INTO edfi.SurveyQuestionResponse (
        HashKey
        -- Identifying references (for aggregate root entity)
        , SurveyQuestionHashKey
        , SurveyResponseHashKey
        -- Primary key columns
        , Namespace
                , QuestionCode
                , SurveyIdentifier
                , SurveyResponseIdentifier
        )
    SELECT 
        HASHBYTES('sha1', 
            Namespace
                    + '|' + QuestionCode
                    + '|' + SurveyIdentifier
                    + '|' + SurveyResponseIdentifier
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            Namespace
            + '|' + QuestionCode
            + '|' + SurveyIdentifier
        )
        , HASHBYTES('sha1', 
            Namespace
            + '|' + SurveyIdentifier
            + '|' + SurveyResponseIdentifier
        )
        , Namespace
        , QuestionCode
        , SurveyIdentifier
        , SurveyResponseIdentifier
    FROM EdFi_Ods_Populated_Template.edfi.SurveyQuestionResponse
    -- GO

        INSERT INTO edfi.SurveyQuestionResponse_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , Comment
            , NoResponse
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            Namespace
                    + '|' + QuestionCode
                    + '|' + SurveyIdentifier
                    + '|' + SurveyResponseIdentifier
        )
            , @schoolYearContext
            -- Attributes
            , Comment
            , NoResponse
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.SurveyQuestionResponse
    
    INSERT INTO edfi.SurveyQuestionResponseSurveyQuestionMatrixElementResponse (
        HashKey
        -- Identifying references (for aggregate child entity)
        -- Contextual primary key
        , MatrixElement
    )
    SELECT
        HASHBYTES('sha1', 
            + '|' + Namespace
                    + '|' + QuestionCode
                    + '|' + SurveyIdentifier
                    + '|' + SurveyResponseIdentifier
        )
            , MatrixElement
    FROM EdFi_Ods_Populated_Template.edfi.SurveyQuestionResponseSurveyQuestionMatrixElementResponse
    -- GO

        INSERT INTO edfi.SurveyQuestionResponseSurveyQuestionMatrixElementResponse_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            -- Contextual primary key
            , MatrixElement
            -- Attributes
            , MaxNumericResponse
            , MinNumericResponse
            , NoResponse
            , NumericResponse
            , TextResponse
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            MatrixElement
                    + '|' + Namespace
                    + '|' + QuestionCode
                    + '|' + SurveyIdentifier
                    + '|' + SurveyResponseIdentifier
        )
            , @schoolYearContext
            -- Identifying references
            -- Contextual primary key
            , MatrixElement
            -- Attributes
            , MaxNumericResponse
            , MinNumericResponse
            , NoResponse
            , NumericResponse
            , TextResponse
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.SurveyQuestionResponseSurveyQuestionMatrixElementResponse
    INSERT INTO edfi.SurveyQuestionResponseValue (
        HashKey
        -- Identifying references (for aggregate child entity)
        -- Contextual primary key
        , SurveyQuestionResponseValueIdentifier
    )
    SELECT
        HASHBYTES('sha1', 
            Namespace
                    + '|' + QuestionCode
                    + '|' + SurveyIdentifier
                    + '|' + SurveyResponseIdentifier
        )
            , SurveyQuestionResponseValueIdentifier
    FROM EdFi_Ods_Populated_Template.edfi.SurveyQuestionResponseValue
    -- GO

        INSERT INTO edfi.SurveyQuestionResponseValue_Attributes (
            HashKey
            , SchoolYearContext
            -- Identifying references
            -- Contextual primary key
            , SurveyQuestionResponseValueIdentifier
            -- Attributes
            , NumericResponse
            , TextResponse
            -- Boilerplate columns
            , CreateDate
        )
        SELECT
            HASHBYTES('sha1', 
            Namespace
                    + '|' + QuestionCode
                    + '|' + SurveyIdentifier
                    + '|' + CONVERT(nvarchar, SurveyQuestionResponseValueIdentifier)
                    + '|' + SurveyResponseIdentifier
        )
            , @schoolYearContext
            -- Identifying references
            -- Contextual primary key
            , SurveyQuestionResponseValueIdentifier
            -- Attributes
            , NumericResponse
            , TextResponse
            -- Boilerplate columns
            , CreateDate
        FROM EdFi_Ods_Populated_Template.edfi.SurveyQuestionResponseValue
    INSERT INTO edfi.SurveyResponse (
        HashKey
        -- Identifying references (for aggregate root entity)
        , SurveyHashKey
        -- Primary key columns
        , Namespace
                , SurveyIdentifier
                , SurveyResponseIdentifier
        )
    SELECT 
        HASHBYTES('sha1', 
            Namespace
                    + '|' + SurveyIdentifier
                    + '|' + SurveyResponseIdentifier
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            Namespace
            + '|' + SurveyIdentifier
        )
        , Namespace
        , SurveyIdentifier
        , SurveyResponseIdentifier
    FROM EdFi_Ods_Populated_Template.edfi.SurveyResponse
    -- GO

        INSERT INTO edfi.SurveyResponse_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , ElectronicMailAddress
            , FullName
            , Location
            , ResponseDate
            , ResponseTime
            -- References
            , ParentHashKey
            , StaffHashKey
            , StudentHashKey
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            Namespace
                    + '|' + SurveyIdentifier
                    + '|' + SurveyResponseIdentifier
        )
            , @schoolYearContext
            -- Attributes
            , ElectronicMailAddress
            , FullName
            , Location
            , ResponseDate
            , ResponseTime
            -- References
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, ParentUSI)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, StaffUSI)
            )
            , HASHBYTES('sha1', 
            CONVERT(nvarchar, StudentUSI)
            )
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.SurveyResponse
    
    INSERT INTO edfi.SurveyResponseSurveyLevel (
        HashKey
        -- Identifying references (for aggregate child entity)
        , SurveyLevelDescriptorHashKey
    )
    SELECT
        HASHBYTES('sha1', 
            Namespace
                    + '|' + SurveyIdentifier
                    + '|' + CONVERT(nvarchar, SurveyLevelDescriptorId)
                    + '|' + SurveyResponseIdentifier
        )
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, SurveyLevelDescriptorId)
        )
    FROM EdFi_Ods_Populated_Template.edfi.SurveyResponseSurveyLevel
    -- GO

    INSERT INTO edfi.SurveyResponseEducationOrganizationTargetAssociation (
        HashKey
        -- Identifying references (for aggregate root entity)
        , EducationOrganizationHashKey
        , SurveyResponseHashKey
        -- Primary key columns
        , EducationOrganizationId
                , Namespace
                , SurveyIdentifier
                , SurveyResponseIdentifier
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + Namespace
                    + '|' + SurveyIdentifier
                    + '|' + SurveyResponseIdentifier
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
        )
        , HASHBYTES('sha1', 
            Namespace
            + '|' + SurveyIdentifier
            + '|' + SurveyResponseIdentifier
        )
        , EducationOrganizationId
        , Namespace
        , SurveyIdentifier
        , SurveyResponseIdentifier
    FROM EdFi_Ods_Populated_Template.edfi.SurveyResponseEducationOrganizationTargetAssociation
    -- GO


    
    INSERT INTO edfi.SurveyResponseStaffTargetAssociation (
        HashKey
        -- Identifying references (for aggregate root entity)
        , StaffHashKey
        , SurveyResponseHashKey
        -- Primary key columns
        , Namespace
                , StaffUSI
                , SurveyIdentifier
                , SurveyResponseIdentifier
        )
    SELECT 
        HASHBYTES('sha1', 
            Namespace
                    + '|' + CONVERT(nvarchar, StaffUSI)
                    + '|' + SurveyIdentifier
                    + '|' + SurveyResponseIdentifier
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, StaffUSI)
        )
        , HASHBYTES('sha1', 
            Namespace
            + '|' + SurveyIdentifier
            + '|' + SurveyResponseIdentifier
        )
        , Namespace
        , StaffUSI
        , SurveyIdentifier
        , SurveyResponseIdentifier
    FROM EdFi_Ods_Populated_Template.edfi.SurveyResponseStaffTargetAssociation
    -- GO


    
    INSERT INTO edfi.SurveySection (
        HashKey
        -- Identifying references (for aggregate root entity)
        , SurveyHashKey
        -- Primary key columns
        , Namespace
                , SurveyIdentifier
                , SurveySectionTitle
        )
    SELECT 
        HASHBYTES('sha1', 
            Namespace
                    + '|' + SurveyIdentifier
                    + '|' + SurveySectionTitle
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            Namespace
            + '|' + SurveyIdentifier
        )
        , Namespace
        , SurveyIdentifier
        , SurveySectionTitle
    FROM EdFi_Ods_Populated_Template.edfi.SurveySection
    -- GO


    
    INSERT INTO edfi.SurveySectionAssociation (
        HashKey
        -- Identifying references (for aggregate root entity)
        , SectionHashKey
        , SurveyHashKey
        -- Primary key columns
        , LocalCourseCode
                , Namespace
                , SchoolId
                , SchoolYear
                , SectionIdentifier
                , SessionName
                , SurveyIdentifier
        )
    SELECT 
        HASHBYTES('sha1', 
            LocalCourseCode
                    + '|' + Namespace
                    + '|' + CONVERT(nvarchar, SchoolId)
                    + '|' + CONVERT(nvarchar, SchoolYear)
                    + '|' + SectionIdentifier
                    + '|' + SessionName
                    + '|' + SurveyIdentifier
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            LocalCourseCode
            + '|' + CONVERT(nvarchar, SchoolId)
            + '|' + CONVERT(nvarchar, SchoolYear)
            + '|' + SectionIdentifier
            + '|' + SessionName
        )
        , HASHBYTES('sha1', 
            Namespace
            + '|' + SurveyIdentifier
        )
        , LocalCourseCode
        , Namespace
        , SchoolId
        , SchoolYear
        , SectionIdentifier
        , SessionName
        , SurveyIdentifier
    FROM EdFi_Ods_Populated_Template.edfi.SurveySectionAssociation
    -- GO


    
    INSERT INTO edfi.SurveySectionResponse (
        HashKey
        -- Identifying references (for aggregate root entity)
        , SurveyResponseHashKey
        , SurveySectionHashKey
        -- Primary key columns
        , Namespace
                , SurveyIdentifier
                , SurveyResponseIdentifier
                , SurveySectionTitle
        )
    SELECT 
        HASHBYTES('sha1', 
            Namespace
                    + '|' + SurveyIdentifier
                    + '|' + SurveyResponseIdentifier
                    + '|' + SurveySectionTitle
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            Namespace
            + '|' + SurveyIdentifier
            + '|' + SurveyResponseIdentifier
        )
        , HASHBYTES('sha1', 
            Namespace
            + '|' + SurveyIdentifier
            + '|' + SurveySectionTitle
        )
        , Namespace
        , SurveyIdentifier
        , SurveyResponseIdentifier
        , SurveySectionTitle
    FROM EdFi_Ods_Populated_Template.edfi.SurveySectionResponse
    -- GO

        INSERT INTO edfi.SurveySectionResponse_Attributes (
            HashKey
            , SchoolYearContext
            -- Attributes
            , SectionRating
            -- Boilerplate columns
            , CreateDate
                    , Id
                    , LastModifiedDate
        )
        SELECT
            HASHBYTES('sha1', 
            Namespace
                    + '|' + SurveyIdentifier
                    + '|' + SurveyResponseIdentifier
                    + '|' + SurveySectionTitle
        )
            , @schoolYearContext
            -- Attributes
            , SectionRating
            -- Boilerplate columns
            , CreateDate
            , Id
            , LastModifiedDate
        FROM EdFi_Ods_Populated_Template.edfi.SurveySectionResponse
    
    INSERT INTO edfi.SurveySectionResponseEducationOrganizationTargetAssociation (
        HashKey
        -- Identifying references (for aggregate root entity)
        , EducationOrganizationHashKey
        , SurveySectionResponseHashKey
        -- Primary key columns
        , EducationOrganizationId
                , Namespace
                , SurveyIdentifier
                , SurveyResponseIdentifier
                , SurveySectionTitle
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
                    + '|' + Namespace
                    + '|' + SurveyIdentifier
                    + '|' + SurveyResponseIdentifier
                    + '|' + SurveySectionTitle
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, EducationOrganizationId)
        )
        , HASHBYTES('sha1', 
            Namespace
            + '|' + SurveyIdentifier
            + '|' + SurveyResponseIdentifier
            + '|' + SurveySectionTitle
        )
        , EducationOrganizationId
        , Namespace
        , SurveyIdentifier
        , SurveyResponseIdentifier
        , SurveySectionTitle
    FROM EdFi_Ods_Populated_Template.edfi.SurveySectionResponseEducationOrganizationTargetAssociation
    -- GO


    
    INSERT INTO edfi.SurveySectionResponseStaffTargetAssociation (
        HashKey
        -- Identifying references (for aggregate root entity)
        , StaffHashKey
        , SurveySectionResponseHashKey
        -- Primary key columns
        , Namespace
                , StaffUSI
                , SurveyIdentifier
                , SurveyResponseIdentifier
                , SurveySectionTitle
        )
    SELECT 
        HASHBYTES('sha1', 
            Namespace
                    + '|' + CONVERT(nvarchar, StaffUSI)
                    + '|' + SurveyIdentifier
                    + '|' + SurveyResponseIdentifier
                    + '|' + SurveySectionTitle
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, StaffUSI)
        )
        , HASHBYTES('sha1', 
            Namespace
            + '|' + SurveyIdentifier
            + '|' + SurveyResponseIdentifier
            + '|' + SurveySectionTitle
        )
        , Namespace
        , StaffUSI
        , SurveyIdentifier
        , SurveyResponseIdentifier
        , SurveySectionTitle
    FROM EdFi_Ods_Populated_Template.edfi.SurveySectionResponseStaffTargetAssociation
    -- GO


    
    INSERT INTO edfi.TeachingCredentialBasisDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , TeachingCredentialBasisDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, TeachingCredentialBasisDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, TeachingCredentialBasisDescriptorId)
        )
        , TeachingCredentialBasisDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.TeachingCredentialBasisDescriptor
    -- GO


    
    INSERT INTO edfi.TeachingCredentialDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , TeachingCredentialDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, TeachingCredentialDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, TeachingCredentialDescriptorId)
        )
        , TeachingCredentialDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.TeachingCredentialDescriptor
    -- GO


    
    INSERT INTO edfi.TechnicalSkillsAssessmentDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , TechnicalSkillsAssessmentDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, TechnicalSkillsAssessmentDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, TechnicalSkillsAssessmentDescriptorId)
        )
        , TechnicalSkillsAssessmentDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.TechnicalSkillsAssessmentDescriptor
    -- GO


    
    INSERT INTO edfi.TelephoneNumberTypeDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , TelephoneNumberTypeDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, TelephoneNumberTypeDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, TelephoneNumberTypeDescriptorId)
        )
        , TelephoneNumberTypeDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.TelephoneNumberTypeDescriptor
    -- GO


    
    INSERT INTO edfi.TermDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , TermDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, TermDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, TermDescriptorId)
        )
        , TermDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.TermDescriptor
    -- GO


    
    INSERT INTO edfi.TitleIPartAParticipantDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , TitleIPartAParticipantDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, TitleIPartAParticipantDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, TitleIPartAParticipantDescriptorId)
        )
        , TitleIPartAParticipantDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.TitleIPartAParticipantDescriptor
    -- GO


    
    INSERT INTO edfi.TitleIPartAProgramServiceDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , TitleIPartAProgramServiceDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, TitleIPartAProgramServiceDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, TitleIPartAProgramServiceDescriptorId)
        )
        , TitleIPartAProgramServiceDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.TitleIPartAProgramServiceDescriptor
    -- GO


    
    INSERT INTO edfi.TitleIPartASchoolDesignationDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , TitleIPartASchoolDesignationDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, TitleIPartASchoolDesignationDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, TitleIPartASchoolDesignationDescriptorId)
        )
        , TitleIPartASchoolDesignationDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.TitleIPartASchoolDesignationDescriptor
    -- GO


    
    INSERT INTO edfi.TribalAffiliationDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , TribalAffiliationDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, TribalAffiliationDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, TribalAffiliationDescriptorId)
        )
        , TribalAffiliationDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.TribalAffiliationDescriptor
    -- GO


    
    INSERT INTO edfi.VisaDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , VisaDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, VisaDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, VisaDescriptorId)
        )
        , VisaDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.VisaDescriptor
    -- GO


    
    INSERT INTO edfi.WeaponDescriptor (
        HashKey
        -- Identifying references (for aggregate root entity)
        , DescriptorHashKey
        -- Primary key columns
        , WeaponDescriptorId
        )
    SELECT 
        HASHBYTES('sha1', 
            CONVERT(nvarchar, WeaponDescriptorId)
        )
        -- Identifying references
        , HASHBYTES('sha1', 
            CONVERT(nvarchar, WeaponDescriptorId)
        )
        , WeaponDescriptorId
    FROM EdFi_Ods_Populated_Template.edfi.WeaponDescriptor
    -- GO


    
END