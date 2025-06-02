let Config = ../config.dhall

let gdprFramework =
      Config.ComplianceFramework::{
      , name = "GDPR"
      , version = "2018"
      , requirements =
          [ "Data minimization"
          , "Purpose limitation"
          , "Storage limitation"
          , "Accuracy"
          , "Integrity and confidentiality"
          ]
      }

let compliancePrompt =
      Config.PromptTemplate::{
      , name = "gdpr_compliance_check"
      , description = "Template for checking GDPR compliance of data processing"
      , components =
          [ Config.PromptComponent::{
            , name = "processing_context"
            , content =
                ''
                Data Processing Activity:
                - Operation: {OPERATION_TYPE}
                - Data Categories: {DATA_CATEGORIES}
                - Processing Purpose: {PROCESSING_PURPOSE}
                - Retention Period: {RETENTION_PERIOD}
                ''
            , required = True
            }
          , Config.PromptComponent::{
            , name = "data_subject_rights"
            , content =
                ''
                Data Subject Rights Implementation:
                - Right to Access: {ACCESS_MECHANISM}
                - Right to Rectification: {RECTIFICATION_PROCESS}
                - Right to Erasure: {ERASURE_PROCESS}
                - Right to Portability: {PORTABILITY_FORMAT}
                ''
            , required = True
            }
          , Config.PromptComponent::{
            , name = "security_measures"
            , content =
                ''
                Security Measures:
                - Encryption: {ENCRYPTION_METHOD}
                - Access Controls: {ACCESS_CONTROLS}
                - Data Backup: {BACKUP_FREQUENCY}
                - Breach Response: {BREACH_PROTOCOL}
                ''
            , required = True
            }
          ]
      , validation =
          [ "Verify legal basis for processing"
          , "Check data minimization compliance"
          , "Validate retention periods"
          , "Ensure rights implementation"
          , "Verify security measures adequacy"
          ]
      }

let withSafety =
      Config.addSafetyConstraints compliancePrompt Config.SafetyLevel.Critical

in  withSafety 