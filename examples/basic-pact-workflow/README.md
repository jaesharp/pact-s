# Basic PACT-S Workflow Example

This example demonstrates the core PACT-S principles through a simple agent task execution scenario.

## Overview

This example shows how an AI agent operating under PACT-S governance would:
1. Request permission for an action
2. Verify compliance with system protocols
3. Execute the action with full transparency
4. Maintain accountability through logging

## Running the Example

```bash
# Install dependencies
npm install

# Run the example
node example.js
```

## What This Demonstrates

### 1. Permission (P)
The agent must request explicit permission before performing any action. See how the `requestPermission()` function ensures no unauthorized operations occur.

### 2. Accountability (A)
Every action is logged with full traceability back to the user's consent. The `logAction()` function maintains an audit trail.

### 3. C (Consent, Compliance, Competency, Clarity)
- **Consent**: User must explicitly approve actions
- **Compliance**: Actions are checked against defined protocols
- **Competency**: Agent verifies it has the capability to perform the task
- **Clarity**: All communications are unambiguous

### 4. Transparency (T)
The entire decision-making process is visible and inspectable through the action log.

### 5. System Integration (S)
Shows how these principles integrate into a cohesive operational framework.

## Example Output

```
=== PACT-S Example: File Analysis Task ===

[PERMISSION] Requesting permission to analyze file: data.txt
[USER INPUT] Do you grant permission? (yes/no): yes
[CONSENT] User granted explicit consent
[COMPLIANCE] Checking protocol compliance...
[COMPLIANCE] ✓ Action complies with file_read protocol
[COMPETENCY] Verifying agent capabilities...
[COMPETENCY] ✓ Agent has required capability: file_analysis
[TRANSPARENCY] Logging action initiation...
[EXECUTION] Analyzing file: data.txt
[TRANSPARENCY] Action completed successfully
[ACCOUNTABILITY] Full action log available for review
```

## Key Concepts Illustrated

1. **No Autonomous Actions**: The agent cannot proceed without explicit user permission
2. **Protocol Adherence**: All actions are validated against defined protocols
3. **Complete Auditability**: Every decision and action is logged
4. **User Sovereignty**: The user maintains full control throughout the process

## Next Steps

- Explore the `example.js` file to see the implementation
- Review the `protocols.json` file to understand compliance rules
- Try modifying the example to test different scenarios