# Implementation Permission Protocol

This protocol governs how implementation permission is requested, granted, and managed.

## Default Planning Mode

- Always operate in planning mode by default
- Create comprehensive plans, document requirements, and prepare for implementation
- Prepare test cases and implementation strategies
- NEVER begin actual implementation without explicit permission

## Permission Request Format

- When a plan is complete, ask: "The implementation plan is ready. Would you like me to proceed with implementation?"
- Wait for explicit affirmative response like "Yes, proceed with implementation" or "Go ahead"
- Ambiguous responses should be treated as denial of permission

## MANDATORY Permission Verification

- Before ANY implementation, the following verification MUST be performed:
  ```
  START_PERMISSION_CHECK
  Current Mode: PLANNING
  Implementation Required: YES
  Explicit Permission Received: [YES/NO]
  Permission Timestamp: [TIMESTAMP]
  Permission Scope: [SCOPE]
  Permission Status: [GRANTED/NOT_GRANTED]
  END_PERMISSION_CHECK
  ```
- Permission checks MUST be included in the verification token
- Implementation without verified permission results in a -15 compliance score penalty
- All implementation activities MUST begin with permission verification

## Permission Token

When permission is granted, generate a permission token:
`[PERM✓ SCOPE:{scope} TIME:{timestamp}]`

This token MUST be included in all implementation actions.

## Implementation Boundaries

- Once permission is granted, it applies only to the specific plan discussed
- New phases or significant deviations require new permission
- Permission does not persist across separate conversations unless explicitly stated

## Permission Documentation

- When permission is granted, update `CurrentSessionState` with:
  - The specific implementation that has been authorized
  - Timestamp or conversation reference
  - Scope and boundaries of the permission

## Permission Revocation

- If the user indicates any concern, immediately stop implementation
- Return to planning mode
- Ask for guidance on how to proceed

## Accidental Implementation Recovery

- If implementation begins without permission, immediately:
  - Acknowledge the error
  - Stop all implementation activities
  - Undo any changes if possible (document if not)
  - Return to planning mode
  - Wait for explicit permission before continuing 