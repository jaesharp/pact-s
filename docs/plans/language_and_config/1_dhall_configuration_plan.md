# 1. Dhall Configuration Plan for PACT-System

This document outlines the plan for leveraging Dhall for type-safe, maintainable, and programmable configuration within the PACT-System, covering prompt templates, policies, system parameters, and other relevant artifacts.

## Phase 1: Foundational Dhall Setup & Best Practices

- [ ] **`[Task]`** Establish Dhall project structure and conventions:
    - [ ] Define a clear directory structure for Dhall configurations (e.g., within [../../prompts/dhall/](../../prompts/dhall/)`, [../../config/dhall/](../../config/dhall/) or a central `[../../dhall-config/](../../dhall-config/) depending on scope).
    - [ ] Develop naming conventions for Dhall files and types.
    - [ ] Document best practices for writing maintainable and reusable Dhall code.
- [ ] **`[Task]`** Set up Dhall tooling:
    - [ ] Ensure team members have access to Dhall formatters (`dhall format`), linters (`dhall lint`), and interpreters.
    - [ ] Integrate Dhall formatting and linting into pre-commit hooks (see [../vcs_strategy.md](../vcs_strategy.md)).
- [ ] **`[Task]`** Develop a core Dhall library for PACT-System common types and utilities:
    - [ ] Define common data types (e.g., for User Identifiers, Timestamps, URIs) that might be shared across different configurations.
    - [ ] Create utility functions for common configuration patterns.

## Phase 2: Dhall for Prompt Templates & Structures

- [ ] **[Task]`** Define a comprehensive Dhall type system for PACT-System prompt templates and their components (see `[../../prompts/README.md](../../prompts/README.md)).
    - [ ] Model different parts of a prompt (e.g., system message, user query, context block, tool specifications) as Dhall types.
    - [ ] Define types for expected response structures where applicable.
- [ ] **`[Task]`** Convert existing prompt examples or templates into Dhall.
- [ ] **`[Task]`** Develop a library of reusable Dhall functions and records for constructing and composing prompts.
    - [ ] E.g., functions to insert context, format tool lists, or structure few-shot examples.
- [ ] **`[Task]`** Implement validation functions or assertions within Dhall to check prompt integrity (e.g., character limits, required fields).

## Phase 3: Dhall for Policies and System Configuration

- [ ] **`[Task]`** Model PACT-System operational policies (e.g., permission rules, compliance checks, data handling policies) as Dhall types and records.
    - [ ] Aim for declarative policy definitions that can be easily understood and verified.
- [ ] **`[Task]`** Define Dhall schemas for other system configurations:
    - [ ] e.g., Tool registry/manifest if evolving [../../tools/symbolic_tool_references.md](../../tools/symbolic_tool_references.md) towards Dhall.
    - [ ] e.g., Agent capability profiles.
    - [ ] e.g., Environment-specific parameters.
- [ ] **`[Task]`** Implement mechanisms for importing and layering Dhall configurations (e.g., base policies extended by specific instance configurations).

## Phase 4: Dhall Build Pipeline & Integration

- [ ] **`[Task]`** Develop a build pipeline to:
    - [ ] Typecheck all Dhall configurations.
    - [ ] Compile/resolve Dhall configurations to a canonical format (e.g., JSON, YAML) for consumption by Haskell applications (see [4_dhall_haskell_integration_plan.md](4_dhall_haskell_integration_plan.md)).
    - [ ] Run any Dhall-based validation assertions.
- [ ] **[Task]`** Integrate this Dhall build pipeline into the CI/CD system (see [../testing_and_verification/6_test_infrastructure_plan.md](../testing_and_verification/6_test_infrastructure_plan.md) and `[../vcs_strategy.md](../vcs_strategy.md)).
    - [ ] Ensure that changes to Dhall configurations are validated upon commit/PR.

## Phase 5: Documentation & Training

- [ ] **`[Documentation]`** Document the Dhall configuration schemas, types, and usage conventions.
- [ ] **`[Documentation]`** Create tutorials and examples for defining and managing PACT-System configurations using Dhall.
- [ ] **`[Task]`** Provide training/resources for team members on Dhall best practices.
    (Links to overall documentation plan: [../documentation/README.md](../documentation/README.md)) 