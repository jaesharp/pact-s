# PACT-System: A Permission, Accountability, C (Consent, Compliance, Competency, Clarity), Transparency System and Framework for Generative AI Programming and Agentic Governance

> **🚧 Work in Progress**: This project is in early development (v0.1.0-alpha). The conceptual framework is well-defined, but implementation is ongoing. Contributions and feedback are welcome!

The PACT-System is an advanced, structured framework for governing AI agent operations. It ensures that agent actions are transparent, controlled, and precisely aligned with the user's explicit consent and directives, placing the user in sole charge and making them fully responsible for all outcomes stemming from agent activity. Instances or applications of this framework are often referred to as PACTs, while the system itself can be shortened to PACT-S. An individual record of a consented, compliant, competent, clear, and transparent operation may be referred to as a 'pact'.

## Overview

The PACT-System evolves traditional AI governance by focusing on verifiable alignment with user intent and establishing clear lines of responsibility. It integrates a four-dimensional approach to the crucial 'C' component—Consent (as the sole basis for action), Compliance (with user directives and operational protocols), Competency (of the agent to fulfill consented tasks), and Clarity (in all system communications and operations concerning the user)—to provide a systematic methodology for trustworthy and user-directed AI operations. This document describes the PACT-System (PACT-S).

## The PACT-System (PACT-S) Pillars

1.  **P - Permission Management**
    *   No agent action or implementation without explicit, verifiable permission granted by the user, reflecting their consent for specific operations.
    *   **Features**:
        *   Fine-grained access control for agent capabilities and data, based on user authorization.
        *   Context-aware authorization mechanisms, ensuring permissions are relevant to the user's current consented task.
        *   Dynamic permission adjustment based on operational modes or risk levels, always deferring to user confirmation for escalations.
        *   Comprehensive audit trails for all permission grants, checks, and changes, attributable to user directives.
        *   Clear protocols for requesting and verifying implementation permissions, ensuring user understanding before consent.

2.  **A - Accountability Framework**
    *   All agent actions are traceable directly to user-consented directives, and responsibility for outcomes rests solely with the user.
    *   **Features**:
        *   Robust action tracking and logging for all agent operations and decisions, linked to specific user consent events.
        *   Attribution of decisions and their outcomes to the sequence of user-consented agent actions.
        *   Performance monitoring against defined objectives as set by the user.
        *   Impact assessment capabilities for agent-driven changes, for user review and acceptance.

