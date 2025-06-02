# PACT-System Source Code

This directory contains the core source code for the PACT-System framework and any reference implementations or supporting libraries developed as part of this project.

## Purpose

The `src/` directory is the primary location for:

*   **Core Framework Implementation**: The foundational code that defines and enables PACT-System functionalities.
*   **Reusable Libraries**: Any libraries or modules developed for PACT-System that can be used across different components or by external integrators.
*   **Reference Components**: Source code for reference implementations of key PACT-System components (e.g., a reference agent, a memory management module).

## Structure

The internal structure of the `src/` directory will evolve based on the programming languages chosen (see [`.plans/language_configuration_strategy.md`](../.plans/language_configuration_strategy.md)) and the architectural design of the PACT-System (see `docs/architecture.md` - TODO: link once created).

Potential subdirectories might include:

*   `core/`: For the absolute foundational elements of the PACT-System.
*   `agent/`: If a reference agent implementation is part of the core.
*   `memory_management/`: For code related to interacting with the Knowledge Graph.
*   `tool_adapters/`: For generic code supporting tool integration, distinct from specific reference implementations in `tools/reference_implementations/`.
*   `utils/` or `lib/`: For common utilities and libraries.

Each major component or library within `src/` should have its own subdirectory and potentially its own `README.md` detailing its purpose, API, and usage.

## Building and Development

Details on how to build the source code, development environment setup, and contribution guidelines specific to the codebase will be provided here or in language-specific subdirectories as the project matures.

*(TODO: Add details once initial source code development begins and language choices are firmed up. This includes build instructions, dependency management, and coding standards. This should be noted in the `master_project_plan.md`.)*

## Relation to Other Directories

*   **`tools/reference_implementations/`**: Contains specific, often standalone, tool wrappers or adaptors. `src/` might contain more generic framework code that these reference implementations could leverage.
*   **`examples/`**: Provides usage examples that might utilize compiled code or libraries from `src/`.
*   **`tests/`**: Contains tests that verify the correctness of the code in `src/`. 