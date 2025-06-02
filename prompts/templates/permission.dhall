let Config = ../config.dhall

let permissionPrompt =
      Config.PromptTemplate::{
      , name = "data_access_permission"
      , description =
          "Template for requesting permission to access sensitive data"
      , components =
          [ Config.PromptComponent::{
            , name = "user_context"
            , content =
                ''
                User requesting access:
                - Role: {USER_ROLE}
                - Department: {DEPARTMENT}
                - Access Level: {ACCESS_LEVEL}
                ''
            , required = True
            }
          , Config.PromptComponent::{
            , name = "data_context"
            , content =
                ''
                Data being accessed:
                - Type: {DATA_TYPE}
                - Classification: {DATA_CLASSIFICATION}
                - Purpose: {ACCESS_PURPOSE}
                ''
            , required = True
            }
          , Config.PromptComponent::{
            , name = "compliance_context"
            , content =
                ''
                Compliance requirements:
                - Framework: {COMPLIANCE_FRAMEWORK}
                - Requirements: {COMPLIANCE_REQUIREMENTS}
                - Audit Trail: Required
                ''
            , required = True
            }
          ]
      , validation =
          [ "Verify user role matches access level"
          , "Check data classification against user clearance"
          , "Validate purpose against allowed use cases"
          , "Ensure compliance requirements are met"
          ]
      }

let withSafety = Config.addSafetyConstraints permissionPrompt Config.SafetyLevel.High

in  withSafety 