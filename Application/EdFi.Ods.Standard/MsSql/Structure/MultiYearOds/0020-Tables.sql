    CREATE TABLE edfi.AbsenceEventCategoryDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , AbsenceEventCategoryDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT AbsenceEventCategoryDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.AbsenceEventCategoryDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.AcademicHonorCategoryDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , AcademicHonorCategoryDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT AcademicHonorCategoryDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.AcademicHonorCategoryDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.AcademicSubjectDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , AcademicSubjectDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT AcademicSubjectDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.AcademicSubjectDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.AcademicWeek (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , SchoolHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , SchoolId int NOT NULL
        , WeekIdentifier nvarchar(80) NOT NULL
        -- Attributes
        , BeginDate date NOT NULL
        , EndDate date NOT NULL
        , TotalInstructionalDays int NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        , Id uniqueidentifier NOT NULL
        , LastModifiedDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT AcademicWeek_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.AcademicWeek_AttributesHistory))
    GO
    
    CREATE TABLE edfi.AccommodationDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , AccommodationDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT AccommodationDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.AccommodationDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.Account (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , EducationOrganizationHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , AccountIdentifier nvarchar(50) NOT NULL
        , EducationOrganizationId int NOT NULL
        , FiscalYear int NOT NULL
        -- Attributes
        , AccountName nvarchar(100) NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        , Id uniqueidentifier NOT NULL
        , LastModifiedDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT Account_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.Account_AttributesHistory))
    GO
    
    CREATE TABLE edfi.AccountAccountCode (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , AccountCodeHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT AccountAccountCode_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , AccountCodeHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.AccountabilityRating (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , EducationOrganizationHashKey uniqueIdentifier NOT NULL
        , SchoolYearTypeHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , EducationOrganizationId int NOT NULL
        , RatingTitle nvarchar(60) NOT NULL
        , SchoolYear smallint NOT NULL
        -- Attributes
        , Rating nvarchar(35) NOT NULL
        , RatingDate date NULL
        , RatingOrganization nvarchar(35) NULL
        , RatingProgram nvarchar(30) NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        , Id uniqueidentifier NOT NULL
        , LastModifiedDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT AccountabilityRating_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.AccountabilityRating_AttributesHistory))
    GO
    
    CREATE TABLE edfi.AccountClassificationDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , AccountClassificationDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT AccountClassificationDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.AccountClassificationDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.AccountCode (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , AccountClassificationDescriptorHashKey uniqueIdentifier NOT NULL
        , EducationOrganizationHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , AccountClassificationDescriptorId int NOT NULL
        , AccountCodeNumber nvarchar(50) NOT NULL
        , EducationOrganizationId int NOT NULL
        , FiscalYear int NOT NULL
        -- Attributes
        , AccountCodeDescription nvarchar(1024) NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        , Id uniqueidentifier NOT NULL
        , LastModifiedDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT AccountCode_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.AccountCode_AttributesHistory))
    GO
    
    CREATE TABLE edfi.AchievementCategoryDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , AchievementCategoryDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT AchievementCategoryDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.AchievementCategoryDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.Actual (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , AccountHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , AccountIdentifier nvarchar(50) NOT NULL
        , AsOfDate date NOT NULL
        , EducationOrganizationId int NOT NULL
        , FiscalYear int NOT NULL
        -- Attributes
        , AmountToDate money NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        , Id uniqueidentifier NOT NULL
        , LastModifiedDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT Actual_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.Actual_AttributesHistory))
    GO
    
    CREATE TABLE edfi.AdditionalCreditTypeDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , AdditionalCreditTypeDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT AdditionalCreditTypeDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.AdditionalCreditTypeDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.AddressTypeDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , AddressTypeDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT AddressTypeDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.AddressTypeDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.AdministrationEnvironmentDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , AdministrationEnvironmentDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT AdministrationEnvironmentDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.AdministrationEnvironmentDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.AdministrativeFundingControlDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , AdministrativeFundingControlDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT AdministrativeFundingControlDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.AdministrativeFundingControlDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.Assessment (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        -- Primary key columns
        , AssessmentIdentifier nvarchar(60) NOT NULL
        , Namespace nvarchar(255) NOT NULL
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT Assessment_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.Assessment_AttributesHistory))
    GO
    
    CREATE TABLE edfi.AssessmentAcademicSubject (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , AcademicSubjectDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT AssessmentAcademicSubject_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , AcademicSubjectDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.AssessmentAssessedGradeLevel (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , GradeLevelDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT AssessmentAssessedGradeLevel_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , GradeLevelDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.AssessmentContentStandard (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT AssessmentContentStandard_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.AssessmentContentStandardAuthor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        -- Contextual primary key
        , Author nvarchar(100) NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT AssessmentContentStandardAuthor_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , Author
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.AssessmentIdentificationCode (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , AssessmentIdentificationSystemDescriptorHashKey uniqueIdentifier NOT NULL
        -- Attributes
        , AssigningOrganizationIdentificationCode nvarchar(60) NULL
        , IdentificationCode nvarchar(60) NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT AssessmentIdentificationCode_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , AssessmentIdentificationSystemDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.AssessmentLanguage (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , LanguageDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT AssessmentLanguage_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , LanguageDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.AssessmentPerformanceLevel (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , AssessmentReportingMethodDescriptorHashKey uniqueIdentifier NOT NULL
        , PerformanceLevelDescriptorHashKey uniqueIdentifier NOT NULL
        -- Attributes
        , MaximumScore nvarchar(35) NULL
        , MinimumScore nvarchar(35) NULL
        -- References
        , ResultDatatypeTypeDescriptorHashKey uniqueIdentifier NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT AssessmentPerformanceLevel_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , AssessmentReportingMethodDescriptorHashKey
            , PerformanceLevelDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.AssessmentPeriod (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        -- Attributes
        , BeginDate date NULL
        , EndDate date NULL
        -- References
        , AssessmentPeriodDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT AssessmentPeriod_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.AssessmentPlatformType (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , PlatformTypeDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT AssessmentPlatformType_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , PlatformTypeDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.AssessmentProgram (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , ProgramHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT AssessmentProgram_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , ProgramHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.AssessmentScore (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , AssessmentReportingMethodDescriptorHashKey uniqueIdentifier NOT NULL
        -- Attributes
        , MaximumScore nvarchar(35) NULL
        , MinimumScore nvarchar(35) NULL
        -- References
        , ResultDatatypeTypeDescriptorHashKey uniqueIdentifier NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT AssessmentScore_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , AssessmentReportingMethodDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.AssessmentSection (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , SectionHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT AssessmentSection_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , SectionHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.AssessmentCategoryDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , AssessmentCategoryDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT AssessmentCategoryDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.AssessmentCategoryDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.AssessmentIdentificationSystemDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , AssessmentIdentificationSystemDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT AssessmentIdentificationSystemDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.AssessmentIdentificationSystemDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.AssessmentItem (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , AssessmentHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , AssessmentIdentifier nvarchar(60) NOT NULL
        , IdentificationCode nvarchar(60) NOT NULL
        , Namespace nvarchar(255) NOT NULL
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT AssessmentItem_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.AssessmentItem_AttributesHistory))
    GO
    
    CREATE TABLE edfi.AssessmentItemLearningStandard (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , LearningStandardHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT AssessmentItemLearningStandard_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , LearningStandardHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.AssessmentItemPossibleResponse (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        -- Contextual primary key
        , ResponseValue nvarchar(60) NOT NULL
        -- Attributes
        , CorrectResponse bit NULL
        , ResponseDescription nvarchar(1024) NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT AssessmentItemPossibleResponse_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , ResponseValue
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.AssessmentItemCategoryDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , AssessmentItemCategoryDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT AssessmentItemCategoryDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.AssessmentItemCategoryDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.AssessmentItemResultDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , AssessmentItemResultDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT AssessmentItemResultDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.AssessmentItemResultDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.AssessmentPeriodDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , AssessmentPeriodDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT AssessmentPeriodDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.AssessmentPeriodDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.AssessmentReportingMethodDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , AssessmentReportingMethodDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT AssessmentReportingMethodDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.AssessmentReportingMethodDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.AttemptStatusDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , AttemptStatusDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT AttemptStatusDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.AttemptStatusDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.AttendanceEventCategoryDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , AttendanceEventCategoryDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT AttendanceEventCategoryDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.AttendanceEventCategoryDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.BehaviorDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , BehaviorDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT BehaviorDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.BehaviorDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.BellSchedule (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , SchoolHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , BellScheduleName nvarchar(60) NOT NULL
        , SchoolId int NOT NULL
        -- Attributes
        , AlternateDayName nvarchar(20) NULL
        , EndTime time NULL
        , StartTime time NULL
        , TotalInstructionalTime int NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        , Id uniqueidentifier NOT NULL
        , LastModifiedDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT BellSchedule_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.BellSchedule_AttributesHistory))
    GO
    
    CREATE TABLE edfi.BellScheduleClassPeriod (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , ClassPeriodHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT BellScheduleClassPeriod_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , ClassPeriodHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.BellScheduleDate (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        -- Contextual primary key
        , Date date NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT BellScheduleDate_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , Date
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.BellScheduleGradeLevel (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , GradeLevelDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT BellScheduleGradeLevel_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , GradeLevelDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.Budget (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , AccountHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , AccountIdentifier nvarchar(50) NOT NULL
        , AsOfDate date NOT NULL
        , EducationOrganizationId int NOT NULL
        , FiscalYear int NOT NULL
        -- Attributes
        , Amount money NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        , Id uniqueidentifier NOT NULL
        , LastModifiedDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT Budget_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.Budget_AttributesHistory))
    GO
    
    CREATE TABLE edfi.Calendar (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , SchoolHashKey uniqueIdentifier NOT NULL
        , SchoolYearTypeHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , CalendarCode nvarchar(60) NOT NULL
        , SchoolId int NOT NULL
        , SchoolYear smallint NOT NULL
        -- References
        , CalendarTypeDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        , Id uniqueidentifier NOT NULL
        , LastModifiedDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT Calendar_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.Calendar_AttributesHistory))
    GO
    
    CREATE TABLE edfi.CalendarGradeLevel (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , GradeLevelDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT CalendarGradeLevel_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , GradeLevelDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.CalendarDate (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , CalendarHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , CalendarCode nvarchar(60) NOT NULL
        , Date date NOT NULL
        , SchoolId int NOT NULL
        , SchoolYear smallint NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        , Id uniqueidentifier NOT NULL
        , LastModifiedDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT CalendarDate_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.CalendarDate_AttributesHistory))
    GO
    
    CREATE TABLE edfi.CalendarDateCalendarEvent (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , CalendarEventDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT CalendarDateCalendarEvent_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , CalendarEventDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.CalendarEventDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , CalendarEventDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT CalendarEventDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.CalendarEventDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.CalendarTypeDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , CalendarTypeDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT CalendarTypeDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.CalendarTypeDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.CareerPathwayDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , CareerPathwayDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT CareerPathwayDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.CareerPathwayDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.CharterApprovalAgencyTypeDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , CharterApprovalAgencyTypeDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT CharterApprovalAgencyTypeDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.CharterApprovalAgencyTypeDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.CharterStatusDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , CharterStatusDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT CharterStatusDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.CharterStatusDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.CitizenshipStatusDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , CitizenshipStatusDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT CitizenshipStatusDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.CitizenshipStatusDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.ClassPeriod (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , SchoolHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , ClassPeriodName nvarchar(60) NOT NULL
        , SchoolId int NOT NULL
        -- Attributes
        , OfficialAttendancePeriod bit NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        , Id uniqueidentifier NOT NULL
        , LastModifiedDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT ClassPeriod_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.ClassPeriod_AttributesHistory))
    GO
    
    CREATE TABLE edfi.ClassPeriodMeetingTime (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        -- Contextual primary key
        , EndTime time NOT NULL
        , StartTime time NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT ClassPeriodMeetingTime_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , EndTime
            , StartTime
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.ClassroomPositionDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , ClassroomPositionDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT ClassroomPositionDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.ClassroomPositionDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.Cohort (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , EducationOrganizationHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , CohortIdentifier nvarchar(20) NOT NULL
        , EducationOrganizationId int NOT NULL
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT Cohort_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.Cohort_AttributesHistory))
    GO
    
    CREATE TABLE edfi.CohortProgram (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , ProgramHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT CohortProgram_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , ProgramHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.CohortScopeDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , CohortScopeDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT CohortScopeDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.CohortScopeDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.CohortTypeDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , CohortTypeDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT CohortTypeDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.CohortTypeDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.CohortYearTypeDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , CohortYearTypeDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT CohortYearTypeDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.CohortYearTypeDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.CommunityOrganization (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , EducationOrganizationHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , CommunityOrganizationId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT CommunityOrganization_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.CommunityOrganization_AttributesHistory))
    GO
    
    CREATE TABLE edfi.CommunityProvider (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , EducationOrganizationHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , CommunityProviderId int NOT NULL
        -- Attributes
        , LicenseExemptIndicator bit NULL
        , SchoolIndicator bit NULL
        -- References
        , CommunityOrganizationHashKey uniqueIdentifier NULL
        , ProviderCategoryDescriptorHashKey uniqueIdentifier NOT NULL
        , ProviderProfitabilityDescriptorHashKey uniqueIdentifier NULL
        , ProviderStatusDescriptorHashKey uniqueIdentifier NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT CommunityProvider_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.CommunityProvider_AttributesHistory))
    GO
    
    CREATE TABLE edfi.CommunityProviderLicense (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , CommunityProviderHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , CommunityProviderId int NOT NULL
        , LicenseIdentifier nvarchar(20) NOT NULL
        , LicensingOrganization nvarchar(75) NOT NULL
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT CommunityProviderLicense_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.CommunityProviderLicense_AttributesHistory))
    GO
    
    CREATE TABLE edfi.CompetencyLevelDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , CompetencyLevelDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT CompetencyLevelDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.CompetencyLevelDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.CompetencyObjective (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , EducationOrganizationHashKey uniqueIdentifier NOT NULL
        , ObjectiveGradeLevelDescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , EducationOrganizationId int NOT NULL
        , Objective nvarchar(60) NOT NULL
        , ObjectiveGradeLevelDescriptorId int NOT NULL
        -- Attributes
        , CompetencyObjectiveId nvarchar(60) NULL
        , Description nvarchar(1024) NULL
        , SuccessCriteria nvarchar(150) NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        , Id uniqueidentifier NOT NULL
        , LastModifiedDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT CompetencyObjective_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.CompetencyObjective_AttributesHistory))
    GO
    
    CREATE TABLE edfi.ContactTypeDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , ContactTypeDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT ContactTypeDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.ContactTypeDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.ContentClassDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , ContentClassDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT ContentClassDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.ContentClassDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.ContinuationOfServicesReasonDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , ContinuationOfServicesReasonDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT ContinuationOfServicesReasonDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.ContinuationOfServicesReasonDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.ContractedStaff (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , AccountHashKey uniqueIdentifier NOT NULL
        , StaffHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , AccountIdentifier nvarchar(50) NOT NULL
        , AsOfDate date NOT NULL
        , EducationOrganizationId int NOT NULL
        , FiscalYear int NOT NULL
        , StaffUSI int NOT NULL
        -- Attributes
        , AmountToDate money NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        , Id uniqueidentifier NOT NULL
        , LastModifiedDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT ContractedStaff_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.ContractedStaff_AttributesHistory))
    GO
    
    CREATE TABLE edfi.CostRateDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , CostRateDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT CostRateDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.CostRateDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.CountryDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , CountryDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT CountryDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.CountryDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.Course (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , EducationOrganizationHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , CourseCode nvarchar(60) NOT NULL
        , EducationOrganizationId int NOT NULL
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT Course_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.Course_AttributesHistory))
    GO
    
    CREATE TABLE edfi.CourseCompetencyLevel (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , CompetencyLevelDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT CourseCompetencyLevel_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , CompetencyLevelDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.CourseIdentificationCode (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , CourseIdentificationSystemDescriptorHashKey uniqueIdentifier NOT NULL
        -- Attributes
        , AssigningOrganizationIdentificationCode nvarchar(60) NULL
        , CourseCatalogURL nvarchar(255) NULL
        , IdentificationCode nvarchar(60) NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT CourseIdentificationCode_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , CourseIdentificationSystemDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.CourseLearningObjective (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , LearningObjectiveHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT CourseLearningObjective_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , LearningObjectiveHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.CourseLearningStandard (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , LearningStandardHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT CourseLearningStandard_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , LearningStandardHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.CourseLevelCharacteristic (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , CourseLevelCharacteristicDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT CourseLevelCharacteristic_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , CourseLevelCharacteristicDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.CourseOfferedGradeLevel (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , GradeLevelDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT CourseOfferedGradeLevel_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , GradeLevelDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.CourseAttemptResultDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , CourseAttemptResultDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT CourseAttemptResultDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.CourseAttemptResultDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.CourseDefinedByDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , CourseDefinedByDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT CourseDefinedByDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.CourseDefinedByDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.CourseGPAApplicabilityDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , CourseGPAApplicabilityDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT CourseGPAApplicabilityDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.CourseGPAApplicabilityDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.CourseIdentificationSystemDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , CourseIdentificationSystemDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT CourseIdentificationSystemDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.CourseIdentificationSystemDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.CourseLevelCharacteristicDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , CourseLevelCharacteristicDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT CourseLevelCharacteristicDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.CourseLevelCharacteristicDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.CourseOffering (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , SchoolHashKey uniqueIdentifier NOT NULL
        , SessionHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , LocalCourseCode nvarchar(60) NOT NULL
        , SchoolId int NOT NULL
        , SchoolYear smallint NOT NULL
        , SessionName nvarchar(60) NOT NULL
        -- Attributes
        , InstructionalTimePlanned int NULL
        , LocalCourseTitle nvarchar(60) NULL
        -- References
        , CourseHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        , Id uniqueidentifier NOT NULL
        , LastModifiedDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT CourseOffering_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.CourseOffering_AttributesHistory))
    GO
    
    CREATE TABLE edfi.CourseOfferingCourseLevelCharacteristic (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , CourseLevelCharacteristicDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT CourseOfferingCourseLevelCharacteristic_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , CourseLevelCharacteristicDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.CourseOfferingCurriculumUsed (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , CurriculumUsedDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT CourseOfferingCurriculumUsed_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , CurriculumUsedDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.CourseOfferingOfferedGradeLevel (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , GradeLevelDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT CourseOfferingOfferedGradeLevel_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , GradeLevelDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.CourseRepeatCodeDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , CourseRepeatCodeDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT CourseRepeatCodeDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.CourseRepeatCodeDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.CourseTranscript (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , CourseHashKey uniqueIdentifier NOT NULL
        , CourseAttemptResultDescriptorHashKey uniqueIdentifier NOT NULL
        , StudentAcademicRecordHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , CourseAttemptResultDescriptorId int NOT NULL
        , CourseCode nvarchar(60) NOT NULL
        , CourseEducationOrganizationId int NOT NULL
        , EducationOrganizationId int NOT NULL
        , SchoolYear smallint NOT NULL
        , StudentUSI int NOT NULL
        , TermDescriptorId int NOT NULL
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT CourseTranscript_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.CourseTranscript_AttributesHistory))
    GO
    
    CREATE TABLE edfi.CourseTranscriptAcademicSubject (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , AcademicSubjectDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT CourseTranscriptAcademicSubject_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , AcademicSubjectDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.CourseTranscriptAlternativeCourseIdentificationCode (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , CourseIdentificationSystemDescriptorHashKey uniqueIdentifier NOT NULL
        -- Attributes
        , AssigningOrganizationIdentificationCode nvarchar(60) NULL
        , CourseCatalogURL nvarchar(255) NULL
        , IdentificationCode nvarchar(60) NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT CourseTranscriptAlternativeCourseIdentificationCode_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , CourseIdentificationSystemDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.CourseTranscriptCreditCategory (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , CreditCategoryDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT CourseTranscriptCreditCategory_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , CreditCategoryDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.CourseTranscriptEarnedAdditionalCredits (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , AdditionalCreditTypeDescriptorHashKey uniqueIdentifier NOT NULL
        -- Attributes
        , Credits decimal(9,3) NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT CourseTranscriptEarnedAdditionalCredits_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , AdditionalCreditTypeDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.Credential (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , StateOfIssueStateAbbreviationDescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , CredentialIdentifier nvarchar(60) NOT NULL
        , StateOfIssueStateAbbreviationDescriptorId int NOT NULL
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT Credential_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.Credential_AttributesHistory))
    GO
    
    CREATE TABLE edfi.CredentialAcademicSubject (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , AcademicSubjectDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT CredentialAcademicSubject_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , AcademicSubjectDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.CredentialEndorsement (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        -- Contextual primary key
        , CredentialEndorsement nvarchar(255) NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT CredentialEndorsement_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , CredentialEndorsement
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.CredentialGradeLevel (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , GradeLevelDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT CredentialGradeLevel_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , GradeLevelDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.CredentialFieldDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , CredentialFieldDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT CredentialFieldDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.CredentialFieldDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.CredentialTypeDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , CredentialTypeDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT CredentialTypeDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.CredentialTypeDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.CreditCategoryDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , CreditCategoryDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT CreditCategoryDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.CreditCategoryDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.CreditTypeDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , CreditTypeDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT CreditTypeDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.CreditTypeDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.CTEProgramServiceDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , CTEProgramServiceDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT CTEProgramServiceDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.CTEProgramServiceDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.CurriculumUsedDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , CurriculumUsedDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT CurriculumUsedDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.CurriculumUsedDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.DeliveryMethodDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , DeliveryMethodDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT DeliveryMethodDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.DeliveryMethodDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.Descriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        -- Primary key columns
        , DescriptorId int NOT NULL
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT Descriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.Descriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.DiagnosisDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , DiagnosisDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT DiagnosisDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.DiagnosisDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.DiplomaLevelDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , DiplomaLevelDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT DiplomaLevelDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.DiplomaLevelDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.DiplomaTypeDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , DiplomaTypeDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT DiplomaTypeDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.DiplomaTypeDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.DisabilityDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , DisabilityDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT DisabilityDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.DisabilityDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.DisabilityDesignationDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , DisabilityDesignationDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT DisabilityDesignationDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.DisabilityDesignationDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.DisabilityDeterminationSourceTypeDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , DisabilityDeterminationSourceTypeDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT DisabilityDeterminationSourceTypeDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.DisabilityDeterminationSourceTypeDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.DisciplineAction (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , StudentHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , DisciplineActionIdentifier nvarchar(20) NOT NULL
        , DisciplineDate date NOT NULL
        , StudentUSI int NOT NULL
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT DisciplineAction_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.DisciplineAction_AttributesHistory))
    GO
    
    CREATE TABLE edfi.DisciplineActionDiscipline (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , DisciplineDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT DisciplineActionDiscipline_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , DisciplineDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.DisciplineActionStaff (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , StaffHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT DisciplineActionStaff_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , StaffHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.DisciplineActionStudentDisciplineIncidentAssociation (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , StudentDisciplineIncidentAssociationHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT DisciplineActionStudentDisciplineIncidentAssociation_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , StudentDisciplineIncidentAssociationHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.DisciplineActionLengthDifferenceReasonDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , DisciplineActionLengthDifferenceReasonDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT DisciplineActionLengthDifferenceReasonDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.DisciplineActionLengthDifferenceReasonDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.DisciplineDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , DisciplineDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT DisciplineDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.DisciplineDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.DisciplineIncident (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , SchoolHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , IncidentIdentifier nvarchar(20) NOT NULL
        , SchoolId int NOT NULL
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT DisciplineIncident_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.DisciplineIncident_AttributesHistory))
    GO
    
    CREATE TABLE edfi.DisciplineIncidentBehavior (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , BehaviorDescriptorHashKey uniqueIdentifier NOT NULL
        -- Attributes
        , BehaviorDetailedDescription nvarchar(1024) NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT DisciplineIncidentBehavior_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , BehaviorDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.DisciplineIncidentExternalParticipant (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , DisciplineIncidentParticipationCodeDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        , FirstName nvarchar(75) NOT NULL
        , LastSurname nvarchar(75) NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT DisciplineIncidentExternalParticipant_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , DisciplineIncidentParticipationCodeDescriptorHashKey
            , FirstName
            , LastSurname
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.DisciplineIncidentWeapon (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , WeaponDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT DisciplineIncidentWeapon_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , WeaponDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.DisciplineIncidentParticipationCodeDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , DisciplineIncidentParticipationCodeDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT DisciplineIncidentParticipationCodeDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.DisciplineIncidentParticipationCodeDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.EducationalEnvironmentDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , EducationalEnvironmentDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT EducationalEnvironmentDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.EducationalEnvironmentDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.EducationContent (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        -- Primary key columns
        , ContentIdentifier nvarchar(225) NOT NULL
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT EducationContent_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.EducationContent_AttributesHistory))
    GO
    
    CREATE TABLE edfi.EducationContentAppropriateGradeLevel (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , GradeLevelDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT EducationContentAppropriateGradeLevel_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , GradeLevelDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.EducationContentAppropriateSex (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , SexDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT EducationContentAppropriateSex_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , SexDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.EducationContentAuthor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        -- Contextual primary key
        , Author nvarchar(100) NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT EducationContentAuthor_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , Author
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.EducationContentDerivativeSourceEducationContent (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT EducationContentDerivativeSourceEducationContent_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.EducationContentDerivativeSourceLearningResourceMetadataURI (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        -- Contextual primary key
        , DerivativeSourceLearningResourceMetadataURI nvarchar(255) NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT EducationContentDerivativeSourceLearningResourceMetadataURI_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , DerivativeSourceLearningResourceMetadataURI
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.EducationContentDerivativeSourceURI (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        -- Contextual primary key
        , DerivativeSourceURI nvarchar(255) NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT EducationContentDerivativeSourceURI_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , DerivativeSourceURI
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.EducationContentLanguage (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , LanguageDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT EducationContentLanguage_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , LanguageDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.EducationOrganization (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        -- Primary key columns
        , EducationOrganizationId int NOT NULL
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT EducationOrganization_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.EducationOrganization_AttributesHistory))
    GO
    
    CREATE TABLE edfi.EducationOrganizationAddress (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT EducationOrganizationAddress_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , AddressTypeDescriptorHashKey
            , StateAbbreviationDescriptorHashKey
            , City
            , PostalCode
            , StreetNumberName
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.EducationOrganizationAddressPeriod (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        -- Contextual primary key
        , BeginDate date NOT NULL
        -- Attributes
        , EndDate date NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT EducationOrganizationAddressPeriod_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , BeginDate
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.EducationOrganizationCategory (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , EducationOrganizationCategoryDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT EducationOrganizationCategory_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , EducationOrganizationCategoryDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.EducationOrganizationIdentificationCode (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , EducationOrganizationIdentificationSystemDescriptorHashKey uniqueIdentifier NOT NULL
        -- Attributes
        , IdentificationCode nvarchar(60) NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT EducationOrganizationIdentificationCode_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , EducationOrganizationIdentificationSystemDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.EducationOrganizationIndicator (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , IndicatorDescriptorHashKey uniqueIdentifier NOT NULL
        -- Attributes
        , DesignatedBy nvarchar(60) NULL
        , IndicatorValue nvarchar(35) NULL
        -- References
        , IndicatorGroupDescriptorHashKey uniqueIdentifier NULL
        , IndicatorLevelDescriptorHashKey uniqueIdentifier NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT EducationOrganizationIndicator_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , IndicatorDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.EducationOrganizationIndicatorPeriod (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        -- Contextual primary key
        , BeginDate date NOT NULL
        -- Attributes
        , EndDate date NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT EducationOrganizationIndicatorPeriod_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , BeginDate
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.EducationOrganizationInstitutionTelephone (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , InstitutionTelephoneNumberTypeDescriptorHashKey uniqueIdentifier NOT NULL
        -- Attributes
        , TelephoneNumber nvarchar(24) NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT EducationOrganizationInstitutionTelephone_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , InstitutionTelephoneNumberTypeDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.EducationOrganizationInternationalAddress (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , AddressTypeDescriptorHashKey uniqueIdentifier NOT NULL
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT EducationOrganizationInternationalAddress_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , AddressTypeDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.EducationOrganizationCategoryDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , EducationOrganizationCategoryDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT EducationOrganizationCategoryDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.EducationOrganizationCategoryDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.EducationOrganizationIdentificationSystemDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , EducationOrganizationIdentificationSystemDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT EducationOrganizationIdentificationSystemDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.EducationOrganizationIdentificationSystemDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.EducationOrganizationInterventionPrescriptionAssociation (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , EducationOrganizationHashKey uniqueIdentifier NOT NULL
        , InterventionPrescriptionHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , EducationOrganizationId int NOT NULL
        , InterventionPrescriptionEducationOrganizationId int NOT NULL
        , InterventionPrescriptionIdentificationCode nvarchar(60) NOT NULL
        -- Attributes
        , BeginDate date NULL
        , EndDate date NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        , Id uniqueidentifier NOT NULL
        , LastModifiedDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT EducationOrganizationInterventionPrescriptionAssociation_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.EducationOrganizationInterventionPrescriptionAssociation_AttributesHistory))
    GO
    
    CREATE TABLE edfi.EducationOrganizationNetwork (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , EducationOrganizationHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , EducationOrganizationNetworkId int NOT NULL
        -- References
        , NetworkPurposeDescriptorHashKey uniqueIdentifier NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT EducationOrganizationNetwork_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.EducationOrganizationNetwork_AttributesHistory))
    GO
    
    CREATE TABLE edfi.EducationOrganizationNetworkAssociation (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , MemberEducationOrganizationHashKey uniqueIdentifier NOT NULL
        , EducationOrganizationNetworkHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , EducationOrganizationNetworkId int NOT NULL
        , MemberEducationOrganizationId int NOT NULL
        -- Attributes
        , BeginDate date NULL
        , EndDate date NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        , Id uniqueidentifier NOT NULL
        , LastModifiedDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT EducationOrganizationNetworkAssociation_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.EducationOrganizationNetworkAssociation_AttributesHistory))
    GO
    
    CREATE TABLE edfi.EducationOrganizationPeerAssociation (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , EducationOrganizationHashKey uniqueIdentifier NOT NULL
        , PeerEducationOrganizationHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , EducationOrganizationId int NOT NULL
        , PeerEducationOrganizationId int NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        , Id uniqueidentifier NOT NULL
        , LastModifiedDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT EducationOrganizationPeerAssociation_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.EducationOrganizationPeerAssociation_AttributesHistory))
    GO
    
    CREATE TABLE edfi.EducationPlanDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , EducationPlanDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT EducationPlanDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.EducationPlanDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.EducationServiceCenter (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , EducationOrganizationHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , EducationServiceCenterId int NOT NULL
        -- References
        , StateEducationAgencyHashKey uniqueIdentifier NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT EducationServiceCenter_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.EducationServiceCenter_AttributesHistory))
    GO
    
    CREATE TABLE edfi.ElectronicMailTypeDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , ElectronicMailTypeDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT ElectronicMailTypeDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.ElectronicMailTypeDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.EmploymentStatusDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , EmploymentStatusDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT EmploymentStatusDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.EmploymentStatusDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.EntryGradeLevelReasonDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , EntryGradeLevelReasonDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT EntryGradeLevelReasonDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.EntryGradeLevelReasonDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.EntryTypeDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , EntryTypeDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT EntryTypeDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.EntryTypeDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.EventCircumstanceDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , EventCircumstanceDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT EventCircumstanceDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.EventCircumstanceDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.ExitWithdrawTypeDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , ExitWithdrawTypeDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT ExitWithdrawTypeDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.ExitWithdrawTypeDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.FeederSchoolAssociation (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , FeederSchoolHashKey uniqueIdentifier NOT NULL
        , SchoolHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , BeginDate date NOT NULL
        , FeederSchoolId int NOT NULL
        , SchoolId int NOT NULL
        -- Attributes
        , EndDate date NULL
        , FeederRelationshipDescription nvarchar(1024) NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        , Id uniqueidentifier NOT NULL
        , LastModifiedDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT FeederSchoolAssociation_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.FeederSchoolAssociation_AttributesHistory))
    GO
    
    CREATE TABLE edfi.GeneralStudentProgramAssociation (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , EducationOrganizationHashKey uniqueIdentifier NOT NULL
        , ProgramHashKey uniqueIdentifier NOT NULL
        , StudentHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , BeginDate date NOT NULL
        , EducationOrganizationId int NOT NULL
        , ProgramEducationOrganizationId int NOT NULL
        , ProgramName nvarchar(60) NOT NULL
        , ProgramTypeDescriptorId int NOT NULL
        , StudentUSI int NOT NULL
        -- Attributes
        , EndDate date NULL
        , ServedOutsideOfRegularSession bit NULL
        -- References
        , ReasonExitedDescriptorHashKey uniqueIdentifier NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        , Id uniqueidentifier NOT NULL
        , LastModifiedDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT GeneralStudentProgramAssociation_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.GeneralStudentProgramAssociation_AttributesHistory))
    GO
    
    CREATE TABLE edfi.GeneralStudentProgramAssociationParticipationStatus (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        -- Attributes
        , DesignatedBy nvarchar(60) NULL
        , StatusBeginDate date NULL
        , StatusEndDate date NULL
        -- References
        , ParticipationStatusDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT GeneralStudentProgramAssociationParticipationStatus_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.Grade (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , GradeTypeDescriptorHashKey uniqueIdentifier NOT NULL
        , GradingPeriodHashKey uniqueIdentifier NOT NULL
        , StudentSectionAssociationHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , BeginDate date NOT NULL
        , GradeTypeDescriptorId int NOT NULL
        , GradingPeriodDescriptorId int NOT NULL
        , GradingPeriodSchoolYear smallint NOT NULL
        , GradingPeriodSequence int NOT NULL
        , LocalCourseCode nvarchar(60) NOT NULL
        , SchoolId int NOT NULL
        , SchoolYear smallint NOT NULL
        , SectionIdentifier nvarchar(255) NOT NULL
        , SessionName nvarchar(60) NOT NULL
        , StudentUSI int NOT NULL
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT Grade_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.Grade_AttributesHistory))
    GO
    
    CREATE TABLE edfi.GradeLearningStandardGrade (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , LearningStandardHashKey uniqueIdentifier NOT NULL
        -- Attributes
        , DiagnosticStatement nvarchar(1024) NULL
        , LetterGradeEarned nvarchar(20) NULL
        , NumericGradeEarned decimal(9,2) NULL
        -- References
        , PerformanceBaseConversionDescriptorHashKey uniqueIdentifier NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT GradeLearningStandardGrade_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , LearningStandardHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.GradebookEntry (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , SectionHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , DateAssigned date NOT NULL
        , GradebookEntryTitle nvarchar(60) NOT NULL
        , LocalCourseCode nvarchar(60) NOT NULL
        , SchoolId int NOT NULL
        , SchoolYear smallint NOT NULL
        , SectionIdentifier nvarchar(255) NOT NULL
        , SessionName nvarchar(60) NOT NULL
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT GradebookEntry_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.GradebookEntry_AttributesHistory))
    GO
    
    CREATE TABLE edfi.GradebookEntryLearningObjective (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , LearningObjectiveHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT GradebookEntryLearningObjective_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , LearningObjectiveHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.GradebookEntryLearningStandard (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , LearningStandardHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT GradebookEntryLearningStandard_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , LearningStandardHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.GradebookEntryTypeDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , GradebookEntryTypeDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT GradebookEntryTypeDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.GradebookEntryTypeDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.GradeLevelDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , GradeLevelDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT GradeLevelDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.GradeLevelDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.GradePointAverageTypeDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , GradePointAverageTypeDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT GradePointAverageTypeDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.GradePointAverageTypeDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.GradeTypeDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , GradeTypeDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT GradeTypeDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.GradeTypeDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.GradingPeriod (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , GradingPeriodDescriptorHashKey uniqueIdentifier NOT NULL
        , SchoolHashKey uniqueIdentifier NOT NULL
        , SchoolYearTypeHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , GradingPeriodDescriptorId int NOT NULL
        , PeriodSequence int NOT NULL
        , SchoolId int NOT NULL
        , SchoolYear smallint NOT NULL
        -- Attributes
        , BeginDate date NOT NULL
        , EndDate date NOT NULL
        , TotalInstructionalDays int NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        , Id uniqueidentifier NOT NULL
        , LastModifiedDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT GradingPeriod_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.GradingPeriod_AttributesHistory))
    GO
    
    CREATE TABLE edfi.GradingPeriodDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , GradingPeriodDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT GradingPeriodDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.GradingPeriodDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.GraduationPlan (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , EducationOrganizationHashKey uniqueIdentifier NOT NULL
        , GraduationPlanTypeDescriptorHashKey uniqueIdentifier NOT NULL
        , GraduationSchoolYearTypeHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , EducationOrganizationId int NOT NULL
        , GraduationPlanTypeDescriptorId int NOT NULL
        , GraduationSchoolYear smallint NOT NULL
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT GraduationPlan_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.GraduationPlan_AttributesHistory))
    GO
    
    CREATE TABLE edfi.GraduationPlanCreditsByCourse (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT GraduationPlanCreditsByCourse_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , CourseSetName
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.GraduationPlanCreditsByCourseCourse (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , CourseHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT GraduationPlanCreditsByCourseCourse_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , CourseHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.GraduationPlanCreditsByCreditCategory (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , CreditCategoryDescriptorHashKey uniqueIdentifier NOT NULL
        -- Attributes
        , CreditConversion decimal(9,2) NULL
        , Credits decimal(9,3) NOT NULL
        -- References
        , CreditTypeDescriptorHashKey uniqueIdentifier NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT GraduationPlanCreditsByCreditCategory_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , CreditCategoryDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.GraduationPlanCreditsBySubject (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , AcademicSubjectDescriptorHashKey uniqueIdentifier NOT NULL
        -- Attributes
        , CreditConversion decimal(9,2) NULL
        , Credits decimal(9,3) NOT NULL
        -- References
        , CreditTypeDescriptorHashKey uniqueIdentifier NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT GraduationPlanCreditsBySubject_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , AcademicSubjectDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.GraduationPlanRequiredAssessment (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , AssessmentHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT GraduationPlanRequiredAssessment_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , AssessmentHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.GraduationPlanRequiredAssessmentPerformanceLevel (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        -- Attributes
        , MaximumScore nvarchar(35) NULL
        , MinimumScore nvarchar(35) NULL
        -- References
        , AssessmentReportingMethodDescriptorHashKey uniqueIdentifier NOT NULL
        , PerformanceLevelDescriptorHashKey uniqueIdentifier NOT NULL
        , ResultDatatypeTypeDescriptorHashKey uniqueIdentifier NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT GraduationPlanRequiredAssessmentPerformanceLevel_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.GraduationPlanRequiredAssessmentScore (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , AssessmentReportingMethodDescriptorHashKey uniqueIdentifier NOT NULL
        -- Attributes
        , MaximumScore nvarchar(35) NULL
        , MinimumScore nvarchar(35) NULL
        -- References
        , ResultDatatypeTypeDescriptorHashKey uniqueIdentifier NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT GraduationPlanRequiredAssessmentScore_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , AssessmentReportingMethodDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.GraduationPlanTypeDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , GraduationPlanTypeDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT GraduationPlanTypeDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.GraduationPlanTypeDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.GunFreeSchoolsActReportingStatusDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , GunFreeSchoolsActReportingStatusDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT GunFreeSchoolsActReportingStatusDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.GunFreeSchoolsActReportingStatusDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.HomelessPrimaryNighttimeResidenceDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , HomelessPrimaryNighttimeResidenceDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT HomelessPrimaryNighttimeResidenceDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.HomelessPrimaryNighttimeResidenceDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.HomelessProgramServiceDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , HomelessProgramServiceDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT HomelessProgramServiceDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.HomelessProgramServiceDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.IdentificationDocumentUseDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , IdentificationDocumentUseDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT IdentificationDocumentUseDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.IdentificationDocumentUseDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.IncidentLocationDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , IncidentLocationDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT IncidentLocationDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.IncidentLocationDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.IndicatorDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , IndicatorDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT IndicatorDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.IndicatorDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.IndicatorGroupDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , IndicatorGroupDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT IndicatorGroupDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.IndicatorGroupDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.IndicatorLevelDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , IndicatorLevelDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT IndicatorLevelDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.IndicatorLevelDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.InstitutionTelephoneNumberTypeDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , InstitutionTelephoneNumberTypeDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT InstitutionTelephoneNumberTypeDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.InstitutionTelephoneNumberTypeDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.InteractivityStyleDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , InteractivityStyleDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT InteractivityStyleDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.InteractivityStyleDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.InternetAccessDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , InternetAccessDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT InternetAccessDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.InternetAccessDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.Intervention (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , EducationOrganizationHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , EducationOrganizationId int NOT NULL
        , InterventionIdentificationCode nvarchar(60) NOT NULL
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT Intervention_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.Intervention_AttributesHistory))
    GO
    
    CREATE TABLE edfi.InterventionAppropriateGradeLevel (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , GradeLevelDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT InterventionAppropriateGradeLevel_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , GradeLevelDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.InterventionAppropriateSex (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , SexDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT InterventionAppropriateSex_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , SexDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.InterventionDiagnosis (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , DiagnosisDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT InterventionDiagnosis_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , DiagnosisDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.InterventionEducationContent (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , EducationContentHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT InterventionEducationContent_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , EducationContentHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.InterventionInterventionPrescription (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , InterventionPrescriptionHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT InterventionInterventionPrescription_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , InterventionPrescriptionHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.InterventionLearningResourceMetadataURI (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        -- Contextual primary key
        , LearningResourceMetadataURI nvarchar(255) NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT InterventionLearningResourceMetadataURI_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , LearningResourceMetadataURI
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.InterventionMeetingTime (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        -- Contextual primary key
        , EndTime time NOT NULL
        , StartTime time NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT InterventionMeetingTime_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , EndTime
            , StartTime
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.InterventionPopulationServed (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , PopulationServedDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT InterventionPopulationServed_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , PopulationServedDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.InterventionStaff (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , StaffHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT InterventionStaff_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , StaffHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.InterventionURI (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        -- Contextual primary key
        , URI nvarchar(255) NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT InterventionURI_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , URI
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.InterventionClassDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , InterventionClassDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT InterventionClassDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.InterventionClassDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.InterventionEffectivenessRatingDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , InterventionEffectivenessRatingDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT InterventionEffectivenessRatingDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.InterventionEffectivenessRatingDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.InterventionPrescription (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , EducationOrganizationHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , EducationOrganizationId int NOT NULL
        , InterventionPrescriptionIdentificationCode nvarchar(60) NOT NULL
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT InterventionPrescription_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.InterventionPrescription_AttributesHistory))
    GO
    
    CREATE TABLE edfi.InterventionPrescriptionAppropriateGradeLevel (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , GradeLevelDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT InterventionPrescriptionAppropriateGradeLevel_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , GradeLevelDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.InterventionPrescriptionAppropriateSex (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , SexDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT InterventionPrescriptionAppropriateSex_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , SexDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.InterventionPrescriptionDiagnosis (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , DiagnosisDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT InterventionPrescriptionDiagnosis_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , DiagnosisDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.InterventionPrescriptionEducationContent (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , EducationContentHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT InterventionPrescriptionEducationContent_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , EducationContentHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.InterventionPrescriptionLearningResourceMetadataURI (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        -- Contextual primary key
        , LearningResourceMetadataURI nvarchar(255) NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT InterventionPrescriptionLearningResourceMetadataURI_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , LearningResourceMetadataURI
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.InterventionPrescriptionPopulationServed (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , PopulationServedDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT InterventionPrescriptionPopulationServed_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , PopulationServedDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.InterventionPrescriptionURI (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        -- Contextual primary key
        , URI nvarchar(255) NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT InterventionPrescriptionURI_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , URI
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.InterventionStudy (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , EducationOrganizationHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , EducationOrganizationId int NOT NULL
        , InterventionStudyIdentificationCode nvarchar(60) NOT NULL
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT InterventionStudy_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.InterventionStudy_AttributesHistory))
    GO
    
    CREATE TABLE edfi.InterventionStudyAppropriateGradeLevel (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , GradeLevelDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT InterventionStudyAppropriateGradeLevel_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , GradeLevelDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.InterventionStudyAppropriateSex (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , SexDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT InterventionStudyAppropriateSex_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , SexDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.InterventionStudyEducationContent (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , EducationContentHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT InterventionStudyEducationContent_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , EducationContentHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.InterventionStudyInterventionEffectiveness (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , DiagnosisDescriptorHashKey uniqueIdentifier NOT NULL
        , GradeLevelDescriptorHashKey uniqueIdentifier NOT NULL
        , PopulationServedDescriptorHashKey uniqueIdentifier NOT NULL
        -- Attributes
        , ImprovementIndex int NULL
        -- References
        , InterventionEffectivenessRatingDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT InterventionStudyInterventionEffectiveness_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , DiagnosisDescriptorHashKey
            , GradeLevelDescriptorHashKey
            , PopulationServedDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.InterventionStudyLearningResourceMetadataURI (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        -- Contextual primary key
        , LearningResourceMetadataURI nvarchar(255) NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT InterventionStudyLearningResourceMetadataURI_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , LearningResourceMetadataURI
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.InterventionStudyPopulationServed (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , PopulationServedDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT InterventionStudyPopulationServed_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , PopulationServedDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.InterventionStudyStateAbbreviation (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , StateAbbreviationDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT InterventionStudyStateAbbreviation_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , StateAbbreviationDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.InterventionStudyURI (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        -- Contextual primary key
        , URI nvarchar(255) NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT InterventionStudyURI_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , URI
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.LanguageDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , LanguageDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT LanguageDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.LanguageDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.LanguageInstructionProgramServiceDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , LanguageInstructionProgramServiceDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT LanguageInstructionProgramServiceDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.LanguageInstructionProgramServiceDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.LanguageUseDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , LanguageUseDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT LanguageUseDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.LanguageUseDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.LearningObjective (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        -- Primary key columns
        , LearningObjectiveId nvarchar(60) NOT NULL
        , Namespace nvarchar(255) NOT NULL
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT LearningObjective_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.LearningObjective_AttributesHistory))
    GO
    
    CREATE TABLE edfi.LearningObjectiveAcademicSubject (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , AcademicSubjectDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT LearningObjectiveAcademicSubject_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , AcademicSubjectDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.LearningObjectiveContentStandard (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT LearningObjectiveContentStandard_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.LearningObjectiveContentStandardAuthor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        -- Contextual primary key
        , Author nvarchar(100) NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT LearningObjectiveContentStandardAuthor_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , Author
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.LearningObjectiveGradeLevel (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , GradeLevelDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT LearningObjectiveGradeLevel_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , GradeLevelDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.LearningObjectiveLearningStandard (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , LearningStandardHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT LearningObjectiveLearningStandard_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , LearningStandardHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.LearningStandard (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        -- Primary key columns
        , LearningStandardId nvarchar(60) NOT NULL
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT LearningStandard_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.LearningStandard_AttributesHistory))
    GO
    
    CREATE TABLE edfi.LearningStandardAcademicSubject (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , AcademicSubjectDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT LearningStandardAcademicSubject_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , AcademicSubjectDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.LearningStandardContentStandard (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT LearningStandardContentStandard_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.LearningStandardContentStandardAuthor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        -- Contextual primary key
        , Author nvarchar(100) NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT LearningStandardContentStandardAuthor_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , Author
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.LearningStandardGradeLevel (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , GradeLevelDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT LearningStandardGradeLevel_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , GradeLevelDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.LearningStandardIdentificationCode (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        -- Contextual primary key
        , ContentStandardName nvarchar(65) NOT NULL
        , IdentificationCode nvarchar(60) NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT LearningStandardIdentificationCode_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , ContentStandardName
            , IdentificationCode
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.LearningStandardPrerequisiteLearningStandard (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT LearningStandardPrerequisiteLearningStandard_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.LearningStandardCategoryDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , LearningStandardCategoryDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT LearningStandardCategoryDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.LearningStandardCategoryDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.LearningStandardEquivalenceAssociation (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , SourceLearningStandardHashKey uniqueIdentifier NOT NULL
        , TargetLearningStandardHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , Namespace nvarchar(255) NOT NULL
        , SourceLearningStandardId nvarchar(60) NOT NULL
        , TargetLearningStandardId nvarchar(60) NOT NULL
        -- Attributes
        , EffectiveDate date NULL
        , LearningStandardEquivalenceStrengthDescription nvarchar(255) NULL
        -- References
        , LearningStandardEquivalenceStrengthDescriptorHashKey uniqueIdentifier NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        , Id uniqueidentifier NOT NULL
        , LastModifiedDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT LearningStandardEquivalenceAssociation_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.LearningStandardEquivalenceAssociation_AttributesHistory))
    GO
    
    CREATE TABLE edfi.LearningStandardEquivalenceStrengthDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , LearningStandardEquivalenceStrengthDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT LearningStandardEquivalenceStrengthDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.LearningStandardEquivalenceStrengthDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.LearningStandardScopeDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , LearningStandardScopeDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT LearningStandardScopeDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.LearningStandardScopeDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.LevelOfEducationDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , LevelOfEducationDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT LevelOfEducationDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.LevelOfEducationDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.LicenseStatusDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , LicenseStatusDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT LicenseStatusDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.LicenseStatusDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.LicenseTypeDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , LicenseTypeDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT LicenseTypeDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.LicenseTypeDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.LimitedEnglishProficiencyDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , LimitedEnglishProficiencyDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT LimitedEnglishProficiencyDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.LimitedEnglishProficiencyDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.LocaleDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , LocaleDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT LocaleDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.LocaleDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.LocalEducationAgency (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , EducationOrganizationHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , LocalEducationAgencyId int NOT NULL
        -- References
        , ParentLocalEducationAgencyHashKey uniqueIdentifier NULL
        , CharterStatusDescriptorHashKey uniqueIdentifier NULL
        , EducationServiceCenterHashKey uniqueIdentifier NULL
        , LocalEducationAgencyCategoryDescriptorHashKey uniqueIdentifier NOT NULL
        , StateEducationAgencyHashKey uniqueIdentifier NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT LocalEducationAgency_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.LocalEducationAgency_AttributesHistory))
    GO
    
    CREATE TABLE edfi.LocalEducationAgencyAccountability (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , SchoolYearTypeHashKey uniqueIdentifier NOT NULL
        -- References
        , GunFreeSchoolsActReportingStatusDescriptorHashKey uniqueIdentifier NULL
        , SchoolChoiceImplementStatusDescriptorHashKey uniqueIdentifier NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT LocalEducationAgencyAccountability_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , SchoolYearTypeHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.LocalEducationAgencyFederalFunds (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT LocalEducationAgencyFederalFunds_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , FiscalYear
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.LocalEducationAgencyCategoryDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , LocalEducationAgencyCategoryDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT LocalEducationAgencyCategoryDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.LocalEducationAgencyCategoryDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.Location (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , SchoolHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , ClassroomIdentificationCode nvarchar(60) NOT NULL
        , SchoolId int NOT NULL
        -- Attributes
        , MaximumNumberOfSeats int NULL
        , OptimalNumberOfSeats int NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        , Id uniqueidentifier NOT NULL
        , LastModifiedDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT Location_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.Location_AttributesHistory))
    GO
    
    CREATE TABLE edfi.MagnetSpecialProgramEmphasisSchoolDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , MagnetSpecialProgramEmphasisSchoolDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT MagnetSpecialProgramEmphasisSchoolDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.MagnetSpecialProgramEmphasisSchoolDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.MediumOfInstructionDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , MediumOfInstructionDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT MediumOfInstructionDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.MediumOfInstructionDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.MethodCreditEarnedDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , MethodCreditEarnedDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT MethodCreditEarnedDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.MethodCreditEarnedDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.MigrantEducationProgramServiceDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , MigrantEducationProgramServiceDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT MigrantEducationProgramServiceDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.MigrantEducationProgramServiceDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.MonitoredDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , MonitoredDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT MonitoredDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.MonitoredDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.NeglectedOrDelinquentProgramDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , NeglectedOrDelinquentProgramDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT NeglectedOrDelinquentProgramDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.NeglectedOrDelinquentProgramDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.NeglectedOrDelinquentProgramServiceDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , NeglectedOrDelinquentProgramServiceDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT NeglectedOrDelinquentProgramServiceDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.NeglectedOrDelinquentProgramServiceDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.NetworkPurposeDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , NetworkPurposeDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT NetworkPurposeDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.NetworkPurposeDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.ObjectiveAssessment (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , AssessmentHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , AssessmentIdentifier nvarchar(60) NOT NULL
        , IdentificationCode nvarchar(60) NOT NULL
        , Namespace nvarchar(255) NOT NULL
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT ObjectiveAssessment_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.ObjectiveAssessment_AttributesHistory))
    GO
    
    CREATE TABLE edfi.ObjectiveAssessmentAssessmentItem (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , AssessmentItemHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT ObjectiveAssessmentAssessmentItem_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , AssessmentItemHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.ObjectiveAssessmentLearningObjective (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , LearningObjectiveHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT ObjectiveAssessmentLearningObjective_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , LearningObjectiveHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.ObjectiveAssessmentLearningStandard (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , LearningStandardHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT ObjectiveAssessmentLearningStandard_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , LearningStandardHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.ObjectiveAssessmentPerformanceLevel (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , AssessmentReportingMethodDescriptorHashKey uniqueIdentifier NOT NULL
        , PerformanceLevelDescriptorHashKey uniqueIdentifier NOT NULL
        -- Attributes
        , MaximumScore nvarchar(35) NULL
        , MinimumScore nvarchar(35) NULL
        -- References
        , ResultDatatypeTypeDescriptorHashKey uniqueIdentifier NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT ObjectiveAssessmentPerformanceLevel_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , AssessmentReportingMethodDescriptorHashKey
            , PerformanceLevelDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.ObjectiveAssessmentScore (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , AssessmentReportingMethodDescriptorHashKey uniqueIdentifier NOT NULL
        -- Attributes
        , MaximumScore nvarchar(35) NULL
        , MinimumScore nvarchar(35) NULL
        -- References
        , ResultDatatypeTypeDescriptorHashKey uniqueIdentifier NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT ObjectiveAssessmentScore_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , AssessmentReportingMethodDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.OldEthnicityDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , OldEthnicityDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT OldEthnicityDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.OldEthnicityDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.OpenStaffPosition (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , EducationOrganizationHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , EducationOrganizationId int NOT NULL
        , RequisitionNumber nvarchar(20) NOT NULL
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT OpenStaffPosition_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.OpenStaffPosition_AttributesHistory))
    GO
    
    CREATE TABLE edfi.OpenStaffPositionAcademicSubject (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , AcademicSubjectDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT OpenStaffPositionAcademicSubject_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , AcademicSubjectDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.OpenStaffPositionInstructionalGradeLevel (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , GradeLevelDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT OpenStaffPositionInstructionalGradeLevel_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , GradeLevelDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.OperationalStatusDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , OperationalStatusDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT OperationalStatusDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.OperationalStatusDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.OtherNameTypeDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , OtherNameTypeDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT OtherNameTypeDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.OtherNameTypeDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.Parent (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        -- Primary key columns
        , ParentUSI int NOT NULL
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT Parent_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.Parent_AttributesHistory))
    GO
    
    CREATE TABLE edfi.ParentAddress (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT ParentAddress_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , AddressTypeDescriptorHashKey
            , StateAbbreviationDescriptorHashKey
            , City
            , PostalCode
            , StreetNumberName
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.ParentAddressPeriod (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        -- Contextual primary key
        , BeginDate date NOT NULL
        -- Attributes
        , EndDate date NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT ParentAddressPeriod_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , BeginDate
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.ParentElectronicMail (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , ElectronicMailTypeDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        , ElectronicMailAddress nvarchar(128) NOT NULL
        -- Attributes
        , DoNotPublishIndicator bit NULL
        , PrimaryEmailAddressIndicator bit NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT ParentElectronicMail_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , ElectronicMailTypeDescriptorHashKey
            , ElectronicMailAddress
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.ParentInternationalAddress (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , AddressTypeDescriptorHashKey uniqueIdentifier NOT NULL
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT ParentInternationalAddress_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , AddressTypeDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.ParentLanguage (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , LanguageDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT ParentLanguage_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , LanguageDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.ParentLanguageUse (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , LanguageUseDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT ParentLanguageUse_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , LanguageUseDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.ParentOtherName (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , OtherNameTypeDescriptorHashKey uniqueIdentifier NOT NULL
        -- Attributes
        , FirstName nvarchar(75) NOT NULL
        , GenerationCodeSuffix nvarchar(10) NULL
        , LastSurname nvarchar(75) NOT NULL
        , MiddleName nvarchar(75) NULL
        , PersonalTitlePrefix nvarchar(30) NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT ParentOtherName_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , OtherNameTypeDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.ParentPersonalIdentificationDocument (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , IdentificationDocumentUseDescriptorHashKey uniqueIdentifier NOT NULL
        , PersonalInformationVerificationDescriptorHashKey uniqueIdentifier NOT NULL
        -- Attributes
        , DocumentExpirationDate date NULL
        , DocumentTitle nvarchar(60) NULL
        , IssuerDocumentIdentificationCode nvarchar(60) NULL
        , IssuerName nvarchar(150) NULL
        -- References
        , IssuerCountryDescriptorHashKey uniqueIdentifier NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT ParentPersonalIdentificationDocument_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , IdentificationDocumentUseDescriptorHashKey
            , PersonalInformationVerificationDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.ParentTelephone (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT ParentTelephone_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , TelephoneNumberTypeDescriptorHashKey
            , TelephoneNumber
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.ParticipationDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , ParticipationDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT ParticipationDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.ParticipationDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.ParticipationStatusDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , ParticipationStatusDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT ParticipationStatusDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.ParticipationStatusDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.Payroll (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , AccountHashKey uniqueIdentifier NOT NULL
        , StaffHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , AccountIdentifier nvarchar(50) NOT NULL
        , AsOfDate date NOT NULL
        , EducationOrganizationId int NOT NULL
        , FiscalYear int NOT NULL
        , StaffUSI int NOT NULL
        -- Attributes
        , AmountToDate money NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        , Id uniqueidentifier NOT NULL
        , LastModifiedDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT Payroll_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.Payroll_AttributesHistory))
    GO
    
    CREATE TABLE edfi.PerformanceBaseConversionDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , PerformanceBaseConversionDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT PerformanceBaseConversionDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.PerformanceBaseConversionDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.PerformanceLevelDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , PerformanceLevelDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT PerformanceLevelDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.PerformanceLevelDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.Person (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , SourceSystemDescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , PersonId nvarchar(32) NOT NULL
        , SourceSystemDescriptorId int NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        , Id uniqueidentifier NOT NULL
        , LastModifiedDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT Person_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.Person_AttributesHistory))
    GO
    
    CREATE TABLE edfi.PersonalInformationVerificationDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , PersonalInformationVerificationDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT PersonalInformationVerificationDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.PersonalInformationVerificationDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.PlatformTypeDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , PlatformTypeDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT PlatformTypeDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.PlatformTypeDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.PopulationServedDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , PopulationServedDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT PopulationServedDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.PopulationServedDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.PostingResultDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , PostingResultDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT PostingResultDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.PostingResultDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.PostSecondaryEvent (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , PostSecondaryEventCategoryDescriptorHashKey uniqueIdentifier NOT NULL
        , StudentHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , EventDate date NOT NULL
        , PostSecondaryEventCategoryDescriptorId int NOT NULL
        , StudentUSI int NOT NULL
        -- References
        , PostSecondaryInstitutionHashKey uniqueIdentifier NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        , Id uniqueidentifier NOT NULL
        , LastModifiedDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT PostSecondaryEvent_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.PostSecondaryEvent_AttributesHistory))
    GO
    
    CREATE TABLE edfi.PostSecondaryEventCategoryDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , PostSecondaryEventCategoryDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT PostSecondaryEventCategoryDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.PostSecondaryEventCategoryDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.PostSecondaryInstitution (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , EducationOrganizationHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , PostSecondaryInstitutionId int NOT NULL
        -- References
        , AdministrativeFundingControlDescriptorHashKey uniqueIdentifier NULL
        , PostSecondaryInstitutionLevelDescriptorHashKey uniqueIdentifier NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT PostSecondaryInstitution_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.PostSecondaryInstitution_AttributesHistory))
    GO
    
    CREATE TABLE edfi.PostSecondaryInstitutionMediumOfInstruction (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , MediumOfInstructionDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT PostSecondaryInstitutionMediumOfInstruction_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , MediumOfInstructionDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.PostSecondaryInstitutionLevelDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , PostSecondaryInstitutionLevelDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT PostSecondaryInstitutionLevelDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.PostSecondaryInstitutionLevelDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.ProficiencyDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , ProficiencyDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT ProficiencyDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.ProficiencyDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.Program (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , EducationOrganizationHashKey uniqueIdentifier NOT NULL
        , ProgramTypeDescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , EducationOrganizationId int NOT NULL
        , ProgramName nvarchar(60) NOT NULL
        , ProgramTypeDescriptorId int NOT NULL
        -- Attributes
        , ProgramId nvarchar(20) NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        , Id uniqueidentifier NOT NULL
        , LastModifiedDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT Program_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.Program_AttributesHistory))
    GO
    
    CREATE TABLE edfi.ProgramCharacteristic (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , ProgramCharacteristicDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT ProgramCharacteristic_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , ProgramCharacteristicDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.ProgramLearningObjective (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , LearningObjectiveHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT ProgramLearningObjective_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , LearningObjectiveHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.ProgramLearningStandard (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , LearningStandardHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT ProgramLearningStandard_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , LearningStandardHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.ProgramService (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , ServiceDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT ProgramService_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , ServiceDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.ProgramSponsor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , ProgramSponsorDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT ProgramSponsor_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , ProgramSponsorDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.ProgramAssignmentDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , ProgramAssignmentDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT ProgramAssignmentDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.ProgramAssignmentDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.ProgramCharacteristicDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , ProgramCharacteristicDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT ProgramCharacteristicDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.ProgramCharacteristicDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.ProgramSponsorDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , ProgramSponsorDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT ProgramSponsorDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.ProgramSponsorDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.ProgramTypeDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , ProgramTypeDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT ProgramTypeDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.ProgramTypeDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.ProgressDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , ProgressDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT ProgressDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.ProgressDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.ProgressLevelDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , ProgressLevelDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT ProgressLevelDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.ProgressLevelDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.ProviderCategoryDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , ProviderCategoryDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT ProviderCategoryDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.ProviderCategoryDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.ProviderProfitabilityDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , ProviderProfitabilityDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT ProviderProfitabilityDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.ProviderProfitabilityDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.ProviderStatusDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , ProviderStatusDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT ProviderStatusDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.ProviderStatusDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.PublicationStatusDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , PublicationStatusDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT PublicationStatusDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.PublicationStatusDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.QuestionFormDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , QuestionFormDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT QuestionFormDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.QuestionFormDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.RaceDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , RaceDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT RaceDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.RaceDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.ReasonExitedDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , ReasonExitedDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT ReasonExitedDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.ReasonExitedDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.ReasonNotTestedDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , ReasonNotTestedDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT ReasonNotTestedDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.ReasonNotTestedDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.RecognitionTypeDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , RecognitionTypeDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT RecognitionTypeDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.RecognitionTypeDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.RelationDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , RelationDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT RelationDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.RelationDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.RepeatIdentifierDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , RepeatIdentifierDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT RepeatIdentifierDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.RepeatIdentifierDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.ReportCard (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , EducationOrganizationHashKey uniqueIdentifier NOT NULL
        , GradingPeriodHashKey uniqueIdentifier NOT NULL
        , StudentHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , EducationOrganizationId int NOT NULL
        , GradingPeriodDescriptorId int NOT NULL
        , GradingPeriodSchoolId int NOT NULL
        , GradingPeriodSchoolYear smallint NOT NULL
        , GradingPeriodSequence int NOT NULL
        , StudentUSI int NOT NULL
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT ReportCard_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.ReportCard_AttributesHistory))
    GO
    
    CREATE TABLE edfi.ReportCardGrade (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , GradeHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT ReportCardGrade_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , GradeHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.ReportCardGradePointAverage (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , GradePointAverageTypeDescriptorHashKey uniqueIdentifier NOT NULL
        -- Attributes
        , GradePointAverageValue decimal(18,4) NOT NULL
        , IsCumulative bit NULL
        , MaxGradePointAverageValue decimal(18,4) NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT ReportCardGradePointAverage_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , GradePointAverageTypeDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.ReportCardStudentCompetencyObjective (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , StudentCompetencyObjectiveHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT ReportCardStudentCompetencyObjective_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , StudentCompetencyObjectiveHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.ReportCardStudentLearningObjective (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , StudentLearningObjectiveHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT ReportCardStudentLearningObjective_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , StudentLearningObjectiveHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.ReporterDescriptionDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , ReporterDescriptionDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT ReporterDescriptionDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.ReporterDescriptionDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.ResidencyStatusDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , ResidencyStatusDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT ResidencyStatusDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.ResidencyStatusDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.ResponseIndicatorDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , ResponseIndicatorDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT ResponseIndicatorDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.ResponseIndicatorDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.ResponsibilityDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , ResponsibilityDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT ResponsibilityDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.ResponsibilityDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.RestraintEvent (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , SchoolHashKey uniqueIdentifier NOT NULL
        , StudentHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , RestraintEventIdentifier nvarchar(20) NOT NULL
        , SchoolId int NOT NULL
        , StudentUSI int NOT NULL
        -- Attributes
        , EventDate date NOT NULL
        -- References
        , EducationalEnvironmentDescriptorHashKey uniqueIdentifier NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        , Id uniqueidentifier NOT NULL
        , LastModifiedDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT RestraintEvent_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.RestraintEvent_AttributesHistory))
    GO
    
    CREATE TABLE edfi.RestraintEventProgram (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , ProgramHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT RestraintEventProgram_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , ProgramHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.RestraintEventReason (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , RestraintEventReasonDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT RestraintEventReason_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , RestraintEventReasonDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.RestraintEventReasonDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , RestraintEventReasonDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT RestraintEventReasonDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.RestraintEventReasonDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.ResultDatatypeTypeDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , ResultDatatypeTypeDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT ResultDatatypeTypeDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.ResultDatatypeTypeDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.RetestIndicatorDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , RetestIndicatorDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT RetestIndicatorDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.RetestIndicatorDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.School (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , EducationOrganizationHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , SchoolId int NOT NULL
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT School_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.School_AttributesHistory))
    GO
    
    CREATE TABLE edfi.SchoolCategory (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , SchoolCategoryDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT SchoolCategory_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , SchoolCategoryDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.SchoolGradeLevel (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , GradeLevelDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT SchoolGradeLevel_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , GradeLevelDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.SchoolCategoryDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , SchoolCategoryDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT SchoolCategoryDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.SchoolCategoryDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.SchoolChoiceImplementStatusDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , SchoolChoiceImplementStatusDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT SchoolChoiceImplementStatusDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.SchoolChoiceImplementStatusDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.SchoolFoodServiceProgramServiceDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , SchoolFoodServiceProgramServiceDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT SchoolFoodServiceProgramServiceDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.SchoolFoodServiceProgramServiceDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.SchoolTypeDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , SchoolTypeDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT SchoolTypeDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.SchoolTypeDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.SchoolYearType (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        -- Primary key columns
        , SchoolYear smallint NOT NULL
        -- Attributes
        , CurrentSchoolYear bit NOT NULL
        , SchoolYearDescription nvarchar(50) NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        , Id uniqueidentifier NOT NULL
        , LastModifiedDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT SchoolYearType_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.SchoolYearType_AttributesHistory))
    GO
    
    CREATE TABLE edfi.Section (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , CourseOfferingHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , LocalCourseCode nvarchar(60) NOT NULL
        , SchoolId int NOT NULL
        , SchoolYear smallint NOT NULL
        , SectionIdentifier nvarchar(255) NOT NULL
        , SessionName nvarchar(60) NOT NULL
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT Section_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.Section_AttributesHistory))
    GO
    
    CREATE TABLE edfi.SectionCharacteristic (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , SectionCharacteristicDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT SectionCharacteristic_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , SectionCharacteristicDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.SectionClassPeriod (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , ClassPeriodHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT SectionClassPeriod_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , ClassPeriodHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.SectionCourseLevelCharacteristic (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , CourseLevelCharacteristicDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT SectionCourseLevelCharacteristic_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , CourseLevelCharacteristicDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.SectionOfferedGradeLevel (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , GradeLevelDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT SectionOfferedGradeLevel_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , GradeLevelDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.SectionProgram (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , ProgramHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT SectionProgram_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , ProgramHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.SectionAttendanceTakenEvent (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , CalendarDateHashKey uniqueIdentifier NOT NULL
        , SectionHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , CalendarCode nvarchar(60) NOT NULL
        , Date date NOT NULL
        , LocalCourseCode nvarchar(60) NOT NULL
        , SchoolId int NOT NULL
        , SchoolYear smallint NOT NULL
        , SectionIdentifier nvarchar(255) NOT NULL
        , SessionName nvarchar(60) NOT NULL
        -- Attributes
        , EventDate date NOT NULL
        -- References
        , StaffHashKey uniqueIdentifier NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        , Id uniqueidentifier NOT NULL
        , LastModifiedDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT SectionAttendanceTakenEvent_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.SectionAttendanceTakenEvent_AttributesHistory))
    GO
    
    CREATE TABLE edfi.SectionCharacteristicDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , SectionCharacteristicDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT SectionCharacteristicDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.SectionCharacteristicDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.SeparationDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , SeparationDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT SeparationDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.SeparationDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.SeparationReasonDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , SeparationReasonDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT SeparationReasonDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.SeparationReasonDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.ServiceDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , ServiceDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT ServiceDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.ServiceDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.Session (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , SchoolHashKey uniqueIdentifier NOT NULL
        , SchoolYearTypeHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , SchoolId int NOT NULL
        , SchoolYear smallint NOT NULL
        , SessionName nvarchar(60) NOT NULL
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT Session_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.Session_AttributesHistory))
    GO
    
    CREATE TABLE edfi.SessionAcademicWeek (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , AcademicWeekHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT SessionAcademicWeek_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , AcademicWeekHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.SessionGradingPeriod (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , GradingPeriodHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT SessionGradingPeriod_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , GradingPeriodHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.SexDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , SexDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT SexDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.SexDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.SourceSystemDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , SourceSystemDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT SourceSystemDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.SourceSystemDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.SpecialEducationProgramServiceDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , SpecialEducationProgramServiceDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT SpecialEducationProgramServiceDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.SpecialEducationProgramServiceDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.SpecialEducationSettingDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , SpecialEducationSettingDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT SpecialEducationSettingDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.SpecialEducationSettingDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.Staff (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        -- Primary key columns
        , StaffUSI int NOT NULL
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT Staff_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.Staff_AttributesHistory))
    GO
    
    CREATE TABLE edfi.StaffAddress (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StaffAddress_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , AddressTypeDescriptorHashKey
            , StateAbbreviationDescriptorHashKey
            , City
            , PostalCode
            , StreetNumberName
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StaffAddressPeriod (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        -- Contextual primary key
        , BeginDate date NOT NULL
        -- Attributes
        , EndDate date NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StaffAddressPeriod_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , BeginDate
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StaffCredential (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , CredentialHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StaffCredential_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , CredentialHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StaffElectronicMail (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , ElectronicMailTypeDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        , ElectronicMailAddress nvarchar(128) NOT NULL
        -- Attributes
        , DoNotPublishIndicator bit NULL
        , PrimaryEmailAddressIndicator bit NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StaffElectronicMail_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , ElectronicMailTypeDescriptorHashKey
            , ElectronicMailAddress
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StaffIdentificationCode (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , StaffIdentificationSystemDescriptorHashKey uniqueIdentifier NOT NULL
        -- Attributes
        , AssigningOrganizationIdentificationCode nvarchar(60) NULL
        , IdentificationCode nvarchar(60) NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StaffIdentificationCode_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , StaffIdentificationSystemDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StaffIdentificationDocument (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , IdentificationDocumentUseDescriptorHashKey uniqueIdentifier NOT NULL
        , PersonalInformationVerificationDescriptorHashKey uniqueIdentifier NOT NULL
        -- Attributes
        , DocumentExpirationDate date NULL
        , DocumentTitle nvarchar(60) NULL
        , IssuerDocumentIdentificationCode nvarchar(60) NULL
        , IssuerName nvarchar(150) NULL
        -- References
        , IssuerCountryDescriptorHashKey uniqueIdentifier NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StaffIdentificationDocument_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , IdentificationDocumentUseDescriptorHashKey
            , PersonalInformationVerificationDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StaffInternationalAddress (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , AddressTypeDescriptorHashKey uniqueIdentifier NOT NULL
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StaffInternationalAddress_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , AddressTypeDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StaffLanguage (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , LanguageDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StaffLanguage_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , LanguageDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StaffLanguageUse (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , LanguageUseDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StaffLanguageUse_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , LanguageUseDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StaffOtherName (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , OtherNameTypeDescriptorHashKey uniqueIdentifier NOT NULL
        -- Attributes
        , FirstName nvarchar(75) NOT NULL
        , GenerationCodeSuffix nvarchar(10) NULL
        , LastSurname nvarchar(75) NOT NULL
        , MiddleName nvarchar(75) NULL
        , PersonalTitlePrefix nvarchar(30) NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StaffOtherName_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , OtherNameTypeDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StaffPersonalIdentificationDocument (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , IdentificationDocumentUseDescriptorHashKey uniqueIdentifier NOT NULL
        , PersonalInformationVerificationDescriptorHashKey uniqueIdentifier NOT NULL
        -- Attributes
        , DocumentExpirationDate date NULL
        , DocumentTitle nvarchar(60) NULL
        , IssuerDocumentIdentificationCode nvarchar(60) NULL
        , IssuerName nvarchar(150) NULL
        -- References
        , IssuerCountryDescriptorHashKey uniqueIdentifier NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StaffPersonalIdentificationDocument_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , IdentificationDocumentUseDescriptorHashKey
            , PersonalInformationVerificationDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StaffRace (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , RaceDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StaffRace_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , RaceDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StaffRecognition (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , RecognitionTypeDescriptorHashKey uniqueIdentifier NOT NULL
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StaffRecognition_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , RecognitionTypeDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StaffTelephone (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StaffTelephone_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , TelephoneNumberTypeDescriptorHashKey
            , TelephoneNumber
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StaffTribalAffiliation (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , TribalAffiliationDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StaffTribalAffiliation_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , TribalAffiliationDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StaffVisa (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , VisaDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StaffVisa_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , VisaDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StaffAbsenceEvent (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , AbsenceEventCategoryDescriptorHashKey uniqueIdentifier NOT NULL
        , StaffHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , AbsenceEventCategoryDescriptorId int NOT NULL
        , EventDate date NOT NULL
        , StaffUSI int NOT NULL
        -- Attributes
        , AbsenceEventReason nvarchar(40) NULL
        , HoursAbsent decimal(18,2) NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        , Id uniqueidentifier NOT NULL
        , LastModifiedDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT StaffAbsenceEvent_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.StaffAbsenceEvent_AttributesHistory))
    GO
    
    CREATE TABLE edfi.StaffClassificationDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , StaffClassificationDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT StaffClassificationDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.StaffClassificationDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.StaffCohortAssociation (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , CohortHashKey uniqueIdentifier NOT NULL
        , StaffHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , BeginDate date NOT NULL
        , CohortIdentifier nvarchar(20) NOT NULL
        , EducationOrganizationId int NOT NULL
        , StaffUSI int NOT NULL
        -- Attributes
        , EndDate date NULL
        , StudentRecordAccess bit NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        , Id uniqueidentifier NOT NULL
        , LastModifiedDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT StaffCohortAssociation_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.StaffCohortAssociation_AttributesHistory))
    GO
    
    CREATE TABLE edfi.StaffDisciplineIncidentAssociation (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DisciplineIncidentHashKey uniqueIdentifier NOT NULL
        , StaffHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , IncidentIdentifier nvarchar(20) NOT NULL
        , SchoolId int NOT NULL
        , StaffUSI int NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        , Id uniqueidentifier NOT NULL
        , LastModifiedDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT StaffDisciplineIncidentAssociation_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.StaffDisciplineIncidentAssociation_AttributesHistory))
    GO
    
    CREATE TABLE edfi.StaffDisciplineIncidentAssociationDisciplineIncidentParticipationCode (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , DisciplineIncidentParticipationCodeDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StaffDisciplineIncidentAssociationDisciplineIncidentParticipationCode_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , DisciplineIncidentParticipationCodeDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StaffEducationOrganizationAssignmentAssociation (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , EducationOrganizationHashKey uniqueIdentifier NOT NULL
        , StaffHashKey uniqueIdentifier NOT NULL
        , StaffClassificationDescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , BeginDate date NOT NULL
        , EducationOrganizationId int NOT NULL
        , StaffClassificationDescriptorId int NOT NULL
        , StaffUSI int NOT NULL
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT StaffEducationOrganizationAssignmentAssociation_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.StaffEducationOrganizationAssignmentAssociation_AttributesHistory))
    GO
    
    CREATE TABLE edfi.StaffEducationOrganizationContactAssociation (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , EducationOrganizationHashKey uniqueIdentifier NOT NULL
        , StaffHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , ContactTitle nvarchar(75) NOT NULL
        , EducationOrganizationId int NOT NULL
        , StaffUSI int NOT NULL
        -- Attributes
        , ElectronicMailAddress nvarchar(128) NOT NULL
        -- References
        , ContactTypeDescriptorHashKey uniqueIdentifier NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        , Id uniqueidentifier NOT NULL
        , LastModifiedDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT StaffEducationOrganizationContactAssociation_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.StaffEducationOrganizationContactAssociation_AttributesHistory))
    GO
    
    CREATE TABLE edfi.StaffEducationOrganizationContactAssociationAddress (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StaffEducationOrganizationContactAssociationAddress_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StaffEducationOrganizationContactAssociationAddressPeriod (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        -- Contextual primary key
        , BeginDate date NOT NULL
        -- Attributes
        , EndDate date NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StaffEducationOrganizationContactAssociationAddressPeriod_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , BeginDate
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StaffEducationOrganizationContactAssociationTelephone (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StaffEducationOrganizationContactAssociationTelephone_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , TelephoneNumberTypeDescriptorHashKey
            , TelephoneNumber
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StaffEducationOrganizationEmploymentAssociation (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , EducationOrganizationHashKey uniqueIdentifier NOT NULL
        , EmploymentStatusDescriptorHashKey uniqueIdentifier NOT NULL
        , StaffHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , EducationOrganizationId int NOT NULL
        , EmploymentStatusDescriptorId int NOT NULL
        , HireDate date NOT NULL
        , StaffUSI int NOT NULL
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT StaffEducationOrganizationEmploymentAssociation_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.StaffEducationOrganizationEmploymentAssociation_AttributesHistory))
    GO
    
    CREATE TABLE edfi.StaffIdentificationSystemDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , StaffIdentificationSystemDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT StaffIdentificationSystemDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.StaffIdentificationSystemDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.StaffLeave (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , StaffHashKey uniqueIdentifier NOT NULL
        , StaffLeaveEventCategoryDescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , BeginDate date NOT NULL
        , StaffLeaveEventCategoryDescriptorId int NOT NULL
        , StaffUSI int NOT NULL
        -- Attributes
        , EndDate date NULL
        , Reason nvarchar(40) NULL
        , SubstituteAssigned bit NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        , Id uniqueidentifier NOT NULL
        , LastModifiedDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT StaffLeave_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.StaffLeave_AttributesHistory))
    GO
    
    CREATE TABLE edfi.StaffLeaveEventCategoryDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , StaffLeaveEventCategoryDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT StaffLeaveEventCategoryDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.StaffLeaveEventCategoryDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.StaffProgramAssociation (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , ProgramHashKey uniqueIdentifier NOT NULL
        , StaffHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , BeginDate date NOT NULL
        , ProgramEducationOrganizationId int NOT NULL
        , ProgramName nvarchar(60) NOT NULL
        , ProgramTypeDescriptorId int NOT NULL
        , StaffUSI int NOT NULL
        -- Attributes
        , EndDate date NULL
        , StudentRecordAccess bit NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        , Id uniqueidentifier NOT NULL
        , LastModifiedDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT StaffProgramAssociation_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.StaffProgramAssociation_AttributesHistory))
    GO
    
    CREATE TABLE edfi.StaffSchoolAssociation (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , ProgramAssignmentDescriptorHashKey uniqueIdentifier NOT NULL
        , SchoolHashKey uniqueIdentifier NOT NULL
        , StaffHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , ProgramAssignmentDescriptorId int NOT NULL
        , SchoolId int NOT NULL
        , StaffUSI int NOT NULL
        -- References
        , CalendarHashKey uniqueIdentifier NULL
        , SchoolYearTypeHashKey uniqueIdentifier NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        , Id uniqueidentifier NOT NULL
        , LastModifiedDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT StaffSchoolAssociation_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.StaffSchoolAssociation_AttributesHistory))
    GO
    
    CREATE TABLE edfi.StaffSchoolAssociationAcademicSubject (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , AcademicSubjectDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StaffSchoolAssociationAcademicSubject_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , AcademicSubjectDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StaffSchoolAssociationGradeLevel (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , GradeLevelDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StaffSchoolAssociationGradeLevel_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , GradeLevelDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StaffSectionAssociation (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , SectionHashKey uniqueIdentifier NOT NULL
        , StaffHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , LocalCourseCode nvarchar(60) NOT NULL
        , SchoolId int NOT NULL
        , SchoolYear smallint NOT NULL
        , SectionIdentifier nvarchar(255) NOT NULL
        , SessionName nvarchar(60) NOT NULL
        , StaffUSI int NOT NULL
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT StaffSectionAssociation_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.StaffSectionAssociation_AttributesHistory))
    GO
    
    CREATE TABLE edfi.StateAbbreviationDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , StateAbbreviationDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT StateAbbreviationDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.StateAbbreviationDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.StateEducationAgency (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , EducationOrganizationHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , StateEducationAgencyId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT StateEducationAgency_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.StateEducationAgency_AttributesHistory))
    GO
    
    CREATE TABLE edfi.StateEducationAgencyAccountability (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , SchoolYearTypeHashKey uniqueIdentifier NOT NULL
        -- Attributes
        , CTEGraduationRateInclusion bit NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StateEducationAgencyAccountability_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , SchoolYearTypeHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StateEducationAgencyFederalFunds (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        -- Contextual primary key
        , FiscalYear int NOT NULL
        -- Attributes
        , FederalProgramsFundingAllocation money NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StateEducationAgencyFederalFunds_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , FiscalYear
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.Student (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        -- Primary key columns
        , StudentUSI int NOT NULL
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT Student_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.Student_AttributesHistory))
    GO
    
    CREATE TABLE edfi.StudentIdentificationDocument (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , IdentificationDocumentUseDescriptorHashKey uniqueIdentifier NOT NULL
        , PersonalInformationVerificationDescriptorHashKey uniqueIdentifier NOT NULL
        -- Attributes
        , DocumentExpirationDate date NULL
        , DocumentTitle nvarchar(60) NULL
        , IssuerDocumentIdentificationCode nvarchar(60) NULL
        , IssuerName nvarchar(150) NULL
        -- References
        , IssuerCountryDescriptorHashKey uniqueIdentifier NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StudentIdentificationDocument_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , IdentificationDocumentUseDescriptorHashKey
            , PersonalInformationVerificationDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentOtherName (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , OtherNameTypeDescriptorHashKey uniqueIdentifier NOT NULL
        -- Attributes
        , FirstName nvarchar(75) NOT NULL
        , GenerationCodeSuffix nvarchar(10) NULL
        , LastSurname nvarchar(75) NOT NULL
        , MiddleName nvarchar(75) NULL
        , PersonalTitlePrefix nvarchar(30) NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StudentOtherName_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , OtherNameTypeDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentPersonalIdentificationDocument (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , IdentificationDocumentUseDescriptorHashKey uniqueIdentifier NOT NULL
        , PersonalInformationVerificationDescriptorHashKey uniqueIdentifier NOT NULL
        -- Attributes
        , DocumentExpirationDate date NULL
        , DocumentTitle nvarchar(60) NULL
        , IssuerDocumentIdentificationCode nvarchar(60) NULL
        , IssuerName nvarchar(150) NULL
        -- References
        , IssuerCountryDescriptorHashKey uniqueIdentifier NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StudentPersonalIdentificationDocument_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , IdentificationDocumentUseDescriptorHashKey
            , PersonalInformationVerificationDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentVisa (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , VisaDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StudentVisa_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , VisaDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentAcademicRecord (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , EducationOrganizationHashKey uniqueIdentifier NOT NULL
        , SchoolYearTypeHashKey uniqueIdentifier NOT NULL
        , StudentHashKey uniqueIdentifier NOT NULL
        , TermDescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , EducationOrganizationId int NOT NULL
        , SchoolYear smallint NOT NULL
        , StudentUSI int NOT NULL
        , TermDescriptorId int NOT NULL
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT StudentAcademicRecord_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.StudentAcademicRecord_AttributesHistory))
    GO
    
    CREATE TABLE edfi.StudentAcademicRecordAcademicHonor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StudentAcademicRecordAcademicHonor_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , AcademicHonorCategoryDescriptorHashKey
            , HonorDescription
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentAcademicRecordClassRanking (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        -- Attributes
        , ClassRank int NOT NULL
        , ClassRankingDate date NULL
        , PercentageRanking int NULL
        , TotalNumberInClass int NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StudentAcademicRecordClassRanking_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentAcademicRecordDiploma (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StudentAcademicRecordDiploma_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , DiplomaTypeDescriptorHashKey
            , DiplomaAwardDate
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentAcademicRecordGradePointAverage (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , GradePointAverageTypeDescriptorHashKey uniqueIdentifier NOT NULL
        -- Attributes
        , GradePointAverageValue decimal(18,4) NOT NULL
        , IsCumulative bit NULL
        , MaxGradePointAverageValue decimal(18,4) NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StudentAcademicRecordGradePointAverage_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , GradePointAverageTypeDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentAcademicRecordRecognition (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , RecognitionTypeDescriptorHashKey uniqueIdentifier NOT NULL
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StudentAcademicRecordRecognition_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , RecognitionTypeDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentAcademicRecordReportCard (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , ReportCardHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StudentAcademicRecordReportCard_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , ReportCardHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentAssessment (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , AssessmentHashKey uniqueIdentifier NOT NULL
        , StudentHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , AssessmentIdentifier nvarchar(60) NOT NULL
        , Namespace nvarchar(255) NOT NULL
        , StudentAssessmentIdentifier nvarchar(60) NOT NULL
        , StudentUSI int NOT NULL
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT StudentAssessment_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.StudentAssessment_AttributesHistory))
    GO
    
    CREATE TABLE edfi.StudentAssessmentAccommodation (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , AccommodationDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StudentAssessmentAccommodation_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , AccommodationDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentAssessmentItem (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , AssessmentItemHashKey uniqueIdentifier NOT NULL
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StudentAssessmentItem_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , AssessmentItemHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentAssessmentPerformanceLevel (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , AssessmentReportingMethodDescriptorHashKey uniqueIdentifier NOT NULL
        , PerformanceLevelDescriptorHashKey uniqueIdentifier NOT NULL
        -- Attributes
        , PerformanceLevelMet bit NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StudentAssessmentPerformanceLevel_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , AssessmentReportingMethodDescriptorHashKey
            , PerformanceLevelDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentAssessmentScoreResult (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , AssessmentReportingMethodDescriptorHashKey uniqueIdentifier NOT NULL
        -- Attributes
        , Result nvarchar(35) NOT NULL
        -- References
        , ResultDatatypeTypeDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StudentAssessmentScoreResult_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , AssessmentReportingMethodDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentAssessmentStudentObjectiveAssessment (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , ObjectiveAssessmentHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StudentAssessmentStudentObjectiveAssessment_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , ObjectiveAssessmentHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentAssessmentStudentObjectiveAssessmentPerformanceLevel (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , AssessmentReportingMethodDescriptorHashKey uniqueIdentifier NOT NULL
        , PerformanceLevelDescriptorHashKey uniqueIdentifier NOT NULL
        -- Attributes
        , PerformanceLevelMet bit NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StudentAssessmentStudentObjectiveAssessmentPerformanceLevel_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , AssessmentReportingMethodDescriptorHashKey
            , PerformanceLevelDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentAssessmentStudentObjectiveAssessmentScoreResult (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , AssessmentReportingMethodDescriptorHashKey uniqueIdentifier NOT NULL
        -- Attributes
        , Result nvarchar(35) NOT NULL
        -- References
        , ResultDatatypeTypeDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StudentAssessmentStudentObjectiveAssessmentScoreResult_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , AssessmentReportingMethodDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentCharacteristicDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , StudentCharacteristicDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT StudentCharacteristicDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.StudentCharacteristicDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.StudentCohortAssociation (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , CohortHashKey uniqueIdentifier NOT NULL
        , StudentHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , BeginDate date NOT NULL
        , CohortIdentifier nvarchar(20) NOT NULL
        , EducationOrganizationId int NOT NULL
        , StudentUSI int NOT NULL
        -- Attributes
        , EndDate date NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        , Id uniqueidentifier NOT NULL
        , LastModifiedDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT StudentCohortAssociation_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.StudentCohortAssociation_AttributesHistory))
    GO
    
    CREATE TABLE edfi.StudentCohortAssociationSection (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , SectionHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StudentCohortAssociationSection_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , SectionHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentCompetencyObjective (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , ObjectiveCompetencyObjectiveHashKey uniqueIdentifier NOT NULL
        , GradingPeriodHashKey uniqueIdentifier NOT NULL
        , StudentHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , GradingPeriodDescriptorId int NOT NULL
        , GradingPeriodSchoolId int NOT NULL
        , GradingPeriodSchoolYear smallint NOT NULL
        , GradingPeriodSequence int NOT NULL
        , Objective nvarchar(60) NOT NULL
        , ObjectiveEducationOrganizationId int NOT NULL
        , ObjectiveGradeLevelDescriptorId int NOT NULL
        , StudentUSI int NOT NULL
        -- Attributes
        , DiagnosticStatement nvarchar(1024) NULL
        -- References
        , CompetencyLevelDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        , Id uniqueidentifier NOT NULL
        , LastModifiedDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT StudentCompetencyObjective_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.StudentCompetencyObjective_AttributesHistory))
    GO
    
    CREATE TABLE edfi.StudentCompetencyObjectiveGeneralStudentProgramAssociation (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , GeneralStudentProgramAssociationHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StudentCompetencyObjectiveGeneralStudentProgramAssociation_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , GeneralStudentProgramAssociationHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentCompetencyObjectiveStudentSectionAssociation (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , StudentSectionAssociationHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StudentCompetencyObjectiveStudentSectionAssociation_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , StudentSectionAssociationHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentCTEProgramAssociation (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , GeneralStudentProgramAssociationHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , BeginDate date NOT NULL
        , EducationOrganizationId int NOT NULL
        , ProgramEducationOrganizationId int NOT NULL
        , ProgramName nvarchar(60) NOT NULL
        , ProgramTypeDescriptorId int NOT NULL
        , StudentUSI int NOT NULL
        -- Attributes
        , NonTraditionalGenderStatus bit NULL
        , PrivateCTEProgram bit NULL
        -- References
        , TechnicalSkillsAssessmentDescriptorHashKey uniqueIdentifier NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT StudentCTEProgramAssociation_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.StudentCTEProgramAssociation_AttributesHistory))
    GO
    
    CREATE TABLE edfi.StudentCTEProgramAssociationCTEProgram (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , CareerPathwayDescriptorHashKey uniqueIdentifier NOT NULL
        -- Attributes
        , CIPCode nvarchar(120) NULL
        , CTEProgramCompletionIndicator bit NULL
        , PrimaryCTEProgramIndicator bit NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StudentCTEProgramAssociationCTEProgram_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , CareerPathwayDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentCTEProgramAssociationCTEProgramService (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , CTEProgramServiceDescriptorHashKey uniqueIdentifier NOT NULL
        -- Attributes
        , CIPCode nvarchar(120) NULL
        , PrimaryIndicator bit NULL
        , ServiceBeginDate date NULL
        , ServiceEndDate date NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StudentCTEProgramAssociationCTEProgramService_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , CTEProgramServiceDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentCTEProgramAssociationService (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , ServiceDescriptorHashKey uniqueIdentifier NOT NULL
        -- Attributes
        , PrimaryIndicator bit NULL
        , ServiceBeginDate date NULL
        , ServiceEndDate date NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StudentCTEProgramAssociationService_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , ServiceDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentDisciplineIncidentAssociation (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DisciplineIncidentHashKey uniqueIdentifier NOT NULL
        , StudentHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , IncidentIdentifier nvarchar(20) NOT NULL
        , SchoolId int NOT NULL
        , StudentUSI int NOT NULL
        -- References
        , StudentParticipationCodeDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        , Id uniqueidentifier NOT NULL
        , LastModifiedDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT StudentDisciplineIncidentAssociation_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.StudentDisciplineIncidentAssociation_AttributesHistory))
    GO
    
    CREATE TABLE edfi.StudentDisciplineIncidentAssociationBehavior (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , BehaviorDescriptorHashKey uniqueIdentifier NOT NULL
        -- Attributes
        , BehaviorDetailedDescription nvarchar(1024) NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StudentDisciplineIncidentAssociationBehavior_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , BehaviorDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentEducationOrganizationAssociation (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , EducationOrganizationHashKey uniqueIdentifier NOT NULL
        , StudentHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , EducationOrganizationId int NOT NULL
        , StudentUSI int NOT NULL
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT StudentEducationOrganizationAssociation_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.StudentEducationOrganizationAssociation_AttributesHistory))
    GO
    
    CREATE TABLE edfi.StudentEducationOrganizationAssociationAddress (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StudentEducationOrganizationAssociationAddress_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , AddressTypeDescriptorHashKey
            , StateAbbreviationDescriptorHashKey
            , City
            , PostalCode
            , StreetNumberName
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentEducationOrganizationAssociationAddressPeriod (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        -- Contextual primary key
        , BeginDate date NOT NULL
        -- Attributes
        , EndDate date NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StudentEducationOrganizationAssociationAddressPeriod_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , BeginDate
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentEducationOrganizationAssociationCohortYear (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , CohortYearTypeDescriptorHashKey uniqueIdentifier NOT NULL
        , SchoolYearTypeHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StudentEducationOrganizationAssociationCohortYear_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , CohortYearTypeDescriptorHashKey
            , SchoolYearTypeHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentEducationOrganizationAssociationDisability (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , DisabilityDescriptorHashKey uniqueIdentifier NOT NULL
        -- Attributes
        , DisabilityDiagnosis nvarchar(80) NULL
        , OrderOfDisability int NULL
        -- References
        , DisabilityDeterminationSourceTypeDescriptorHashKey uniqueIdentifier NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StudentEducationOrganizationAssociationDisability_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , DisabilityDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentEducationOrganizationAssociationDisabilityDesignation (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , DisabilityDesignationDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StudentEducationOrganizationAssociationDisabilityDesignation_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , DisabilityDesignationDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentEducationOrganizationAssociationElectronicMail (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , ElectronicMailTypeDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        , ElectronicMailAddress nvarchar(128) NOT NULL
        -- Attributes
        , DoNotPublishIndicator bit NULL
        , PrimaryEmailAddressIndicator bit NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StudentEducationOrganizationAssociationElectronicMail_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , ElectronicMailTypeDescriptorHashKey
            , ElectronicMailAddress
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentEducationOrganizationAssociationInternationalAddress (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , AddressTypeDescriptorHashKey uniqueIdentifier NOT NULL
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StudentEducationOrganizationAssociationInternationalAddress_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , AddressTypeDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentEducationOrganizationAssociationLanguage (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , LanguageDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StudentEducationOrganizationAssociationLanguage_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , LanguageDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentEducationOrganizationAssociationLanguageUse (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , LanguageUseDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StudentEducationOrganizationAssociationLanguageUse_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , LanguageUseDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentEducationOrganizationAssociationProgramParticipation (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , ProgramTypeDescriptorHashKey uniqueIdentifier NOT NULL
        -- Attributes
        , BeginDate date NULL
        , DesignatedBy nvarchar(60) NULL
        , EndDate date NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StudentEducationOrganizationAssociationProgramParticipation_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , ProgramTypeDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentEducationOrganizationAssociationProgramParticipationProgramCharacteristic (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , ProgramCharacteristicDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StudentEducationOrganizationAssociationProgramParticipationProgramCharacteristic_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , ProgramCharacteristicDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentEducationOrganizationAssociationRace (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , RaceDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StudentEducationOrganizationAssociationRace_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , RaceDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentEducationOrganizationAssociationStudentCharacteristic (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , StudentCharacteristicDescriptorHashKey uniqueIdentifier NOT NULL
        -- Attributes
        , DesignatedBy nvarchar(60) NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StudentEducationOrganizationAssociationStudentCharacteristic_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , StudentCharacteristicDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentEducationOrganizationAssociationStudentCharacteristicPeriod (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        -- Contextual primary key
        , BeginDate date NOT NULL
        -- Attributes
        , EndDate date NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StudentEducationOrganizationAssociationStudentCharacteristicPeriod_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , BeginDate
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentEducationOrganizationAssociationStudentIdentificationCode (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , StudentIdentificationSystemDescriptorHashKey uniqueIdentifier NOT NULL
        -- Contextual primary key
        , AssigningOrganizationIdentificationCode nvarchar(60) NOT NULL
        -- Attributes
        , IdentificationCode nvarchar(60) NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StudentEducationOrganizationAssociationStudentIdentificationCode_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , StudentIdentificationSystemDescriptorHashKey
            , AssigningOrganizationIdentificationCode
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentEducationOrganizationAssociationStudentIndicator (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        -- Contextual primary key
        , IndicatorName nvarchar(200) NOT NULL
        -- Attributes
        , DesignatedBy nvarchar(60) NULL
        , Indicator nvarchar(35) NOT NULL
        , IndicatorGroup nvarchar(200) NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StudentEducationOrganizationAssociationStudentIndicator_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , IndicatorName
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentEducationOrganizationAssociationStudentIndicatorPeriod (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        -- Contextual primary key
        , BeginDate date NOT NULL
        -- Attributes
        , EndDate date NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StudentEducationOrganizationAssociationStudentIndicatorPeriod_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , BeginDate
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentEducationOrganizationAssociationTelephone (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StudentEducationOrganizationAssociationTelephone_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , TelephoneNumberTypeDescriptorHashKey
            , TelephoneNumber
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentEducationOrganizationAssociationTribalAffiliation (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , TribalAffiliationDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StudentEducationOrganizationAssociationTribalAffiliation_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , TribalAffiliationDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentEducationOrganizationResponsibilityAssociation (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , EducationOrganizationHashKey uniqueIdentifier NOT NULL
        , ResponsibilityDescriptorHashKey uniqueIdentifier NOT NULL
        , StudentHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , BeginDate date NOT NULL
        , EducationOrganizationId int NOT NULL
        , ResponsibilityDescriptorId int NOT NULL
        , StudentUSI int NOT NULL
        -- Attributes
        , EndDate date NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        , Id uniqueidentifier NOT NULL
        , LastModifiedDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT StudentEducationOrganizationResponsibilityAssociation_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.StudentEducationOrganizationResponsibilityAssociation_AttributesHistory))
    GO
    
    CREATE TABLE edfi.StudentGradebookEntry (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , GradebookEntryHashKey uniqueIdentifier NOT NULL
        , StudentSectionAssociationHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , BeginDate date NOT NULL
        , DateAssigned date NOT NULL
        , GradebookEntryTitle nvarchar(60) NOT NULL
        , LocalCourseCode nvarchar(60) NOT NULL
        , SchoolId int NOT NULL
        , SchoolYear smallint NOT NULL
        , SectionIdentifier nvarchar(255) NOT NULL
        , SessionName nvarchar(60) NOT NULL
        , StudentUSI int NOT NULL
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT StudentGradebookEntry_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.StudentGradebookEntry_AttributesHistory))
    GO
    
    CREATE TABLE edfi.StudentHomelessProgramAssociation (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , GeneralStudentProgramAssociationHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , BeginDate date NOT NULL
        , EducationOrganizationId int NOT NULL
        , ProgramEducationOrganizationId int NOT NULL
        , ProgramName nvarchar(60) NOT NULL
        , ProgramTypeDescriptorId int NOT NULL
        , StudentUSI int NOT NULL
        -- Attributes
        , AwaitingFosterCare bit NULL
        , HomelessUnaccompaniedYouth bit NULL
        -- References
        , HomelessPrimaryNighttimeResidenceDescriptorHashKey uniqueIdentifier NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT StudentHomelessProgramAssociation_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.StudentHomelessProgramAssociation_AttributesHistory))
    GO
    
    CREATE TABLE edfi.StudentHomelessProgramAssociationHomelessProgramService (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , HomelessProgramServiceDescriptorHashKey uniqueIdentifier NOT NULL
        -- Attributes
        , PrimaryIndicator bit NULL
        , ServiceBeginDate date NULL
        , ServiceEndDate date NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StudentHomelessProgramAssociationHomelessProgramService_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , HomelessProgramServiceDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentIdentificationSystemDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , StudentIdentificationSystemDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT StudentIdentificationSystemDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.StudentIdentificationSystemDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.StudentInterventionAssociation (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , InterventionHashKey uniqueIdentifier NOT NULL
        , StudentHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , EducationOrganizationId int NOT NULL
        , InterventionIdentificationCode nvarchar(60) NOT NULL
        , StudentUSI int NOT NULL
        -- Attributes
        , DiagnosticStatement nvarchar(1024) NULL
        , Dosage int NULL
        -- References
        , CohortHashKey uniqueIdentifier NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        , Id uniqueidentifier NOT NULL
        , LastModifiedDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT StudentInterventionAssociation_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.StudentInterventionAssociation_AttributesHistory))
    GO
    
    CREATE TABLE edfi.StudentInterventionAssociationInterventionEffectiveness (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , DiagnosisDescriptorHashKey uniqueIdentifier NOT NULL
        , GradeLevelDescriptorHashKey uniqueIdentifier NOT NULL
        , PopulationServedDescriptorHashKey uniqueIdentifier NOT NULL
        -- Attributes
        , ImprovementIndex int NULL
        -- References
        , InterventionEffectivenessRatingDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StudentInterventionAssociationInterventionEffectiveness_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , DiagnosisDescriptorHashKey
            , GradeLevelDescriptorHashKey
            , PopulationServedDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentInterventionAttendanceEvent (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , AttendanceEventCategoryDescriptorHashKey uniqueIdentifier NOT NULL
        , InterventionHashKey uniqueIdentifier NOT NULL
        , StudentHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , AttendanceEventCategoryDescriptorId int NOT NULL
        , EducationOrganizationId int NOT NULL
        , EventDate date NOT NULL
        , InterventionIdentificationCode nvarchar(60) NOT NULL
        , StudentUSI int NOT NULL
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT StudentInterventionAttendanceEvent_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.StudentInterventionAttendanceEvent_AttributesHistory))
    GO
    
    CREATE TABLE edfi.StudentLanguageInstructionProgramAssociation (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , GeneralStudentProgramAssociationHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , BeginDate date NOT NULL
        , EducationOrganizationId int NOT NULL
        , ProgramEducationOrganizationId int NOT NULL
        , ProgramName nvarchar(60) NOT NULL
        , ProgramTypeDescriptorId int NOT NULL
        , StudentUSI int NOT NULL
        -- Attributes
        , Dosage int NULL
        , EnglishLearnerParticipation bit NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT StudentLanguageInstructionProgramAssociation_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.StudentLanguageInstructionProgramAssociation_AttributesHistory))
    GO
    
    CREATE TABLE edfi.StudentLanguageInstructionProgramAssociationEnglishLanguageProficiencyAssessment (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , SchoolYearTypeHashKey uniqueIdentifier NOT NULL
        -- References
        , MonitoredDescriptorHashKey uniqueIdentifier NULL
        , ParticipationDescriptorHashKey uniqueIdentifier NULL
        , ProficiencyDescriptorHashKey uniqueIdentifier NULL
        , ProgressDescriptorHashKey uniqueIdentifier NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StudentLanguageInstructionProgramAssociationEnglishLanguageProficiencyAssessment_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , SchoolYearTypeHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentLanguageInstructionProgramAssociationLanguageInstructionProgramService (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , LanguageInstructionProgramServiceDescriptorHashKey uniqueIdentifier NOT NULL
        -- Attributes
        , PrimaryIndicator bit NULL
        , ServiceBeginDate date NULL
        , ServiceEndDate date NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StudentLanguageInstructionProgramAssociationLanguageInstructionProgramService_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , LanguageInstructionProgramServiceDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentLearningObjective (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , GradingPeriodHashKey uniqueIdentifier NOT NULL
        , LearningObjectiveHashKey uniqueIdentifier NOT NULL
        , StudentHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , GradingPeriodDescriptorId int NOT NULL
        , GradingPeriodSchoolId int NOT NULL
        , GradingPeriodSchoolYear smallint NOT NULL
        , GradingPeriodSequence int NOT NULL
        , LearningObjectiveId nvarchar(60) NOT NULL
        , Namespace nvarchar(255) NOT NULL
        , StudentUSI int NOT NULL
        -- Attributes
        , DiagnosticStatement nvarchar(1024) NULL
        -- References
        , CompetencyLevelDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        , Id uniqueidentifier NOT NULL
        , LastModifiedDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT StudentLearningObjective_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.StudentLearningObjective_AttributesHistory))
    GO
    
    CREATE TABLE edfi.StudentLearningObjectiveGeneralStudentProgramAssociation (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , GeneralStudentProgramAssociationHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StudentLearningObjectiveGeneralStudentProgramAssociation_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , GeneralStudentProgramAssociationHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentLearningObjectiveStudentSectionAssociation (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , StudentSectionAssociationHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StudentLearningObjectiveStudentSectionAssociation_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , StudentSectionAssociationHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentMigrantEducationProgramAssociation (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , GeneralStudentProgramAssociationHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , BeginDate date NOT NULL
        , EducationOrganizationId int NOT NULL
        , ProgramEducationOrganizationId int NOT NULL
        , ProgramName nvarchar(60) NOT NULL
        , ProgramTypeDescriptorId int NOT NULL
        , StudentUSI int NOT NULL
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT StudentMigrantEducationProgramAssociation_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.StudentMigrantEducationProgramAssociation_AttributesHistory))
    GO
    
    CREATE TABLE edfi.StudentMigrantEducationProgramAssociationMigrantEducationProgramService (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , MigrantEducationProgramServiceDescriptorHashKey uniqueIdentifier NOT NULL
        -- Attributes
        , PrimaryIndicator bit NULL
        , ServiceBeginDate date NULL
        , ServiceEndDate date NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StudentMigrantEducationProgramAssociationMigrantEducationProgramService_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , MigrantEducationProgramServiceDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentNeglectedOrDelinquentProgramAssociation (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , GeneralStudentProgramAssociationHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , BeginDate date NOT NULL
        , EducationOrganizationId int NOT NULL
        , ProgramEducationOrganizationId int NOT NULL
        , ProgramName nvarchar(60) NOT NULL
        , ProgramTypeDescriptorId int NOT NULL
        , StudentUSI int NOT NULL
        -- References
        , NeglectedOrDelinquentProgramDescriptorHashKey uniqueIdentifier NULL
        , ELAProgressLevelDescriptorHashKey uniqueIdentifier NULL
        , MathematicsProgressLevelDescriptorHashKey uniqueIdentifier NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT StudentNeglectedOrDelinquentProgramAssociation_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.StudentNeglectedOrDelinquentProgramAssociation_AttributesHistory))
    GO
    
    CREATE TABLE edfi.StudentNeglectedOrDelinquentProgramAssociationNeglectedOrDelinquentProgramService (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , NeglectedOrDelinquentProgramServiceDescriptorHashKey uniqueIdentifier NOT NULL
        -- Attributes
        , PrimaryIndicator bit NULL
        , ServiceBeginDate date NULL
        , ServiceEndDate date NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StudentNeglectedOrDelinquentProgramAssociationNeglectedOrDelinquentProgramService_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , NeglectedOrDelinquentProgramServiceDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentParentAssociation (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , ParentHashKey uniqueIdentifier NOT NULL
        , StudentHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , ParentUSI int NOT NULL
        , StudentUSI int NOT NULL
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT StudentParentAssociation_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.StudentParentAssociation_AttributesHistory))
    GO
    
    CREATE TABLE edfi.StudentParticipationCodeDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , StudentParticipationCodeDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT StudentParticipationCodeDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.StudentParticipationCodeDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.StudentProgramAssociation (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , GeneralStudentProgramAssociationHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , BeginDate date NOT NULL
        , EducationOrganizationId int NOT NULL
        , ProgramEducationOrganizationId int NOT NULL
        , ProgramName nvarchar(60) NOT NULL
        , ProgramTypeDescriptorId int NOT NULL
        , StudentUSI int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT StudentProgramAssociation_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.StudentProgramAssociation_AttributesHistory))
    GO
    
    CREATE TABLE edfi.StudentProgramAssociationService (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , ServiceDescriptorHashKey uniqueIdentifier NOT NULL
        -- Attributes
        , PrimaryIndicator bit NULL
        , ServiceBeginDate date NULL
        , ServiceEndDate date NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StudentProgramAssociationService_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , ServiceDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentProgramAttendanceEvent (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , AttendanceEventCategoryDescriptorHashKey uniqueIdentifier NOT NULL
        , EducationOrganizationHashKey uniqueIdentifier NOT NULL
        , ProgramHashKey uniqueIdentifier NOT NULL
        , StudentHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , AttendanceEventCategoryDescriptorId int NOT NULL
        , EducationOrganizationId int NOT NULL
        , EventDate date NOT NULL
        , ProgramEducationOrganizationId int NOT NULL
        , ProgramName nvarchar(60) NOT NULL
        , ProgramTypeDescriptorId int NOT NULL
        , StudentUSI int NOT NULL
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT StudentProgramAttendanceEvent_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.StudentProgramAttendanceEvent_AttributesHistory))
    GO
    
    CREATE TABLE edfi.StudentSchoolAssociation (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , SchoolHashKey uniqueIdentifier NOT NULL
        , StudentHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , EntryDate date NOT NULL
        , SchoolId int NOT NULL
        , StudentUSI int NOT NULL
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT StudentSchoolAssociation_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.StudentSchoolAssociation_AttributesHistory))
    GO
    
    CREATE TABLE edfi.StudentSchoolAssociationAlternativeGraduationPlan (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , AlternativeGraduationPlanHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StudentSchoolAssociationAlternativeGraduationPlan_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , AlternativeGraduationPlanHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentSchoolAssociationEducationPlan (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , EducationPlanDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StudentSchoolAssociationEducationPlan_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , EducationPlanDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentSchoolAttendanceEvent (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , AttendanceEventCategoryDescriptorHashKey uniqueIdentifier NOT NULL
        , SchoolHashKey uniqueIdentifier NOT NULL
        , SessionHashKey uniqueIdentifier NOT NULL
        , StudentHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , AttendanceEventCategoryDescriptorId int NOT NULL
        , EventDate date NOT NULL
        , SchoolId int NOT NULL
        , SchoolYear smallint NOT NULL
        , SessionName nvarchar(60) NOT NULL
        , StudentUSI int NOT NULL
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT StudentSchoolAttendanceEvent_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.StudentSchoolAttendanceEvent_AttributesHistory))
    GO
    
    CREATE TABLE edfi.StudentSchoolFoodServiceProgramAssociation (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , GeneralStudentProgramAssociationHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , BeginDate date NOT NULL
        , EducationOrganizationId int NOT NULL
        , ProgramEducationOrganizationId int NOT NULL
        , ProgramName nvarchar(60) NOT NULL
        , ProgramTypeDescriptorId int NOT NULL
        , StudentUSI int NOT NULL
        -- Attributes
        , DirectCertification bit NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT StudentSchoolFoodServiceProgramAssociation_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.StudentSchoolFoodServiceProgramAssociation_AttributesHistory))
    GO
    
    CREATE TABLE edfi.StudentSchoolFoodServiceProgramAssociationSchoolFoodServiceProgramService (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , SchoolFoodServiceProgramServiceDescriptorHashKey uniqueIdentifier NOT NULL
        -- Attributes
        , PrimaryIndicator bit NULL
        , ServiceBeginDate date NULL
        , ServiceEndDate date NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StudentSchoolFoodServiceProgramAssociationSchoolFoodServiceProgramService_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , SchoolFoodServiceProgramServiceDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentSectionAssociation (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , SectionHashKey uniqueIdentifier NOT NULL
        , StudentHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , BeginDate date NOT NULL
        , LocalCourseCode nvarchar(60) NOT NULL
        , SchoolId int NOT NULL
        , SchoolYear smallint NOT NULL
        , SectionIdentifier nvarchar(255) NOT NULL
        , SessionName nvarchar(60) NOT NULL
        , StudentUSI int NOT NULL
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT StudentSectionAssociation_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.StudentSectionAssociation_AttributesHistory))
    GO
    
    CREATE TABLE edfi.StudentSectionAttendanceEvent (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , AttendanceEventCategoryDescriptorHashKey uniqueIdentifier NOT NULL
        , SectionHashKey uniqueIdentifier NOT NULL
        , StudentHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , AttendanceEventCategoryDescriptorId int NOT NULL
        , EventDate date NOT NULL
        , LocalCourseCode nvarchar(60) NOT NULL
        , SchoolId int NOT NULL
        , SchoolYear smallint NOT NULL
        , SectionIdentifier nvarchar(255) NOT NULL
        , SessionName nvarchar(60) NOT NULL
        , StudentUSI int NOT NULL
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT StudentSectionAttendanceEvent_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.StudentSectionAttendanceEvent_AttributesHistory))
    GO
    
    CREATE TABLE edfi.StudentSpecialEducationProgramAssociation (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , GeneralStudentProgramAssociationHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , BeginDate date NOT NULL
        , EducationOrganizationId int NOT NULL
        , ProgramEducationOrganizationId int NOT NULL
        , ProgramName nvarchar(60) NOT NULL
        , ProgramTypeDescriptorId int NOT NULL
        , StudentUSI int NOT NULL
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT StudentSpecialEducationProgramAssociation_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.StudentSpecialEducationProgramAssociation_AttributesHistory))
    GO
    
    CREATE TABLE edfi.StudentSpecialEducationProgramAssociationDisability (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , DisabilityDescriptorHashKey uniqueIdentifier NOT NULL
        -- Attributes
        , DisabilityDiagnosis nvarchar(80) NULL
        , OrderOfDisability int NULL
        -- References
        , DisabilityDeterminationSourceTypeDescriptorHashKey uniqueIdentifier NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StudentSpecialEducationProgramAssociationDisability_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , DisabilityDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentSpecialEducationProgramAssociationDisabilityDesignation (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , DisabilityDesignationDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StudentSpecialEducationProgramAssociationDisabilityDesignation_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , DisabilityDesignationDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentSpecialEducationProgramAssociationServiceProvider (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , StaffHashKey uniqueIdentifier NOT NULL
        -- Attributes
        , PrimaryProvider bit NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StudentSpecialEducationProgramAssociationServiceProvider_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , StaffHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentSpecialEducationProgramAssociationSpecialEducationProgramService (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , SpecialEducationProgramServiceDescriptorHashKey uniqueIdentifier NOT NULL
        -- Attributes
        , PrimaryIndicator bit NULL
        , ServiceBeginDate date NULL
        , ServiceEndDate date NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StudentSpecialEducationProgramAssociationSpecialEducationProgramService_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , SpecialEducationProgramServiceDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentSpecialEducationProgramAssociationSpecialEducationProgramServiceProvider (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , StaffHashKey uniqueIdentifier NOT NULL
        -- Attributes
        , PrimaryProvider bit NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StudentSpecialEducationProgramAssociationSpecialEducationProgramServiceProvider_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , StaffHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentTitleIPartAProgramAssociation (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , GeneralStudentProgramAssociationHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , BeginDate date NOT NULL
        , EducationOrganizationId int NOT NULL
        , ProgramEducationOrganizationId int NOT NULL
        , ProgramName nvarchar(60) NOT NULL
        , ProgramTypeDescriptorId int NOT NULL
        , StudentUSI int NOT NULL
        -- References
        , TitleIPartAParticipantDescriptorHashKey uniqueIdentifier NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT StudentTitleIPartAProgramAssociation_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.StudentTitleIPartAProgramAssociation_AttributesHistory))
    GO
    
    CREATE TABLE edfi.StudentTitleIPartAProgramAssociationService (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , ServiceDescriptorHashKey uniqueIdentifier NOT NULL
        -- Attributes
        , PrimaryIndicator bit NULL
        , ServiceBeginDate date NULL
        , ServiceEndDate date NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StudentTitleIPartAProgramAssociationService_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , ServiceDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.StudentTitleIPartAProgramAssociationTitleIPartAProgramService (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , TitleIPartAProgramServiceDescriptorHashKey uniqueIdentifier NOT NULL
        -- Attributes
        , PrimaryIndicator bit NULL
        , ServiceBeginDate date NULL
        , ServiceEndDate date NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT StudentTitleIPartAProgramAssociationTitleIPartAProgramService_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , TitleIPartAProgramServiceDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.Survey (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        -- Primary key columns
        , Namespace nvarchar(255) NOT NULL
        , SurveyIdentifier nvarchar(60) NOT NULL
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT Survey_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.Survey_AttributesHistory))
    GO
    
    CREATE TABLE edfi.SurveyCategoryDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , SurveyCategoryDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT SurveyCategoryDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.SurveyCategoryDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.SurveyCourseAssociation (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , CourseHashKey uniqueIdentifier NOT NULL
        , SurveyHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , CourseCode nvarchar(60) NOT NULL
        , EducationOrganizationId int NOT NULL
        , Namespace nvarchar(255) NOT NULL
        , SurveyIdentifier nvarchar(60) NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        , Id uniqueidentifier NOT NULL
        , LastModifiedDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT SurveyCourseAssociation_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.SurveyCourseAssociation_AttributesHistory))
    GO
    
    CREATE TABLE edfi.SurveyLevelDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , SurveyLevelDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT SurveyLevelDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.SurveyLevelDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.SurveyProgramAssociation (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , ProgramHashKey uniqueIdentifier NOT NULL
        , SurveyHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , EducationOrganizationId int NOT NULL
        , Namespace nvarchar(255) NOT NULL
        , ProgramName nvarchar(60) NOT NULL
        , ProgramTypeDescriptorId int NOT NULL
        , SurveyIdentifier nvarchar(60) NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        , Id uniqueidentifier NOT NULL
        , LastModifiedDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT SurveyProgramAssociation_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.SurveyProgramAssociation_AttributesHistory))
    GO
    
    CREATE TABLE edfi.SurveyQuestion (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , SurveyHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , Namespace nvarchar(255) NOT NULL
        , QuestionCode nvarchar(60) NOT NULL
        , SurveyIdentifier nvarchar(60) NOT NULL
        -- Attributes
        , QuestionText nvarchar(1024) NOT NULL
        -- References
        , QuestionFormDescriptorHashKey uniqueIdentifier NOT NULL
        , SurveySectionHashKey uniqueIdentifier NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        , Id uniqueidentifier NOT NULL
        , LastModifiedDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT SurveyQuestion_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.SurveyQuestion_AttributesHistory))
    GO
    
    CREATE TABLE edfi.SurveyQuestionMatrix (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        -- Contextual primary key
        , MatrixElement nvarchar(255) NOT NULL
        -- Attributes
        , MaxRawScore int NULL
        , MinRawScore int NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT SurveyQuestionMatrix_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , MatrixElement
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.SurveyQuestionResponseChoice (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        -- Contextual primary key
        , SortOrder int NOT NULL
        -- Attributes
        , NumericValue int NULL
        , TextValue nvarchar(255) NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT SurveyQuestionResponseChoice_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , SortOrder
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.SurveyQuestionResponse (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , SurveyQuestionHashKey uniqueIdentifier NOT NULL
        , SurveyResponseHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , Namespace nvarchar(255) NOT NULL
        , QuestionCode nvarchar(60) NOT NULL
        , SurveyIdentifier nvarchar(60) NOT NULL
        , SurveyResponseIdentifier nvarchar(60) NOT NULL
        -- Attributes
        , Comment nvarchar(1024) NULL
        , NoResponse bit NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        , Id uniqueidentifier NOT NULL
        , LastModifiedDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT SurveyQuestionResponse_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.SurveyQuestionResponse_AttributesHistory))
    GO
    
    CREATE TABLE edfi.SurveyQuestionResponseSurveyQuestionMatrixElementResponse (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT SurveyQuestionResponseSurveyQuestionMatrixElementResponse_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , MatrixElement
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.SurveyQuestionResponseValue (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        -- Contextual primary key
        , SurveyQuestionResponseValueIdentifier int NOT NULL
        -- Attributes
        , NumericResponse int NULL
        , TextResponse nvarchar(2048) NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT SurveyQuestionResponseValue_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , SurveyQuestionResponseValueIdentifier
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.SurveyResponse (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , SurveyHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , Namespace nvarchar(255) NOT NULL
        , SurveyIdentifier nvarchar(60) NOT NULL
        , SurveyResponseIdentifier nvarchar(60) NOT NULL
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
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT SurveyResponse_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.SurveyResponse_AttributesHistory))
    GO
    
    CREATE TABLE edfi.SurveyResponseSurveyLevel (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Identifying references
        , SurveyLevelDescriptorHashKey uniqueIdentifier NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary key constraint
        , CONSTRAINT SurveyResponseSurveyLevel_PK PRIMARY KEY CLUSTERED (
            HashKey
            , SchoolYearContext
            , SurveyLevelDescriptorHashKey
    )
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    GO

    CREATE TABLE edfi.SurveyResponseEducationOrganizationTargetAssociation (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , EducationOrganizationHashKey uniqueIdentifier NOT NULL
        , SurveyResponseHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , EducationOrganizationId int NOT NULL
        , Namespace nvarchar(255) NOT NULL
        , SurveyIdentifier nvarchar(60) NOT NULL
        , SurveyResponseIdentifier nvarchar(60) NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        , Id uniqueidentifier NOT NULL
        , LastModifiedDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT SurveyResponseEducationOrganizationTargetAssociation_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.SurveyResponseEducationOrganizationTargetAssociation_AttributesHistory))
    GO
    
    CREATE TABLE edfi.SurveyResponseStaffTargetAssociation (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , StaffHashKey uniqueIdentifier NOT NULL
        , SurveyResponseHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , Namespace nvarchar(255) NOT NULL
        , StaffUSI int NOT NULL
        , SurveyIdentifier nvarchar(60) NOT NULL
        , SurveyResponseIdentifier nvarchar(60) NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        , Id uniqueidentifier NOT NULL
        , LastModifiedDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT SurveyResponseStaffTargetAssociation_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.SurveyResponseStaffTargetAssociation_AttributesHistory))
    GO
    
    CREATE TABLE edfi.SurveySection (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , SurveyHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , Namespace nvarchar(255) NOT NULL
        , SurveyIdentifier nvarchar(60) NOT NULL
        , SurveySectionTitle nvarchar(255) NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        , Id uniqueidentifier NOT NULL
        , LastModifiedDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT SurveySection_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.SurveySection_AttributesHistory))
    GO
    
    CREATE TABLE edfi.SurveySectionAssociation (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , SectionHashKey uniqueIdentifier NOT NULL
        , SurveyHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , LocalCourseCode nvarchar(60) NOT NULL
        , Namespace nvarchar(255) NOT NULL
        , SchoolId int NOT NULL
        , SchoolYear smallint NOT NULL
        , SectionIdentifier nvarchar(255) NOT NULL
        , SessionName nvarchar(60) NOT NULL
        , SurveyIdentifier nvarchar(60) NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        , Id uniqueidentifier NOT NULL
        , LastModifiedDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT SurveySectionAssociation_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.SurveySectionAssociation_AttributesHistory))
    GO
    
    CREATE TABLE edfi.SurveySectionResponse (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , SurveyResponseHashKey uniqueIdentifier NOT NULL
        , SurveySectionHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , Namespace nvarchar(255) NOT NULL
        , SurveyIdentifier nvarchar(60) NOT NULL
        , SurveyResponseIdentifier nvarchar(60) NOT NULL
        , SurveySectionTitle nvarchar(255) NOT NULL
        -- Attributes
        , SectionRating decimal(9,3) NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        , Id uniqueidentifier NOT NULL
        , LastModifiedDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT SurveySectionResponse_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.SurveySectionResponse_AttributesHistory))
    GO
    
    CREATE TABLE edfi.SurveySectionResponseEducationOrganizationTargetAssociation (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , EducationOrganizationHashKey uniqueIdentifier NOT NULL
        , SurveySectionResponseHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , EducationOrganizationId int NOT NULL
        , Namespace nvarchar(255) NOT NULL
        , SurveyIdentifier nvarchar(60) NOT NULL
        , SurveyResponseIdentifier nvarchar(60) NOT NULL
        , SurveySectionTitle nvarchar(255) NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        , Id uniqueidentifier NOT NULL
        , LastModifiedDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT SurveySectionResponseEducationOrganizationTargetAssociation_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.SurveySectionResponseEducationOrganizationTargetAssociation_AttributesHistory))
    GO
    
    CREATE TABLE edfi.SurveySectionResponseStaffTargetAssociation (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , StaffHashKey uniqueIdentifier NOT NULL
        , SurveySectionResponseHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , Namespace nvarchar(255) NOT NULL
        , StaffUSI int NOT NULL
        , SurveyIdentifier nvarchar(60) NOT NULL
        , SurveyResponseIdentifier nvarchar(60) NOT NULL
        , SurveySectionTitle nvarchar(255) NOT NULL
        -- Boilerplate
        , CreateDate datetime2 NOT NULL
        , Id uniqueidentifier NOT NULL
        , LastModifiedDate datetime2 NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT SurveySectionResponseStaffTargetAssociation_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.SurveySectionResponseStaffTargetAssociation_AttributesHistory))
    GO
    
    CREATE TABLE edfi.TeachingCredentialBasisDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , TeachingCredentialBasisDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT TeachingCredentialBasisDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.TeachingCredentialBasisDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.TeachingCredentialDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , TeachingCredentialDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT TeachingCredentialDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.TeachingCredentialDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.TechnicalSkillsAssessmentDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , TechnicalSkillsAssessmentDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT TechnicalSkillsAssessmentDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.TechnicalSkillsAssessmentDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.TelephoneNumberTypeDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , TelephoneNumberTypeDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT TelephoneNumberTypeDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.TelephoneNumberTypeDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.TermDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , TermDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT TermDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.TermDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.TitleIPartAParticipantDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , TitleIPartAParticipantDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT TitleIPartAParticipantDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.TitleIPartAParticipantDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.TitleIPartAProgramServiceDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , TitleIPartAProgramServiceDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT TitleIPartAProgramServiceDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.TitleIPartAProgramServiceDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.TitleIPartASchoolDesignationDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , TitleIPartASchoolDesignationDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT TitleIPartASchoolDesignationDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.TitleIPartASchoolDesignationDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.TribalAffiliationDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , TribalAffiliationDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT TribalAffiliationDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.TribalAffiliationDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.VisaDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , VisaDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT VisaDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.VisaDescriptor_AttributesHistory))
    GO
    
    CREATE TABLE edfi.WeaponDescriptor (
        HashKey uniqueidentifier NOT NULL
        , SchoolYearContext smallint NOT NULL
        -- Primary key references
        , DescriptorHashKey uniqueIdentifier NOT NULL
        -- Primary key columns
        , WeaponDescriptorId int NOT NULL
        -- Temporal table artifacts
        , SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
        , SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
        , PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
        -- Primary Key Constraint
        , CONSTRAINT WeaponDescriptor_PK PRIMARY KEY CLUSTERED (HashKey, SchoolYearContext)
        WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
        ) ON [PRIMARY]
        WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = edfi.WeaponDescriptor_AttributesHistory))
    GO
    
