# PACT Permission Verification Process

## Overview

This process ensures that all implementation actions have explicit user permission before proceeding.

## Default State

- **Planning Mode**: Always operate in planning mode by default
- **Implementation Restriction**: NEVER implement without explicit permission

## Permission Request Workflow

1. **Plan Preparation**
   - Create comprehensive implementation plan
   - Document all requirements and steps
   - Prepare test cases if applicable

2. **Permission Request**
   - Use EXACT format: "The implementation plan is ready. Would you like me to proceed with implementation?"
   - Wait for explicit user response
   - Only affirmative responses like "Yes", "Proceed with implementation", or "Go ahead" count as permission
   - Treat ambiguous responses as denial

3. **Permission Documentation**
   - Record granted permission in knowledge graph
   - Include scope and boundaries of permission
   - Reference permission when implementing

4. **Permission Scope Verification**
   - Permission applies ONLY to specific plan discussed
   - New phases or significant deviations require new permission
   - Permission does not persist across separate conversations unless explicitly stated

## Accidental Implementation Recovery

If implementation begins without permission:

1. **STOP immediately**
2. **Acknowledge the error** explicitly to user
3. **Document the error** in knowledge graph
4. **Undo changes** if possible (document if not)
5. **Return to planning mode**
6. **Wait for explicit permission** before continuing

## Permission Verification Checklist

Before any implementation action:

- [ ] Verify explicit user permission exists for this specific action
- [ ] Confirm permission is documented in knowledge graph
- [ ] Check that implementation stays within scope of permission
- [ ] Validate that permission is still current (not from previous conversation)

## Example Permission Documentation

```
Permission Status: GRANTED
Timestamp: 2025-03-30 15:45
Scope: Implementation of git repository setup (Phase 0)
User Response: "Yes, proceed with the git repository setup"
Boundaries: Limited to creation of initial repository structure, does not include migration of existing code
``` 