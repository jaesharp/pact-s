-- Basic types for prompt engineering
let Text/concatSep = https://prelude.dhall-lang.org/Text/concatSep

let PromptComponent =
      { Type =
          { name : Text
          , content : Text
          , required : Bool
          }
      , default =
          { name = ""
          , content = ""
          , required = False
          }
      }

let PromptTemplate =
      { Type =
          { name : Text
          , description : Text
          , components : List PromptComponent.Type
          , validation : List Text
          }
      , default =
          { name = ""
          , description = ""
          , components = [] : List PromptComponent.Type
          , validation = [] : List Text
          }
      }

let SafetyLevel = < Low | Medium | High | Critical >

let ComplianceFramework =
      { Type =
          { name : Text
          , version : Text
          , requirements : List Text
          }
      , default =
          { name = ""
          , version = "1.0"
          , requirements = [] : List Text
          }
      }

let AIModel =
      { Type =
          { name : Text
          , capabilities : List Text
          , constraints : List Text
          }
      , default =
          { name = ""
          , capabilities = [] : List Text
          , constraints = [] : List Text
          }
      }

-- Configuration for different prompt types
let PermissionPrompt =
      { Type =
          { action : Text
          , context : List Text
          , constraints : List Text
          , safetyLevel : SafetyLevel
          }
      , default =
          { action = ""
          , context = [] : List Text
          , constraints = [] : List Text
          , safetyLevel = SafetyLevel.High
          }
      }

let CompliancePrompt =
      { Type =
          { framework : ComplianceFramework.Type
          , evidence : List Text
          , validation : List Text
          }
      , default =
          { framework = ComplianceFramework::{=}
          , evidence = [] : List Text
          , validation = [] : List Text
          }
      }

let AIAssistancePrompt =
      { Type =
          { model : AIModel.Type
          , task : Text
          , context : List Text
          , constraints : List Text
          }
      , default =
          { model = AIModel::{=}
          , task = ""
          , context = [] : List Text
          , constraints = [] : List Text
          }
      }

-- Helper functions for prompt composition
let combinePrompts =
      λ(p1 : PromptTemplate.Type) →
      λ(p2 : PromptTemplate.Type) →
        PromptTemplate::{
        , name = "${p1.name}_${p2.name}"
        , description = "${p1.description} combined with ${p2.description}"
        , components = p1.components # p2.components
        , validation = p1.validation # p2.validation
        }

let addSafetyConstraints =
      λ(prompt : PromptTemplate.Type) →
      λ(level : SafetyLevel) →
        let safetyConstraints =
              merge
                { Low = [ "Basic validation required" ]
                , Medium =
                    [ "Input validation required"
                    , "Output validation required"
                    ]
                , High =
                    [ "Strict input validation"
                    , "Strict output validation"
                    , "Context verification"
                    ]
                , Critical =
                    [ "Complete input/output validation"
                    , "Full context verification"
                    , "Safety bounds checking"
                    , "Rollback capability"
                    ]
                }
                level

        in  prompt ⫽ { validation = prompt.validation # safetyConstraints }

in  { PromptComponent
    , PromptTemplate
    , SafetyLevel
    , ComplianceFramework
    , AIModel
    , PermissionPrompt
    , CompliancePrompt
    , AIAssistancePrompt
    , combinePrompts
    , addSafetyConstraints
    } 