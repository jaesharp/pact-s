# 5. PACT-System Haskell/Liquid Haskell/Dhall Toolchain Support & Documentation Plan

This document outlines the plan for developing supporting tooling, CI/CD integration, and specific documentation and training needs for the Haskell, Liquid Haskell, and Dhall toolchain chosen for PACT-System development.

## Phase 1: Development Environment & Tooling Setup

- [ ] **`[Task]`** Standardize Haskell/Liquid Haskell/Dhall development environment setup:
    - [ ] Document recommended GHC, Liquid Haskell, Dhall versions and installation procedures (see [../../CONTRIBUTING.md](../../CONTRIBUTING.md) or a dedicated developer setup guide).
    - [ ] Provide guidance on IDE integration (e.g., VS Code with Haskell Language Server (HLS), Dhall language server).
    - [ ] Set up project build tools (Cabal or Stack) with configurations for Haskell, Liquid Haskell, and Dhall-related build steps (see [1_dhall_configuration_plan.md](1_dhall_configuration_plan.md)` and `[2_haskell_core_logic_plan.md](2_haskell_core_logic_plan.md)).
- [ ] **[Task]`** Implement and configure code formatting and linting tools for all three languages and integrate into pre-commit hooks (see `[../vcs_strategy.md](../vcs_strategy.md)):
    - [ ] Dhall: `dhall format`, `dhall lint`.
    - [ ] Haskell: `ormolu`/`fourmolu` (formatter), `hlint`, `stan` (linters).
    - [ ] Liquid Haskell: Ensure editor/build tool integration for LH checks.
- [ ] **`[Task]`** Establish project-wide settings or configurations for these tools to ensure consistency.

## Phase 2: CI/CD Integration for the Toolchain

(Refer to [../testing_and_verification/6_test_infrastructure_plan.md](../testing_and_verification/6_test_infrastructure_plan.md) for general CI infrastructure)

- [ ] **`[Task]`** Configure CI workflows to:
    - [ ] Build Haskell code.
    - [ ] Run Haskell tests (Hspec, QuickCheck - see [../testing_and_verification/1_unit_testing_plan.md](../testing_and_verification/1_unit_testing_plan.md)).
    - [ ] Run Liquid Haskell checks (potentially as a separate or conditional step).
    - [ ] Typecheck, lint, and format Dhall configurations.
    - [ ] Execute Dhall-to-JSON/YAML compilation/resolution pipeline.
    - [ ] Generate Haddock API documentation for Haskell code.
- [ ] **`[Task]`** Ensure CI reports errors from any part of the toolchain clearly.
- [ ] **`[Task]`** Optimize CI runtimes for the Haskell/Dhall build and test processes (e.g., caching dependencies).

## Phase 3: Advanced Tooling & Support (As Needed)

- [ ] **`[Research]`** Investigate or develop tools for visualizing Dhall configurations or their corresponding Haskell types if beneficial for understanding complex structures.
- [ ] **`[Research]`** Explore options for better debugging support for Dhall evaluation or Liquid Haskell verification if common pain points arise.
- [ ] **[Task]`** Develop or adopt tools for testing prompt effectiveness if prompts are managed via Dhall (linking to outcomes of `[1_dhall_configuration_plan.md](1_dhall_configuration_plan.md)).
- [ ] **`[Task]`** If managing policies in Dhall, develop tools or scripts for validating policy sets or simulating policy application.

## Phase 4: Documentation & Training for the Toolchain

(Links to overall documentation plan: [../documentation/README.md](../documentation/README.md)` and its sub-plans like `[../documentation/1_documentation_types_and_content_plan.md](../documentation/1_documentation_types_and_content_plan.md))

- [ ] **[Documentation]`** Document the specific roles of Haskell, Liquid Haskell, and Dhall within the PACT-System architecture (`[../../docs/architecture.md](../../docs/architecture.md)).
- [ ] **`[Documentation]`** Create detailed developer guides and tutorials focusing on:
    - [ ] Setting up the Haskell/Liquid Haskell/Dhall development environment for PACT-System.
    - [ ] Writing and managing Dhall configurations for prompts, policies, etc.
    - [ ] Integrating Dhall configurations with Haskell code.
    - [ ] Applying Liquid Haskell for formal verification in PACT-System modules (with examples).
    - [ ] Common patterns and best practices for this toolchain.
- [ ] **[Documentation]`** Provide clear examples of the hybrid approach in `[../../examples/](../../examples/).
- [ ] **`[Task]`** Develop and deliver training materials or workshops for team members on Haskell, Liquid Haskell, and Dhall, focusing on their application within PACT-System.
- [ ] **[Documentation]`** Update `[../../CONTRIBUTING.md](../../CONTRIBUTING.md) with guidelines specific to this toolchain (build procedures, code style, verification expectations).

## Phase 5: Community & Ecosystem Engagement (Long-term)

- [ ] **`[Task]`** Encourage contributions to and use of relevant Haskell/Dhall/Liquid Haskell open-source libraries.
- [ ] **`[Task]`** Share learnings and best practices with the broader communities if novel techniques are developed. 