3.  **C - Consent, Compliance, Competency, and Clarity**
    *   **C1 - Consent Management**
        *   Ensuring agent operations are exclusively driven by, and continuously validated against, the user's informed and affirmative consent. The user is the sole authority for agent actions.
        *   **Features**:
            *   Granular mechanisms for obtaining, managing, and revoking user consent for specific data processing tasks and agent interactions (e.g., in a user-centric application context where the user explicitly takes responsibility for initiated actions).
            *   Clear articulation to the user of how the agent will use data and make decisions, as a prerequisite for consent.
            *   Protocols for state persistence and referencing saved states based *only* on user directives (`@@reference {TAG}`).
    *   **C2 - Compliance Engine**
        *   Adherence to user-defined operational protocols and explicit directives, as well as relevant external regulations that support user control and data rights.
        *   **Features**:
            *   Mapping and enforcement of user-specific operational rules and any applicable regulatory requirements (e.g., data privacy laws like GDPR, HIPAA) that empower the user.
            *   Automated compliance checking within agent workflows to ensure continuous alignment with consented parameters.
            *   Violation detection (deviation from user consent or established protocols), reporting to the user, and standardized resolution procedures requiring user approval.
            *   Regular self-verification and compliance checks (e.g., `pact_compliance.md` self-check protocol) to maintain alignment.
    *   **C3 - Competency Assurance**
        *   Ensuring an agent possesses and reliably exercises the necessary capabilities to fulfill user-consented tasks accurately and predictably.
        *   **Features**:
            *   Verification of agent model capabilities and limitations relative to the user's intended task.
            *   Processes for ongoing evaluation of agent performance in executing consented actions.
            *   Guidelines for appropriate tool usage by the agent, ensuring it operates within its competency for a given user directive.
            *   Mode discipline: Defaulting to planning or restricted modes, requiring explicit user consent for transitions to higher-capability modes that expand the scope of potential actions.
    *   **C4 - Clarity**
        *   Ensuring all system communications, agent actions, and the basis for those actions are understandable and unambiguous to the user.
        *   **Features**:
            *   Clear, concise, and jargon-free language in all user interfaces and system messages.
            *   Explanations of agent reasoning or decision-making processes available in a digestible format (complements Transparency's raw data).
            *   Unambiguous presentation of choices for consent and permission, detailing scope and implications.
            *   Mechanisms for users to easily query the system about its state, data handling practices, and the purpose of its actions.

4.  **T - Transparency Layer**
    *   All agent actions and their underlying data are documented, inspectable, and verifiable by the user, ensuring full visibility into operations performed on their behalf.
    *   **Features**:
        *   Comprehensive activity logging for operations, tool calls, and state changes, accessible to the user.
        *   Access to the data and models used in decision-making processes, where appropriate and feasible.
        *   Data lineage tracking to allow the user to understand data provenance and transformations.
        *   Generation of audit reports and compliance documentation for user review.
        *   Standardized tool call formatting with explicit reasoning (`tool_call_template.md`), clarifying the agent's interpretation of user directives.

5.  **S - System Integration & Operation**
    *   The PACT-System is an implementable system designed to facilitate user control and responsibility over integrated agent operations.
    *   **Features**:
        *   Defined project structure (core, tools, protocols, verification, memory, tests) supporting PACT-System principles.
        *   Integration points with AI agents, development workflows (CI/CD), monitoring tools, and audit frameworks, all designed to uphold user authority.
        *   Knowledge graph integrity for maintaining an accurate state representation of the system, its operations, and user consent status.
        *   Usage guidelines for specific project implementations (e.g., project-specific guidelines emphasizing a default planning mode, comprehensive documentation of proposed actions for user approval, and explicit permission requests before execution, each forming a basis for a 'pact').

## Core Principles of the PACT-System in Action

(This section summarizes the principles detailed in [`core/principles.md`](./core/principles.md))

*   **User Permission First & Foremost**: Explicit user consent is the prerequisite for any agent action within a PACT-System.
*   **Transparent & Clear Operations**: Agent actions are documented, justifiable, and understandable to the user, often recorded as individual 'pacts'.
*   **C (Consent, Compliance, Competency, Clarity) Driven for User Alignment**: Operations are based on user consent, compliant with user directives, demonstrate agent competency to act as instructed, and are clearly communicated.
*   **Consistent & Accountable Tool Usage**: Standardized, reasoned tool calls, transparent to the user, with each significant call potentially forming a 'pact'.
*   **Knowledge Graph Integrity for User Oversight**: Accurate state representation, reflecting user-consented configurations and logged 'pacts'.
*   **Verifiable Adherence to User Directives**: Regular checks and auditable evidence of alignment within any PACTs deployment.
*   **State Persistence & Reference by User Command**: Controlled management of operational states as directed by the user.
*   **Mode Discipline for User Control**: Controlled transitions between operational modes, always requiring user consent for escalation.

## Project Structure (Illustrative for a PACT-S based project)

The PACT-System project is organized as follows to separate concerns and maintain clarity:

```
pact_system_project/ # This represents the root of the PACT-S project itself.
├── .github/         # GitHub-specific files (workflows, issue templates, PR templates)
├── .idea/           # IDE-specific settings (typically in .gitignore)
├── .plans/          # Project planning documents
├── .refactor/       # Historical refactoring documents (contents moved to .plans)
├── CHANGELOG.md     # Project changelog
├── CONTRIBUTING.md  # Contribution guidelines
├── LICENSE-BSD      # BSD 3-Clause License text
├── LICENSE-MIT      # MIT License text
├── README.md        # This main project overview
├── core/            # Core PACT-System principles, foundational concepts
├── docs/            # User guides, conceptual documentation, architecture
│   ├── src/         # Source .tex files for PDF generation
│   └── ...          
├── evaluations/     # PACT-System effectiveness evaluations (content TBD)
├── examples/        # Example PACT-System implementations/use-cases
├── governance-framework/ # Source material, reviewed for integration
├── memory/          # Knowledge persistence, state tracking, KG schema & protocols
├── plans/           # Source material (future research ideas from S2)
├── prompts/         # Standardized prompts, templates
│   └── templates/
├── protocols/       # Operational protocols, procedures, compliance checklists
├── src/             # Source code for reference implementations/libraries
│   ├── core/        # Core implementation parts
│   └── types/       # Type definitions
├── tests/           # Verification tests, test plans, fixtures
│   └── scripts/     # Test execution scripts
├── tools/           # Tooling guides & references
│   ├── examples/    # Specific examples of using tools
│   └── reference_implementations/ 
└── verification/    # Compliance evidence & verification procedures
```

**Key Directory Overview:**

*   **`./README.md`**: (This Document) Main overview, PACT-System pillars, and core principles.
*   **[`.github/`](./.github/)**: GitHub-specific configurations. (A `README.md` could be added here if complex workflows are defined).
*   **[`docs/plans/`](./docs/plans/README.md)**: Collection of strategic planning documents, historical records, and ongoing development plans. Includes the main project roadmap.
*   **[`CHANGELOG.md`](./CHANGELOG.md)**: Tracks notable changes to the project.
*   **[`CONTRIBUTING.md`](./CONTRIBUTING.md)**: Guidelines for contributing to the PACT-System framework.
*   **[`core/`](./core/principles.md)**: Elaborates on the core principles of the PACT-System.
*   **[`docs/`](./docs/README.md)** (to be created/enhanced): Main entry for user guides, conceptual documentation, system architecture, and API references. Links to specific documents like:
    *   [`docs/knowledge_management/kg_apache_age_example.md`](./docs/knowledge_management/kg_apache_age_example.md)
    *   [`docs/developer_guides/worktree_management_protocol.md`](./protocols/development_workflow/worktree_management_protocol.md)
*   **[`evaluations/`](./evaluations/README.md)** (to be created): For documents related to testing and evaluating the effectiveness of PACT-System implementations.
*   **[`examples/`](./examples/README.md)** (to be created): To house example implementations or use-cases of the PACT-System (distinct from `tools/examples/` which are for specific tool usage).
*   **[`governance-framework/`](./governance-framework/README.md)** (if it exists, or directory to be reviewed): Contains source material from a previous iteration.
*   **[`memory/`](./memory/README.md)**: Comprehensive guide to PACT-System memory architecture, Knowledge Graph schema, and access protocols.
*   **[`plans/`](./docs/plans/README.md)** (if it exists, or directory to be reviewed; distinct from `.plans/`): Contains source material related to future research ideas from a previous iteration.
*   **[`prompts/`](./prompts/README.md)** (to be created): For standardized prompts, templates (e.g., Dhall files like [`prompts/templates/compliance.dhall`](./prompts/templates/compliance.dhall)).
*   **[`protocols/`](./protocols/README.md)**: Index and collection of PACT-System operational protocols.
*   **[`src/`](./src/README.md)** (to be created): For source code of any PACT-System reference implementation or core libraries.
*   **[`tests/`](./tests/README.md)**: Overview of testing documentation, specific test documents, and execution methods.
*   **[`tools/`](./tools/README.md)** (Tool Precedence Guide - consider renaming to `README.md`): Index and collection of utility guides, symbolic tool references, and best practices.
    *   [`tools/examples/`](./tools/reference_implementations/README.md) (to be created): Specific examples of using defined tools.
*   **[`verification/`](./verification/README.md)**: PACT-System verification procedures and principles.

## Integration & Usage Example (Conceptual Haskell)

```haskell
-- Hypothetical Haskell representation for a PACT-System
module PACT_System.Core where

import Data.Time (UTCTime)

-- Define core data types (simplified)
data User = User { userId :: String }

data Resource = Resource { resourceId :: String, resourceType :: String }

data ActionType = PROCESS_USER_DATA | MODIFY_SYSTEM | READ_SENSITIVE_DATA
  deriving (Show, Eq)

data PACTS_Mode = Strict | Lenient
  deriving (Show, Eq)

data ComplianceRule = AI_SAFETY_STD_001 | PROJECT_EXAMPLE_POLICY | GDPR_ARTICLE_5
  deriving (Show, Eq)

data ConsentContext = ConsentContext { sessionId :: String, consentTimestamp :: Maybe UTCTime }

data CompetencyProfile = CompetencyProfile { profileName :: String, capabilities :: [String] }

data PACT_System_Config = PACT_System_Config {
  mode :: PACTS_Mode,
  loggingEnabled :: Bool,
  complianceRules :: [ComplianceRule],
  defaultConsent :: ConsentContext,
  baseCompetency :: CompetencyProfile
}

-- Represents the PACT-System instance
data PACT_System_Instance = PACT_System_Instance { config :: PACT_System_Config }

-- Initialize the PACT-System
initPACT_System :: PACT_System_Config -> PACT_System_Instance
initPACT_System cfg = PACT_System_Instance { config = cfg }

data PermissionContext = PermissionContext {
  action :: ActionType,
  actor :: User,
  resource :: Resource,
  operationContext :: String -- e.g., JSON string or custom data type
}

-- Permission Check
checkPermission :: PACT_System_Instance -> PermissionContext -> IO Bool
checkPermission pactsInstance permCtx = do
  -- Placeholder for actual permission logic:
  -- 1. Log permission check request (Transparency, Accountability)
  -- 2. Evaluate against Permission rules (Permission)
  -- 3. Check against relevant Compliance rules (Compliance)
  -- 4. Verify Consent if action involves user data (Consent)
  putStrLn $ "Checking permission for action: " ++ show (action permCtx) ++ " by user: " ++ userId (actor permCtx)
  return True -- Simplified: always grant permission for example

-- Competency Check (Illustrative)
isCompetentFor :: PACT_System_Instance -> ActionType -> String -> IO Bool
isCompetentFor pactsInstance actionType taskDescription = do
  -- Placeholder for competency logic:
  -- 1. Log competency check (Transparency, Accountability)
  -- 2. Evaluate if the AI system/model associated with this instance 
  --    has the required capabilities for the actionType and taskDescription (Competency)
  putStrLn $ "Checking competency for action: " ++ show actionType
  return True -- Simplified: always competent for example


data TaskDetails = TaskDetails { 
  taskType :: String, 
  taskResource :: Resource,
  complianceReqs :: [ComplianceRule] 
}

data TaskInput = TaskInput { details :: TaskDetails, toolUsed :: String }

data TaskOutput a = TaskOutput { outputData :: a, executionLog :: String }

-- Action Execution (with Accountability & Transparency)
-- Uses a simplified approach where the action is an IO operation
execute :: PACT_System_Instance -> TaskInput -> IO a -> IO (TaskOutput a)
execute pactsInstance taskInput actionToPerform = do
  -- Placeholder for execution logic:
  -- 1. Log action initiation (Transparency, Accountability)
  -- 2. Perform the action
  -- 3. Log action completion and outcome (Transparency, Accountability)
  putStrLn $ "Executing task: " ++ taskType (details taskInput) ++ " with tool: " ++ toolUsed taskInput
  result <- actionToPerform
  return TaskOutput { outputData = result, executionLog = "Action performed successfully." }

-- Compliance Verification
verifyCompliance :: PACT_System_Instance -> TaskOutput a -> [ComplianceRule] -> IO Bool
verifyCompliance pactsInstance taskOutput rules = do
  -- Placeholder for compliance logic:
  -- 1. Log compliance verification attempt (Transparency, Accountability)
  -- 2. Check outputData and executionLog against specified rules (Compliance)
  putStrLn $ "Verifying compliance for output: " ++ executionLog taskOutput
  return True -- Simplified: always compliant for example

-- Example Usage
performAiTask :: PACT_System_Instance -> TaskDetails -> User -> String -> IO (TaskOutput String)
performAiTask pacts userTaskDetails user opContext = do
  -- Permission Check
  permissionGranted <- checkPermission pacts PermissionContext {
    action = PROCESS_USER_DATA, -- Example action
    actor = user,
    resource = taskResource userTaskDetails,
    operationContext = opContext
  }
  if not permissionGranted 
    then fail "Permission denied by PACT-System."
    else do
      -- Competency Check (Illustrative)
      competent <- isCompetentFor pacts PROCESS_USER_DATA "Analysing user sentiment"
      if not competent
        then fail "AI competency not sufficient for this task type."
        else do
          -- Action
          let aiAction :: IO String
              aiAction = return "processed_user_data_example" -- Simplified AI action
          
          taskOutput <- execute pacts TaskInput { details = userTaskDetails, toolUsed = "internal_haskell_processor"} aiAction
          
          -- Compliance Verification
          complianceOk <- verifyCompliance pacts taskOutput (complianceReqs userTaskDetails)
          if not complianceOk
            then fail "Compliance verification failed."
            else return taskOutput

main :: IO ()
main = do
  let config = PACT_System_Config {
    mode = Strict,
    loggingEnabled = True,
    complianceRules = [AI_SAFETY_STD_001, PROJECT_EXAMPLE_POLICY],
    defaultConsent = ConsentContext { sessionId = "user_session_123", consentTimestamp = Nothing },
    baseCompetency = CompetencyProfile { profileName = "text_analysis_v2_haskell", capabilities = ["sentiment_analysis"] }
  }
  let pactsInstance = initPACT_System config
  let user = User { userId = "jane_doe" }
  let task = TaskDetails { 
    taskType = "SentimentAnalysis", 
    taskResource = Resource { resourceId = "doc_abc", resourceType = "text" },
    complianceReqs = [PROJECT_EXAMPLE_POLICY] 
  }

  putStrLn "Attempting to perform AI task within PACT-System..."
  eitherTaskOutput <- catch (Right <$> performAiTask pactsInstance task user "UserSessionData") \
                          (\e -> return $ Left (show (e :: SomeException)))
  
  case eitherTaskOutput of
    Right result -> putStrLn $ "Task successful. Output: " ++ outputData result
    Left err -> putStrLn $ "Task failed: " ++ err
  
  putStrLn "PACT-System demo finished."
```

## Further Documentation

This README provides a high-level introduction to the PACT-System. More detailed documentation, protocols, strategic plans, and working guides can be found in the respective directories. Key starting points include:

*   **Core PACT-System Information:**
    *   [`README.md`](./README.md) (This document): Main overview, pillars, and principles.
    *   [`core/principles.md`](./core/principles.md): Detailed elaboration of core PACT-System principles.
    *   [`CHANGELOG.md`](./CHANGELOG.md): Tracks notable changes to the project.
    *   [`CONTRIBUTING.md`](./CONTRIBUTING.md): Guidelines for contributing to the PACT-System.

*   **Operational Protocols & Procedures:**
    *   [`protocols/README.md`](./protocols/README.md): Index of all operational protocols.
    *   Key protocols include: 
        *   [`protocols/mode_transition.md`](./protocols/core_governance/mode_transition.md)
        *   [`protocols/permission_verification.md`](./protocols/core_governance/permission_verification.md) & [`protocols/implementation_permission.md`](./protocols/core_governance/implementation_permission.md)
        *   [`protocols/tool_usage_protocol.md`](./protocols/agent_tool_operation/tool_usage_protocol.md)
        *   [`protocols/pact_compliance_protocol.md`](./protocols/core_governance/pact_compliance_protocol.md)
        *   [`protocols/response_tags.md`](./protocols/communication_and_state/response_tags.md)
        *   [`protocols/state_reference_protocol.md`](./protocols/communication_and_state/state_reference_protocol.md)

*   **Tooling & Agent Interaction:**
    *   [`tools/index.md`](./tools/README.md): Tool Precedence Guide (consider renaming to `README.md`).
    *   [`tools/symbolic_tool_references.md`](./tools/symbolic_tool_references.md): Definitive list of symbolic tools and their mappings.
    *   [`tools/tool_call_template.md`](./tools/tool_call_template.md): Standard format for agent tool calls.
    *   [`tools/deep_reasoning_models_prompting_guide.md`](./tools/deep_reasoning_models_prompting_guide.md): Guide for prompting advanced reasoning models.
    *   [`tools/z3_guide.md`](./tools/z3_guide.md): Guide for using the Z3 solver.
    *   [`tools/edit_file_tool_best_practices.md`](./tools/edit_file_tool_best_practices.md): Best practices for using the `edit_file` tool.

*   **Memory & Knowledge Graph:**
    *   [`memory/README.md`](./memory/README.md): Comprehensive guide to PACT-System memory architecture, KG schema, and access protocols.

*   **Testing & Verification:**
    *   [`tests/README.md`](./tests/README.md): Overview of testing documentation and execution.
    *   [`verification/README.md`](./verification/README.md): PACT-System verification procedures and principles.

*   **Strategic Plans & Project Evolution (see [`docs/plans/README.md`](./docs/plans/README.md) for a full index):**
    *   [`.plans/development_roadmap_and_tasks.md`](./docs/plans/development_roadmap_and_tasks.md): High-level roadmap and conceptual issue tracking.
    *   [`.plans/pacts_ontology_and_xml_workflow.md`](./docs/plans/ontology_and_formalism/2_xml_xsd_workflow_plan.md): Plan for OWL2 ontology and XML/XSD workflow.
    *   [`.plans/documentation_strategy.md`](./docs/plans/documentation/README.md): Comprehensive user documentation strategy.
    *   [`.plans/vcs_strategy.md`](./docs/plans/vcs_strategy.md): Version control strategy.
    *   [`.plans/testing_strategy.md`](./docs/plans/testing_and_verification/README.md): Detailed testing strategy.
    *   [`.plans/multi_repo_architecture_docs_plan.md`](./docs/plans/future-research/multi_repo_architecture_docs_plan.md): Plan for developing multi-repository architecture documentation.

## License

This project is dual-licensed under the terms of the MIT License and the BSD 3-Clause License.

*   **MIT License**: See [LICENSE-MIT](LICENSE-MIT) for the full text.
*   **BSD 3-Clause License**: See [LICENSE-BSD](LICENSE-BSD) for the full text.

You may use this project under the terms of either license at your discretion.