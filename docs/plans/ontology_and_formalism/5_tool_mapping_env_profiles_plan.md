# 5. PACT-System Tool Mapping and Environment Profiles Plan

This document details the tasks for implementing the strategy for symbolic tool mapping and environment profiles, and its impact on the ontology, XSDs, and agent resolution logic.

## Phase 1: Design & Specification

- [ ] **[Task]`** Finalize the JSON structure for environment profiles within [../../../tools/symbolic_tool_references.md](../../../tools/symbolic_tool_references.md) as per the "Chosen Approach" (details in `[./README.md](./README.md) section 3.F).
    - [ ] Confirm structure for `reference_default`.
    - [ ] Confirm structure for the `profiles` object (map of environment profile identifiers to concrete tool names).
- [ ] **`[Task]`** Define requirements for Agent Resolution Logic:
    - [ ] How will an agent identify its current environment profile?
    - [ ] Specify the lookup process: profile match, fallback to `reference_default`, handling of missing tools/profiles.
- [ ] **[Task]`** Specify the impact on the PACT-System Ontology (see `[1_ontology_definition_plan.md](1_ontology_definition_plan.md)):
    - [ ] How will `SymbolicToolReference` and `ActualToolImplementation` classes accommodate the `reference_default` and the map of `profiles`?
    - [ ] Define necessary properties (object or data) to represent this structure.
- [ ] **[Task]`** Specify the impact on XSDs for tool descriptions (see `[2_xml_xsd_workflow_plan.md](2_xml_xsd_workflow_plan.md)):
    - [ ] How will the XSD represent the `reference_default` and `profiles` map for tool implementations?
- [ ] **`[Documentation]`** Document the chosen JSON structure, agent logic requirements, and ontology/XSD impact specifications.

## Phase 2: Implementation (Iterative)

- [ ] **[Task]`** Update `[../../../tools/symbolic_tool_references.md](../../../tools/symbolic_tool_references.md) to implement the new JSON structure for at least a few representative tools.
    - [ ] Add `reference_default` and sample `profiles`.
- [ ] **`[Task]`** Implement changes to the PACT-System Ontology to reflect the new tool mapping structure.
    - [ ] Update classes and properties as specified in Phase 1.
- [ ] **`[Task]`** Implement changes to the XSDs for tool descriptions.
    - [ ] Ensure XSDs can validate the new structure in `symbolic_tool_references.md` (if it transitions to XML) or a similar XML representation.
- [ ] **`[Task]`** (If applicable) Develop or update agent-side logic for resolving symbolic tool names using environment profiles.
    - [ ] Implement profile identification.
    - [ ] Implement lookup and fallback mechanisms.
- [ ] **`[Task]`** Develop tests for:
    - [ ] Validation of the updated `symbolic_tool_references.md` structure.
    - [ ] Agent resolution logic (if implemented).
    - [ ] Ontology consistency with the new tool mapping concepts.

## Phase 3: Future Considerations (Post-Initial Implementation)

- [ ] **[Research]`** Investigate and design mechanisms for dynamic registration and discovery of tool implementations by agents in an environment (as noted in `[./README.md](./README.md) section 3.F).
    - [ ] Define protocols for tool registration.
    - [ ] Define discovery mechanisms (e.g., a registry service).
    - [ ] Assess security implications.
- [ ] **`[Task]`** If dynamic discovery is pursued, update ontology, XSDs, and agent logic accordingly.

## Phase 4: Documentation & Maintenance

- [ ] **[Documentation]`** Update all relevant documentation to reflect the new tool mapping and environment profile system (e.g., main `[../../../tools/symbolic_tool_references.md](../../../tools/symbolic_tool_references.md), agent development guides).
- [ ] **`[Task]`** Establish a maintenance plan for the environment profile definitions and agent resolution logic.

*(This plan is a living document and will be updated as development progresses.)* 