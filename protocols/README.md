# PACT-System Operational Protocols

This directory contains specific, operational protocols that define mandatory procedures and standards for various aspects of the PACT-System framework and for agents/systems operating under its governance.

These protocols are intended to be actionable and, where applicable, verifiable. They complement the higher-level principles found in `../core/principles.md` and the overall framework description in `../README.md`.

## Available Protocols

*   **Core Governance & Compliance:**
    *   [`pact_compliance_protocol.md`](./pact_compliance_protocol.md): Defines the self-check compliance procedures and verification token requirements for PACT-System adherence.
    *   [`implementation_permission.md`](./implementation_permission.md): Governs how implementation permission is requested, granted, documented, and managed.
    *   [`permission_verification.md`](./permission_verification.md): Details the process for verifying explicit user permission before actions.
    *   [`mode_transition.md`](./mode_transition.md): Rules for transitioning between operational modes (e.g., Planning and Implementation).

*   **Communication & State Management:**
    *   [`response_tags.md`](./response_tags.md): Defines the standardized tag system for structured communication.
    *   [`state_reference_protocol.md`](./state_reference_protocol.md): Governs how saved states are referenced and loaded (e.g., using `@@reference {TAG}`).
    *   [`progress_tracking_protocol.md`](./progress_tracking_protocol.md): Outlines how to track operational progress and maintain session state, including the `CurrentSessionState` concept.
    *   [`interruption_handling.md`](./interruption_handling.md): Procedures for managing interruptions and ensuring task resumption.

*   **Tool Usage & Agent Operation:**
    *   [`tool_usage_protocol.md`](./tool_usage_protocol.md): Comprehensive protocol for how PACT-System agents should use tools, including reasoning, interaction patterns, and documentation. (Refers to `../tools/tool_call_template.md` and `../tools/symbolic_tool_references.md`).
    *   [`deep_reasoner_usage_protocol.md`](./deep_reasoner_usage_protocol.md): Specific protocols for using deep reasoning models, focusing on context management and result verification.

*   **Development Workflow & Version Control Protocols:**
    *   [`worktree_management_protocol.md`](./development_workflow/worktree_management_protocol.md): Protocol for managing Git worktrees for issue-based development, to be followed by developers and agents.
    *   [`branching_protocol.md`](./development_workflow/branching_protocol.md): Defines the GitFlow-based branching model and branch naming conventions.
    *   [`commit_protocol.md`](./development_workflow/commit_protocol.md): Outlines Conventional Commits standards and best practices for commit messages.
    *   [`pull_request_protocol.md`](./development_workflow/pull_request_protocol.md): Details the process for creating, reviewing, and merging Pull Requests.
    *   [`versioning_and_release_protocol.md`](./development_workflow/versioning_and_release_protocol.md): Specifies standards for Semantic Versioning and the release process.
    *   [`cicd_workflow_protocol.md`](./development_workflow/cicd_workflow_protocol.md): Outlines CI/CD workflows and local Git hook configurations for automation and quality assurance.

## Protocol Adherence

All PACT-System compliant agents and processes are expected to adhere strictly to these protocols. Before taking any significant action, the relevant protocol(s) should be consulted and their requirements met.

## Protocol Updates

Updates or amendments to these core operational protocols require careful consideration, versioning (if a system is implemented), and should align with the overall PACT-System principles and governance. Changes should be documented in the project `../CHANGELOG.md`. 