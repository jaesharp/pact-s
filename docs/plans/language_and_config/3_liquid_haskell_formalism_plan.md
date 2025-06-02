# 3. Liquid Haskell Formalism Plan for PACT-System

This document details the strategy and tasks for applying Liquid Haskell to formally specify and verify properties of critical PACT-System Haskell modules, enhancing correctness and safety guarantees.

## Phase 1: Setup and Foundational Knowledge

- [ ] **`[Task]`** Set up Liquid Haskell tooling in the Haskell development environment.
    - [ ] Ensure GHC and Liquid Haskell versions are compatible.
    - [ ] Configure build tools (Cabal/Stack) to support Liquid Haskell checks.
    - [ ] Integrate Liquid Haskell checks into the CI pipeline (see [../testing_and_verification/6_test_infrastructure_plan.md](../testing_and_verification/6_test_infrastructure_plan.md)), potentially as a separate, optional, or nightly job initially due to performance.
- [ ] **`[Task]`** Team familiarization with Liquid Haskell:
    - [ ] Conduct training sessions or provide learning resources on Liquid Haskell syntax, refinement types, and common verification patterns.
    - [ ] Work through introductory examples and tutorials.

## Phase 2: Identification of Critical Modules and Properties

- [ ] **[Task]`** Identify Haskell modules and functions within the PACT-System core logic (`[./2_haskell_core_logic_plan.md](./2_haskell_core_logic_plan.md)) that are most critical and would benefit most from Liquid Haskell verification. Examples:
    - [ ] State transition functions in protocol implementations.
    - [ ] Core permission checking logic.
    - [ ] Data validation and sanitization routines.
    - [ ] Functions handling sensitive data or critical system state.
    - [ ] Modules implementing core algorithms of PACT-System pillars.
- [ ] **`[Task]`** For each identified critical module/function, define specific properties and invariants to be formally specified and verified using Liquid Haskell.
    - [ ] Examples: Memory safety (e.g., no out-of-bounds array access if not using dependent types for length), state machine correctness (valid transitions only), data consistency, adherence to specified value ranges, pre/post-conditions for functions.

## Phase 3: Iterative Application of Liquid Haskell

- [ ] **`[Task]`** Incrementally add Liquid Haskell refinement type specifications to the selected Haskell modules.
    - [ ] Start with simpler properties and gradually increase complexity.
    - [ ] Define refined data types (e.g., `Nat` for natural numbers, lists with specific lengths).
    - [ ] Specify function signatures with pre-conditions (refinements on input types) and post-conditions (refinements on output types).
    - [ ] Define invariants for data structures.
- [ ] **`[Task]`** Run Liquid Haskell checker regularly during development to verify specifications.
- [ ] **`[Task]`** Debug and refine Haskell code and/or Liquid Haskell specifications to satisfy the verifier.
    - [ ] This may involve code changes to make properties provable or refining specifications to accurately reflect intended behavior.
- [ ] **`[Task]`** Document Liquid Haskell specifications alongside the Haskell code (e.g., using annotations, comments, or separate documentation).

## Phase 4: Advanced Verification Techniques (As Expertise Grows)

- [ ] **`[Research]`** Explore advanced Liquid Haskell features:
    - [ ] Measures and abstract refinements for more complex properties.
    - [ ] Termination checking for recursive functions.
    - [ ] Verifying properties of concurrent or effectful code if applicable.
- [ ] **`[Task]`** Apply advanced techniques to verify more sophisticated invariants within the PACT-System.
- [ ] **[Task]`** Investigate integration with other formal methods tools (e.g., SMT solvers like Z3 via Haskell bindings) if Liquid Haskell reaches its limits for certain types of properties, or to cross-verify (see `[../ontology_and_formalism/README.md](../ontology_and_formalism/README.md)).

## Phase 5: Maintenance and Evolution

- [ ] **`[Task]`** Maintain Liquid Haskell specifications as the Haskell codebase evolves.
    - [ ] Ensure Liquid Haskell checks remain part of the CI process for relevant modules.
- [ ] **`[Task]`** Regularly review and update Liquid Haskell specifications for clarity and accuracy.
- [ ] **`[Documentation]`** Document the parts of the PACT-System that have been formally verified with Liquid Haskell and the properties proven.
    (Links to overall documentation plan: [../documentation/README.md](../documentation/README.md))

## Scope & Limitations

- [ ] **`[Decision]`** Define the initial scope for Liquid Haskell application. It may not be feasible or necessary to apply it to all Haskell code.
- [ ] Acknowledge that Liquid Haskell, while powerful, has its own learning curve and may increase initial development time for specified modules in exchange for higher assurance. 