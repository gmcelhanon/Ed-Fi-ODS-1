    CREATE TABLE edfi.AbsenceEventCategoryDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        AbsenceEventCategoryDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT AbsenceEventCategoryDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.AcademicHonorCategoryDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        AcademicHonorCategoryDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT AcademicHonorCategoryDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.AcademicSubjectDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        AcademicSubjectDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT AcademicSubjectDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.AcademicWeek (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        SchoolHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        SchoolId int NOT NULL,
        WeekIdentifier nvarchar(80) NOT NULL,
        -- Constraints
        CONSTRAINT AcademicWeek_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.AcademicWeek_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , BeginDate date NOT NULL
            , EndDate date NOT NULL
            , TotalInstructionalDays int NOT NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT AcademicWeek_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.AccommodationDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        AccommodationDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT AccommodationDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.Account (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        EducationOrganizationHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        AccountIdentifier nvarchar(50) NOT NULL,
        EducationOrganizationId int NOT NULL,
        FiscalYear int NOT NULL,
        -- Constraints
        CONSTRAINT Account_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.Account_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , AccountName nvarchar(100) NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT Account_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.AccountAccountCode (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , AccountCodeHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT AccountAccountCode_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , AccountCodeHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.AccountabilityRating (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        EducationOrganizationHashKey uniqueIdentifier NOT NULL,
        SchoolYearTypeHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        EducationOrganizationId int NOT NULL,
        RatingTitle nvarchar(60) NOT NULL,
        SchoolYear smallint NOT NULL,
        -- Constraints
        CONSTRAINT AccountabilityRating_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.AccountabilityRating_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , Rating nvarchar(35) NOT NULL
            , RatingDate date NULL
            , RatingOrganization nvarchar(35) NULL
            , RatingProgram nvarchar(30) NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT AccountabilityRating_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.AccountClassificationDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        AccountClassificationDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT AccountClassificationDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.AccountCode (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        AccountClassificationDescriptorHashKey uniqueIdentifier NOT NULL,
        EducationOrganizationHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        AccountClassificationDescriptorId int NOT NULL,
        AccountCodeNumber nvarchar(50) NOT NULL,
        EducationOrganizationId int NOT NULL,
        FiscalYear int NOT NULL,
        -- Constraints
        CONSTRAINT AccountCode_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.AccountCode_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , AccountCodeDescription nvarchar(1024) NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT AccountCode_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.AchievementCategoryDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        AchievementCategoryDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT AchievementCategoryDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.Actual (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        AccountHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        AccountIdentifier nvarchar(50) NOT NULL,
        AsOfDate date NOT NULL,
        EducationOrganizationId int NOT NULL,
        FiscalYear int NOT NULL,
        -- Constraints
        CONSTRAINT Actual_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.Actual_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , AmountToDate money NOT NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT Actual_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.AdditionalCreditTypeDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        AdditionalCreditTypeDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT AdditionalCreditTypeDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.AddressTypeDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        AddressTypeDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT AddressTypeDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.AdministrationEnvironmentDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        AdministrationEnvironmentDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT AdministrationEnvironmentDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.AdministrativeFundingControlDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        AdministrativeFundingControlDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT AdministrativeFundingControlDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.Assessment (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        -- Primary key columns
        AssessmentIdentifier nvarchar(60) NOT NULL,
        Namespace nvarchar(255) NOT NULL,
        -- Constraints
        CONSTRAINT Assessment_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.Assessment_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , AdaptiveAssessment bit NULL
            , AssessmentFamily nvarchar(60) NULL
            , AssessmentForm nvarchar(60) NULL
            , AssessmentTitle nvarchar(100) NOT NULL
            , AssessmentVersion int NULL
            , MaxRawScore decimal(15,5) NULL
            , Nomenclature nvarchar(35) NULL
            , RevisionDate date NULL
            -- References
            , AssessmentCategoryDescriptorHashKey uniqueIdentifier NULL
            , EducationOrganizationHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT Assessment_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.AssessmentAcademicSubject (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , AcademicSubjectDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT AssessmentAcademicSubject_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , AcademicSubjectDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.AssessmentAssessedGradeLevel (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , GradeLevelDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT AssessmentAssessedGradeLevel_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , GradeLevelDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.AssessmentContentStandard (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        -- Contextual primary key
        -- Constraints
        CONSTRAINT AssessmentContentStandard_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.AssessmentContentStandard_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            -- Contextual primary key
            -- Attributes
            , BeginDate date NULL
            , EndDate date NULL
            , PublicationDate date NULL
            , PublicationYear smallint NULL
            , Title nvarchar(75) NOT NULL
            , URI nvarchar(255) NULL
            , Version nvarchar(50) NULL
            -- References
            , MandatingEducationOrganizationHashKey uniqueIdentifier NULL
            , PublicationStatusDescriptorHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT AssessmentContentStandard_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.AssessmentContentStandardAuthor (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        -- Contextual primary key
        , Author nvarchar(100) NOT NULL
        -- Constraints
        CONSTRAINT AssessmentContentStandardAuthor_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , Author
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.AssessmentIdentificationCode (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , AssessmentIdentificationSystemDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT AssessmentIdentificationCode_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , AssessmentIdentificationSystemDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.AssessmentIdentificationCode_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , AssessmentIdentificationSystemDescriptorHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            -- Attributes
            , AssigningOrganizationIdentificationCode nvarchar(60) NULL
            , IdentificationCode nvarchar(60) NOT NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT AssessmentIdentificationCode_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.AssessmentLanguage (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , LanguageDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT AssessmentLanguage_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , LanguageDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.AssessmentPerformanceLevel (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , AssessmentReportingMethodDescriptorHashKey uniqueIdentifier NOT NULL
        , PerformanceLevelDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT AssessmentPerformanceLevel_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , AssessmentReportingMethodDescriptorHashKey
            , PerformanceLevelDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.AssessmentPerformanceLevel_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , AssessmentReportingMethodDescriptorHashKey uniqueIdentifier NOT NULL
            , PerformanceLevelDescriptorHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            -- Attributes
            , MaximumScore nvarchar(35) NULL
            , MinimumScore nvarchar(35) NULL
            -- References
            , ResultDatatypeTypeDescriptorHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT AssessmentPerformanceLevel_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.AssessmentPeriod (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        -- Contextual primary key
        -- Constraints
        CONSTRAINT AssessmentPeriod_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.AssessmentPeriod_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            -- Contextual primary key
            -- Attributes
            , BeginDate date NULL
            , EndDate date NULL
            -- References
            , AssessmentPeriodDescriptorHashKey uniqueIdentifier NOT NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT AssessmentPeriod_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.AssessmentPlatformType (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , PlatformTypeDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT AssessmentPlatformType_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , PlatformTypeDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.AssessmentProgram (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , ProgramHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT AssessmentProgram_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , ProgramHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.AssessmentScore (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , AssessmentReportingMethodDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT AssessmentScore_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , AssessmentReportingMethodDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.AssessmentScore_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , AssessmentReportingMethodDescriptorHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            -- Attributes
            , MaximumScore nvarchar(35) NULL
            , MinimumScore nvarchar(35) NULL
            -- References
            , ResultDatatypeTypeDescriptorHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT AssessmentScore_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.AssessmentSection (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , SectionHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT AssessmentSection_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , SectionHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.AssessmentCategoryDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        AssessmentCategoryDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT AssessmentCategoryDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.AssessmentIdentificationSystemDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        AssessmentIdentificationSystemDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT AssessmentIdentificationSystemDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.AssessmentItem (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        AssessmentHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        AssessmentIdentifier nvarchar(60) NOT NULL,
        IdentificationCode nvarchar(60) NOT NULL,
        Namespace nvarchar(255) NOT NULL,
        -- Constraints
        CONSTRAINT AssessmentItem_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.AssessmentItem_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , AssessmentItemURI nvarchar(255) NULL
            , CorrectResponse nvarchar(20) NULL
            , ExpectedTimeAssessed nvarchar(30) NULL
            , ItemText nvarchar(1024) NULL
            , MaxRawScore decimal(15,5) NULL
            , Nomenclature nvarchar(35) NULL
            -- References
            , AssessmentItemCategoryDescriptorHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT AssessmentItem_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.AssessmentItemLearningStandard (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , LearningStandardHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT AssessmentItemLearningStandard_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , LearningStandardHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.AssessmentItemPossibleResponse (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        -- Contextual primary key
        , ResponseValue nvarchar(60) NOT NULL
        -- Constraints
        CONSTRAINT AssessmentItemPossibleResponse_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , ResponseValue
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.AssessmentItemPossibleResponse_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            -- Contextual primary key
            , ResponseValue nvarchar(60) NOT NULL
            -- Attributes
            , CorrectResponse bit NULL
            , ResponseDescription nvarchar(1024) NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT AssessmentItemPossibleResponse_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
                , ResponseValue ASC -- Contextual PK column
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.AssessmentItemCategoryDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        AssessmentItemCategoryDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT AssessmentItemCategoryDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.AssessmentItemResultDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        AssessmentItemResultDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT AssessmentItemResultDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.AssessmentPeriodDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        AssessmentPeriodDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT AssessmentPeriodDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.AssessmentReportingMethodDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        AssessmentReportingMethodDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT AssessmentReportingMethodDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.AttemptStatusDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        AttemptStatusDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT AttemptStatusDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.AttendanceEventCategoryDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        AttendanceEventCategoryDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT AttendanceEventCategoryDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.BehaviorDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        BehaviorDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT BehaviorDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.BellSchedule (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        SchoolHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        BellScheduleName nvarchar(60) NOT NULL,
        SchoolId int NOT NULL,
        -- Constraints
        CONSTRAINT BellSchedule_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.BellSchedule_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , AlternateDayName nvarchar(20) NULL
            , EndTime time NULL
            , StartTime time NULL
            , TotalInstructionalTime int NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT BellSchedule_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.BellScheduleClassPeriod (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , ClassPeriodHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT BellScheduleClassPeriod_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , ClassPeriodHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.BellScheduleDate (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        -- Contextual primary key
        , Date date NOT NULL
        -- Constraints
        CONSTRAINT BellScheduleDate_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , Date
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.BellScheduleGradeLevel (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , GradeLevelDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT BellScheduleGradeLevel_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , GradeLevelDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.Budget (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        AccountHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        AccountIdentifier nvarchar(50) NOT NULL,
        AsOfDate date NOT NULL,
        EducationOrganizationId int NOT NULL,
        FiscalYear int NOT NULL,
        -- Constraints
        CONSTRAINT Budget_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.Budget_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , Amount money NOT NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT Budget_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.Calendar (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        SchoolHashKey uniqueIdentifier NOT NULL,
        SchoolYearTypeHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        CalendarCode nvarchar(60) NOT NULL,
        SchoolId int NOT NULL,
        SchoolYear smallint NOT NULL,
        -- Constraints
        CONSTRAINT Calendar_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.Calendar_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- References
            , CalendarTypeDescriptorHashKey uniqueIdentifier NOT NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT Calendar_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.CalendarGradeLevel (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , GradeLevelDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT CalendarGradeLevel_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , GradeLevelDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.CalendarDate (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        CalendarHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        CalendarCode nvarchar(60) NOT NULL,
        Date date NOT NULL,
        SchoolId int NOT NULL,
        SchoolYear smallint NOT NULL,
        -- Constraints
        CONSTRAINT CalendarDate_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.CalendarDateCalendarEvent (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , CalendarEventDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT CalendarDateCalendarEvent_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , CalendarEventDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.CalendarEventDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        CalendarEventDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT CalendarEventDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.CalendarTypeDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        CalendarTypeDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT CalendarTypeDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.CareerPathwayDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        CareerPathwayDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT CareerPathwayDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.CharterApprovalAgencyTypeDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        CharterApprovalAgencyTypeDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT CharterApprovalAgencyTypeDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.CharterStatusDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        CharterStatusDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT CharterStatusDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.CitizenshipStatusDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        CitizenshipStatusDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT CitizenshipStatusDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.ClassPeriod (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        SchoolHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        ClassPeriodName nvarchar(60) NOT NULL,
        SchoolId int NOT NULL,
        -- Constraints
        CONSTRAINT ClassPeriod_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.ClassPeriod_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , OfficialAttendancePeriod bit NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT ClassPeriod_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.ClassPeriodMeetingTime (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        -- Contextual primary key
        , EndTime time NOT NULL
        , StartTime time NOT NULL
        -- Constraints
        CONSTRAINT ClassPeriodMeetingTime_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , EndTime
            , StartTime
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.ClassroomPositionDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        ClassroomPositionDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT ClassroomPositionDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.Cohort (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        EducationOrganizationHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        CohortIdentifier nvarchar(20) NOT NULL,
        EducationOrganizationId int NOT NULL,
        -- Constraints
        CONSTRAINT Cohort_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.Cohort_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , CohortDescription nvarchar(1024) NULL
            -- References
            , AcademicSubjectDescriptorHashKey uniqueIdentifier NULL
            , CohortScopeDescriptorHashKey uniqueIdentifier NULL
            , CohortTypeDescriptorHashKey uniqueIdentifier NOT NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT Cohort_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.CohortProgram (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , ProgramHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT CohortProgram_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , ProgramHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.CohortScopeDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        CohortScopeDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT CohortScopeDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.CohortTypeDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        CohortTypeDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT CohortTypeDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.CohortYearTypeDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        CohortYearTypeDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT CohortYearTypeDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.CommunityOrganization (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        EducationOrganizationHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        CommunityOrganizationId int NOT NULL,
        -- Constraints
        CONSTRAINT CommunityOrganization_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.CommunityProvider (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        EducationOrganizationHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        CommunityProviderId int NOT NULL,
        -- Constraints
        CONSTRAINT CommunityProvider_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.CommunityProvider_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , LicenseExemptIndicator bit NULL
            , SchoolIndicator bit NULL
            -- References
            , CommunityOrganizationHashKey uniqueIdentifier NULL
            , ProviderCategoryDescriptorHashKey uniqueIdentifier NOT NULL
            , ProviderProfitabilityDescriptorHashKey uniqueIdentifier NULL
            , ProviderStatusDescriptorHashKey uniqueIdentifier NOT NULL
            -- Boilerplate
            -- Constraints
            , CONSTRAINT CommunityProvider_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.CommunityProviderLicense (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        CommunityProviderHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        CommunityProviderId int NOT NULL,
        LicenseIdentifier nvarchar(20) NOT NULL,
        LicensingOrganization nvarchar(75) NOT NULL,
        -- Constraints
        CONSTRAINT CommunityProviderLicense_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.CommunityProviderLicense_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , AuthorizedFacilityCapacity int NULL
            , LicenseEffectiveDate date NOT NULL
            , LicenseExpirationDate date NULL
            , LicenseIssueDate date NULL
            , OldestAgeAuthorizedToServe int NULL
            , YoungestAgeAuthorizedToServe int NULL
            -- References
            , LicenseStatusDescriptorHashKey uniqueIdentifier NULL
            , LicenseTypeDescriptorHashKey uniqueIdentifier NOT NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT CommunityProviderLicense_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.CompetencyLevelDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        CompetencyLevelDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT CompetencyLevelDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.CompetencyObjective (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        EducationOrganizationHashKey uniqueIdentifier NOT NULL,
        ObjectiveGradeLevelDescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        EducationOrganizationId int NOT NULL,
        Objective nvarchar(60) NOT NULL,
        ObjectiveGradeLevelDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT CompetencyObjective_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.CompetencyObjective_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , CompetencyObjectiveId nvarchar(60) NULL
            , Description nvarchar(1024) NULL
            , SuccessCriteria nvarchar(150) NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT CompetencyObjective_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.ContactTypeDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        ContactTypeDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT ContactTypeDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.ContentClassDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        ContentClassDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT ContentClassDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.ContinuationOfServicesReasonDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        ContinuationOfServicesReasonDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT ContinuationOfServicesReasonDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.ContractedStaff (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        AccountHashKey uniqueIdentifier NOT NULL,
        StaffHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        AccountIdentifier nvarchar(50) NOT NULL,
        AsOfDate date NOT NULL,
        EducationOrganizationId int NOT NULL,
        FiscalYear int NOT NULL,
        StaffUSI int NOT NULL,
        -- Constraints
        CONSTRAINT ContractedStaff_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.ContractedStaff_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , AmountToDate money NOT NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT ContractedStaff_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.CostRateDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        CostRateDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT CostRateDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.CountryDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        CountryDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT CountryDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.Course (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        EducationOrganizationHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        CourseCode nvarchar(60) NOT NULL,
        EducationOrganizationId int NOT NULL,
        -- Constraints
        CONSTRAINT Course_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.Course_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , CourseDescription nvarchar(1024) NULL
            , CourseTitle nvarchar(60) NOT NULL
            , DateCourseAdopted date NULL
            , HighSchoolCourseRequirement bit NULL
            , MaxCompletionsForCredit int NULL
            , MaximumAvailableCreditConversion decimal(9,2) NULL
            , MaximumAvailableCredits decimal(9,3) NULL
            , MinimumAvailableCreditConversion decimal(9,2) NULL
            , MinimumAvailableCredits decimal(9,3) NULL
            , NumberOfParts int NOT NULL
            , TimeRequiredForCompletion int NULL
            -- References
            , AcademicSubjectDescriptorHashKey uniqueIdentifier NULL
            , CareerPathwayDescriptorHashKey uniqueIdentifier NULL
            , CourseDefinedByDescriptorHashKey uniqueIdentifier NULL
            , CourseGPAApplicabilityDescriptorHashKey uniqueIdentifier NULL
            , MinimumAvailableCreditTypeDescriptorHashKey uniqueIdentifier NULL
            , MaximumAvailableCreditTypeDescriptorHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT Course_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.CourseCompetencyLevel (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , CompetencyLevelDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT CourseCompetencyLevel_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , CompetencyLevelDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.CourseIdentificationCode (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , CourseIdentificationSystemDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT CourseIdentificationCode_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , CourseIdentificationSystemDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.CourseIdentificationCode_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , CourseIdentificationSystemDescriptorHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            -- Attributes
            , AssigningOrganizationIdentificationCode nvarchar(60) NULL
            , CourseCatalogURL nvarchar(255) NULL
            , IdentificationCode nvarchar(60) NOT NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT CourseIdentificationCode_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.CourseLearningObjective (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , LearningObjectiveHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT CourseLearningObjective_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , LearningObjectiveHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.CourseLearningStandard (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , LearningStandardHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT CourseLearningStandard_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , LearningStandardHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.CourseLevelCharacteristic (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , CourseLevelCharacteristicDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT CourseLevelCharacteristic_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , CourseLevelCharacteristicDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.CourseOfferedGradeLevel (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , GradeLevelDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT CourseOfferedGradeLevel_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , GradeLevelDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.CourseAttemptResultDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        CourseAttemptResultDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT CourseAttemptResultDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.CourseDefinedByDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        CourseDefinedByDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT CourseDefinedByDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.CourseGPAApplicabilityDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        CourseGPAApplicabilityDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT CourseGPAApplicabilityDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.CourseIdentificationSystemDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        CourseIdentificationSystemDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT CourseIdentificationSystemDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.CourseLevelCharacteristicDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        CourseLevelCharacteristicDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT CourseLevelCharacteristicDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.CourseOffering (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        SchoolHashKey uniqueIdentifier NOT NULL,
        SessionHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        LocalCourseCode nvarchar(60) NOT NULL,
        SchoolId int NOT NULL,
        SchoolYear smallint NOT NULL,
        SessionName nvarchar(60) NOT NULL,
        -- Constraints
        CONSTRAINT CourseOffering_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.CourseOffering_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , InstructionalTimePlanned int NULL
            , LocalCourseTitle nvarchar(60) NULL
            -- References
            , CourseHashKey uniqueIdentifier NOT NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT CourseOffering_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.CourseOfferingCourseLevelCharacteristic (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , CourseLevelCharacteristicDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT CourseOfferingCourseLevelCharacteristic_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , CourseLevelCharacteristicDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.CourseOfferingCurriculumUsed (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , CurriculumUsedDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT CourseOfferingCurriculumUsed_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , CurriculumUsedDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.CourseOfferingOfferedGradeLevel (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , GradeLevelDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT CourseOfferingOfferedGradeLevel_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , GradeLevelDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.CourseRepeatCodeDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        CourseRepeatCodeDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT CourseRepeatCodeDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.CourseTranscript (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        CourseHashKey uniqueIdentifier NOT NULL,
        CourseAttemptResultDescriptorHashKey uniqueIdentifier NOT NULL,
        StudentAcademicRecordHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        CourseAttemptResultDescriptorId int NOT NULL,
        CourseCode nvarchar(60) NOT NULL,
        CourseEducationOrganizationId int NOT NULL,
        EducationOrganizationId int NOT NULL,
        SchoolYear smallint NOT NULL,
        StudentUSI int NOT NULL,
        TermDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT CourseTranscript_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.CourseTranscript_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , AlternativeCourseCode nvarchar(60) NULL
            , AlternativeCourseTitle nvarchar(60) NULL
            , AssigningOrganizationIdentificationCode nvarchar(60) NULL
            , AttemptedCreditConversion decimal(9,2) NULL
            , AttemptedCredits decimal(9,3) NULL
            , CourseCatalogURL nvarchar(255) NULL
            , CourseTitle nvarchar(60) NULL
            , EarnedCreditConversion decimal(9,2) NULL
            , EarnedCredits decimal(9,3) NOT NULL
            , FinalLetterGradeEarned nvarchar(20) NULL
            , FinalNumericGradeEarned decimal(9,2) NULL
            -- References
            , CourseRepeatCodeDescriptorHashKey uniqueIdentifier NULL
            , AttemptedCreditTypeDescriptorHashKey uniqueIdentifier NULL
            , EarnedCreditTypeDescriptorHashKey uniqueIdentifier NULL
            , ExternalEducationOrganizationHashKey uniqueIdentifier NULL
            , WhenTakenGradeLevelDescriptorHashKey uniqueIdentifier NULL
            , MethodCreditEarnedDescriptorHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT CourseTranscript_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.CourseTranscriptAcademicSubject (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , AcademicSubjectDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT CourseTranscriptAcademicSubject_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , AcademicSubjectDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.CourseTranscriptAlternativeCourseIdentificationCode (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , CourseIdentificationSystemDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT CourseTranscriptAlternativeCourseIdentificationCode_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , CourseIdentificationSystemDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.CourseTranscriptAlternativeCourseIdentificationCode_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , CourseIdentificationSystemDescriptorHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            -- Attributes
            , AssigningOrganizationIdentificationCode nvarchar(60) NULL
            , CourseCatalogURL nvarchar(255) NULL
            , IdentificationCode nvarchar(60) NOT NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT CourseTranscriptAlternativeCourseIdentificationCode_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.CourseTranscriptCreditCategory (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , CreditCategoryDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT CourseTranscriptCreditCategory_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , CreditCategoryDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.CourseTranscriptEarnedAdditionalCredits (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , AdditionalCreditTypeDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT CourseTranscriptEarnedAdditionalCredits_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , AdditionalCreditTypeDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.CourseTranscriptEarnedAdditionalCredits_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , AdditionalCreditTypeDescriptorHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            -- Attributes
            , Credits decimal(9,3) NOT NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT CourseTranscriptEarnedAdditionalCredits_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.Credential (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        StateOfIssueStateAbbreviationDescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        CredentialIdentifier nvarchar(60) NOT NULL,
        StateOfIssueStateAbbreviationDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT Credential_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.Credential_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , EffectiveDate date NULL
            , ExpirationDate date NULL
            , IssuanceDate date NOT NULL
            , Namespace nvarchar(255) NOT NULL
            -- References
            , CredentialFieldDescriptorHashKey uniqueIdentifier NOT NULL
            , CredentialTypeDescriptorHashKey uniqueIdentifier NOT NULL
            , TeachingCredentialBasisDescriptorHashKey uniqueIdentifier NULL
            , TeachingCredentialDescriptorHashKey uniqueIdentifier NOT NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT Credential_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.CredentialAcademicSubject (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , AcademicSubjectDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT CredentialAcademicSubject_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , AcademicSubjectDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.CredentialEndorsement (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        -- Contextual primary key
        , CredentialEndorsement nvarchar(255) NOT NULL
        -- Constraints
        CONSTRAINT CredentialEndorsement_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , CredentialEndorsement
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.CredentialGradeLevel (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , GradeLevelDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT CredentialGradeLevel_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , GradeLevelDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.CredentialFieldDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        CredentialFieldDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT CredentialFieldDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.CredentialTypeDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        CredentialTypeDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT CredentialTypeDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.CreditCategoryDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        CreditCategoryDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT CreditCategoryDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.CreditTypeDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        CreditTypeDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT CreditTypeDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.CTEProgramServiceDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        CTEProgramServiceDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT CTEProgramServiceDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.CurriculumUsedDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        CurriculumUsedDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT CurriculumUsedDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.DeliveryMethodDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        DeliveryMethodDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT DeliveryMethodDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.Descriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        -- Primary key columns
        DescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT Descriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.Descriptor_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , CodeValue nvarchar(50) NOT NULL
            , Description nvarchar(1024) NULL
            , EffectiveBeginDate date NULL
            , EffectiveEndDate date NULL
            , Namespace nvarchar(255) NOT NULL
            , PriorDescriptorId int NULL
            , ShortDescription nvarchar(75) NOT NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT Descriptor_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.DiagnosisDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        DiagnosisDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT DiagnosisDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.DiplomaLevelDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        DiplomaLevelDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT DiplomaLevelDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.DiplomaTypeDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        DiplomaTypeDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT DiplomaTypeDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.DisabilityDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        DisabilityDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT DisabilityDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.DisabilityDesignationDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        DisabilityDesignationDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT DisabilityDesignationDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.DisabilityDeterminationSourceTypeDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        DisabilityDeterminationSourceTypeDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT DisabilityDeterminationSourceTypeDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.DisciplineAction (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        StudentHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        DisciplineActionIdentifier nvarchar(20) NOT NULL,
        DisciplineDate date NOT NULL,
        StudentUSI int NOT NULL,
        -- Constraints
        CONSTRAINT DisciplineAction_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.DisciplineAction_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , ActualDisciplineActionLength decimal(5,2) NULL
            , DisciplineActionLength decimal(5,2) NULL
            , IEPPlacementMeetingIndicator bit NULL
            , ReceivedEducationServicesDuringExpulsion bit NULL
            , RelatedToZeroTolerancePolicy bit NULL
            -- References
            , DisciplineActionLengthDifferenceReasonDescriptorHashKey uniqueIdentifier NULL
            , ResponsibilitySchoolHashKey uniqueIdentifier NOT NULL
            , AssignmentSchoolHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT DisciplineAction_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.DisciplineActionDiscipline (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , DisciplineDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT DisciplineActionDiscipline_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , DisciplineDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.DisciplineActionStaff (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , StaffHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT DisciplineActionStaff_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , StaffHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.DisciplineActionStudentDisciplineIncidentAssociation (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , StudentDisciplineIncidentAssociationHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT DisciplineActionStudentDisciplineIncidentAssociation_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , StudentDisciplineIncidentAssociationHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.DisciplineActionLengthDifferenceReasonDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        DisciplineActionLengthDifferenceReasonDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT DisciplineActionLengthDifferenceReasonDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.DisciplineDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        DisciplineDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT DisciplineDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.DisciplineIncident (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        SchoolHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        IncidentIdentifier nvarchar(20) NOT NULL,
        SchoolId int NOT NULL,
        -- Constraints
        CONSTRAINT DisciplineIncident_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.DisciplineIncident_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , CaseNumber nvarchar(20) NULL
            , IncidentCost money NULL
            , IncidentDate date NOT NULL
            , IncidentDescription nvarchar(1024) NULL
            , IncidentTime time NULL
            , ReportedToLawEnforcement bit NULL
            , ReporterName nvarchar(75) NULL
            -- References
            , IncidentLocationDescriptorHashKey uniqueIdentifier NULL
            , ReporterDescriptionDescriptorHashKey uniqueIdentifier NULL
            , StaffHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT DisciplineIncident_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.DisciplineIncidentBehavior (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , BehaviorDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT DisciplineIncidentBehavior_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , BehaviorDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.DisciplineIncidentBehavior_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , BehaviorDescriptorHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            -- Attributes
            , BehaviorDetailedDescription nvarchar(1024) NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT DisciplineIncidentBehavior_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.DisciplineIncidentExternalParticipant (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , DisciplineIncidentParticipationCodeDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        , FirstName nvarchar(75) NOT NULL
        , LastSurname nvarchar(75) NOT NULL
        -- Constraints
        CONSTRAINT DisciplineIncidentExternalParticipant_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , DisciplineIncidentParticipationCodeDescriptorHashKey
            , FirstName
            , LastSurname
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.DisciplineIncidentWeapon (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , WeaponDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT DisciplineIncidentWeapon_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , WeaponDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.DisciplineIncidentParticipationCodeDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        DisciplineIncidentParticipationCodeDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT DisciplineIncidentParticipationCodeDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.EducationalEnvironmentDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        EducationalEnvironmentDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT EducationalEnvironmentDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.EducationContent (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        -- Primary key columns
        ContentIdentifier nvarchar(225) NOT NULL,
        -- Constraints
        CONSTRAINT EducationContent_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.EducationContent_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , AdditionalAuthorsIndicator bit NULL
            , Cost money NULL
            , Description nvarchar(1024) NULL
            , LearningResourceMetadataURI nvarchar(255) NULL
            , Namespace nvarchar(255) NOT NULL
            , PublicationDate date NULL
            , PublicationYear smallint NULL
            , Publisher nvarchar(50) NULL
            , ShortDescription nvarchar(75) NULL
            , TimeRequired nvarchar(30) NULL
            , UseRightsURL nvarchar(255) NULL
            , Version nvarchar(10) NULL
            -- References
            , ContentClassDescriptorHashKey uniqueIdentifier NULL
            , CostRateDescriptorHashKey uniqueIdentifier NULL
            , InteractivityStyleDescriptorHashKey uniqueIdentifier NULL
            , LearningStandardHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT EducationContent_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.EducationContentAppropriateGradeLevel (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , GradeLevelDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT EducationContentAppropriateGradeLevel_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , GradeLevelDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.EducationContentAppropriateSex (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , SexDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT EducationContentAppropriateSex_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , SexDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.EducationContentAuthor (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        -- Contextual primary key
        , Author nvarchar(100) NOT NULL
        -- Constraints
        CONSTRAINT EducationContentAuthor_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , Author
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.EducationContentDerivativeSourceEducationContent (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        -- Contextual primary key
        -- Constraints
        CONSTRAINT EducationContentDerivativeSourceEducationContent_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.EducationContentDerivativeSourceLearningResourceMetadataURI (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        -- Contextual primary key
        , DerivativeSourceLearningResourceMetadataURI nvarchar(255) NOT NULL
        -- Constraints
        CONSTRAINT EducationContentDerivativeSourceLearningResourceMetadataURI_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , DerivativeSourceLearningResourceMetadataURI
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.EducationContentDerivativeSourceURI (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        -- Contextual primary key
        , DerivativeSourceURI nvarchar(255) NOT NULL
        -- Constraints
        CONSTRAINT EducationContentDerivativeSourceURI_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , DerivativeSourceURI
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.EducationContentLanguage (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , LanguageDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT EducationContentLanguage_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , LanguageDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.EducationOrganization (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        -- Primary key columns
        EducationOrganizationId int NOT NULL,
        -- Constraints
        CONSTRAINT EducationOrganization_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.EducationOrganization_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , NameOfInstitution nvarchar(75) NOT NULL
            , ShortNameOfInstitution nvarchar(75) NULL
            , WebSite nvarchar(255) NULL
            -- References
            , OperationalStatusDescriptorHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT EducationOrganization_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.EducationOrganizationAddress (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , AddressTypeDescriptorHashKey uniqueIdentifier NOT NULL
        , StateAbbreviationDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        , City nvarchar(30) NOT NULL
        , PostalCode nvarchar(17) NOT NULL
        , StreetNumberName nvarchar(150) NOT NULL
        -- Constraints
        CONSTRAINT EducationOrganizationAddress_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , AddressTypeDescriptorHashKey
            , StateAbbreviationDescriptorHashKey
            , City
            , PostalCode
            , StreetNumberName
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.EducationOrganizationAddress_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , AddressTypeDescriptorHashKey uniqueIdentifier NOT NULL
            , StateAbbreviationDescriptorHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            , City nvarchar(30) NOT NULL
            , PostalCode nvarchar(17) NOT NULL
            , StreetNumberName nvarchar(150) NOT NULL
            -- Attributes
            , ApartmentRoomSuiteNumber nvarchar(50) NULL
            , BuildingSiteNumber nvarchar(20) NULL
            , CongressionalDistrict nvarchar(30) NULL
            , CountyFIPSCode nvarchar(5) NULL
            , DoNotPublishIndicator bit NULL
            , Latitude nvarchar(20) NULL
            , Longitude nvarchar(20) NULL
            , NameOfCounty nvarchar(30) NULL
            -- References
            , LocaleDescriptorHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT EducationOrganizationAddress_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
                , City ASC -- Contextual PK column
                , PostalCode ASC -- Contextual PK column
                , StreetNumberName ASC -- Contextual PK column
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.EducationOrganizationAddressPeriod (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        -- Contextual primary key
        , BeginDate date NOT NULL
        -- Constraints
        CONSTRAINT EducationOrganizationAddressPeriod_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , BeginDate
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.EducationOrganizationAddressPeriod_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            -- Contextual primary key
            , BeginDate date NOT NULL
            -- Attributes
            , EndDate date NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT EducationOrganizationAddressPeriod_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
                , BeginDate ASC -- Contextual PK column
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.EducationOrganizationCategory (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , EducationOrganizationCategoryDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT EducationOrganizationCategory_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , EducationOrganizationCategoryDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.EducationOrganizationIdentificationCode (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , EducationOrganizationIdentificationSystemDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT EducationOrganizationIdentificationCode_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , EducationOrganizationIdentificationSystemDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.EducationOrganizationIdentificationCode_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , EducationOrganizationIdentificationSystemDescriptorHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            -- Attributes
            , IdentificationCode nvarchar(60) NOT NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT EducationOrganizationIdentificationCode_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.EducationOrganizationIndicator (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , IndicatorDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT EducationOrganizationIndicator_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , IndicatorDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.EducationOrganizationIndicator_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , IndicatorDescriptorHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            -- Attributes
            , DesignatedBy nvarchar(60) NULL
            , IndicatorValue nvarchar(35) NULL
            -- References
            , IndicatorGroupDescriptorHashKey uniqueIdentifier NULL
            , IndicatorLevelDescriptorHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT EducationOrganizationIndicator_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.EducationOrganizationIndicatorPeriod (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        -- Contextual primary key
        , BeginDate date NOT NULL
        -- Constraints
        CONSTRAINT EducationOrganizationIndicatorPeriod_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , BeginDate
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.EducationOrganizationIndicatorPeriod_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            -- Contextual primary key
            , BeginDate date NOT NULL
            -- Attributes
            , EndDate date NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT EducationOrganizationIndicatorPeriod_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
                , BeginDate ASC -- Contextual PK column
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.EducationOrganizationInstitutionTelephone (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , InstitutionTelephoneNumberTypeDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT EducationOrganizationInstitutionTelephone_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , InstitutionTelephoneNumberTypeDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.EducationOrganizationInstitutionTelephone_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , InstitutionTelephoneNumberTypeDescriptorHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            -- Attributes
            , TelephoneNumber nvarchar(24) NOT NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT EducationOrganizationInstitutionTelephone_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.EducationOrganizationInternationalAddress (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , AddressTypeDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT EducationOrganizationInternationalAddress_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , AddressTypeDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.EducationOrganizationInternationalAddress_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , AddressTypeDescriptorHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            -- Attributes
            , AddressLine1 nvarchar(150) NOT NULL
            , AddressLine2 nvarchar(150) NULL
            , AddressLine3 nvarchar(150) NULL
            , AddressLine4 nvarchar(150) NULL
            , BeginDate date NULL
            , EndDate date NULL
            , Latitude nvarchar(20) NULL
            , Longitude nvarchar(20) NULL
            -- References
            , CountryDescriptorHashKey uniqueIdentifier NOT NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT EducationOrganizationInternationalAddress_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.EducationOrganizationCategoryDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        EducationOrganizationCategoryDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT EducationOrganizationCategoryDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.EducationOrganizationIdentificationSystemDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        EducationOrganizationIdentificationSystemDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT EducationOrganizationIdentificationSystemDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.EducationOrganizationInterventionPrescriptionAssociation (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        EducationOrganizationHashKey uniqueIdentifier NOT NULL,
        InterventionPrescriptionHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        EducationOrganizationId int NOT NULL,
        InterventionPrescriptionEducationOrganizationId int NOT NULL,
        InterventionPrescriptionIdentificationCode nvarchar(60) NOT NULL,
        -- Constraints
        CONSTRAINT EducationOrganizationInterventionPrescriptionAssociation_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.EducationOrganizationInterventionPrescriptionAssociation_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , BeginDate date NULL
            , EndDate date NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT EducationOrganizationInterventionPrescriptionAssociation_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.EducationOrganizationNetwork (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        EducationOrganizationHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        EducationOrganizationNetworkId int NOT NULL,
        -- Constraints
        CONSTRAINT EducationOrganizationNetwork_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.EducationOrganizationNetwork_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- References
            , NetworkPurposeDescriptorHashKey uniqueIdentifier NOT NULL
            -- Boilerplate
            -- Constraints
            , CONSTRAINT EducationOrganizationNetwork_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.EducationOrganizationNetworkAssociation (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        MemberEducationOrganizationHashKey uniqueIdentifier NOT NULL,
        EducationOrganizationNetworkHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        EducationOrganizationNetworkId int NOT NULL,
        MemberEducationOrganizationId int NOT NULL,
        -- Constraints
        CONSTRAINT EducationOrganizationNetworkAssociation_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.EducationOrganizationNetworkAssociation_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , BeginDate date NULL
            , EndDate date NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT EducationOrganizationNetworkAssociation_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.EducationOrganizationPeerAssociation (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        EducationOrganizationHashKey uniqueIdentifier NOT NULL,
        PeerEducationOrganizationHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        EducationOrganizationId int NOT NULL,
        PeerEducationOrganizationId int NOT NULL,
        -- Constraints
        CONSTRAINT EducationOrganizationPeerAssociation_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.EducationPlanDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        EducationPlanDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT EducationPlanDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.EducationServiceCenter (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        EducationOrganizationHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        EducationServiceCenterId int NOT NULL,
        -- Constraints
        CONSTRAINT EducationServiceCenter_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.EducationServiceCenter_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- References
            , StateEducationAgencyHashKey uniqueIdentifier NULL
            -- Boilerplate
            -- Constraints
            , CONSTRAINT EducationServiceCenter_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.ElectronicMailTypeDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        ElectronicMailTypeDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT ElectronicMailTypeDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.EmploymentStatusDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        EmploymentStatusDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT EmploymentStatusDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.EntryGradeLevelReasonDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        EntryGradeLevelReasonDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT EntryGradeLevelReasonDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.EntryTypeDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        EntryTypeDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT EntryTypeDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.EventCircumstanceDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        EventCircumstanceDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT EventCircumstanceDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.ExitWithdrawTypeDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        ExitWithdrawTypeDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT ExitWithdrawTypeDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.FeederSchoolAssociation (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        FeederSchoolHashKey uniqueIdentifier NOT NULL,
        SchoolHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        BeginDate date NOT NULL,
        FeederSchoolId int NOT NULL,
        SchoolId int NOT NULL,
        -- Constraints
        CONSTRAINT FeederSchoolAssociation_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.FeederSchoolAssociation_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , EndDate date NULL
            , FeederRelationshipDescription nvarchar(1024) NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT FeederSchoolAssociation_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.GeneralStudentProgramAssociation (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        EducationOrganizationHashKey uniqueIdentifier NOT NULL,
        ProgramHashKey uniqueIdentifier NOT NULL,
        StudentHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        BeginDate date NOT NULL,
        EducationOrganizationId int NOT NULL,
        ProgramEducationOrganizationId int NOT NULL,
        ProgramName nvarchar(60) NOT NULL,
        ProgramTypeDescriptorId int NOT NULL,
        StudentUSI int NOT NULL,
        -- Constraints
        CONSTRAINT GeneralStudentProgramAssociation_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.GeneralStudentProgramAssociation_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , EndDate date NULL
            , ServedOutsideOfRegularSession bit NULL
            -- References
            , ReasonExitedDescriptorHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT GeneralStudentProgramAssociation_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.GeneralStudentProgramAssociationParticipationStatus (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        -- Contextual primary key
        -- Constraints
        CONSTRAINT GeneralStudentProgramAssociationParticipationStatus_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.GeneralStudentProgramAssociationParticipationStatus_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            -- Contextual primary key
            -- Attributes
            , DesignatedBy nvarchar(60) NULL
            , StatusBeginDate date NULL
            , StatusEndDate date NULL
            -- References
            , ParticipationStatusDescriptorHashKey uniqueIdentifier NOT NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT GeneralStudentProgramAssociationParticipationStatus_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.Grade (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        GradeTypeDescriptorHashKey uniqueIdentifier NOT NULL,
        GradingPeriodHashKey uniqueIdentifier NOT NULL,
        StudentSectionAssociationHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        BeginDate date NOT NULL,
        GradeTypeDescriptorId int NOT NULL,
        GradingPeriodDescriptorId int NOT NULL,
        GradingPeriodSchoolYear smallint NOT NULL,
        GradingPeriodSequence int NOT NULL,
        LocalCourseCode nvarchar(60) NOT NULL,
        SchoolId int NOT NULL,
        SchoolYear smallint NOT NULL,
        SectionIdentifier nvarchar(255) NOT NULL,
        SessionName nvarchar(60) NOT NULL,
        StudentUSI int NOT NULL,
        -- Constraints
        CONSTRAINT Grade_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.Grade_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , DiagnosticStatement nvarchar(1024) NULL
            , LetterGradeEarned nvarchar(20) NULL
            , NumericGradeEarned decimal(9,2) NULL
            -- References
            , PerformanceBaseConversionDescriptorHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT Grade_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.GradeLearningStandardGrade (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , LearningStandardHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT GradeLearningStandardGrade_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , LearningStandardHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.GradeLearningStandardGrade_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , LearningStandardHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            -- Attributes
            , DiagnosticStatement nvarchar(1024) NULL
            , LetterGradeEarned nvarchar(20) NULL
            , NumericGradeEarned decimal(9,2) NULL
            -- References
            , PerformanceBaseConversionDescriptorHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT GradeLearningStandardGrade_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.GradebookEntry (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        SectionHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        DateAssigned date NOT NULL,
        GradebookEntryTitle nvarchar(60) NOT NULL,
        LocalCourseCode nvarchar(60) NOT NULL,
        SchoolId int NOT NULL,
        SchoolYear smallint NOT NULL,
        SectionIdentifier nvarchar(255) NOT NULL,
        SessionName nvarchar(60) NOT NULL,
        -- Constraints
        CONSTRAINT GradebookEntry_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.GradebookEntry_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , Description nvarchar(1024) NULL
            , DueDate date NULL
            -- References
            , GradebookEntryTypeDescriptorHashKey uniqueIdentifier NULL
            , GradingPeriodHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT GradebookEntry_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.GradebookEntryLearningObjective (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , LearningObjectiveHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT GradebookEntryLearningObjective_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , LearningObjectiveHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.GradebookEntryLearningStandard (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , LearningStandardHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT GradebookEntryLearningStandard_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , LearningStandardHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.GradebookEntryTypeDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        GradebookEntryTypeDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT GradebookEntryTypeDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.GradeLevelDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        GradeLevelDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT GradeLevelDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.GradePointAverageTypeDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        GradePointAverageTypeDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT GradePointAverageTypeDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.GradeTypeDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        GradeTypeDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT GradeTypeDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.GradingPeriod (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        GradingPeriodDescriptorHashKey uniqueIdentifier NOT NULL,
        SchoolHashKey uniqueIdentifier NOT NULL,
        SchoolYearTypeHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        GradingPeriodDescriptorId int NOT NULL,
        PeriodSequence int NOT NULL,
        SchoolId int NOT NULL,
        SchoolYear smallint NOT NULL,
        -- Constraints
        CONSTRAINT GradingPeriod_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.GradingPeriod_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , BeginDate date NOT NULL
            , EndDate date NOT NULL
            , TotalInstructionalDays int NOT NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT GradingPeriod_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.GradingPeriodDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        GradingPeriodDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT GradingPeriodDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.GraduationPlan (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        EducationOrganizationHashKey uniqueIdentifier NOT NULL,
        GraduationPlanTypeDescriptorHashKey uniqueIdentifier NOT NULL,
        GraduationSchoolYearTypeHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        EducationOrganizationId int NOT NULL,
        GraduationPlanTypeDescriptorId int NOT NULL,
        GraduationSchoolYear smallint NOT NULL,
        -- Constraints
        CONSTRAINT GraduationPlan_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.GraduationPlan_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , IndividualPlan bit NULL
            , TotalRequiredCreditConversion decimal(9,2) NULL
            , TotalRequiredCredits decimal(9,3) NOT NULL
            -- References
            , TotalRequiredCreditTypeDescriptorHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT GraduationPlan_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.GraduationPlanCreditsByCourse (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        -- Contextual primary key
        , CourseSetName nvarchar(120) NOT NULL
        -- Constraints
        CONSTRAINT GraduationPlanCreditsByCourse_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , CourseSetName
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.GraduationPlanCreditsByCourse_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            -- Contextual primary key
            , CourseSetName nvarchar(120) NOT NULL
            -- Attributes
            , CreditConversion decimal(9,2) NULL
            , Credits decimal(9,3) NOT NULL
            -- References
            , CreditTypeDescriptorHashKey uniqueIdentifier NULL
            , WhenTakenGradeLevelDescriptorHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT GraduationPlanCreditsByCourse_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
                , CourseSetName ASC -- Contextual PK column
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.GraduationPlanCreditsByCourseCourse (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , CourseHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT GraduationPlanCreditsByCourseCourse_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , CourseHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.GraduationPlanCreditsByCreditCategory (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , CreditCategoryDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT GraduationPlanCreditsByCreditCategory_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , CreditCategoryDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.GraduationPlanCreditsByCreditCategory_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , CreditCategoryDescriptorHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            -- Attributes
            , CreditConversion decimal(9,2) NULL
            , Credits decimal(9,3) NOT NULL
            -- References
            , CreditTypeDescriptorHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT GraduationPlanCreditsByCreditCategory_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.GraduationPlanCreditsBySubject (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , AcademicSubjectDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT GraduationPlanCreditsBySubject_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , AcademicSubjectDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.GraduationPlanCreditsBySubject_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , AcademicSubjectDescriptorHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            -- Attributes
            , CreditConversion decimal(9,2) NULL
            , Credits decimal(9,3) NOT NULL
            -- References
            , CreditTypeDescriptorHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT GraduationPlanCreditsBySubject_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.GraduationPlanRequiredAssessment (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , AssessmentHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT GraduationPlanRequiredAssessment_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , AssessmentHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.GraduationPlanRequiredAssessmentPerformanceLevel (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        -- Contextual primary key
        -- Constraints
        CONSTRAINT GraduationPlanRequiredAssessmentPerformanceLevel_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.GraduationPlanRequiredAssessmentPerformanceLevel_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            -- Contextual primary key
            -- Attributes
            , MaximumScore nvarchar(35) NULL
            , MinimumScore nvarchar(35) NULL
            -- References
            , AssessmentReportingMethodDescriptorHashKey uniqueIdentifier NOT NULL
            , PerformanceLevelDescriptorHashKey uniqueIdentifier NOT NULL
            , ResultDatatypeTypeDescriptorHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT GraduationPlanRequiredAssessmentPerformanceLevel_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.GraduationPlanRequiredAssessmentScore (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , AssessmentReportingMethodDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT GraduationPlanRequiredAssessmentScore_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , AssessmentReportingMethodDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.GraduationPlanRequiredAssessmentScore_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , AssessmentReportingMethodDescriptorHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            -- Attributes
            , MaximumScore nvarchar(35) NULL
            , MinimumScore nvarchar(35) NULL
            -- References
            , ResultDatatypeTypeDescriptorHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT GraduationPlanRequiredAssessmentScore_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.GraduationPlanTypeDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        GraduationPlanTypeDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT GraduationPlanTypeDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.GunFreeSchoolsActReportingStatusDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        GunFreeSchoolsActReportingStatusDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT GunFreeSchoolsActReportingStatusDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.HomelessPrimaryNighttimeResidenceDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        HomelessPrimaryNighttimeResidenceDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT HomelessPrimaryNighttimeResidenceDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.HomelessProgramServiceDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        HomelessProgramServiceDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT HomelessProgramServiceDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.IdentificationDocumentUseDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        IdentificationDocumentUseDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT IdentificationDocumentUseDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.IncidentLocationDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        IncidentLocationDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT IncidentLocationDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.IndicatorDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        IndicatorDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT IndicatorDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.IndicatorGroupDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        IndicatorGroupDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT IndicatorGroupDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.IndicatorLevelDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        IndicatorLevelDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT IndicatorLevelDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.InstitutionTelephoneNumberTypeDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        InstitutionTelephoneNumberTypeDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT InstitutionTelephoneNumberTypeDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.InteractivityStyleDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        InteractivityStyleDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT InteractivityStyleDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.InternetAccessDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        InternetAccessDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT InternetAccessDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.Intervention (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        EducationOrganizationHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        EducationOrganizationId int NOT NULL,
        InterventionIdentificationCode nvarchar(60) NOT NULL,
        -- Constraints
        CONSTRAINT Intervention_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.Intervention_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , BeginDate date NOT NULL
            , EndDate date NULL
            , MaxDosage int NULL
            , MinDosage int NULL
            -- References
            , DeliveryMethodDescriptorHashKey uniqueIdentifier NOT NULL
            , InterventionClassDescriptorHashKey uniqueIdentifier NOT NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT Intervention_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.InterventionAppropriateGradeLevel (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , GradeLevelDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT InterventionAppropriateGradeLevel_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , GradeLevelDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.InterventionAppropriateSex (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , SexDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT InterventionAppropriateSex_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , SexDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.InterventionDiagnosis (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , DiagnosisDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT InterventionDiagnosis_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , DiagnosisDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.InterventionEducationContent (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , EducationContentHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT InterventionEducationContent_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , EducationContentHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.InterventionInterventionPrescription (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , InterventionPrescriptionHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT InterventionInterventionPrescription_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , InterventionPrescriptionHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.InterventionLearningResourceMetadataURI (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        -- Contextual primary key
        , LearningResourceMetadataURI nvarchar(255) NOT NULL
        -- Constraints
        CONSTRAINT InterventionLearningResourceMetadataURI_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , LearningResourceMetadataURI
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.InterventionMeetingTime (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        -- Contextual primary key
        , EndTime time NOT NULL
        , StartTime time NOT NULL
        -- Constraints
        CONSTRAINT InterventionMeetingTime_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , EndTime
            , StartTime
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.InterventionPopulationServed (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , PopulationServedDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT InterventionPopulationServed_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , PopulationServedDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.InterventionStaff (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , StaffHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT InterventionStaff_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , StaffHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.InterventionURI (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        -- Contextual primary key
        , URI nvarchar(255) NOT NULL
        -- Constraints
        CONSTRAINT InterventionURI_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , URI
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.InterventionClassDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        InterventionClassDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT InterventionClassDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.InterventionEffectivenessRatingDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        InterventionEffectivenessRatingDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT InterventionEffectivenessRatingDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.InterventionPrescription (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        EducationOrganizationHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        EducationOrganizationId int NOT NULL,
        InterventionPrescriptionIdentificationCode nvarchar(60) NOT NULL,
        -- Constraints
        CONSTRAINT InterventionPrescription_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.InterventionPrescription_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , MaxDosage int NULL
            , MinDosage int NULL
            -- References
            , DeliveryMethodDescriptorHashKey uniqueIdentifier NOT NULL
            , InterventionClassDescriptorHashKey uniqueIdentifier NOT NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT InterventionPrescription_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.InterventionPrescriptionAppropriateGradeLevel (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , GradeLevelDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT InterventionPrescriptionAppropriateGradeLevel_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , GradeLevelDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.InterventionPrescriptionAppropriateSex (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , SexDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT InterventionPrescriptionAppropriateSex_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , SexDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.InterventionPrescriptionDiagnosis (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , DiagnosisDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT InterventionPrescriptionDiagnosis_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , DiagnosisDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.InterventionPrescriptionEducationContent (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , EducationContentHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT InterventionPrescriptionEducationContent_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , EducationContentHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.InterventionPrescriptionLearningResourceMetadataURI (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        -- Contextual primary key
        , LearningResourceMetadataURI nvarchar(255) NOT NULL
        -- Constraints
        CONSTRAINT InterventionPrescriptionLearningResourceMetadataURI_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , LearningResourceMetadataURI
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.InterventionPrescriptionPopulationServed (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , PopulationServedDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT InterventionPrescriptionPopulationServed_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , PopulationServedDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.InterventionPrescriptionURI (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        -- Contextual primary key
        , URI nvarchar(255) NOT NULL
        -- Constraints
        CONSTRAINT InterventionPrescriptionURI_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , URI
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.InterventionStudy (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        EducationOrganizationHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        EducationOrganizationId int NOT NULL,
        InterventionStudyIdentificationCode nvarchar(60) NOT NULL,
        -- Constraints
        CONSTRAINT InterventionStudy_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.InterventionStudy_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , Participants int NOT NULL
            -- References
            , DeliveryMethodDescriptorHashKey uniqueIdentifier NOT NULL
            , InterventionClassDescriptorHashKey uniqueIdentifier NOT NULL
            , InterventionPrescriptionHashKey uniqueIdentifier NOT NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT InterventionStudy_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.InterventionStudyAppropriateGradeLevel (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , GradeLevelDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT InterventionStudyAppropriateGradeLevel_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , GradeLevelDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.InterventionStudyAppropriateSex (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , SexDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT InterventionStudyAppropriateSex_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , SexDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.InterventionStudyEducationContent (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , EducationContentHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT InterventionStudyEducationContent_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , EducationContentHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.InterventionStudyInterventionEffectiveness (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , DiagnosisDescriptorHashKey uniqueIdentifier NOT NULL
        , GradeLevelDescriptorHashKey uniqueIdentifier NOT NULL
        , PopulationServedDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT InterventionStudyInterventionEffectiveness_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , DiagnosisDescriptorHashKey
            , GradeLevelDescriptorHashKey
            , PopulationServedDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.InterventionStudyInterventionEffectiveness_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , DiagnosisDescriptorHashKey uniqueIdentifier NOT NULL
            , GradeLevelDescriptorHashKey uniqueIdentifier NOT NULL
            , PopulationServedDescriptorHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            -- Attributes
            , ImprovementIndex int NULL
            -- References
            , InterventionEffectivenessRatingDescriptorHashKey uniqueIdentifier NOT NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT InterventionStudyInterventionEffectiveness_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.InterventionStudyLearningResourceMetadataURI (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        -- Contextual primary key
        , LearningResourceMetadataURI nvarchar(255) NOT NULL
        -- Constraints
        CONSTRAINT InterventionStudyLearningResourceMetadataURI_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , LearningResourceMetadataURI
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.InterventionStudyPopulationServed (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , PopulationServedDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT InterventionStudyPopulationServed_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , PopulationServedDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.InterventionStudyStateAbbreviation (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , StateAbbreviationDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT InterventionStudyStateAbbreviation_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , StateAbbreviationDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.InterventionStudyURI (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        -- Contextual primary key
        , URI nvarchar(255) NOT NULL
        -- Constraints
        CONSTRAINT InterventionStudyURI_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , URI
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.LanguageDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        LanguageDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT LanguageDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.LanguageInstructionProgramServiceDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        LanguageInstructionProgramServiceDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT LanguageInstructionProgramServiceDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.LanguageUseDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        LanguageUseDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT LanguageUseDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.LearningObjective (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        -- Primary key columns
        LearningObjectiveId nvarchar(60) NOT NULL,
        Namespace nvarchar(255) NOT NULL,
        -- Constraints
        CONSTRAINT LearningObjective_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.LearningObjective_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , Description nvarchar(1024) NULL
            , Nomenclature nvarchar(35) NULL
            , Objective nvarchar(60) NOT NULL
            , SuccessCriteria nvarchar(150) NULL
            -- References
            , ParentLearningObjectiveHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT LearningObjective_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.LearningObjectiveAcademicSubject (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , AcademicSubjectDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT LearningObjectiveAcademicSubject_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , AcademicSubjectDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.LearningObjectiveContentStandard (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        -- Contextual primary key
        -- Constraints
        CONSTRAINT LearningObjectiveContentStandard_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.LearningObjectiveContentStandard_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            -- Contextual primary key
            -- Attributes
            , BeginDate date NULL
            , EndDate date NULL
            , PublicationDate date NULL
            , PublicationYear smallint NULL
            , Title nvarchar(75) NOT NULL
            , URI nvarchar(255) NULL
            , Version nvarchar(50) NULL
            -- References
            , MandatingEducationOrganizationHashKey uniqueIdentifier NULL
            , PublicationStatusDescriptorHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT LearningObjectiveContentStandard_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.LearningObjectiveContentStandardAuthor (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        -- Contextual primary key
        , Author nvarchar(100) NOT NULL
        -- Constraints
        CONSTRAINT LearningObjectiveContentStandardAuthor_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , Author
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.LearningObjectiveGradeLevel (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , GradeLevelDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT LearningObjectiveGradeLevel_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , GradeLevelDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.LearningObjectiveLearningStandard (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , LearningStandardHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT LearningObjectiveLearningStandard_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , LearningStandardHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.LearningStandard (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        -- Primary key columns
        LearningStandardId nvarchar(60) NOT NULL,
        -- Constraints
        CONSTRAINT LearningStandard_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.LearningStandard_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , CourseTitle nvarchar(60) NULL
            , Description nvarchar(1024) NOT NULL
            , LearningStandardItemCode nvarchar(60) NULL
            , Namespace nvarchar(255) NOT NULL
            , SuccessCriteria nvarchar(150) NULL
            , URI nvarchar(255) NULL
            -- References
            , ParentLearningStandardHashKey uniqueIdentifier NULL
            , LearningStandardCategoryDescriptorHashKey uniqueIdentifier NULL
            , LearningStandardScopeDescriptorHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT LearningStandard_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.LearningStandardAcademicSubject (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , AcademicSubjectDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT LearningStandardAcademicSubject_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , AcademicSubjectDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.LearningStandardContentStandard (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        -- Contextual primary key
        -- Constraints
        CONSTRAINT LearningStandardContentStandard_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.LearningStandardContentStandard_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            -- Contextual primary key
            -- Attributes
            , BeginDate date NULL
            , EndDate date NULL
            , PublicationDate date NULL
            , PublicationYear smallint NULL
            , Title nvarchar(75) NOT NULL
            , URI nvarchar(255) NULL
            , Version nvarchar(50) NULL
            -- References
            , MandatingEducationOrganizationHashKey uniqueIdentifier NULL
            , PublicationStatusDescriptorHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT LearningStandardContentStandard_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.LearningStandardContentStandardAuthor (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        -- Contextual primary key
        , Author nvarchar(100) NOT NULL
        -- Constraints
        CONSTRAINT LearningStandardContentStandardAuthor_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , Author
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.LearningStandardGradeLevel (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , GradeLevelDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT LearningStandardGradeLevel_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , GradeLevelDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.LearningStandardIdentificationCode (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        -- Contextual primary key
        , ContentStandardName nvarchar(65) NOT NULL
        , IdentificationCode nvarchar(60) NOT NULL
        -- Constraints
        CONSTRAINT LearningStandardIdentificationCode_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , ContentStandardName
            , IdentificationCode
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.LearningStandardPrerequisiteLearningStandard (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        -- Contextual primary key
        -- Constraints
        CONSTRAINT LearningStandardPrerequisiteLearningStandard_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.LearningStandardCategoryDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        LearningStandardCategoryDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT LearningStandardCategoryDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.LearningStandardEquivalenceAssociation (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        SourceLearningStandardHashKey uniqueIdentifier NOT NULL,
        TargetLearningStandardHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        Namespace nvarchar(255) NOT NULL,
        SourceLearningStandardId nvarchar(60) NOT NULL,
        TargetLearningStandardId nvarchar(60) NOT NULL,
        -- Constraints
        CONSTRAINT LearningStandardEquivalenceAssociation_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.LearningStandardEquivalenceAssociation_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , EffectiveDate date NULL
            , LearningStandardEquivalenceStrengthDescription nvarchar(255) NULL
            -- References
            , LearningStandardEquivalenceStrengthDescriptorHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT LearningStandardEquivalenceAssociation_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.LearningStandardEquivalenceStrengthDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        LearningStandardEquivalenceStrengthDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT LearningStandardEquivalenceStrengthDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.LearningStandardScopeDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        LearningStandardScopeDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT LearningStandardScopeDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.LevelOfEducationDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        LevelOfEducationDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT LevelOfEducationDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.LicenseStatusDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        LicenseStatusDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT LicenseStatusDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.LicenseTypeDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        LicenseTypeDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT LicenseTypeDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.LimitedEnglishProficiencyDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        LimitedEnglishProficiencyDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT LimitedEnglishProficiencyDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.LocaleDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        LocaleDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT LocaleDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.LocalEducationAgency (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        EducationOrganizationHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        LocalEducationAgencyId int NOT NULL,
        -- Constraints
        CONSTRAINT LocalEducationAgency_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.LocalEducationAgency_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- References
            , ParentLocalEducationAgencyHashKey uniqueIdentifier NULL
            , CharterStatusDescriptorHashKey uniqueIdentifier NULL
            , EducationServiceCenterHashKey uniqueIdentifier NULL
            , LocalEducationAgencyCategoryDescriptorHashKey uniqueIdentifier NOT NULL
            , StateEducationAgencyHashKey uniqueIdentifier NULL
            -- Boilerplate
            -- Constraints
            , CONSTRAINT LocalEducationAgency_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.LocalEducationAgencyAccountability (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , SchoolYearTypeHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT LocalEducationAgencyAccountability_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , SchoolYearTypeHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.LocalEducationAgencyAccountability_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , SchoolYearTypeHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            -- References
            , GunFreeSchoolsActReportingStatusDescriptorHashKey uniqueIdentifier NULL
            , SchoolChoiceImplementStatusDescriptorHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT LocalEducationAgencyAccountability_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.LocalEducationAgencyFederalFunds (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        -- Contextual primary key
        , FiscalYear int NOT NULL
        -- Constraints
        CONSTRAINT LocalEducationAgencyFederalFunds_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , FiscalYear
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.LocalEducationAgencyFederalFunds_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            -- Contextual primary key
            , FiscalYear int NOT NULL
            -- Attributes
            , InnovativeDollarsSpent money NULL
            , InnovativeDollarsSpentStrategicPriorities money NULL
            , InnovativeProgramsFundsReceived money NULL
            , SchoolImprovementAllocation money NULL
            , SchoolImprovementReservedFundsPercentage decimal(5,4) NULL
            , StateAssessmentAdministrationFunding decimal(5,4) NULL
            , SupplementalEducationalServicesFundsSpent money NULL
            , SupplementalEducationalServicesPerPupilExpenditure money NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT LocalEducationAgencyFederalFunds_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
                , FiscalYear ASC -- Contextual PK column
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.LocalEducationAgencyCategoryDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        LocalEducationAgencyCategoryDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT LocalEducationAgencyCategoryDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.Location (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        SchoolHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        ClassroomIdentificationCode nvarchar(60) NOT NULL,
        SchoolId int NOT NULL,
        -- Constraints
        CONSTRAINT Location_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.Location_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , MaximumNumberOfSeats int NULL
            , OptimalNumberOfSeats int NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT Location_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.MagnetSpecialProgramEmphasisSchoolDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        MagnetSpecialProgramEmphasisSchoolDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT MagnetSpecialProgramEmphasisSchoolDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.MediumOfInstructionDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        MediumOfInstructionDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT MediumOfInstructionDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.MethodCreditEarnedDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        MethodCreditEarnedDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT MethodCreditEarnedDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.MigrantEducationProgramServiceDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        MigrantEducationProgramServiceDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT MigrantEducationProgramServiceDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.MonitoredDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        MonitoredDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT MonitoredDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.NeglectedOrDelinquentProgramDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        NeglectedOrDelinquentProgramDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT NeglectedOrDelinquentProgramDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.NeglectedOrDelinquentProgramServiceDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        NeglectedOrDelinquentProgramServiceDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT NeglectedOrDelinquentProgramServiceDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.NetworkPurposeDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        NetworkPurposeDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT NetworkPurposeDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.ObjectiveAssessment (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        AssessmentHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        AssessmentIdentifier nvarchar(60) NOT NULL,
        IdentificationCode nvarchar(60) NOT NULL,
        Namespace nvarchar(255) NOT NULL,
        -- Constraints
        CONSTRAINT ObjectiveAssessment_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.ObjectiveAssessment_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , Description nvarchar(1024) NULL
            , MaxRawScore decimal(15,5) NULL
            , Nomenclature nvarchar(35) NULL
            , PercentOfAssessment decimal(5,4) NULL
            -- References
            , ParentObjectiveAssessmentHashKey uniqueIdentifier NULL
            , AcademicSubjectDescriptorHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT ObjectiveAssessment_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.ObjectiveAssessmentAssessmentItem (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , AssessmentItemHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT ObjectiveAssessmentAssessmentItem_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , AssessmentItemHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.ObjectiveAssessmentLearningObjective (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , LearningObjectiveHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT ObjectiveAssessmentLearningObjective_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , LearningObjectiveHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.ObjectiveAssessmentLearningStandard (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , LearningStandardHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT ObjectiveAssessmentLearningStandard_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , LearningStandardHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.ObjectiveAssessmentPerformanceLevel (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , AssessmentReportingMethodDescriptorHashKey uniqueIdentifier NOT NULL
        , PerformanceLevelDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT ObjectiveAssessmentPerformanceLevel_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , AssessmentReportingMethodDescriptorHashKey
            , PerformanceLevelDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.ObjectiveAssessmentPerformanceLevel_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , AssessmentReportingMethodDescriptorHashKey uniqueIdentifier NOT NULL
            , PerformanceLevelDescriptorHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            -- Attributes
            , MaximumScore nvarchar(35) NULL
            , MinimumScore nvarchar(35) NULL
            -- References
            , ResultDatatypeTypeDescriptorHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT ObjectiveAssessmentPerformanceLevel_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.ObjectiveAssessmentScore (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , AssessmentReportingMethodDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT ObjectiveAssessmentScore_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , AssessmentReportingMethodDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.ObjectiveAssessmentScore_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , AssessmentReportingMethodDescriptorHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            -- Attributes
            , MaximumScore nvarchar(35) NULL
            , MinimumScore nvarchar(35) NULL
            -- References
            , ResultDatatypeTypeDescriptorHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT ObjectiveAssessmentScore_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.OldEthnicityDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        OldEthnicityDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT OldEthnicityDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.OpenStaffPosition (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        EducationOrganizationHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        EducationOrganizationId int NOT NULL,
        RequisitionNumber nvarchar(20) NOT NULL,
        -- Constraints
        CONSTRAINT OpenStaffPosition_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.OpenStaffPosition_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , DatePosted date NOT NULL
            , DatePostingRemoved date NULL
            , PositionTitle nvarchar(100) NULL
            -- References
            , EmploymentStatusDescriptorHashKey uniqueIdentifier NOT NULL
            , PostingResultDescriptorHashKey uniqueIdentifier NULL
            , ProgramAssignmentDescriptorHashKey uniqueIdentifier NULL
            , StaffClassificationDescriptorHashKey uniqueIdentifier NOT NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT OpenStaffPosition_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.OpenStaffPositionAcademicSubject (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , AcademicSubjectDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT OpenStaffPositionAcademicSubject_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , AcademicSubjectDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.OpenStaffPositionInstructionalGradeLevel (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , GradeLevelDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT OpenStaffPositionInstructionalGradeLevel_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , GradeLevelDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.OperationalStatusDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        OperationalStatusDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT OperationalStatusDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.OtherNameTypeDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        OtherNameTypeDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT OtherNameTypeDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.Parent (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        -- Primary key columns
        ParentUSI int NOT NULL,
        -- Constraints
        CONSTRAINT Parent_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.Parent_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , FirstName nvarchar(75) NOT NULL
            , GenerationCodeSuffix nvarchar(10) NULL
            , LastSurname nvarchar(75) NOT NULL
            , LoginId nvarchar(60) NULL
            , MaidenName nvarchar(75) NULL
            , MiddleName nvarchar(75) NULL
            , ParentUniqueId nvarchar(32) NOT NULL
            , PersonalTitlePrefix nvarchar(30) NULL
            -- References
            , PersonHashKey uniqueIdentifier NULL
            , SexDescriptorHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT Parent_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.ParentAddress (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , AddressTypeDescriptorHashKey uniqueIdentifier NOT NULL
        , StateAbbreviationDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        , City nvarchar(30) NOT NULL
        , PostalCode nvarchar(17) NOT NULL
        , StreetNumberName nvarchar(150) NOT NULL
        -- Constraints
        CONSTRAINT ParentAddress_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , AddressTypeDescriptorHashKey
            , StateAbbreviationDescriptorHashKey
            , City
            , PostalCode
            , StreetNumberName
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.ParentAddress_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , AddressTypeDescriptorHashKey uniqueIdentifier NOT NULL
            , StateAbbreviationDescriptorHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            , City nvarchar(30) NOT NULL
            , PostalCode nvarchar(17) NOT NULL
            , StreetNumberName nvarchar(150) NOT NULL
            -- Attributes
            , ApartmentRoomSuiteNumber nvarchar(50) NULL
            , BuildingSiteNumber nvarchar(20) NULL
            , CongressionalDistrict nvarchar(30) NULL
            , CountyFIPSCode nvarchar(5) NULL
            , DoNotPublishIndicator bit NULL
            , Latitude nvarchar(20) NULL
            , Longitude nvarchar(20) NULL
            , NameOfCounty nvarchar(30) NULL
            -- References
            , LocaleDescriptorHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT ParentAddress_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
                , City ASC -- Contextual PK column
                , PostalCode ASC -- Contextual PK column
                , StreetNumberName ASC -- Contextual PK column
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.ParentAddressPeriod (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        -- Contextual primary key
        , BeginDate date NOT NULL
        -- Constraints
        CONSTRAINT ParentAddressPeriod_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , BeginDate
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.ParentAddressPeriod_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            -- Contextual primary key
            , BeginDate date NOT NULL
            -- Attributes
            , EndDate date NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT ParentAddressPeriod_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
                , BeginDate ASC -- Contextual PK column
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.ParentElectronicMail (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , ElectronicMailTypeDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        , ElectronicMailAddress nvarchar(128) NOT NULL
        -- Constraints
        CONSTRAINT ParentElectronicMail_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , ElectronicMailTypeDescriptorHashKey
            , ElectronicMailAddress
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.ParentElectronicMail_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , ElectronicMailTypeDescriptorHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            , ElectronicMailAddress nvarchar(128) NOT NULL
            -- Attributes
            , DoNotPublishIndicator bit NULL
            , PrimaryEmailAddressIndicator bit NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT ParentElectronicMail_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
                , ElectronicMailAddress ASC -- Contextual PK column
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.ParentInternationalAddress (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , AddressTypeDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT ParentInternationalAddress_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , AddressTypeDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.ParentInternationalAddress_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , AddressTypeDescriptorHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            -- Attributes
            , AddressLine1 nvarchar(150) NOT NULL
            , AddressLine2 nvarchar(150) NULL
            , AddressLine3 nvarchar(150) NULL
            , AddressLine4 nvarchar(150) NULL
            , BeginDate date NULL
            , EndDate date NULL
            , Latitude nvarchar(20) NULL
            , Longitude nvarchar(20) NULL
            -- References
            , CountryDescriptorHashKey uniqueIdentifier NOT NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT ParentInternationalAddress_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.ParentLanguage (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , LanguageDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT ParentLanguage_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , LanguageDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.ParentLanguageUse (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , LanguageUseDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT ParentLanguageUse_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , LanguageUseDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.ParentOtherName (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , OtherNameTypeDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT ParentOtherName_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , OtherNameTypeDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.ParentOtherName_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , OtherNameTypeDescriptorHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            -- Attributes
            , FirstName nvarchar(75) NOT NULL
            , GenerationCodeSuffix nvarchar(10) NULL
            , LastSurname nvarchar(75) NOT NULL
            , MiddleName nvarchar(75) NULL
            , PersonalTitlePrefix nvarchar(30) NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT ParentOtherName_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.ParentPersonalIdentificationDocument (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , IdentificationDocumentUseDescriptorHashKey uniqueIdentifier NOT NULL
        , PersonalInformationVerificationDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT ParentPersonalIdentificationDocument_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , IdentificationDocumentUseDescriptorHashKey
            , PersonalInformationVerificationDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.ParentPersonalIdentificationDocument_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , IdentificationDocumentUseDescriptorHashKey uniqueIdentifier NOT NULL
            , PersonalInformationVerificationDescriptorHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            -- Attributes
            , DocumentExpirationDate date NULL
            , DocumentTitle nvarchar(60) NULL
            , IssuerDocumentIdentificationCode nvarchar(60) NULL
            , IssuerName nvarchar(150) NULL
            -- References
            , IssuerCountryDescriptorHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT ParentPersonalIdentificationDocument_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.ParentTelephone (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , TelephoneNumberTypeDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        , TelephoneNumber nvarchar(24) NOT NULL
        -- Constraints
        CONSTRAINT ParentTelephone_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , TelephoneNumberTypeDescriptorHashKey
            , TelephoneNumber
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.ParentTelephone_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , TelephoneNumberTypeDescriptorHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            , TelephoneNumber nvarchar(24) NOT NULL
            -- Attributes
            , DoNotPublishIndicator bit NULL
            , OrderOfPriority int NULL
            , TextMessageCapabilityIndicator bit NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT ParentTelephone_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
                , TelephoneNumber ASC -- Contextual PK column
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.ParticipationDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        ParticipationDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT ParticipationDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.ParticipationStatusDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        ParticipationStatusDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT ParticipationStatusDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.Payroll (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        AccountHashKey uniqueIdentifier NOT NULL,
        StaffHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        AccountIdentifier nvarchar(50) NOT NULL,
        AsOfDate date NOT NULL,
        EducationOrganizationId int NOT NULL,
        FiscalYear int NOT NULL,
        StaffUSI int NOT NULL,
        -- Constraints
        CONSTRAINT Payroll_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.Payroll_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , AmountToDate money NOT NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT Payroll_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.PerformanceBaseConversionDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        PerformanceBaseConversionDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT PerformanceBaseConversionDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.PerformanceLevelDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        PerformanceLevelDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT PerformanceLevelDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.Person (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        SourceSystemDescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        PersonId nvarchar(32) NOT NULL,
        SourceSystemDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT Person_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.PersonalInformationVerificationDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        PersonalInformationVerificationDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT PersonalInformationVerificationDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.PlatformTypeDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        PlatformTypeDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT PlatformTypeDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.PopulationServedDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        PopulationServedDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT PopulationServedDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.PostingResultDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        PostingResultDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT PostingResultDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.PostSecondaryEvent (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        PostSecondaryEventCategoryDescriptorHashKey uniqueIdentifier NOT NULL,
        StudentHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        EventDate date NOT NULL,
        PostSecondaryEventCategoryDescriptorId int NOT NULL,
        StudentUSI int NOT NULL,
        -- Constraints
        CONSTRAINT PostSecondaryEvent_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.PostSecondaryEvent_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- References
            , PostSecondaryInstitutionHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT PostSecondaryEvent_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.PostSecondaryEventCategoryDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        PostSecondaryEventCategoryDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT PostSecondaryEventCategoryDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.PostSecondaryInstitution (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        EducationOrganizationHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        PostSecondaryInstitutionId int NOT NULL,
        -- Constraints
        CONSTRAINT PostSecondaryInstitution_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.PostSecondaryInstitution_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- References
            , AdministrativeFundingControlDescriptorHashKey uniqueIdentifier NULL
            , PostSecondaryInstitutionLevelDescriptorHashKey uniqueIdentifier NULL
            -- Boilerplate
            -- Constraints
            , CONSTRAINT PostSecondaryInstitution_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.PostSecondaryInstitutionMediumOfInstruction (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , MediumOfInstructionDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT PostSecondaryInstitutionMediumOfInstruction_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , MediumOfInstructionDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.PostSecondaryInstitutionLevelDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        PostSecondaryInstitutionLevelDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT PostSecondaryInstitutionLevelDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.ProficiencyDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        ProficiencyDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT ProficiencyDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.Program (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        EducationOrganizationHashKey uniqueIdentifier NOT NULL,
        ProgramTypeDescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        EducationOrganizationId int NOT NULL,
        ProgramName nvarchar(60) NOT NULL,
        ProgramTypeDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT Program_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.Program_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , ProgramId nvarchar(20) NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT Program_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.ProgramCharacteristic (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , ProgramCharacteristicDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT ProgramCharacteristic_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , ProgramCharacteristicDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.ProgramLearningObjective (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , LearningObjectiveHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT ProgramLearningObjective_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , LearningObjectiveHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.ProgramLearningStandard (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , LearningStandardHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT ProgramLearningStandard_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , LearningStandardHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.ProgramService (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , ServiceDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT ProgramService_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , ServiceDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.ProgramSponsor (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , ProgramSponsorDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT ProgramSponsor_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , ProgramSponsorDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.ProgramAssignmentDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        ProgramAssignmentDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT ProgramAssignmentDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.ProgramCharacteristicDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        ProgramCharacteristicDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT ProgramCharacteristicDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.ProgramSponsorDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        ProgramSponsorDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT ProgramSponsorDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.ProgramTypeDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        ProgramTypeDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT ProgramTypeDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.ProgressDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        ProgressDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT ProgressDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.ProgressLevelDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        ProgressLevelDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT ProgressLevelDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.ProviderCategoryDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        ProviderCategoryDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT ProviderCategoryDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.ProviderProfitabilityDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        ProviderProfitabilityDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT ProviderProfitabilityDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.ProviderStatusDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        ProviderStatusDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT ProviderStatusDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.PublicationStatusDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        PublicationStatusDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT PublicationStatusDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.QuestionFormDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        QuestionFormDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT QuestionFormDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.RaceDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        RaceDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT RaceDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.ReasonExitedDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        ReasonExitedDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT ReasonExitedDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.ReasonNotTestedDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        ReasonNotTestedDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT ReasonNotTestedDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.RecognitionTypeDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        RecognitionTypeDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT RecognitionTypeDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.RelationDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        RelationDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT RelationDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.RepeatIdentifierDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        RepeatIdentifierDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT RepeatIdentifierDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.ReportCard (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        EducationOrganizationHashKey uniqueIdentifier NOT NULL,
        GradingPeriodHashKey uniqueIdentifier NOT NULL,
        StudentHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        EducationOrganizationId int NOT NULL,
        GradingPeriodDescriptorId int NOT NULL,
        GradingPeriodSchoolId int NOT NULL,
        GradingPeriodSchoolYear smallint NOT NULL,
        GradingPeriodSequence int NOT NULL,
        StudentUSI int NOT NULL,
        -- Constraints
        CONSTRAINT ReportCard_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.ReportCard_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , GPACumulative decimal(18,4) NULL
            , GPAGivenGradingPeriod decimal(18,4) NULL
            , NumberOfDaysAbsent decimal(18,4) NULL
            , NumberOfDaysInAttendance decimal(18,4) NULL
            , NumberOfDaysTardy int NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT ReportCard_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.ReportCardGrade (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , GradeHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT ReportCardGrade_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , GradeHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.ReportCardGradePointAverage (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , GradePointAverageTypeDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT ReportCardGradePointAverage_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , GradePointAverageTypeDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.ReportCardGradePointAverage_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , GradePointAverageTypeDescriptorHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            -- Attributes
            , GradePointAverageValue decimal(18,4) NOT NULL
            , IsCumulative bit NULL
            , MaxGradePointAverageValue decimal(18,4) NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT ReportCardGradePointAverage_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.ReportCardStudentCompetencyObjective (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , StudentCompetencyObjectiveHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT ReportCardStudentCompetencyObjective_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , StudentCompetencyObjectiveHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.ReportCardStudentLearningObjective (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , StudentLearningObjectiveHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT ReportCardStudentLearningObjective_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , StudentLearningObjectiveHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.ReporterDescriptionDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        ReporterDescriptionDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT ReporterDescriptionDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.ResidencyStatusDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        ResidencyStatusDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT ResidencyStatusDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.ResponseIndicatorDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        ResponseIndicatorDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT ResponseIndicatorDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.ResponsibilityDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        ResponsibilityDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT ResponsibilityDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.RestraintEvent (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        SchoolHashKey uniqueIdentifier NOT NULL,
        StudentHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        RestraintEventIdentifier nvarchar(20) NOT NULL,
        SchoolId int NOT NULL,
        StudentUSI int NOT NULL,
        -- Constraints
        CONSTRAINT RestraintEvent_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.RestraintEvent_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , EventDate date NOT NULL
            -- References
            , EducationalEnvironmentDescriptorHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT RestraintEvent_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.RestraintEventProgram (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , ProgramHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT RestraintEventProgram_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , ProgramHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.RestraintEventReason (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , RestraintEventReasonDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT RestraintEventReason_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , RestraintEventReasonDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.RestraintEventReasonDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        RestraintEventReasonDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT RestraintEventReasonDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.ResultDatatypeTypeDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        ResultDatatypeTypeDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT ResultDatatypeTypeDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.RetestIndicatorDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        RetestIndicatorDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT RetestIndicatorDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.School (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        EducationOrganizationHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        SchoolId int NOT NULL,
        -- Constraints
        CONSTRAINT School_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.School_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- References
            , AdministrativeFundingControlDescriptorHashKey uniqueIdentifier NULL
            , CharterApprovalAgencyTypeDescriptorHashKey uniqueIdentifier NULL
            , CharterStatusDescriptorHashKey uniqueIdentifier NULL
            , InternetAccessDescriptorHashKey uniqueIdentifier NULL
            , LocalEducationAgencyHashKey uniqueIdentifier NULL
            , MagnetSpecialProgramEmphasisSchoolDescriptorHashKey uniqueIdentifier NULL
            , SchoolTypeDescriptorHashKey uniqueIdentifier NULL
            , CharterApprovalSchoolYearTypeHashKey uniqueIdentifier NULL
            , TitleIPartASchoolDesignationDescriptorHashKey uniqueIdentifier NULL
            -- Boilerplate
            -- Constraints
            , CONSTRAINT School_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.SchoolCategory (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , SchoolCategoryDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT SchoolCategory_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , SchoolCategoryDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.SchoolGradeLevel (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , GradeLevelDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT SchoolGradeLevel_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , GradeLevelDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.SchoolCategoryDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        SchoolCategoryDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT SchoolCategoryDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.SchoolChoiceImplementStatusDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        SchoolChoiceImplementStatusDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT SchoolChoiceImplementStatusDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.SchoolFoodServiceProgramServiceDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        SchoolFoodServiceProgramServiceDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT SchoolFoodServiceProgramServiceDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.SchoolTypeDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        SchoolTypeDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT SchoolTypeDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.SchoolYearType (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        -- Primary key columns
        SchoolYear smallint NOT NULL,
        -- Constraints
        CONSTRAINT SchoolYearType_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.SchoolYearType_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , CurrentSchoolYear bit NOT NULL
            , SchoolYearDescription nvarchar(50) NOT NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT SchoolYearType_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.Section (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        CourseOfferingHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        LocalCourseCode nvarchar(60) NOT NULL,
        SchoolId int NOT NULL,
        SchoolYear smallint NOT NULL,
        SectionIdentifier nvarchar(255) NOT NULL,
        SessionName nvarchar(60) NOT NULL,
        -- Constraints
        CONSTRAINT Section_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.Section_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , AvailableCreditConversion decimal(9,2) NULL
            , AvailableCredits decimal(9,3) NULL
            , OfficialAttendancePeriod bit NULL
            , SectionName nvarchar(100) NULL
            , SequenceOfCourse int NULL
            -- References
            , AvailableCreditTypeDescriptorHashKey uniqueIdentifier NULL
            , EducationalEnvironmentDescriptorHashKey uniqueIdentifier NULL
            , InstructionLanguageDescriptorHashKey uniqueIdentifier NULL
            , LocationHashKey uniqueIdentifier NULL
            , MediumOfInstructionDescriptorHashKey uniqueIdentifier NULL
            , PopulationServedDescriptorHashKey uniqueIdentifier NULL
            , LocationSchoolHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT Section_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.SectionCharacteristic (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , SectionCharacteristicDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT SectionCharacteristic_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , SectionCharacteristicDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.SectionClassPeriod (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , ClassPeriodHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT SectionClassPeriod_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , ClassPeriodHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.SectionCourseLevelCharacteristic (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , CourseLevelCharacteristicDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT SectionCourseLevelCharacteristic_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , CourseLevelCharacteristicDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.SectionOfferedGradeLevel (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , GradeLevelDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT SectionOfferedGradeLevel_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , GradeLevelDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.SectionProgram (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , ProgramHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT SectionProgram_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , ProgramHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.SectionAttendanceTakenEvent (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        CalendarDateHashKey uniqueIdentifier NOT NULL,
        SectionHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        CalendarCode nvarchar(60) NOT NULL,
        Date date NOT NULL,
        LocalCourseCode nvarchar(60) NOT NULL,
        SchoolId int NOT NULL,
        SchoolYear smallint NOT NULL,
        SectionIdentifier nvarchar(255) NOT NULL,
        SessionName nvarchar(60) NOT NULL,
        -- Constraints
        CONSTRAINT SectionAttendanceTakenEvent_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.SectionAttendanceTakenEvent_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , EventDate date NOT NULL
            -- References
            , StaffHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT SectionAttendanceTakenEvent_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.SectionCharacteristicDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        SectionCharacteristicDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT SectionCharacteristicDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.SeparationDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        SeparationDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT SeparationDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.SeparationReasonDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        SeparationReasonDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT SeparationReasonDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.ServiceDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        ServiceDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT ServiceDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.Session (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        SchoolHashKey uniqueIdentifier NOT NULL,
        SchoolYearTypeHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        SchoolId int NOT NULL,
        SchoolYear smallint NOT NULL,
        SessionName nvarchar(60) NOT NULL,
        -- Constraints
        CONSTRAINT Session_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.Session_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , BeginDate date NOT NULL
            , EndDate date NOT NULL
            , TotalInstructionalDays int NOT NULL
            -- References
            , TermDescriptorHashKey uniqueIdentifier NOT NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT Session_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.SessionAcademicWeek (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , AcademicWeekHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT SessionAcademicWeek_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , AcademicWeekHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.SessionGradingPeriod (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , GradingPeriodHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT SessionGradingPeriod_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , GradingPeriodHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.SexDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        SexDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT SexDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.SourceSystemDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        SourceSystemDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT SourceSystemDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.SpecialEducationProgramServiceDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        SpecialEducationProgramServiceDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT SpecialEducationProgramServiceDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.SpecialEducationSettingDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        SpecialEducationSettingDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT SpecialEducationSettingDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.Staff (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        -- Primary key columns
        StaffUSI int NOT NULL,
        -- Constraints
        CONSTRAINT Staff_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.Staff_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , BirthDate date NULL
            , FirstName nvarchar(75) NOT NULL
            , GenerationCodeSuffix nvarchar(10) NULL
            , HighlyQualifiedTeacher bit NULL
            , HispanicLatinoEthnicity bit NULL
            , LastSurname nvarchar(75) NOT NULL
            , LoginId nvarchar(60) NULL
            , MaidenName nvarchar(75) NULL
            , MiddleName nvarchar(75) NULL
            , PersonalTitlePrefix nvarchar(30) NULL
            , StaffUniqueId nvarchar(32) NOT NULL
            , YearsOfPriorProfessionalExperience decimal(5,2) NULL
            , YearsOfPriorTeachingExperience decimal(5,2) NULL
            -- References
            , CitizenshipStatusDescriptorHashKey uniqueIdentifier NULL
            , HighestCompletedLevelOfEducationDescriptorHashKey uniqueIdentifier NULL
            , OldEthnicityDescriptorHashKey uniqueIdentifier NULL
            , PersonHashKey uniqueIdentifier NULL
            , SexDescriptorHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT Staff_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.StaffAddress (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , AddressTypeDescriptorHashKey uniqueIdentifier NOT NULL
        , StateAbbreviationDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        , City nvarchar(30) NOT NULL
        , PostalCode nvarchar(17) NOT NULL
        , StreetNumberName nvarchar(150) NOT NULL
        -- Constraints
        CONSTRAINT StaffAddress_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , AddressTypeDescriptorHashKey
            , StateAbbreviationDescriptorHashKey
            , City
            , PostalCode
            , StreetNumberName
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StaffAddress_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , AddressTypeDescriptorHashKey uniqueIdentifier NOT NULL
            , StateAbbreviationDescriptorHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            , City nvarchar(30) NOT NULL
            , PostalCode nvarchar(17) NOT NULL
            , StreetNumberName nvarchar(150) NOT NULL
            -- Attributes
            , ApartmentRoomSuiteNumber nvarchar(50) NULL
            , BuildingSiteNumber nvarchar(20) NULL
            , CongressionalDistrict nvarchar(30) NULL
            , CountyFIPSCode nvarchar(5) NULL
            , DoNotPublishIndicator bit NULL
            , Latitude nvarchar(20) NULL
            , Longitude nvarchar(20) NULL
            , NameOfCounty nvarchar(30) NULL
            -- References
            , LocaleDescriptorHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StaffAddress_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
                , City ASC -- Contextual PK column
                , PostalCode ASC -- Contextual PK column
                , StreetNumberName ASC -- Contextual PK column
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.StaffAddressPeriod (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        -- Contextual primary key
        , BeginDate date NOT NULL
        -- Constraints
        CONSTRAINT StaffAddressPeriod_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , BeginDate
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StaffAddressPeriod_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            -- Contextual primary key
            , BeginDate date NOT NULL
            -- Attributes
            , EndDate date NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StaffAddressPeriod_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
                , BeginDate ASC -- Contextual PK column
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.StaffCredential (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , CredentialHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT StaffCredential_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , CredentialHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StaffElectronicMail (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , ElectronicMailTypeDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        , ElectronicMailAddress nvarchar(128) NOT NULL
        -- Constraints
        CONSTRAINT StaffElectronicMail_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , ElectronicMailTypeDescriptorHashKey
            , ElectronicMailAddress
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StaffElectronicMail_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , ElectronicMailTypeDescriptorHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            , ElectronicMailAddress nvarchar(128) NOT NULL
            -- Attributes
            , DoNotPublishIndicator bit NULL
            , PrimaryEmailAddressIndicator bit NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StaffElectronicMail_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
                , ElectronicMailAddress ASC -- Contextual PK column
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.StaffIdentificationCode (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , StaffIdentificationSystemDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT StaffIdentificationCode_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , StaffIdentificationSystemDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StaffIdentificationCode_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , StaffIdentificationSystemDescriptorHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            -- Attributes
            , AssigningOrganizationIdentificationCode nvarchar(60) NULL
            , IdentificationCode nvarchar(60) NOT NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StaffIdentificationCode_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.StaffIdentificationDocument (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , IdentificationDocumentUseDescriptorHashKey uniqueIdentifier NOT NULL
        , PersonalInformationVerificationDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT StaffIdentificationDocument_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , IdentificationDocumentUseDescriptorHashKey
            , PersonalInformationVerificationDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StaffIdentificationDocument_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , IdentificationDocumentUseDescriptorHashKey uniqueIdentifier NOT NULL
            , PersonalInformationVerificationDescriptorHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            -- Attributes
            , DocumentExpirationDate date NULL
            , DocumentTitle nvarchar(60) NULL
            , IssuerDocumentIdentificationCode nvarchar(60) NULL
            , IssuerName nvarchar(150) NULL
            -- References
            , IssuerCountryDescriptorHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StaffIdentificationDocument_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.StaffInternationalAddress (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , AddressTypeDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT StaffInternationalAddress_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , AddressTypeDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StaffInternationalAddress_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , AddressTypeDescriptorHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            -- Attributes
            , AddressLine1 nvarchar(150) NOT NULL
            , AddressLine2 nvarchar(150) NULL
            , AddressLine3 nvarchar(150) NULL
            , AddressLine4 nvarchar(150) NULL
            , BeginDate date NULL
            , EndDate date NULL
            , Latitude nvarchar(20) NULL
            , Longitude nvarchar(20) NULL
            -- References
            , CountryDescriptorHashKey uniqueIdentifier NOT NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StaffInternationalAddress_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.StaffLanguage (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , LanguageDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT StaffLanguage_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , LanguageDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StaffLanguageUse (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , LanguageUseDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT StaffLanguageUse_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , LanguageUseDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StaffOtherName (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , OtherNameTypeDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT StaffOtherName_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , OtherNameTypeDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StaffOtherName_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , OtherNameTypeDescriptorHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            -- Attributes
            , FirstName nvarchar(75) NOT NULL
            , GenerationCodeSuffix nvarchar(10) NULL
            , LastSurname nvarchar(75) NOT NULL
            , MiddleName nvarchar(75) NULL
            , PersonalTitlePrefix nvarchar(30) NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StaffOtherName_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.StaffPersonalIdentificationDocument (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , IdentificationDocumentUseDescriptorHashKey uniqueIdentifier NOT NULL
        , PersonalInformationVerificationDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT StaffPersonalIdentificationDocument_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , IdentificationDocumentUseDescriptorHashKey
            , PersonalInformationVerificationDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StaffPersonalIdentificationDocument_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , IdentificationDocumentUseDescriptorHashKey uniqueIdentifier NOT NULL
            , PersonalInformationVerificationDescriptorHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            -- Attributes
            , DocumentExpirationDate date NULL
            , DocumentTitle nvarchar(60) NULL
            , IssuerDocumentIdentificationCode nvarchar(60) NULL
            , IssuerName nvarchar(150) NULL
            -- References
            , IssuerCountryDescriptorHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StaffPersonalIdentificationDocument_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.StaffRace (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , RaceDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT StaffRace_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , RaceDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StaffRecognition (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , RecognitionTypeDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT StaffRecognition_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , RecognitionTypeDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StaffRecognition_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , RecognitionTypeDescriptorHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            -- Attributes
            , AchievementCategorySystem nvarchar(60) NULL
            , AchievementTitle nvarchar(60) NULL
            , Criteria nvarchar(150) NULL
            , CriteriaURL nvarchar(255) NULL
            , EvidenceStatement nvarchar(150) NULL
            , ImageURL nvarchar(255) NULL
            , IssuerName nvarchar(150) NULL
            , IssuerOriginURL nvarchar(255) NULL
            , RecognitionAwardDate date NULL
            , RecognitionAwardExpiresDate date NULL
            , RecognitionDescription nvarchar(80) NULL
            -- References
            , AchievementCategoryDescriptorHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StaffRecognition_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.StaffTelephone (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , TelephoneNumberTypeDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        , TelephoneNumber nvarchar(24) NOT NULL
        -- Constraints
        CONSTRAINT StaffTelephone_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , TelephoneNumberTypeDescriptorHashKey
            , TelephoneNumber
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StaffTelephone_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , TelephoneNumberTypeDescriptorHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            , TelephoneNumber nvarchar(24) NOT NULL
            -- Attributes
            , DoNotPublishIndicator bit NULL
            , OrderOfPriority int NULL
            , TextMessageCapabilityIndicator bit NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StaffTelephone_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
                , TelephoneNumber ASC -- Contextual PK column
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.StaffTribalAffiliation (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , TribalAffiliationDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT StaffTribalAffiliation_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , TribalAffiliationDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StaffVisa (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , VisaDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT StaffVisa_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , VisaDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StaffAbsenceEvent (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        AbsenceEventCategoryDescriptorHashKey uniqueIdentifier NOT NULL,
        StaffHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        AbsenceEventCategoryDescriptorId int NOT NULL,
        EventDate date NOT NULL,
        StaffUSI int NOT NULL,
        -- Constraints
        CONSTRAINT StaffAbsenceEvent_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StaffAbsenceEvent_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , AbsenceEventReason nvarchar(40) NULL
            , HoursAbsent decimal(18,2) NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StaffAbsenceEvent_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.StaffClassificationDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        StaffClassificationDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT StaffClassificationDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.StaffCohortAssociation (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        CohortHashKey uniqueIdentifier NOT NULL,
        StaffHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        BeginDate date NOT NULL,
        CohortIdentifier nvarchar(20) NOT NULL,
        EducationOrganizationId int NOT NULL,
        StaffUSI int NOT NULL,
        -- Constraints
        CONSTRAINT StaffCohortAssociation_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StaffCohortAssociation_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , EndDate date NULL
            , StudentRecordAccess bit NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StaffCohortAssociation_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.StaffDisciplineIncidentAssociation (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DisciplineIncidentHashKey uniqueIdentifier NOT NULL,
        StaffHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        IncidentIdentifier nvarchar(20) NOT NULL,
        SchoolId int NOT NULL,
        StaffUSI int NOT NULL,
        -- Constraints
        CONSTRAINT StaffDisciplineIncidentAssociation_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.StaffDisciplineIncidentAssociationDisciplineIncidentParticipationCode (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , DisciplineIncidentParticipationCodeDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT StaffDisciplineIncidentAssociationDisciplineIncidentParticipationCode_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , DisciplineIncidentParticipationCodeDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StaffEducationOrganizationAssignmentAssociation (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        EducationOrganizationHashKey uniqueIdentifier NOT NULL,
        StaffHashKey uniqueIdentifier NOT NULL,
        StaffClassificationDescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        BeginDate date NOT NULL,
        EducationOrganizationId int NOT NULL,
        StaffClassificationDescriptorId int NOT NULL,
        StaffUSI int NOT NULL,
        -- Constraints
        CONSTRAINT StaffEducationOrganizationAssignmentAssociation_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StaffEducationOrganizationAssignmentAssociation_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , EndDate date NULL
            , OrderOfAssignment int NULL
            , PositionTitle nvarchar(100) NULL
            -- References
            , CredentialHashKey uniqueIdentifier NULL
            , EmploymentStaffEducationOrganizationEmploymentAssociationHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StaffEducationOrganizationAssignmentAssociation_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.StaffEducationOrganizationContactAssociation (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        EducationOrganizationHashKey uniqueIdentifier NOT NULL,
        StaffHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        ContactTitle nvarchar(75) NOT NULL,
        EducationOrganizationId int NOT NULL,
        StaffUSI int NOT NULL,
        -- Constraints
        CONSTRAINT StaffEducationOrganizationContactAssociation_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StaffEducationOrganizationContactAssociation_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , ElectronicMailAddress nvarchar(128) NOT NULL
            -- References
            , ContactTypeDescriptorHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StaffEducationOrganizationContactAssociation_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.StaffEducationOrganizationContactAssociationAddress (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        -- Contextual primary key
        -- Constraints
        CONSTRAINT StaffEducationOrganizationContactAssociationAddress_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StaffEducationOrganizationContactAssociationAddress_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            -- Contextual primary key
            -- Attributes
            , ApartmentRoomSuiteNumber nvarchar(50) NULL
            , BuildingSiteNumber nvarchar(20) NULL
            , City nvarchar(30) NOT NULL
            , CongressionalDistrict nvarchar(30) NULL
            , CountyFIPSCode nvarchar(5) NULL
            , DoNotPublishIndicator bit NULL
            , Latitude nvarchar(20) NULL
            , Longitude nvarchar(20) NULL
            , NameOfCounty nvarchar(30) NULL
            , PostalCode nvarchar(17) NOT NULL
            , StreetNumberName nvarchar(150) NOT NULL
            -- References
            , AddressTypeDescriptorHashKey uniqueIdentifier NOT NULL
            , LocaleDescriptorHashKey uniqueIdentifier NULL
            , StateAbbreviationDescriptorHashKey uniqueIdentifier NOT NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StaffEducationOrganizationContactAssociationAddress_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.StaffEducationOrganizationContactAssociationAddressPeriod (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        -- Contextual primary key
        , BeginDate date NOT NULL
        -- Constraints
        CONSTRAINT StaffEducationOrganizationContactAssociationAddressPeriod_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , BeginDate
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StaffEducationOrganizationContactAssociationAddressPeriod_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            -- Contextual primary key
            , BeginDate date NOT NULL
            -- Attributes
            , EndDate date NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StaffEducationOrganizationContactAssociationAddressPeriod_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
                , BeginDate ASC -- Contextual PK column
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.StaffEducationOrganizationContactAssociationTelephone (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , TelephoneNumberTypeDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        , TelephoneNumber nvarchar(24) NOT NULL
        -- Constraints
        CONSTRAINT StaffEducationOrganizationContactAssociationTelephone_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , TelephoneNumberTypeDescriptorHashKey
            , TelephoneNumber
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StaffEducationOrganizationContactAssociationTelephone_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , TelephoneNumberTypeDescriptorHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            , TelephoneNumber nvarchar(24) NOT NULL
            -- Attributes
            , DoNotPublishIndicator bit NULL
            , OrderOfPriority int NULL
            , TextMessageCapabilityIndicator bit NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StaffEducationOrganizationContactAssociationTelephone_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
                , TelephoneNumber ASC -- Contextual PK column
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.StaffEducationOrganizationEmploymentAssociation (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        EducationOrganizationHashKey uniqueIdentifier NOT NULL,
        EmploymentStatusDescriptorHashKey uniqueIdentifier NOT NULL,
        StaffHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        EducationOrganizationId int NOT NULL,
        EmploymentStatusDescriptorId int NOT NULL,
        HireDate date NOT NULL,
        StaffUSI int NOT NULL,
        -- Constraints
        CONSTRAINT StaffEducationOrganizationEmploymentAssociation_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StaffEducationOrganizationEmploymentAssociation_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , Department nvarchar(60) NULL
            , EndDate date NULL
            , FullTimeEquivalency decimal(5,4) NULL
            , HourlyWage money NULL
            , OfferDate date NULL
            -- References
            , CredentialHashKey uniqueIdentifier NULL
            , SeparationDescriptorHashKey uniqueIdentifier NULL
            , SeparationReasonDescriptorHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StaffEducationOrganizationEmploymentAssociation_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.StaffIdentificationSystemDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        StaffIdentificationSystemDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT StaffIdentificationSystemDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.StaffLeave (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        StaffHashKey uniqueIdentifier NOT NULL,
        StaffLeaveEventCategoryDescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        BeginDate date NOT NULL,
        StaffLeaveEventCategoryDescriptorId int NOT NULL,
        StaffUSI int NOT NULL,
        -- Constraints
        CONSTRAINT StaffLeave_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StaffLeave_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , EndDate date NULL
            , Reason nvarchar(40) NULL
            , SubstituteAssigned bit NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StaffLeave_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.StaffLeaveEventCategoryDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        StaffLeaveEventCategoryDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT StaffLeaveEventCategoryDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.StaffProgramAssociation (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        ProgramHashKey uniqueIdentifier NOT NULL,
        StaffHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        BeginDate date NOT NULL,
        ProgramEducationOrganizationId int NOT NULL,
        ProgramName nvarchar(60) NOT NULL,
        ProgramTypeDescriptorId int NOT NULL,
        StaffUSI int NOT NULL,
        -- Constraints
        CONSTRAINT StaffProgramAssociation_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StaffProgramAssociation_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , EndDate date NULL
            , StudentRecordAccess bit NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StaffProgramAssociation_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.StaffSchoolAssociation (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        ProgramAssignmentDescriptorHashKey uniqueIdentifier NOT NULL,
        SchoolHashKey uniqueIdentifier NOT NULL,
        StaffHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        ProgramAssignmentDescriptorId int NOT NULL,
        SchoolId int NOT NULL,
        StaffUSI int NOT NULL,
        -- Constraints
        CONSTRAINT StaffSchoolAssociation_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StaffSchoolAssociation_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- References
            , CalendarHashKey uniqueIdentifier NULL
            , SchoolYearTypeHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StaffSchoolAssociation_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.StaffSchoolAssociationAcademicSubject (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , AcademicSubjectDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT StaffSchoolAssociationAcademicSubject_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , AcademicSubjectDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StaffSchoolAssociationGradeLevel (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , GradeLevelDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT StaffSchoolAssociationGradeLevel_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , GradeLevelDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StaffSectionAssociation (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        SectionHashKey uniqueIdentifier NOT NULL,
        StaffHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        LocalCourseCode nvarchar(60) NOT NULL,
        SchoolId int NOT NULL,
        SchoolYear smallint NOT NULL,
        SectionIdentifier nvarchar(255) NOT NULL,
        SessionName nvarchar(60) NOT NULL,
        StaffUSI int NOT NULL,
        -- Constraints
        CONSTRAINT StaffSectionAssociation_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StaffSectionAssociation_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , BeginDate date NULL
            , EndDate date NULL
            , HighlyQualifiedTeacher bit NULL
            , PercentageContribution decimal(5,4) NULL
            , TeacherStudentDataLinkExclusion bit NULL
            -- References
            , ClassroomPositionDescriptorHashKey uniqueIdentifier NOT NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StaffSectionAssociation_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.StateAbbreviationDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        StateAbbreviationDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT StateAbbreviationDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.StateEducationAgency (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        EducationOrganizationHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        StateEducationAgencyId int NOT NULL,
        -- Constraints
        CONSTRAINT StateEducationAgency_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.StateEducationAgencyAccountability (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , SchoolYearTypeHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT StateEducationAgencyAccountability_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , SchoolYearTypeHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StateEducationAgencyAccountability_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , SchoolYearTypeHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            -- Attributes
            , CTEGraduationRateInclusion bit NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StateEducationAgencyAccountability_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.StateEducationAgencyFederalFunds (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        -- Contextual primary key
        , FiscalYear int NOT NULL
        -- Constraints
        CONSTRAINT StateEducationAgencyFederalFunds_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , FiscalYear
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StateEducationAgencyFederalFunds_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            -- Contextual primary key
            , FiscalYear int NOT NULL
            -- Attributes
            , FederalProgramsFundingAllocation money NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StateEducationAgencyFederalFunds_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
                , FiscalYear ASC -- Contextual PK column
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.Student (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        -- Primary key columns
        StudentUSI int NOT NULL,
        -- Constraints
        CONSTRAINT Student_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.Student_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , BirthCity nvarchar(30) NULL
            , BirthDate date NOT NULL
            , BirthInternationalProvince nvarchar(150) NULL
            , DateEnteredUS date NULL
            , FirstName nvarchar(75) NOT NULL
            , GenerationCodeSuffix nvarchar(10) NULL
            , LastSurname nvarchar(75) NOT NULL
            , MaidenName nvarchar(75) NULL
            , MiddleName nvarchar(75) NULL
            , MultipleBirthStatus bit NULL
            , PersonalTitlePrefix nvarchar(30) NULL
            , StudentUniqueId nvarchar(32) NOT NULL
            -- References
            , CitizenshipStatusDescriptorHashKey uniqueIdentifier NULL
            , BirthCountryDescriptorHashKey uniqueIdentifier NULL
            , PersonHashKey uniqueIdentifier NULL
            , BirthSexDescriptorHashKey uniqueIdentifier NULL
            , BirthStateAbbreviationDescriptorHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT Student_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.StudentIdentificationDocument (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , IdentificationDocumentUseDescriptorHashKey uniqueIdentifier NOT NULL
        , PersonalInformationVerificationDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT StudentIdentificationDocument_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , IdentificationDocumentUseDescriptorHashKey
            , PersonalInformationVerificationDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StudentIdentificationDocument_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , IdentificationDocumentUseDescriptorHashKey uniqueIdentifier NOT NULL
            , PersonalInformationVerificationDescriptorHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            -- Attributes
            , DocumentExpirationDate date NULL
            , DocumentTitle nvarchar(60) NULL
            , IssuerDocumentIdentificationCode nvarchar(60) NULL
            , IssuerName nvarchar(150) NULL
            -- References
            , IssuerCountryDescriptorHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StudentIdentificationDocument_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.StudentOtherName (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , OtherNameTypeDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT StudentOtherName_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , OtherNameTypeDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StudentOtherName_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , OtherNameTypeDescriptorHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            -- Attributes
            , FirstName nvarchar(75) NOT NULL
            , GenerationCodeSuffix nvarchar(10) NULL
            , LastSurname nvarchar(75) NOT NULL
            , MiddleName nvarchar(75) NULL
            , PersonalTitlePrefix nvarchar(30) NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StudentOtherName_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.StudentPersonalIdentificationDocument (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , IdentificationDocumentUseDescriptorHashKey uniqueIdentifier NOT NULL
        , PersonalInformationVerificationDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT StudentPersonalIdentificationDocument_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , IdentificationDocumentUseDescriptorHashKey
            , PersonalInformationVerificationDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StudentPersonalIdentificationDocument_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , IdentificationDocumentUseDescriptorHashKey uniqueIdentifier NOT NULL
            , PersonalInformationVerificationDescriptorHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            -- Attributes
            , DocumentExpirationDate date NULL
            , DocumentTitle nvarchar(60) NULL
            , IssuerDocumentIdentificationCode nvarchar(60) NULL
            , IssuerName nvarchar(150) NULL
            -- References
            , IssuerCountryDescriptorHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StudentPersonalIdentificationDocument_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.StudentVisa (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , VisaDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT StudentVisa_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , VisaDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentAcademicRecord (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        EducationOrganizationHashKey uniqueIdentifier NOT NULL,
        SchoolYearTypeHashKey uniqueIdentifier NOT NULL,
        StudentHashKey uniqueIdentifier NOT NULL,
        TermDescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        EducationOrganizationId int NOT NULL,
        SchoolYear smallint NOT NULL,
        StudentUSI int NOT NULL,
        TermDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT StudentAcademicRecord_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StudentAcademicRecord_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , CumulativeAttemptedCreditConversion decimal(9,2) NULL
            , CumulativeAttemptedCredits decimal(9,3) NULL
            , CumulativeEarnedCreditConversion decimal(9,2) NULL
            , CumulativeEarnedCredits decimal(9,3) NULL
            , CumulativeGradePointAverage decimal(18,4) NULL
            , CumulativeGradePointsEarned decimal(18,4) NULL
            , GradeValueQualifier nvarchar(80) NULL
            , ProjectedGraduationDate date NULL
            , SessionAttemptedCreditConversion decimal(9,2) NULL
            , SessionAttemptedCredits decimal(9,3) NULL
            , SessionEarnedCreditConversion decimal(9,2) NULL
            , SessionEarnedCredits decimal(9,3) NULL
            , SessionGradePointAverage decimal(18,4) NULL
            , SessionGradePointsEarned decimal(18,4) NULL
            -- References
            , CumulativeEarnedCreditTypeDescriptorHashKey uniqueIdentifier NULL
            , CumulativeAttemptedCreditTypeDescriptorHashKey uniqueIdentifier NULL
            , SessionEarnedCreditTypeDescriptorHashKey uniqueIdentifier NULL
            , SessionAttemptedCreditTypeDescriptorHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StudentAcademicRecord_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.StudentAcademicRecordAcademicHonor (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , AcademicHonorCategoryDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        , HonorDescription nvarchar(80) NOT NULL
        -- Constraints
        CONSTRAINT StudentAcademicRecordAcademicHonor_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , AcademicHonorCategoryDescriptorHashKey
            , HonorDescription
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StudentAcademicRecordAcademicHonor_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , AcademicHonorCategoryDescriptorHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            , HonorDescription nvarchar(80) NOT NULL
            -- Attributes
            , AchievementCategorySystem nvarchar(60) NULL
            , AchievementTitle nvarchar(60) NULL
            , Criteria nvarchar(150) NULL
            , CriteriaURL nvarchar(255) NULL
            , EvidenceStatement nvarchar(150) NULL
            , HonorAwardDate date NULL
            , HonorAwardExpiresDate date NULL
            , ImageURL nvarchar(255) NULL
            , IssuerName nvarchar(150) NULL
            , IssuerOriginURL nvarchar(255) NULL
            -- References
            , AchievementCategoryDescriptorHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StudentAcademicRecordAcademicHonor_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
                , HonorDescription ASC -- Contextual PK column
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.StudentAcademicRecordClassRanking (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        -- Contextual primary key
        -- Constraints
        CONSTRAINT StudentAcademicRecordClassRanking_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StudentAcademicRecordClassRanking_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            -- Contextual primary key
            -- Attributes
            , ClassRank int NOT NULL
            , ClassRankingDate date NULL
            , PercentageRanking int NULL
            , TotalNumberInClass int NOT NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StudentAcademicRecordClassRanking_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.StudentAcademicRecordDiploma (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , DiplomaTypeDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        , DiplomaAwardDate date NOT NULL
        -- Constraints
        CONSTRAINT StudentAcademicRecordDiploma_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , DiplomaTypeDescriptorHashKey
            , DiplomaAwardDate
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StudentAcademicRecordDiploma_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , DiplomaTypeDescriptorHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            , DiplomaAwardDate date NOT NULL
            -- Attributes
            , AchievementCategorySystem nvarchar(60) NULL
            , AchievementTitle nvarchar(60) NULL
            , Criteria nvarchar(150) NULL
            , CriteriaURL nvarchar(255) NULL
            , CTECompleter bit NULL
            , DiplomaAwardExpiresDate date NULL
            , DiplomaDescription nvarchar(80) NULL
            , EvidenceStatement nvarchar(150) NULL
            , ImageURL nvarchar(255) NULL
            , IssuerName nvarchar(150) NULL
            , IssuerOriginURL nvarchar(255) NULL
            -- References
            , AchievementCategoryDescriptorHashKey uniqueIdentifier NULL
            , DiplomaLevelDescriptorHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StudentAcademicRecordDiploma_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
                , DiplomaAwardDate ASC -- Contextual PK column
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.StudentAcademicRecordGradePointAverage (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , GradePointAverageTypeDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT StudentAcademicRecordGradePointAverage_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , GradePointAverageTypeDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StudentAcademicRecordGradePointAverage_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , GradePointAverageTypeDescriptorHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            -- Attributes
            , GradePointAverageValue decimal(18,4) NOT NULL
            , IsCumulative bit NULL
            , MaxGradePointAverageValue decimal(18,4) NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StudentAcademicRecordGradePointAverage_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.StudentAcademicRecordRecognition (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , RecognitionTypeDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT StudentAcademicRecordRecognition_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , RecognitionTypeDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StudentAcademicRecordRecognition_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , RecognitionTypeDescriptorHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            -- Attributes
            , AchievementCategorySystem nvarchar(60) NULL
            , AchievementTitle nvarchar(60) NULL
            , Criteria nvarchar(150) NULL
            , CriteriaURL nvarchar(255) NULL
            , EvidenceStatement nvarchar(150) NULL
            , ImageURL nvarchar(255) NULL
            , IssuerName nvarchar(150) NULL
            , IssuerOriginURL nvarchar(255) NULL
            , RecognitionAwardDate date NULL
            , RecognitionAwardExpiresDate date NULL
            , RecognitionDescription nvarchar(80) NULL
            -- References
            , AchievementCategoryDescriptorHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StudentAcademicRecordRecognition_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.StudentAcademicRecordReportCard (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , ReportCardHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT StudentAcademicRecordReportCard_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , ReportCardHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentAssessment (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        AssessmentHashKey uniqueIdentifier NOT NULL,
        StudentHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        AssessmentIdentifier nvarchar(60) NOT NULL,
        Namespace nvarchar(255) NOT NULL,
        StudentAssessmentIdentifier nvarchar(60) NOT NULL,
        StudentUSI int NOT NULL,
        -- Constraints
        CONSTRAINT StudentAssessment_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StudentAssessment_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , AdministrationDate datetime2 NOT NULL
            , AdministrationEndDate datetime2 NULL
            , EventDescription nvarchar(1024) NULL
            , SerialNumber nvarchar(60) NULL
            -- References
            , AdministrationEnvironmentDescriptorHashKey uniqueIdentifier NULL
            , EventCircumstanceDescriptorHashKey uniqueIdentifier NULL
            , WhenAssessedGradeLevelDescriptorHashKey uniqueIdentifier NULL
            , AdministrationLanguageDescriptorHashKey uniqueIdentifier NULL
            , PlatformTypeDescriptorHashKey uniqueIdentifier NULL
            , ReasonNotTestedDescriptorHashKey uniqueIdentifier NULL
            , RetestIndicatorDescriptorHashKey uniqueIdentifier NULL
            , SchoolYearTypeHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StudentAssessment_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.StudentAssessmentAccommodation (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , AccommodationDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT StudentAssessmentAccommodation_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , AccommodationDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentAssessmentItem (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , AssessmentItemHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT StudentAssessmentItem_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , AssessmentItemHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StudentAssessmentItem_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , AssessmentItemHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            -- Attributes
            , AssessmentResponse nvarchar(60) NULL
            , DescriptiveFeedback nvarchar(1024) NULL
            , RawScoreResult decimal(15,5) NULL
            , TimeAssessed nvarchar(30) NULL
            -- References
            , AssessmentItemResultDescriptorHashKey uniqueIdentifier NOT NULL
            , ResponseIndicatorDescriptorHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StudentAssessmentItem_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.StudentAssessmentPerformanceLevel (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , AssessmentReportingMethodDescriptorHashKey uniqueIdentifier NOT NULL
        , PerformanceLevelDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT StudentAssessmentPerformanceLevel_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , AssessmentReportingMethodDescriptorHashKey
            , PerformanceLevelDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StudentAssessmentPerformanceLevel_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , AssessmentReportingMethodDescriptorHashKey uniqueIdentifier NOT NULL
            , PerformanceLevelDescriptorHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            -- Attributes
            , PerformanceLevelMet bit NOT NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StudentAssessmentPerformanceLevel_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.StudentAssessmentScoreResult (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , AssessmentReportingMethodDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT StudentAssessmentScoreResult_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , AssessmentReportingMethodDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StudentAssessmentScoreResult_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , AssessmentReportingMethodDescriptorHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            -- Attributes
            , Result nvarchar(35) NOT NULL
            -- References
            , ResultDatatypeTypeDescriptorHashKey uniqueIdentifier NOT NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StudentAssessmentScoreResult_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.StudentAssessmentStudentObjectiveAssessment (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , ObjectiveAssessmentHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT StudentAssessmentStudentObjectiveAssessment_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , ObjectiveAssessmentHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentAssessmentStudentObjectiveAssessmentPerformanceLevel (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , AssessmentReportingMethodDescriptorHashKey uniqueIdentifier NOT NULL
        , PerformanceLevelDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT StudentAssessmentStudentObjectiveAssessmentPerformanceLevel_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , AssessmentReportingMethodDescriptorHashKey
            , PerformanceLevelDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StudentAssessmentStudentObjectiveAssessmentPerformanceLevel_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , AssessmentReportingMethodDescriptorHashKey uniqueIdentifier NOT NULL
            , PerformanceLevelDescriptorHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            -- Attributes
            , PerformanceLevelMet bit NOT NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StudentAssessmentStudentObjectiveAssessmentPerformanceLevel_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.StudentAssessmentStudentObjectiveAssessmentScoreResult (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , AssessmentReportingMethodDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT StudentAssessmentStudentObjectiveAssessmentScoreResult_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , AssessmentReportingMethodDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StudentAssessmentStudentObjectiveAssessmentScoreResult_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , AssessmentReportingMethodDescriptorHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            -- Attributes
            , Result nvarchar(35) NOT NULL
            -- References
            , ResultDatatypeTypeDescriptorHashKey uniqueIdentifier NOT NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StudentAssessmentStudentObjectiveAssessmentScoreResult_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.StudentCharacteristicDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        StudentCharacteristicDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT StudentCharacteristicDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.StudentCohortAssociation (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        CohortHashKey uniqueIdentifier NOT NULL,
        StudentHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        BeginDate date NOT NULL,
        CohortIdentifier nvarchar(20) NOT NULL,
        EducationOrganizationId int NOT NULL,
        StudentUSI int NOT NULL,
        -- Constraints
        CONSTRAINT StudentCohortAssociation_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StudentCohortAssociation_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , EndDate date NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StudentCohortAssociation_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.StudentCohortAssociationSection (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , SectionHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT StudentCohortAssociationSection_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , SectionHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentCompetencyObjective (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        ObjectiveCompetencyObjectiveHashKey uniqueIdentifier NOT NULL,
        GradingPeriodHashKey uniqueIdentifier NOT NULL,
        StudentHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        GradingPeriodDescriptorId int NOT NULL,
        GradingPeriodSchoolId int NOT NULL,
        GradingPeriodSchoolYear smallint NOT NULL,
        GradingPeriodSequence int NOT NULL,
        Objective nvarchar(60) NOT NULL,
        ObjectiveEducationOrganizationId int NOT NULL,
        ObjectiveGradeLevelDescriptorId int NOT NULL,
        StudentUSI int NOT NULL,
        -- Constraints
        CONSTRAINT StudentCompetencyObjective_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StudentCompetencyObjective_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , DiagnosticStatement nvarchar(1024) NULL
            -- References
            , CompetencyLevelDescriptorHashKey uniqueIdentifier NOT NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StudentCompetencyObjective_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.StudentCompetencyObjectiveGeneralStudentProgramAssociation (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , GeneralStudentProgramAssociationHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT StudentCompetencyObjectiveGeneralStudentProgramAssociation_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , GeneralStudentProgramAssociationHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentCompetencyObjectiveStudentSectionAssociation (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , StudentSectionAssociationHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT StudentCompetencyObjectiveStudentSectionAssociation_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , StudentSectionAssociationHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentCTEProgramAssociation (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        GeneralStudentProgramAssociationHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        BeginDate date NOT NULL,
        EducationOrganizationId int NOT NULL,
        ProgramEducationOrganizationId int NOT NULL,
        ProgramName nvarchar(60) NOT NULL,
        ProgramTypeDescriptorId int NOT NULL,
        StudentUSI int NOT NULL,
        -- Constraints
        CONSTRAINT StudentCTEProgramAssociation_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StudentCTEProgramAssociation_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , NonTraditionalGenderStatus bit NULL
            , PrivateCTEProgram bit NULL
            -- References
            , TechnicalSkillsAssessmentDescriptorHashKey uniqueIdentifier NULL
            -- Boilerplate
            -- Constraints
            , CONSTRAINT StudentCTEProgramAssociation_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.StudentCTEProgramAssociationCTEProgram (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , CareerPathwayDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT StudentCTEProgramAssociationCTEProgram_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , CareerPathwayDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StudentCTEProgramAssociationCTEProgram_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , CareerPathwayDescriptorHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            -- Attributes
            , CIPCode nvarchar(120) NULL
            , CTEProgramCompletionIndicator bit NULL
            , PrimaryCTEProgramIndicator bit NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StudentCTEProgramAssociationCTEProgram_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.StudentCTEProgramAssociationCTEProgramService (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , CTEProgramServiceDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT StudentCTEProgramAssociationCTEProgramService_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , CTEProgramServiceDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StudentCTEProgramAssociationCTEProgramService_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , CTEProgramServiceDescriptorHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            -- Attributes
            , CIPCode nvarchar(120) NULL
            , PrimaryIndicator bit NULL
            , ServiceBeginDate date NULL
            , ServiceEndDate date NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StudentCTEProgramAssociationCTEProgramService_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.StudentCTEProgramAssociationService (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , ServiceDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT StudentCTEProgramAssociationService_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , ServiceDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StudentCTEProgramAssociationService_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , ServiceDescriptorHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            -- Attributes
            , PrimaryIndicator bit NULL
            , ServiceBeginDate date NULL
            , ServiceEndDate date NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StudentCTEProgramAssociationService_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.StudentDisciplineIncidentAssociation (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DisciplineIncidentHashKey uniqueIdentifier NOT NULL,
        StudentHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        IncidentIdentifier nvarchar(20) NOT NULL,
        SchoolId int NOT NULL,
        StudentUSI int NOT NULL,
        -- Constraints
        CONSTRAINT StudentDisciplineIncidentAssociation_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StudentDisciplineIncidentAssociation_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- References
            , StudentParticipationCodeDescriptorHashKey uniqueIdentifier NOT NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StudentDisciplineIncidentAssociation_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.StudentDisciplineIncidentAssociationBehavior (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , BehaviorDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT StudentDisciplineIncidentAssociationBehavior_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , BehaviorDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StudentDisciplineIncidentAssociationBehavior_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , BehaviorDescriptorHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            -- Attributes
            , BehaviorDetailedDescription nvarchar(1024) NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StudentDisciplineIncidentAssociationBehavior_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.StudentEducationOrganizationAssociation (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        EducationOrganizationHashKey uniqueIdentifier NOT NULL,
        StudentHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        EducationOrganizationId int NOT NULL,
        StudentUSI int NOT NULL,
        -- Constraints
        CONSTRAINT StudentEducationOrganizationAssociation_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StudentEducationOrganizationAssociation_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , HispanicLatinoEthnicity bit NULL
            , LoginId nvarchar(60) NULL
            , ProfileThumbnail nvarchar(255) NULL
            -- References
            , LimitedEnglishProficiencyDescriptorHashKey uniqueIdentifier NULL
            , OldEthnicityDescriptorHashKey uniqueIdentifier NULL
            , SexDescriptorHashKey uniqueIdentifier NOT NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StudentEducationOrganizationAssociation_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.StudentEducationOrganizationAssociationAddress (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , AddressTypeDescriptorHashKey uniqueIdentifier NOT NULL
        , StateAbbreviationDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        , City nvarchar(30) NOT NULL
        , PostalCode nvarchar(17) NOT NULL
        , StreetNumberName nvarchar(150) NOT NULL
        -- Constraints
        CONSTRAINT StudentEducationOrganizationAssociationAddress_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , AddressTypeDescriptorHashKey
            , StateAbbreviationDescriptorHashKey
            , City
            , PostalCode
            , StreetNumberName
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StudentEducationOrganizationAssociationAddress_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , AddressTypeDescriptorHashKey uniqueIdentifier NOT NULL
            , StateAbbreviationDescriptorHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            , City nvarchar(30) NOT NULL
            , PostalCode nvarchar(17) NOT NULL
            , StreetNumberName nvarchar(150) NOT NULL
            -- Attributes
            , ApartmentRoomSuiteNumber nvarchar(50) NULL
            , BuildingSiteNumber nvarchar(20) NULL
            , CongressionalDistrict nvarchar(30) NULL
            , CountyFIPSCode nvarchar(5) NULL
            , DoNotPublishIndicator bit NULL
            , Latitude nvarchar(20) NULL
            , Longitude nvarchar(20) NULL
            , NameOfCounty nvarchar(30) NULL
            -- References
            , LocaleDescriptorHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StudentEducationOrganizationAssociationAddress_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
                , City ASC -- Contextual PK column
                , PostalCode ASC -- Contextual PK column
                , StreetNumberName ASC -- Contextual PK column
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.StudentEducationOrganizationAssociationAddressPeriod (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        -- Contextual primary key
        , BeginDate date NOT NULL
        -- Constraints
        CONSTRAINT StudentEducationOrganizationAssociationAddressPeriod_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , BeginDate
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StudentEducationOrganizationAssociationAddressPeriod_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            -- Contextual primary key
            , BeginDate date NOT NULL
            -- Attributes
            , EndDate date NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StudentEducationOrganizationAssociationAddressPeriod_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
                , BeginDate ASC -- Contextual PK column
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.StudentEducationOrganizationAssociationCohortYear (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , CohortYearTypeDescriptorHashKey uniqueIdentifier NOT NULL
        , SchoolYearTypeHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT StudentEducationOrganizationAssociationCohortYear_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , CohortYearTypeDescriptorHashKey
            , SchoolYearTypeHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentEducationOrganizationAssociationDisability (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , DisabilityDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT StudentEducationOrganizationAssociationDisability_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , DisabilityDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StudentEducationOrganizationAssociationDisability_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , DisabilityDescriptorHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            -- Attributes
            , DisabilityDiagnosis nvarchar(80) NULL
            , OrderOfDisability int NULL
            -- References
            , DisabilityDeterminationSourceTypeDescriptorHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StudentEducationOrganizationAssociationDisability_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.StudentEducationOrganizationAssociationDisabilityDesignation (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , DisabilityDesignationDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT StudentEducationOrganizationAssociationDisabilityDesignation_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , DisabilityDesignationDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentEducationOrganizationAssociationElectronicMail (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , ElectronicMailTypeDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        , ElectronicMailAddress nvarchar(128) NOT NULL
        -- Constraints
        CONSTRAINT StudentEducationOrganizationAssociationElectronicMail_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , ElectronicMailTypeDescriptorHashKey
            , ElectronicMailAddress
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StudentEducationOrganizationAssociationElectronicMail_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , ElectronicMailTypeDescriptorHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            , ElectronicMailAddress nvarchar(128) NOT NULL
            -- Attributes
            , DoNotPublishIndicator bit NULL
            , PrimaryEmailAddressIndicator bit NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StudentEducationOrganizationAssociationElectronicMail_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
                , ElectronicMailAddress ASC -- Contextual PK column
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.StudentEducationOrganizationAssociationInternationalAddress (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , AddressTypeDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT StudentEducationOrganizationAssociationInternationalAddress_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , AddressTypeDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StudentEducationOrganizationAssociationInternationalAddress_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , AddressTypeDescriptorHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            -- Attributes
            , AddressLine1 nvarchar(150) NOT NULL
            , AddressLine2 nvarchar(150) NULL
            , AddressLine3 nvarchar(150) NULL
            , AddressLine4 nvarchar(150) NULL
            , BeginDate date NULL
            , EndDate date NULL
            , Latitude nvarchar(20) NULL
            , Longitude nvarchar(20) NULL
            -- References
            , CountryDescriptorHashKey uniqueIdentifier NOT NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StudentEducationOrganizationAssociationInternationalAddress_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.StudentEducationOrganizationAssociationLanguage (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , LanguageDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT StudentEducationOrganizationAssociationLanguage_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , LanguageDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentEducationOrganizationAssociationLanguageUse (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , LanguageUseDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT StudentEducationOrganizationAssociationLanguageUse_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , LanguageUseDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentEducationOrganizationAssociationProgramParticipation (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , ProgramTypeDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT StudentEducationOrganizationAssociationProgramParticipation_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , ProgramTypeDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StudentEducationOrganizationAssociationProgramParticipation_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , ProgramTypeDescriptorHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            -- Attributes
            , BeginDate date NULL
            , DesignatedBy nvarchar(60) NULL
            , EndDate date NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StudentEducationOrganizationAssociationProgramParticipation_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.StudentEducationOrganizationAssociationProgramParticipationProgramCharacteristic (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , ProgramCharacteristicDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT StudentEducationOrganizationAssociationProgramParticipationProgramCharacteristic_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , ProgramCharacteristicDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentEducationOrganizationAssociationRace (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , RaceDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT StudentEducationOrganizationAssociationRace_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , RaceDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentEducationOrganizationAssociationStudentCharacteristic (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , StudentCharacteristicDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT StudentEducationOrganizationAssociationStudentCharacteristic_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , StudentCharacteristicDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StudentEducationOrganizationAssociationStudentCharacteristic_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , StudentCharacteristicDescriptorHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            -- Attributes
            , DesignatedBy nvarchar(60) NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StudentEducationOrganizationAssociationStudentCharacteristic_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.StudentEducationOrganizationAssociationStudentCharacteristicPeriod (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        -- Contextual primary key
        , BeginDate date NOT NULL
        -- Constraints
        CONSTRAINT StudentEducationOrganizationAssociationStudentCharacteristicPeriod_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , BeginDate
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StudentEducationOrganizationAssociationStudentCharacteristicPeriod_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            -- Contextual primary key
            , BeginDate date NOT NULL
            -- Attributes
            , EndDate date NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StudentEducationOrganizationAssociationStudentCharacteristicPeriod_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
                , BeginDate ASC -- Contextual PK column
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.StudentEducationOrganizationAssociationStudentIdentificationCode (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , StudentIdentificationSystemDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        , AssigningOrganizationIdentificationCode nvarchar(60) NOT NULL
        -- Constraints
        CONSTRAINT StudentEducationOrganizationAssociationStudentIdentificationCode_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , StudentIdentificationSystemDescriptorHashKey
            , AssigningOrganizationIdentificationCode
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StudentEducationOrganizationAssociationStudentIdentificationCode_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , StudentIdentificationSystemDescriptorHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            , AssigningOrganizationIdentificationCode nvarchar(60) NOT NULL
            -- Attributes
            , IdentificationCode nvarchar(60) NOT NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StudentEducationOrganizationAssociationStudentIdentificationCode_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
                , AssigningOrganizationIdentificationCode ASC -- Contextual PK column
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.StudentEducationOrganizationAssociationStudentIndicator (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        -- Contextual primary key
        , IndicatorName nvarchar(200) NOT NULL
        -- Constraints
        CONSTRAINT StudentEducationOrganizationAssociationStudentIndicator_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , IndicatorName
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StudentEducationOrganizationAssociationStudentIndicator_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            -- Contextual primary key
            , IndicatorName nvarchar(200) NOT NULL
            -- Attributes
            , DesignatedBy nvarchar(60) NULL
            , Indicator nvarchar(35) NOT NULL
            , IndicatorGroup nvarchar(200) NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StudentEducationOrganizationAssociationStudentIndicator_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
                , IndicatorName ASC -- Contextual PK column
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.StudentEducationOrganizationAssociationStudentIndicatorPeriod (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        -- Contextual primary key
        , BeginDate date NOT NULL
        -- Constraints
        CONSTRAINT StudentEducationOrganizationAssociationStudentIndicatorPeriod_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , BeginDate
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StudentEducationOrganizationAssociationStudentIndicatorPeriod_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            -- Contextual primary key
            , BeginDate date NOT NULL
            -- Attributes
            , EndDate date NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StudentEducationOrganizationAssociationStudentIndicatorPeriod_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
                , BeginDate ASC -- Contextual PK column
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.StudentEducationOrganizationAssociationTelephone (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , TelephoneNumberTypeDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        , TelephoneNumber nvarchar(24) NOT NULL
        -- Constraints
        CONSTRAINT StudentEducationOrganizationAssociationTelephone_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , TelephoneNumberTypeDescriptorHashKey
            , TelephoneNumber
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StudentEducationOrganizationAssociationTelephone_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , TelephoneNumberTypeDescriptorHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            , TelephoneNumber nvarchar(24) NOT NULL
            -- Attributes
            , DoNotPublishIndicator bit NULL
            , OrderOfPriority int NULL
            , TextMessageCapabilityIndicator bit NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StudentEducationOrganizationAssociationTelephone_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
                , TelephoneNumber ASC -- Contextual PK column
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.StudentEducationOrganizationAssociationTribalAffiliation (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , TribalAffiliationDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT StudentEducationOrganizationAssociationTribalAffiliation_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , TribalAffiliationDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentEducationOrganizationResponsibilityAssociation (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        EducationOrganizationHashKey uniqueIdentifier NOT NULL,
        ResponsibilityDescriptorHashKey uniqueIdentifier NOT NULL,
        StudentHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        BeginDate date NOT NULL,
        EducationOrganizationId int NOT NULL,
        ResponsibilityDescriptorId int NOT NULL,
        StudentUSI int NOT NULL,
        -- Constraints
        CONSTRAINT StudentEducationOrganizationResponsibilityAssociation_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StudentEducationOrganizationResponsibilityAssociation_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , EndDate date NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StudentEducationOrganizationResponsibilityAssociation_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.StudentGradebookEntry (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        GradebookEntryHashKey uniqueIdentifier NOT NULL,
        StudentSectionAssociationHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        BeginDate date NOT NULL,
        DateAssigned date NOT NULL,
        GradebookEntryTitle nvarchar(60) NOT NULL,
        LocalCourseCode nvarchar(60) NOT NULL,
        SchoolId int NOT NULL,
        SchoolYear smallint NOT NULL,
        SectionIdentifier nvarchar(255) NOT NULL,
        SessionName nvarchar(60) NOT NULL,
        StudentUSI int NOT NULL,
        -- Constraints
        CONSTRAINT StudentGradebookEntry_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StudentGradebookEntry_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , DateFulfilled date NULL
            , DiagnosticStatement nvarchar(1024) NULL
            , LetterGradeEarned nvarchar(20) NULL
            , NumericGradeEarned decimal(9,2) NULL
            -- References
            , CompetencyLevelDescriptorHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StudentGradebookEntry_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.StudentHomelessProgramAssociation (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        GeneralStudentProgramAssociationHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        BeginDate date NOT NULL,
        EducationOrganizationId int NOT NULL,
        ProgramEducationOrganizationId int NOT NULL,
        ProgramName nvarchar(60) NOT NULL,
        ProgramTypeDescriptorId int NOT NULL,
        StudentUSI int NOT NULL,
        -- Constraints
        CONSTRAINT StudentHomelessProgramAssociation_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StudentHomelessProgramAssociation_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , AwaitingFosterCare bit NULL
            , HomelessUnaccompaniedYouth bit NULL
            -- References
            , HomelessPrimaryNighttimeResidenceDescriptorHashKey uniqueIdentifier NULL
            -- Boilerplate
            -- Constraints
            , CONSTRAINT StudentHomelessProgramAssociation_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.StudentHomelessProgramAssociationHomelessProgramService (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , HomelessProgramServiceDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT StudentHomelessProgramAssociationHomelessProgramService_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , HomelessProgramServiceDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StudentHomelessProgramAssociationHomelessProgramService_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , HomelessProgramServiceDescriptorHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            -- Attributes
            , PrimaryIndicator bit NULL
            , ServiceBeginDate date NULL
            , ServiceEndDate date NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StudentHomelessProgramAssociationHomelessProgramService_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.StudentIdentificationSystemDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        StudentIdentificationSystemDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT StudentIdentificationSystemDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.StudentInterventionAssociation (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        InterventionHashKey uniqueIdentifier NOT NULL,
        StudentHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        EducationOrganizationId int NOT NULL,
        InterventionIdentificationCode nvarchar(60) NOT NULL,
        StudentUSI int NOT NULL,
        -- Constraints
        CONSTRAINT StudentInterventionAssociation_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StudentInterventionAssociation_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , DiagnosticStatement nvarchar(1024) NULL
            , Dosage int NULL
            -- References
            , CohortHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StudentInterventionAssociation_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.StudentInterventionAssociationInterventionEffectiveness (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , DiagnosisDescriptorHashKey uniqueIdentifier NOT NULL
        , GradeLevelDescriptorHashKey uniqueIdentifier NOT NULL
        , PopulationServedDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT StudentInterventionAssociationInterventionEffectiveness_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , DiagnosisDescriptorHashKey
            , GradeLevelDescriptorHashKey
            , PopulationServedDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StudentInterventionAssociationInterventionEffectiveness_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , DiagnosisDescriptorHashKey uniqueIdentifier NOT NULL
            , GradeLevelDescriptorHashKey uniqueIdentifier NOT NULL
            , PopulationServedDescriptorHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            -- Attributes
            , ImprovementIndex int NULL
            -- References
            , InterventionEffectivenessRatingDescriptorHashKey uniqueIdentifier NOT NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StudentInterventionAssociationInterventionEffectiveness_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.StudentInterventionAttendanceEvent (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        AttendanceEventCategoryDescriptorHashKey uniqueIdentifier NOT NULL,
        InterventionHashKey uniqueIdentifier NOT NULL,
        StudentHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        AttendanceEventCategoryDescriptorId int NOT NULL,
        EducationOrganizationId int NOT NULL,
        EventDate date NOT NULL,
        InterventionIdentificationCode nvarchar(60) NOT NULL,
        StudentUSI int NOT NULL,
        -- Constraints
        CONSTRAINT StudentInterventionAttendanceEvent_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StudentInterventionAttendanceEvent_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , AttendanceEventReason nvarchar(255) NULL
            , EventDuration decimal(3,2) NULL
            , InterventionDuration int NULL
            -- References
            , EducationalEnvironmentDescriptorHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StudentInterventionAttendanceEvent_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.StudentLanguageInstructionProgramAssociation (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        GeneralStudentProgramAssociationHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        BeginDate date NOT NULL,
        EducationOrganizationId int NOT NULL,
        ProgramEducationOrganizationId int NOT NULL,
        ProgramName nvarchar(60) NOT NULL,
        ProgramTypeDescriptorId int NOT NULL,
        StudentUSI int NOT NULL,
        -- Constraints
        CONSTRAINT StudentLanguageInstructionProgramAssociation_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StudentLanguageInstructionProgramAssociation_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , Dosage int NULL
            , EnglishLearnerParticipation bit NULL
            -- Boilerplate
            -- Constraints
            , CONSTRAINT StudentLanguageInstructionProgramAssociation_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.StudentLanguageInstructionProgramAssociationEnglishLanguageProficiencyAssessment (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , SchoolYearTypeHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT StudentLanguageInstructionProgramAssociationEnglishLanguageProficiencyAssessment_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , SchoolYearTypeHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StudentLanguageInstructionProgramAssociationEnglishLanguageProficiencyAssessment_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , SchoolYearTypeHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            -- References
            , MonitoredDescriptorHashKey uniqueIdentifier NULL
            , ParticipationDescriptorHashKey uniqueIdentifier NULL
            , ProficiencyDescriptorHashKey uniqueIdentifier NULL
            , ProgressDescriptorHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StudentLanguageInstructionProgramAssociationEnglishLanguageProficiencyAssessment_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.StudentLanguageInstructionProgramAssociationLanguageInstructionProgramService (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , LanguageInstructionProgramServiceDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT StudentLanguageInstructionProgramAssociationLanguageInstructionProgramService_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , LanguageInstructionProgramServiceDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StudentLanguageInstructionProgramAssociationLanguageInstructionProgramService_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , LanguageInstructionProgramServiceDescriptorHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            -- Attributes
            , PrimaryIndicator bit NULL
            , ServiceBeginDate date NULL
            , ServiceEndDate date NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StudentLanguageInstructionProgramAssociationLanguageInstructionProgramService_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.StudentLearningObjective (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        GradingPeriodHashKey uniqueIdentifier NOT NULL,
        LearningObjectiveHashKey uniqueIdentifier NOT NULL,
        StudentHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        GradingPeriodDescriptorId int NOT NULL,
        GradingPeriodSchoolId int NOT NULL,
        GradingPeriodSchoolYear smallint NOT NULL,
        GradingPeriodSequence int NOT NULL,
        LearningObjectiveId nvarchar(60) NOT NULL,
        Namespace nvarchar(255) NOT NULL,
        StudentUSI int NOT NULL,
        -- Constraints
        CONSTRAINT StudentLearningObjective_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StudentLearningObjective_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , DiagnosticStatement nvarchar(1024) NULL
            -- References
            , CompetencyLevelDescriptorHashKey uniqueIdentifier NOT NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StudentLearningObjective_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.StudentLearningObjectiveGeneralStudentProgramAssociation (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , GeneralStudentProgramAssociationHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT StudentLearningObjectiveGeneralStudentProgramAssociation_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , GeneralStudentProgramAssociationHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentLearningObjectiveStudentSectionAssociation (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , StudentSectionAssociationHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT StudentLearningObjectiveStudentSectionAssociation_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , StudentSectionAssociationHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentMigrantEducationProgramAssociation (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        GeneralStudentProgramAssociationHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        BeginDate date NOT NULL,
        EducationOrganizationId int NOT NULL,
        ProgramEducationOrganizationId int NOT NULL,
        ProgramName nvarchar(60) NOT NULL,
        ProgramTypeDescriptorId int NOT NULL,
        StudentUSI int NOT NULL,
        -- Constraints
        CONSTRAINT StudentMigrantEducationProgramAssociation_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StudentMigrantEducationProgramAssociation_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , EligibilityExpirationDate date NULL
            , LastQualifyingMove date NOT NULL
            , PriorityForServices bit NOT NULL
            , QualifyingArrivalDate date NULL
            , StateResidencyDate date NULL
            , USInitialEntry date NULL
            , USInitialSchoolEntry date NULL
            , USMostRecentEntry date NULL
            -- References
            , ContinuationOfServicesReasonDescriptorHashKey uniqueIdentifier NULL
            -- Boilerplate
            -- Constraints
            , CONSTRAINT StudentMigrantEducationProgramAssociation_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.StudentMigrantEducationProgramAssociationMigrantEducationProgramService (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , MigrantEducationProgramServiceDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT StudentMigrantEducationProgramAssociationMigrantEducationProgramService_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , MigrantEducationProgramServiceDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StudentMigrantEducationProgramAssociationMigrantEducationProgramService_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , MigrantEducationProgramServiceDescriptorHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            -- Attributes
            , PrimaryIndicator bit NULL
            , ServiceBeginDate date NULL
            , ServiceEndDate date NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StudentMigrantEducationProgramAssociationMigrantEducationProgramService_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.StudentNeglectedOrDelinquentProgramAssociation (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        GeneralStudentProgramAssociationHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        BeginDate date NOT NULL,
        EducationOrganizationId int NOT NULL,
        ProgramEducationOrganizationId int NOT NULL,
        ProgramName nvarchar(60) NOT NULL,
        ProgramTypeDescriptorId int NOT NULL,
        StudentUSI int NOT NULL,
        -- Constraints
        CONSTRAINT StudentNeglectedOrDelinquentProgramAssociation_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StudentNeglectedOrDelinquentProgramAssociation_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- References
            , NeglectedOrDelinquentProgramDescriptorHashKey uniqueIdentifier NULL
            , ELAProgressLevelDescriptorHashKey uniqueIdentifier NULL
            , MathematicsProgressLevelDescriptorHashKey uniqueIdentifier NULL
            -- Boilerplate
            -- Constraints
            , CONSTRAINT StudentNeglectedOrDelinquentProgramAssociation_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.StudentNeglectedOrDelinquentProgramAssociationNeglectedOrDelinquentProgramService (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , NeglectedOrDelinquentProgramServiceDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT StudentNeglectedOrDelinquentProgramAssociationNeglectedOrDelinquentProgramService_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , NeglectedOrDelinquentProgramServiceDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StudentNeglectedOrDelinquentProgramAssociationNeglectedOrDelinquentProgramService_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , NeglectedOrDelinquentProgramServiceDescriptorHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            -- Attributes
            , PrimaryIndicator bit NULL
            , ServiceBeginDate date NULL
            , ServiceEndDate date NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StudentNeglectedOrDelinquentProgramAssociationNeglectedOrDelinquentProgramService_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.StudentParentAssociation (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        ParentHashKey uniqueIdentifier NOT NULL,
        StudentHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        ParentUSI int NOT NULL,
        StudentUSI int NOT NULL,
        -- Constraints
        CONSTRAINT StudentParentAssociation_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StudentParentAssociation_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , ContactPriority int NULL
            , ContactRestrictions nvarchar(250) NULL
            , EmergencyContactStatus bit NULL
            , LivesWith bit NULL
            , PrimaryContactStatus bit NULL
            -- References
            , RelationDescriptorHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StudentParentAssociation_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.StudentParticipationCodeDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        StudentParticipationCodeDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT StudentParticipationCodeDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.StudentProgramAssociation (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        GeneralStudentProgramAssociationHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        BeginDate date NOT NULL,
        EducationOrganizationId int NOT NULL,
        ProgramEducationOrganizationId int NOT NULL,
        ProgramName nvarchar(60) NOT NULL,
        ProgramTypeDescriptorId int NOT NULL,
        StudentUSI int NOT NULL,
        -- Constraints
        CONSTRAINT StudentProgramAssociation_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.StudentProgramAssociationService (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , ServiceDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT StudentProgramAssociationService_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , ServiceDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StudentProgramAssociationService_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , ServiceDescriptorHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            -- Attributes
            , PrimaryIndicator bit NULL
            , ServiceBeginDate date NULL
            , ServiceEndDate date NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StudentProgramAssociationService_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.StudentProgramAttendanceEvent (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        AttendanceEventCategoryDescriptorHashKey uniqueIdentifier NOT NULL,
        EducationOrganizationHashKey uniqueIdentifier NOT NULL,
        ProgramHashKey uniqueIdentifier NOT NULL,
        StudentHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        AttendanceEventCategoryDescriptorId int NOT NULL,
        EducationOrganizationId int NOT NULL,
        EventDate date NOT NULL,
        ProgramEducationOrganizationId int NOT NULL,
        ProgramName nvarchar(60) NOT NULL,
        ProgramTypeDescriptorId int NOT NULL,
        StudentUSI int NOT NULL,
        -- Constraints
        CONSTRAINT StudentProgramAttendanceEvent_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StudentProgramAttendanceEvent_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , AttendanceEventReason nvarchar(255) NULL
            , EventDuration decimal(3,2) NULL
            , ProgramAttendanceDuration int NULL
            -- References
            , EducationalEnvironmentDescriptorHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StudentProgramAttendanceEvent_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.StudentSchoolAssociation (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        SchoolHashKey uniqueIdentifier NOT NULL,
        StudentHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        EntryDate date NOT NULL,
        SchoolId int NOT NULL,
        StudentUSI int NOT NULL,
        -- Constraints
        CONSTRAINT StudentSchoolAssociation_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StudentSchoolAssociation_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , EmployedWhileEnrolled bit NULL
            , ExitWithdrawDate date NULL
            , FullTimeEquivalency decimal(3,2) NULL
            , PrimarySchool bit NULL
            , RepeatGradeIndicator bit NULL
            , SchoolChoiceTransfer bit NULL
            , TermCompletionIndicator bit NULL
            -- References
            , CalendarHashKey uniqueIdentifier NULL
            , EntryGradeLevelReasonDescriptorHashKey uniqueIdentifier NULL
            , EntryTypeDescriptorHashKey uniqueIdentifier NULL
            , ExitWithdrawTypeDescriptorHashKey uniqueIdentifier NULL
            , EntryGradeLevelDescriptorHashKey uniqueIdentifier NOT NULL
            , GraduationPlanHashKey uniqueIdentifier NULL
            , ResidencyStatusDescriptorHashKey uniqueIdentifier NULL
            , SchoolYearTypeHashKey uniqueIdentifier NULL
            , ClassOfSchoolYearTypeHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StudentSchoolAssociation_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.StudentSchoolAssociationAlternativeGraduationPlan (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , AlternativeGraduationPlanHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT StudentSchoolAssociationAlternativeGraduationPlan_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , AlternativeGraduationPlanHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentSchoolAssociationEducationPlan (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , EducationPlanDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT StudentSchoolAssociationEducationPlan_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , EducationPlanDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentSchoolAttendanceEvent (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        AttendanceEventCategoryDescriptorHashKey uniqueIdentifier NOT NULL,
        SchoolHashKey uniqueIdentifier NOT NULL,
        SessionHashKey uniqueIdentifier NOT NULL,
        StudentHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        AttendanceEventCategoryDescriptorId int NOT NULL,
        EventDate date NOT NULL,
        SchoolId int NOT NULL,
        SchoolYear smallint NOT NULL,
        SessionName nvarchar(60) NOT NULL,
        StudentUSI int NOT NULL,
        -- Constraints
        CONSTRAINT StudentSchoolAttendanceEvent_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StudentSchoolAttendanceEvent_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , ArrivalTime time NULL
            , AttendanceEventReason nvarchar(255) NULL
            , DepartureTime time NULL
            , EventDuration decimal(3,2) NULL
            , SchoolAttendanceDuration int NULL
            -- References
            , EducationalEnvironmentDescriptorHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StudentSchoolAttendanceEvent_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.StudentSchoolFoodServiceProgramAssociation (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        GeneralStudentProgramAssociationHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        BeginDate date NOT NULL,
        EducationOrganizationId int NOT NULL,
        ProgramEducationOrganizationId int NOT NULL,
        ProgramName nvarchar(60) NOT NULL,
        ProgramTypeDescriptorId int NOT NULL,
        StudentUSI int NOT NULL,
        -- Constraints
        CONSTRAINT StudentSchoolFoodServiceProgramAssociation_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StudentSchoolFoodServiceProgramAssociation_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , DirectCertification bit NULL
            -- Boilerplate
            -- Constraints
            , CONSTRAINT StudentSchoolFoodServiceProgramAssociation_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.StudentSchoolFoodServiceProgramAssociationSchoolFoodServiceProgramService (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , SchoolFoodServiceProgramServiceDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT StudentSchoolFoodServiceProgramAssociationSchoolFoodServiceProgramService_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , SchoolFoodServiceProgramServiceDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StudentSchoolFoodServiceProgramAssociationSchoolFoodServiceProgramService_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , SchoolFoodServiceProgramServiceDescriptorHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            -- Attributes
            , PrimaryIndicator bit NULL
            , ServiceBeginDate date NULL
            , ServiceEndDate date NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StudentSchoolFoodServiceProgramAssociationSchoolFoodServiceProgramService_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.StudentSectionAssociation (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        SectionHashKey uniqueIdentifier NOT NULL,
        StudentHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        BeginDate date NOT NULL,
        LocalCourseCode nvarchar(60) NOT NULL,
        SchoolId int NOT NULL,
        SchoolYear smallint NOT NULL,
        SectionIdentifier nvarchar(255) NOT NULL,
        SessionName nvarchar(60) NOT NULL,
        StudentUSI int NOT NULL,
        -- Constraints
        CONSTRAINT StudentSectionAssociation_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StudentSectionAssociation_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , EndDate date NULL
            , HomeroomIndicator bit NULL
            , TeacherStudentDataLinkExclusion bit NULL
            -- References
            , AttemptStatusDescriptorHashKey uniqueIdentifier NULL
            , RepeatIdentifierDescriptorHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StudentSectionAssociation_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.StudentSectionAttendanceEvent (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        AttendanceEventCategoryDescriptorHashKey uniqueIdentifier NOT NULL,
        SectionHashKey uniqueIdentifier NOT NULL,
        StudentHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        AttendanceEventCategoryDescriptorId int NOT NULL,
        EventDate date NOT NULL,
        LocalCourseCode nvarchar(60) NOT NULL,
        SchoolId int NOT NULL,
        SchoolYear smallint NOT NULL,
        SectionIdentifier nvarchar(255) NOT NULL,
        SessionName nvarchar(60) NOT NULL,
        StudentUSI int NOT NULL,
        -- Constraints
        CONSTRAINT StudentSectionAttendanceEvent_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StudentSectionAttendanceEvent_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , ArrivalTime time NULL
            , AttendanceEventReason nvarchar(255) NULL
            , DepartureTime time NULL
            , EventDuration decimal(3,2) NULL
            , SectionAttendanceDuration int NULL
            -- References
            , EducationalEnvironmentDescriptorHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StudentSectionAttendanceEvent_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.StudentSpecialEducationProgramAssociation (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        GeneralStudentProgramAssociationHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        BeginDate date NOT NULL,
        EducationOrganizationId int NOT NULL,
        ProgramEducationOrganizationId int NOT NULL,
        ProgramName nvarchar(60) NOT NULL,
        ProgramTypeDescriptorId int NOT NULL,
        StudentUSI int NOT NULL,
        -- Constraints
        CONSTRAINT StudentSpecialEducationProgramAssociation_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StudentSpecialEducationProgramAssociation_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , IdeaEligibility bit NULL
            , IEPBeginDate date NULL
            , IEPEndDate date NULL
            , IEPReviewDate date NULL
            , LastEvaluationDate date NULL
            , MedicallyFragile bit NULL
            , MultiplyDisabled bit NULL
            , SchoolHoursPerWeek decimal(5,2) NULL
            , SpecialEducationHoursPerWeek decimal(5,2) NULL
            -- References
            , SpecialEducationSettingDescriptorHashKey uniqueIdentifier NULL
            -- Boilerplate
            -- Constraints
            , CONSTRAINT StudentSpecialEducationProgramAssociation_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.StudentSpecialEducationProgramAssociationDisability (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , DisabilityDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT StudentSpecialEducationProgramAssociationDisability_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , DisabilityDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StudentSpecialEducationProgramAssociationDisability_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , DisabilityDescriptorHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            -- Attributes
            , DisabilityDiagnosis nvarchar(80) NULL
            , OrderOfDisability int NULL
            -- References
            , DisabilityDeterminationSourceTypeDescriptorHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StudentSpecialEducationProgramAssociationDisability_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.StudentSpecialEducationProgramAssociationDisabilityDesignation (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , DisabilityDesignationDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT StudentSpecialEducationProgramAssociationDisabilityDesignation_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , DisabilityDesignationDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentSpecialEducationProgramAssociationServiceProvider (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , StaffHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT StudentSpecialEducationProgramAssociationServiceProvider_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , StaffHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StudentSpecialEducationProgramAssociationServiceProvider_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , StaffHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            -- Attributes
            , PrimaryProvider bit NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StudentSpecialEducationProgramAssociationServiceProvider_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.StudentSpecialEducationProgramAssociationSpecialEducationProgramService (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , SpecialEducationProgramServiceDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT StudentSpecialEducationProgramAssociationSpecialEducationProgramService_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , SpecialEducationProgramServiceDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StudentSpecialEducationProgramAssociationSpecialEducationProgramService_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , SpecialEducationProgramServiceDescriptorHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            -- Attributes
            , PrimaryIndicator bit NULL
            , ServiceBeginDate date NULL
            , ServiceEndDate date NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StudentSpecialEducationProgramAssociationSpecialEducationProgramService_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.StudentSpecialEducationProgramAssociationSpecialEducationProgramServiceProvider (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , StaffHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT StudentSpecialEducationProgramAssociationSpecialEducationProgramServiceProvider_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , StaffHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StudentSpecialEducationProgramAssociationSpecialEducationProgramServiceProvider_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , StaffHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            -- Attributes
            , PrimaryProvider bit NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StudentSpecialEducationProgramAssociationSpecialEducationProgramServiceProvider_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.StudentTitleIPartAProgramAssociation (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        GeneralStudentProgramAssociationHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        BeginDate date NOT NULL,
        EducationOrganizationId int NOT NULL,
        ProgramEducationOrganizationId int NOT NULL,
        ProgramName nvarchar(60) NOT NULL,
        ProgramTypeDescriptorId int NOT NULL,
        StudentUSI int NOT NULL,
        -- Constraints
        CONSTRAINT StudentTitleIPartAProgramAssociation_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StudentTitleIPartAProgramAssociation_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- References
            , TitleIPartAParticipantDescriptorHashKey uniqueIdentifier NOT NULL
            -- Boilerplate
            -- Constraints
            , CONSTRAINT StudentTitleIPartAProgramAssociation_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.StudentTitleIPartAProgramAssociationService (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , ServiceDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT StudentTitleIPartAProgramAssociationService_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , ServiceDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StudentTitleIPartAProgramAssociationService_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , ServiceDescriptorHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            -- Attributes
            , PrimaryIndicator bit NULL
            , ServiceBeginDate date NULL
            , ServiceEndDate date NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StudentTitleIPartAProgramAssociationService_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.StudentTitleIPartAProgramAssociationTitleIPartAProgramService (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , TitleIPartAProgramServiceDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT StudentTitleIPartAProgramAssociationTitleIPartAProgramService_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , TitleIPartAProgramServiceDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.StudentTitleIPartAProgramAssociationTitleIPartAProgramService_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            , TitleIPartAProgramServiceDescriptorHashKey uniqueIdentifier NOT NULL
            -- Contextual primary key
            -- Attributes
            , PrimaryIndicator bit NULL
            , ServiceBeginDate date NULL
            , ServiceEndDate date NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT StudentTitleIPartAProgramAssociationTitleIPartAProgramService_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.Survey (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        -- Primary key columns
        Namespace nvarchar(255) NOT NULL,
        SurveyIdentifier nvarchar(60) NOT NULL,
        -- Constraints
        CONSTRAINT Survey_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.Survey_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , NumberAdministered int NULL
            , SurveyTitle nvarchar(255) NOT NULL
            -- References
            , EducationOrganizationHashKey uniqueIdentifier NULL
            , SchoolYearTypeHashKey uniqueIdentifier NOT NULL
            , SessionHashKey uniqueIdentifier NULL
            , SurveyCategoryDescriptorHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT Survey_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.SurveyCategoryDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        SurveyCategoryDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT SurveyCategoryDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.SurveyCourseAssociation (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        CourseHashKey uniqueIdentifier NOT NULL,
        SurveyHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        CourseCode nvarchar(60) NOT NULL,
        EducationOrganizationId int NOT NULL,
        Namespace nvarchar(255) NOT NULL,
        SurveyIdentifier nvarchar(60) NOT NULL,
        -- Constraints
        CONSTRAINT SurveyCourseAssociation_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.SurveyLevelDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        SurveyLevelDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT SurveyLevelDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.SurveyProgramAssociation (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        ProgramHashKey uniqueIdentifier NOT NULL,
        SurveyHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        EducationOrganizationId int NOT NULL,
        Namespace nvarchar(255) NOT NULL,
        ProgramName nvarchar(60) NOT NULL,
        ProgramTypeDescriptorId int NOT NULL,
        SurveyIdentifier nvarchar(60) NOT NULL,
        -- Constraints
        CONSTRAINT SurveyProgramAssociation_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.SurveyQuestion (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        SurveyHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        Namespace nvarchar(255) NOT NULL,
        QuestionCode nvarchar(60) NOT NULL,
        SurveyIdentifier nvarchar(60) NOT NULL,
        -- Constraints
        CONSTRAINT SurveyQuestion_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.SurveyQuestion_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , QuestionText nvarchar(1024) NOT NULL
            -- References
            , QuestionFormDescriptorHashKey uniqueIdentifier NOT NULL
            , SurveySectionHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT SurveyQuestion_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.SurveyQuestionMatrix (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        -- Contextual primary key
        , MatrixElement nvarchar(255) NOT NULL
        -- Constraints
        CONSTRAINT SurveyQuestionMatrix_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , MatrixElement
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.SurveyQuestionMatrix_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            -- Contextual primary key
            , MatrixElement nvarchar(255) NOT NULL
            -- Attributes
            , MaxRawScore int NULL
            , MinRawScore int NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT SurveyQuestionMatrix_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
                , MatrixElement ASC -- Contextual PK column
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.SurveyQuestionResponseChoice (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        -- Contextual primary key
        , SortOrder int NOT NULL
        -- Constraints
        CONSTRAINT SurveyQuestionResponseChoice_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , SortOrder
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.SurveyQuestionResponseChoice_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            -- Contextual primary key
            , SortOrder int NOT NULL
            -- Attributes
            , NumericValue int NULL
            , TextValue nvarchar(255) NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT SurveyQuestionResponseChoice_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
                , SortOrder ASC -- Contextual PK column
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.SurveyQuestionResponse (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        SurveyQuestionHashKey uniqueIdentifier NOT NULL,
        SurveyResponseHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        Namespace nvarchar(255) NOT NULL,
        QuestionCode nvarchar(60) NOT NULL,
        SurveyIdentifier nvarchar(60) NOT NULL,
        SurveyResponseIdentifier nvarchar(60) NOT NULL,
        -- Constraints
        CONSTRAINT SurveyQuestionResponse_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.SurveyQuestionResponse_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , Comment nvarchar(1024) NULL
            , NoResponse bit NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT SurveyQuestionResponse_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.SurveyQuestionResponseSurveyQuestionMatrixElementResponse (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        -- Contextual primary key
        , MatrixElement nvarchar(255) NOT NULL
        -- Constraints
        CONSTRAINT SurveyQuestionResponseSurveyQuestionMatrixElementResponse_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , MatrixElement
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.SurveyQuestionResponseSurveyQuestionMatrixElementResponse_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            -- Contextual primary key
            , MatrixElement nvarchar(255) NOT NULL
            -- Attributes
            , MaxNumericResponse int NULL
            , MinNumericResponse int NULL
            , NoResponse bit NULL
            , NumericResponse int NULL
            , TextResponse nvarchar(2048) NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT SurveyQuestionResponseSurveyQuestionMatrixElementResponse_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
                , MatrixElement ASC -- Contextual PK column
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.SurveyQuestionResponseValue (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        -- Contextual primary key
        , SurveyQuestionResponseValueIdentifier int NOT NULL
        -- Constraints
        CONSTRAINT SurveyQuestionResponseValue_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , SurveyQuestionResponseValueIdentifier
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.SurveyQuestionResponseValue_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Identifying references
            -- Contextual primary key
            , SurveyQuestionResponseValueIdentifier int NOT NULL
            -- Attributes
            , NumericResponse int NULL
            , TextResponse nvarchar(2048) NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT SurveyQuestionResponseValue_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
                , SurveyQuestionResponseValueIdentifier ASC -- Contextual PK column
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    CREATE TABLE edfi.SurveyResponse (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        SurveyHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        Namespace nvarchar(255) NOT NULL,
        SurveyIdentifier nvarchar(60) NOT NULL,
        SurveyResponseIdentifier nvarchar(60) NOT NULL,
        -- Constraints
        CONSTRAINT SurveyResponse_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.SurveyResponse_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , ElectronicMailAddress nvarchar(128) NULL
            , FullName nvarchar(80) NULL
            , Location nvarchar(75) NULL
            , ResponseDate date NOT NULL
            , ResponseTime int NULL
            -- References
            , ParentHashKey uniqueIdentifier NULL
            , StaffHashKey uniqueIdentifier NULL
            , StudentHashKey uniqueIdentifier NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT SurveyResponse_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.SurveyResponseSurveyLevel (
        HashKey uniqueidentifier NOT NULL
        -- Identifying references
        , SurveyLevelDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        -- Constraints
        CONSTRAINT SurveyResponseSurveyLevel_PK PRIMARY KEY CLUSTERED (
            HashKey ASC
            , SurveyLevelDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.SurveyResponseEducationOrganizationTargetAssociation (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        EducationOrganizationHashKey uniqueIdentifier NOT NULL,
        SurveyResponseHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        EducationOrganizationId int NOT NULL,
        Namespace nvarchar(255) NOT NULL,
        SurveyIdentifier nvarchar(60) NOT NULL,
        SurveyResponseIdentifier nvarchar(60) NOT NULL,
        -- Constraints
        CONSTRAINT SurveyResponseEducationOrganizationTargetAssociation_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.SurveyResponseStaffTargetAssociation (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        StaffHashKey uniqueIdentifier NOT NULL,
        SurveyResponseHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        Namespace nvarchar(255) NOT NULL,
        StaffUSI int NOT NULL,
        SurveyIdentifier nvarchar(60) NOT NULL,
        SurveyResponseIdentifier nvarchar(60) NOT NULL,
        -- Constraints
        CONSTRAINT SurveyResponseStaffTargetAssociation_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.SurveySection (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        SurveyHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        Namespace nvarchar(255) NOT NULL,
        SurveyIdentifier nvarchar(60) NOT NULL,
        SurveySectionTitle nvarchar(255) NOT NULL,
        -- Constraints
        CONSTRAINT SurveySection_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.SurveySectionAssociation (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        SectionHashKey uniqueIdentifier NOT NULL,
        SurveyHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        LocalCourseCode nvarchar(60) NOT NULL,
        Namespace nvarchar(255) NOT NULL,
        SchoolId int NOT NULL,
        SchoolYear smallint NOT NULL,
        SectionIdentifier nvarchar(255) NOT NULL,
        SessionName nvarchar(60) NOT NULL,
        SurveyIdentifier nvarchar(60) NOT NULL,
        -- Constraints
        CONSTRAINT SurveySectionAssociation_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.SurveySectionResponse (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        SurveyResponseHashKey uniqueIdentifier NOT NULL,
        SurveySectionHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        Namespace nvarchar(255) NOT NULL,
        SurveyIdentifier nvarchar(60) NOT NULL,
        SurveyResponseIdentifier nvarchar(60) NOT NULL,
        SurveySectionTitle nvarchar(255) NOT NULL,
        -- Constraints
        CONSTRAINT SurveySectionResponse_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

        CREATE TABLE edfi.SurveySectionResponse_Attributes (
            HashKey uniqueidentifier NOT NULL
            , SchoolYearContext int NOT NULL
            -- Attributes
            , SectionRating decimal(9,3) NULL
            -- Boilerplate
            , CreateDate datetime2 NOT NULL
            , Id uniqueidentifier NOT NULL
            , LastModifiedDate datetime2 NOT NULL
            -- Constraints
            , CONSTRAINT SurveySectionResponse_Attributes_PK PRIMARY KEY CLUSTERED (
                HashKey ASC
                , SchoolYearContext ASC
            ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
            ) ON [PRIMARY]
        GO
    
    CREATE TABLE edfi.SurveySectionResponseEducationOrganizationTargetAssociation (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        EducationOrganizationHashKey uniqueIdentifier NOT NULL,
        SurveySectionResponseHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        EducationOrganizationId int NOT NULL,
        Namespace nvarchar(255) NOT NULL,
        SurveyIdentifier nvarchar(60) NOT NULL,
        SurveyResponseIdentifier nvarchar(60) NOT NULL,
        SurveySectionTitle nvarchar(255) NOT NULL,
        -- Constraints
        CONSTRAINT SurveySectionResponseEducationOrganizationTargetAssociation_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.SurveySectionResponseStaffTargetAssociation (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        StaffHashKey uniqueIdentifier NOT NULL,
        SurveySectionResponseHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        Namespace nvarchar(255) NOT NULL,
        StaffUSI int NOT NULL,
        SurveyIdentifier nvarchar(60) NOT NULL,
        SurveyResponseIdentifier nvarchar(60) NOT NULL,
        SurveySectionTitle nvarchar(255) NOT NULL,
        -- Constraints
        CONSTRAINT SurveySectionResponseStaffTargetAssociation_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.TeachingCredentialBasisDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        TeachingCredentialBasisDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT TeachingCredentialBasisDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.TeachingCredentialDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        TeachingCredentialDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT TeachingCredentialDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.TechnicalSkillsAssessmentDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        TechnicalSkillsAssessmentDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT TechnicalSkillsAssessmentDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.TelephoneNumberTypeDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        TelephoneNumberTypeDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT TelephoneNumberTypeDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.TermDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        TermDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT TermDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.TitleIPartAParticipantDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        TitleIPartAParticipantDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT TitleIPartAParticipantDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.TitleIPartAProgramServiceDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        TitleIPartAProgramServiceDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT TitleIPartAProgramServiceDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.TitleIPartASchoolDesignationDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        TitleIPartASchoolDesignationDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT TitleIPartASchoolDesignationDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.TribalAffiliationDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        TribalAffiliationDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT TribalAffiliationDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.VisaDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        VisaDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT VisaDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
    CREATE TABLE edfi.WeaponDescriptor (
        HashKey uniqueidentifier NOT NULL,
        -- Primary key references
        DescriptorHashKey uniqueIdentifier NOT NULL,
        -- Primary key columns
        WeaponDescriptorId int NOT NULL,
        -- Constraints
        CONSTRAINT WeaponDescriptor_PK PRIMARY KEY CLUSTERED (HashKey ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO


    
