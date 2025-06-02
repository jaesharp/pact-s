let Config = ../config.dhall

let graphAssistantModel =
      Config.AIModel::{
      , name = "graph_assistant"
      , capabilities =
          [ "Graph pattern recognition"
          , "Schema optimization"
          , "Query optimization"
          , "Semantic analysis"
          ]
      , constraints =
          [ "No direct data modification"
          , "Read-only access to graph"
          , "Pattern suggestions only"
          , "Performance impact limits"
          ]
      }

let aiAssistancePrompt =
      Config.PromptTemplate::{
      , name = "graph_pattern_assistance"
      , description =
          "Template for requesting AI assistance with graph pattern analysis"
      , components =
          [ Config.PromptComponent::{
            , name = "task_context"
            , content =
                ''
                Task Description:
                - Type: {TASK_TYPE}
                - Objective: {TASK_OBJECTIVE}
                - Constraints: {TASK_CONSTRAINTS}
                - Expected Output: {EXPECTED_OUTPUT}
                ''
            , required = True
            }
          , Config.PromptComponent::{
            , name = "graph_context"
            , content =
                ''
                Graph Context:
                - Schema: {GRAPH_SCHEMA}
                - Node Types: {NODE_TYPES}
                - Edge Types: {EDGE_TYPES}
                - Current Patterns: {EXISTING_PATTERNS}
                ''
            , required = True
            }
          , Config.PromptComponent::{
            , name = "performance_context"
            , content =
                ''
                Performance Requirements:
                - Response Time: {MAX_RESPONSE_TIME}
                - Memory Usage: {MAX_MEMORY_USAGE}
                - Complexity Limit: {COMPLEXITY_THRESHOLD}
                ''
            , required = True
            }
          ]
      , validation =
          [ "Verify task alignment with capabilities"
          , "Check pattern complexity"
          , "Validate performance impact"
          , "Ensure constraint compliance"
          ]
      }

let withSafety =
      Config.addSafetyConstraints aiAssistancePrompt Config.SafetyLevel.High

in  withSafety 