let Config = ../config.dhall

let baseComplianceFramework =
      Config.ComplianceFramework::{
      , name = "base_compliance"
      , version = "1.0"
      , requirements =
          [ "Access control"
          , "Data protection"
          , "Audit logging"
          , "Error handling"
          , "System integrity"
          ]
      }

let compliancePrompt =
      Config.PromptTemplate::{
      , name = "base_compliance_check"
      , description = "Template for checking system compliance with base requirements"
      , components =
          [ Config.PromptComponent::{
            , name = "operation_context"
            , content =
                ''
                Operation Details:
                - Type: {OPERATION_TYPE}
                - Scope: {OPERATION_SCOPE}
                - Impact Level: {IMPACT_LEVEL}
                - Duration: {OPERATION_DURATION}
                ''
            , required = True
            }
          , Config.PromptComponent::{
            , name = "system_context"
            , content =
                ''
                System State:
                - Current Mode: {SYSTEM_MODE}
                - Access Level: {ACCESS_LEVEL}
                - Safety Bounds: {SAFETY_BOUNDS}
                - Error Tolerance: {ERROR_TOLERANCE}
                ''
            , required = True
            }
          , Config.PromptComponent::{
            , name = "audit_context"
            , content =
                ''
                Audit Requirements:
                - Logging Level: {LOG_LEVEL}
                - Tracking ID: {TRACKING_ID}
                - Verification Method: {VERIFY_METHOD}
                ''
            , required = True
            }
          ]
      , validation =
          [ "Verify operation permissions"
          , "Check system state validity"
          , "Validate audit trail completeness"
          , "Ensure error handling coverage"
          , "Verify system integrity"
          ]
      }

let withSafety =
      Config.addSafetyConstraints compliancePrompt Config.SafetyLevel.High

in  withSafety 