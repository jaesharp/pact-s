# Mode Transition Protocol (PACT-System)

## 1. Overview

This protocol governs how the PACT-System transitions between operational modes, specifically PLANNING mode and IMPLEMENTATION mode. This protocol is critical for enforcing permission requirements and ensuring that implementation actions only occur with explicit user approval. Its aim is to ensure the system always defaults to PLANNING mode unless explicitly authorized by the user to be in IMPLEMENTATION mode.

## 2. Protocol Principles

1.  **Default to Planning**: The PACT-System always begins in PLANNING mode by default.
2.  **Explicit Permission**: Transition to IMPLEMENTATION mode requires explicit, verifiable user permission.
3.  **Time-Limited Permission**: Implementation permission is typically scoped to the current task and may expire upon task completion, a new user query, or other defined boundary conditions.
4.  **Boundary Detection**: Conversation boundaries or significant context shifts automatically trigger a review and potential reset of the mode to PLANNING.
5.  **Clear Mode Indication**: The current operational mode should be clear to the user and the system at all times (e.g., via verification tokens or status indicators).

## 3. Mode Definitions

### 3.1. PLANNING Mode

PLANNING mode is the default operational state where:
*   Knowledge exploration, information gathering, and analysis are permitted.
*   Implementation proposals, plans, and strategies can be formulated and discussed with the user.
*   No modifications to external system state, user files, or execution of impactful tools are permitted without transitioning out of this mode based on further user consent.

### 3.2. IMPLEMENTATION Mode

IMPLEMENTATION mode is a restricted, user-authorized operational state where:
*   Specific, consented-to file modifications are permitted.
*   Agreed-upon system state changes are allowed.
*   Knowledge graph modifications reflecting the implementation can be made.
*   Active implementation of the authorized plan occurs.
*   This mode is entered only upon explicit user permission for a defined scope of work.

## 4. Default Mode Rule (Operational)

*   The system MUST operate in PLANNING mode by default.
*   IMPLEMENTATION mode requires explicit permission.
*   At the start of each new user interaction or session, the system MUST reset to PLANNING mode.
*   Mode persistence across distinct interactions or sessions is NOT permitted unless explicitly re-authorized for a defined continuation.

## 5. Conversation Boundary Detection (triggers for Mode Review/Reset)

The system MUST identify conversation boundaries that trigger a review and likely reset to PLANNING mode:

1.  **New User Query**: Any new query from the user that is not an explicit, direct continuation of an ongoing, authorized implementation task.
2.  **Topic Change**: Any significant shift in conversation topic away from the authorized task.
3.  **Time Gap**: Extended periods of inactivity between interactions, potentially invalidating prior context or permission.
4.  **Explicit Reset Command**: Any user instruction to reset, stop the current task, or start over.
5.  **Task Completion/Failure**: Upon explicit completion of an implementation task, or if a task fails and cannot be immediately recovered within scope.

When a conversation boundary is detected:
*   Immediately reset to PLANNING mode.
*   Set implementation permission status to `NOT_GRANTED` (or `EXPIRED`).
*   Update the knowledge graph to reflect the mode change and permission status.
*   Include mode reset confirmation in any verification token (e.g., `[PACT✓ ... MODE:PLANNING ...]`)

## 6. Permission Expiration Rules

Implementation permissions are temporary and limited in scope:

1.  **Task Completion**: Permission expires upon successful completion of the approved task.
2.  **New User Query/Context Shift**: Permission expires when the user issues a new, unrelated query or significantly changes the context (see Conversation Boundary Detection).
3.  **Single Use Principle**: Each explicit permission grant is typically valid for one defined implementation task or scope only.
4.  **Explicit Duration (If Applicable)**: If specified at the time of granting, permission may be time-limited.

Expired permissions MUST be documented in the knowledge graph (e.g., updating the status of a permission entity).

## 7. State Reference Containment (`@@reference {TAG}`)

When state references are used via `@@reference {TAG}` notation:

