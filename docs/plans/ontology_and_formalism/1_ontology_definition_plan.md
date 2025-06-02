# 1. PACT-System OWL2 Ontology Definition Plan

This document details the tasks for defining the PACT-System OWL2 ontology, including core concepts, classes, properties, axioms, and development tooling.

## Phase 1: Initial Scoping & Foundational Decisions

- [ ] **[Discussion]`** Discuss and answer: What are the absolute core entities and relationships for the first pass of the PACT-System ontology? (from `[./README.md](./README.md) Section 4)
- [ ] **[Research]`** Discuss and answer: Are there existing ontologies (e.g., for provenance, security, AI ethics, agent communication) that we can draw inspiration from or potentially align with? (from `[./README.md](./README.md) Section 4)
- [ ] **`[Task]`** Select and set up primary ontology development tooling (e.g., Protégé).
- [ ] **`[Task]`** Select and configure reasoners for consistency checking (e.g., Pellet, HermiT, FaCT++).

## Phase 2: Core Entity & Relationship Definition (Iterative)

- [ ] **`[Task]`** Define Main Classes & Individuals:
    - [ ] `PACT_System_Framework`
    - [ ] Pillars: `PermissionPillar`, `AccountabilityPillar`, `C_Pillar`, `TransparencyPillar`, `SystemPillar`
    - [ ] C_Pillar Dimensions: `ConsentDimension`, `ComplianceDimension`, `CompetencyDimension`, `ClarityDimension`
    - [ ] Core Actors/Objects: `Agent`, `User`, `SystemComponent`, `Resource`
    - [ ] Key PACTS Artifacts: `Permission`, `ConsentRecord`, `Policy`, `Rule`, `OperationalMode`
    - [ ] Operational Elements: `Action`, `ToolCall`, `Decision`, `AuditTrail`, `LogEntry`
    - [ ] Competency/Capability: `CompetencyProfile`, `Capability`
    - [ ] Tooling Abstractions: `SymbolicToolReference`, `ActualToolImplementation` (Consider relationship with [5_tool_mapping_env_profiles_plan.md](5_tool_mapping_env_profiles_plan.md))
    - [ ] *Further classes/individuals as identified...*
- [ ] **`[Task]`** Define Object Properties (Relationships) between classes:
    - [ ] `hasPillar`, `hasDimension`
    - [ ] `grantsPermission` (e.g., User grants Permission to Agent for Resource regarding Action)
    - [ ] `requiresPermission` (e.g., Action requires Permission for Resource)
    - [ ] `recordsConsent` (e.g., User records ConsentRecord regarding Action on Resource)
    - [ ] `compliesWith` (e.g., Action by Agent compliesWith Policy/Rule)
    - [ ] `hasCompetencyProfile` (e.g., Agent has CompetencyProfile)
    - [ ] `requiresCompetency` (e.g., Action requires Competency)
    - [ ] `isPerformedBy` (e.g., Action isPerformedBy Agent)
    - [ ] `isResponsibleFor` (e.g., User isResponsibleFor Action)
    - [ ] `isTransparentVia` (e.g., Action isTransparentVia LogEntry/AuditTrail)
    - [ ] `mapsTo` (e.g., SymbolicToolReference mapsTo ActualToolImplementation)
    - [ ] `hasSubComponent`, `interactsWith` (for SystemComponent relationships)
    - [ ] *Further object properties as identified...*
- [ ] **`[Task]`** Define Data Properties for classes:
    - [ ] `permissionDetails` (string, structure?)
    - [ ] `consentTimestamp` (dateTime)
    - [ ] `policyStatement` (string)
    - [ ] `ruleExpression` (string, structure?)
    - [ ] `logTimestamp` (dateTime)
    - [ ] `competencyLevel` (string, numeric?)
    - [ ] `toolVersion` (string)
    - [ ] `parameterName` (string)
    - [ ] `parameterType` (string)
    - [ ] `restrictionDetails` (string)
    - [ ] *Further data properties as identified...*
- [ ] **`[Task]`** Define Axioms & Restrictions:
    - [ ] Example: An `Action` `requiresPermission` a `Permission` that `isGrantedTo` an `Agent` `by` a `User`.
    - [ ] Example: All `ToolCall` events must be subClassOf `Action` and `hasLogEntry` some `LogEntry`.
    - [ ] Define cardinalities (e.g., an Action must have exactly one primary performing Agent).
    - [ ] Define disjoint classes (e.g., User is disjoint with Agent, unless a model allows an Agent to act as a User proxy).
    - [ ] Define equivalent classes where appropriate.
    - [ ] *Further axioms and restrictions as identified...*

## Phase 3: Validation & Refinement

- [ ] **`[Task]`** Perform regular consistency checking using selected reasoners.
- [ ] **[Task]`** Manually review ontology against PACT-System core principles and documentation ([../../../README.md](../../../README.md), `[../../../core/principles.md](../../../core/principles.md)).
- [ ] **`[Task]`** Iterate on definitions based on validation results and evolving understanding.
- [ ] **`[Task]`** Document ontology design choices, assumptions, and any identified open issues.

## Phase 4: Versioning and Maintenance Strategy

- [ ] **`[Task]`** Define a versioning scheme for the ontology.
- [ ] **`[Task]`** Establish a process for proposing, reviewing, and incorporating changes to the ontology.
- [ ] **`[Task]`** Plan for long-term maintenance and evolution of the ontology.

*(This plan is a living document and will be updated as development progresses.)* 