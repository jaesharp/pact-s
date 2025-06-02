# 2. PACT-System XML/XSD Workflow Plan

This document details the tasks for establishing the XML/XSD workflow, including mapping from OWL, schema granularity, versioning, and namespaces.

## Phase 1: Initial Scoping & Foundational Decisions

- [ ] **[Discussion]`** Discuss and answer: Which PACT-System artifact (e.g., policy definition, audit log, tool description) would be the best candidate for an initial XML/XSD definition pilot? (from `[./README.md](./README.md) Section 4)
- [ ] **`[Task]`** Define the mapping strategy from OWL classes and properties to XSD elements and types.
    - [ ] Consider how to represent OWL restrictions (cardinality, etc.) in XSD.
    - [ ] Plan for mapping OWL inheritance to XSD (e.g., substitution groups, type extension/restriction).
- [ ] **`[Decision]`** Determine the granularity of XSDs:
    - [ ] Option 1: One monolithic schema for all PACT-System artifacts.
    - [ ] Option 2: Multiple modular schemas (e.g., one for policies, one for logs, one for tool descriptions).
    - [ ] If modular, define how schemas will relate/import each other.
- [ ] **`[Task]`** Establish a clear versioning strategy for the XSDs.
    - [ ] How will XSD versions relate to Ontology versions?
    - [ ] How will backward/forward compatibility be handled?
- [ ] **`[Task]`** Define XML namespaces to be used for PACT-System schemas.
- [ ] **`[Research]`** Investigate existing standard XML schemas or industry formats that could be relevant or adapted (e.g., for audit logs, policy languages).

## Phase 2: Pilot Schema Development (Based on chosen artifact from Phase 1)

- [ ] **`[Task]`** Develop the initial XSD for the selected pilot PACT-System artifact.
    - [ ] Define top-level elements.
    - [ ] Define complex types and simple types.
    - [ ] Incorporate decided mapping from OWL, versioning, and namespaces.
- [ ] **`[Task]`** Create example XML instance documents that conform to the pilot XSD.
    - [ ] Include valid examples.
    - [ ] Include examples that test constraints (and should be invalid).
- [ ] **`[Task]`** Validate example XML instances against the pilot XSD using XML validation tools.
- [ ] **`[Task]`** Refine pilot XSD based on development and validation experience.

## Phase 3: Broader Schema Development (Iterative)

- [ ] **[Task]`** Systematically develop XSDs for other PACT-System artifacts based on the ontology and decisions from Phase 1 (e.g., Policy definitions, Permission grants, Consent records, Competency profiles, Audit logs, Tool descriptions, Compliance event records - as per `[./README.md](./README.md) Section 1).
- [ ] **`[Task]`** For each new schema, create example XML instances and perform validation.
- [ ] **`[Task]`** Ensure consistency across all developed XSDs.
- [ ] **`[Task]`** Document each XSD, explaining its purpose, structure, and key elements/types.

## Phase 4: Integration & Maintenance

- [ ] **`[Task]`** Integrate XSDs into relevant PACT-System components or workflows (e.g., for validating inputs/outputs, data exchange).
- [ ] **`[Task]`** Establish a process for proposing, reviewing, and incorporating changes to the XSDs.
- [ ] **[Task]`** Plan for long-term maintenance and evolution of the XSDs in conjunction with the OWL ontology (see `[1_ontology_definition_plan.md](1_ontology_definition_plan.md)).

*(This plan is a living document and will be updated as development progresses.)* 