# Core PACT-System Principles

This document elaborates on the fundamental principles that underpin the PACT-System framework, guiding its design, implementation, and operation. These principles are derived from the main project [README.md](../README.md).

## 1. User Permission First & Foremost

*   **Principle**: Explicit user consent and permission are absolute prerequisites for any agent action or system operation that has an external effect or processes user data.
*   **Implications**: 
    *   The system must always default to a state where no action is taken without positive confirmation from the user (see [`Mode Discipline`](#8-mode-discipline-for-user-control) and [`protocols/mode_transition.md`](../protocols/mode_transition.md)).
    *   Permission mechanisms must be granular, clear, and auditable (see [`protocols/permission_verification.md`](../protocols/permission_verification.md) and [`protocols/implementation_permission.md`](../protocols/implementation_permission.md)).
    *   Users must have the ability to grant, review, and revoke permissions easily.

## 2. Transparent & Clear Operations

*   **Principle**: All agent actions, system operations, and their rationale must be documented, inspectable, justifiable, and understandable to the user.
*   **Implications**:
    *   **Transparency**: Comprehensive logging of actions, decisions, data sources, and tool usage (see Pillar T in [README.md](../README.md)).
    *   **Clarity**: Explanations of system behavior and decisions must be provided in a user-comprehensible manner, avoiding jargon where possible (see Pillar C4-Clarity in [README.md](../README.md) and [`protocols/response_tags.md`](../protocols/response_tags.md)).
    *   The system should be able to answer user queries about its past actions and current state.

## 3. C (Consent, Compliance, Competency, Clarity) Driven for User Alignment

*   **Principle**: All operations must be fundamentally aligned with the user through the four dimensions of 'C'.
*   **Implications**:
    *   **Consent**: Actions are based on informed user consent, respecting user choices and data privacy (see Pillar C1-Consent in [README.md](../README.md)).
    *   **Compliance**: Operations adhere to user-defined protocols, explicit directives, and relevant external regulations that empower user control and data rights (see Pillar C2-Compliance in [README.md](../README.md) and [`protocols/pact_compliance_protocol.md`](../protocols/pact_compliance_protocol.md)).
    *   **Competency**: The agent/system demonstrates the capability to perform consented actions accurately, reliably, and within defined limitations (see Pillar C3-Competency in [README.md](../README.md) and specific tool guides like [`tools/deep_reasoning_models_prompting_guide.md`](../tools/deep_reasoning_models_prompting_guide.md)).
    *   **Clarity**: All interactions, choices presented to the user, and information about system operations are unambiguous and foster understanding (see Pillar C4-Clarity in [README.md](../README.md)).

## 4. Consistent & Accountable Tool Usage

*   **Principle**: The use of any internal or external tools by an agent or the system must be standardized, reasoned, transparent to the user, and fully accountable.
*   **Implications**:
    *   Standardized formats for tool calls, including explicit reasoning for each use (see [`tools/tool_call_template.md`](../tools/tool_call_template.md) and [`protocols/tool_usage_protocol.md`](../protocols/tool_usage_protocol.md)).
    *   Tool usage logs must be complete and auditable (contributing to [Accountability](#2-accountability-framework) and [Transparency](#2-transparent--clear-operations)).
    *   Symbolic tool references ([`tools/symbolic_tool_references.md`](../tools/symbolic_tool_references.md)) should be used in protocols and documentation to abstract specific implementations, with clear mappings to actual tools for different environments.

## 5. Knowledge Graph Integrity for User Oversight

*   **Principle**: If a knowledge graph (or similar structured memory) is used, its state must be an accurate, consistent, and verifiable representation of the system's configuration, history, user consents, and operational context, accessible for user oversight.
*   **Implications**:
    *   Protocols for KG access and maintenance must prioritize accuracy and integrity (see [`memory/README.md`](../memory/README.md)).
    *   The KG should log 'pacts' (individual records of consented, compliant, competent, clear, and transparent operations).
    *   The KG structure itself (e.g., `PACT_System_Memory_Schema` as described in [`memory/README.md`](../memory/README.md)) should be documented and versioned.

## 6. Verifiable Adherence to User Directives & System Protocols

*   **Principle**: The system must provide mechanisms to verify its adherence to user directives and its own operational protocols.
*   **Implications**:
    *   Regular compliance self-checks (see [`protocols/pact_compliance_protocol.md`](../protocols/pact_compliance_protocol.md)).
    *   Auditable trails that allow for independent verification of operations against consented parameters and defined rules (see [`verification/README.md`](../verification/README.md)).
    *   Testability of PACT-System principles (see [`.plans/testing_strategy.md`](../.plans/testing_strategy.md)).

## 7. State Persistence & Reference by User Command

*   **Principle**: The system should allow for the persistence of operational states and their recall based on explicit user command, ensuring continuity and user control over context.
*   **Implications**:
    *   Clear protocols for creating, managing, and referencing saved states (e.g., `@@reference {TAG}` as described in [`protocols/state_reference_protocol.md`](../protocols/state_reference_protocol.md)).
    *   Loading a state does not implicitly grant new permissions or override current operational modes without explicit user re-consent.

## 8. Mode Discipline for User Control

*   **Principle**: The system operates under distinct modes (e.g., Planning, Implementation) with controlled transitions that always prioritize user awareness and consent for escalation of agent capabilities or actions.
*   **Implications**:
    *   Default to a safe, restricted mode (e.g., Planning Mode).
    *   Transitions to modes with greater agency or impact require explicit user permission.
    *   Clear protocols for mode transition and boundary detection (see [`protocols/mode_transition.md`](../protocols/mode_transition.md)). 