1.  **Mode Preservation**: Loading a referenced state MUST NOT override the current operational mode (PLANNING or IMPLEMENTATION) by default.
2.  **Permission Isolation**: Loading a referenced state MUST NOT implicitly grant or alter existing implementation permissions.
3.  **Verification Requirement**: After loading a referenced state, the system must re-verify the current mode and permission status against the loaded context and current user intent.
4.  **Explicit Transition Still Required**: Even if a loaded state previously involved IMPLEMENTATION mode, the user must explicitly grant new permission to enter IMPLEMENTATION mode in the current session.

## 8. Transition Process (Conceptual Flow)

The transition from PLANNING to IMPLEMENTATION mode generally follows this process:

1.  **Proposal & Request Phase** (Agent in PLANNING mode):
    *   Agent proposes a detailed implementation plan based on user requirements.
    *   Agent clearly states what actions will be taken, tools used, and potential impacts.
    *   Agent explicitly requests permission to proceed with the described implementation.
2.  **Authorization Phase** (User action):
    *   User reviews the plan and explicitly grants implementation permission for the defined scope.
    *   The system verifies the affirmative nature of the user's consent.
3.  **Transition & Implementation Phase** (Agent enters IMPLEMENTATION mode):
    *   The mode transition is logged (see Section 9).
    *   System status/indicators reflect the mode change.
    *   Permitted implementation actions are performed, adhering strictly to the authorized plan.
4.  **Completion & Reversion Phase**:
    *   Upon task completion (or if an irrecoverable error within scope occurs, or a boundary is met), the implementation is finalized.
    *   The system automatically reverts to PLANNING mode.
    *   The transition back to PLANNING is logged.

## 9. Transition Documentation

All significant mode transitions (PLANNING <-> IMPLEMENTATION) MUST be documented, for example, as an event in an audit log or knowledge graph. The documentation should capture:

```
START_MODE_TRANSITION_EVENT // or a structured log entry
  PreviousMode: [PLANNING|IMPLEMENTATION]
  NewMode: [PLANNING|IMPLEMENTATION]
  TransitionReason: [USER_PERMISSION_GRANTED | CONVERSATION_BOUNDARY_DETECTED | TASK_COMPLETED | EXPLICIT_USER_RESET | ERROR_RECOVERY]
  AssociatedPermissionID: [Reference to specific permission grant, if applicable]
Timestamp: [TIMESTAMP]
END_MODE_TRANSITION_EVENT
```

## 10. Common Transition Pitfalls & Mitigation

*   **Ambiguous User Permission**: User response is not clearly affirmative.
    *   *Mitigation*: Agent must re-prompt for explicit, unambiguous permission.
*   **Implicit Mode Continuation Across Boundaries**: Assuming IMPLEMENTATION mode persists after a new query or significant topic shift.
    *   *Mitigation*: Strict adherence to Conversation Boundary Detection rules and automatic reset to PLANNING.
*   **Permission Scope Creep**: Extending implementation beyond the specifically authorized plan.
    *   *Mitigation*: Agent must re-confirm with user and obtain new permission for any deviations or scope expansion.
*   **Mode Confusion (Lack of Clarity)**: User or system is unclear about the current operational mode.
    *   *Mitigation*: Consistent use of mode indicators (e.g., in PACT✓ token) and agent explicitly stating its current mode if necessary.

## 11. Violation Prevention Checklist (Agent Self-Check)

Before each substantive response or action, the agent should internally verify:

*   [ ] Current operational mode is correctly identified and appropriate for the context.
*   [ ] If in IMPLEMENTATION mode, the authorizing permission is valid, current, and its scope covers the intended actions.
*   [ ] Conversation boundaries have been assessed, and mode has been reset if required.
*   [ ] Mode transitions (if any occurred) are properly documented/logged.
*   [ ] Any user-facing verification token accurately reflects the current mode and permission status.

## 12. Compliance Considerations (Example)

*(This section is an example of how compliance scoring might have been applied in a specific context and is not a mandatory part of the core PACT-System mode transition protocol. Specific PACTS instances may define their own audit or scoring metrics.)*
*   Example scoring: 
    *   -20 points: Failing to reset to PLANNING mode at conversation boundary.
    *   -15 points: Implementing without valid permission.
    *   -10 points: Failing to document mode transitions.
    *   -5 points: Ambiguous mode status in communication. 