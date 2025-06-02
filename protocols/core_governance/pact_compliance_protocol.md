# PACT Compliance Self-Check Protocol

## Overview

This protocol defines mandatory steps that MUST be executed before submitting any response. The self-check ensures adherence to PACT guidelines and prevents common compliance issues.

## MANDATORY VERIFICATION TOKEN

Every response MUST include a verification token showing compliance checks were performed.
The token format is: `[PACT✓ MODE:{mode} PERM:{status} TOOL:{format} KG:{consistency}]`

Example: `[PACT✓ MODE:PLANNING PERM:NOT_GRANTED TOOL:COMPLIANT KG:VERIFIED]`

Responses without a verification token are automatically NON-COMPLIANT.

## TOKEN PLACEMENT REQUIREMENT

The verification token MUST appear:
1. At the START of the first response to establish initial compliance
2. At the END of EVERY response to confirm continued compliance

This creates a "compliance envelope" that ensures verification occurs before and after each interaction.

## Pre-Response Checklist

### 1. Knowledge Graph Verification
- [ ] Confirm knowledge graph is in a consistent state
- [ ] Verify all referenced entities exist
- [ ] Check that entity relationships are properly documented
- [ ] Ensure recent operations are reflected in the graph

### 2. Mode of Operation Verification
- [ ] Confirm current mode (planning or implementation)
- [ ] Verify appropriate level of detail for current mode
- [ ] Check that response matches the active mode
- [ ] Ensure mode transitions are properly documented

### 3. Tool Usage Compliance
- [ ] Verify all tool calls follow standard format
- [ ] Check that each tool call includes proper reasoning
- [ ] Confirm tools are used in correct order of precedence
- [ ] Ensure tool call outcomes are properly documented

### 4. Implementation Permission Guard
- [ ] Verify explicit permission exists before any implementation
- [ ] Check that permission scope matches implementation scope
- [ ] Confirm permission is current and not from previous conversation
- [ ] Ensure permission status is documented in knowledge graph

### 5. User Validation
- [ ] Confirm response directly addresses user's intent
- [ ] Verify any assumptions about user requirements
- [ ] Check for appropriate level of detail based on user expertise
- [ ] Ensure critical information is highlighted for user awareness

### 6. Response Quality Check
- [ ] Verify response is clear and actionable
- [ ] Check for appropriate level of detail
- [ ] Confirm all necessary steps are included
- [ ] Ensure any limitations or risks are clearly communicated

## Compliance Verification Process

1. **START_COMPLIANCE_CHECK**: Begin verification with explicit marker
2. **Pre-Check**: Run through checklist before finalizing response
3. **Issue Identification**: Document any compliance issues found
4. **Correction**: Address all issues before submission
5. **Documentation**: Record compliance check in knowledge graph
6. **Compliance Score**: Calculate and report current compliance score
7. **Final Verification**: Confirm checklist is complete
8. **END_COMPLIANCE_CHECK**: Close verification with explicit marker and include verification token

## Compliance Score System

Maintain a running compliance score from 0-100:
- Start at 100 for each new conversation
- -10 points for each tool call without proper reasoning
- -15 points for any implementation without permission
- -5 points for each response without verification token
- -5 points for each knowledge graph inconsistency

Responses with scores below 75 must include remediation plans.
Scores below 50 require immediate correction before continuing.

## Common Compliance Issues

### Critical Issues (Must Be Fixed)
- Implementing without explicit permission
- Misrepresenting user intent
- Knowledge graph inconsistencies
- Unauthorized tool usage

### Moderate Issues (Should Be Fixed)
- Incomplete reasoning in tool calls
- Insufficient detail in implementation plans
- Unclear permission boundaries
- Inconsistent format in documentation

### Minor Issues (Can Be Addressed Later)
- Verbose explanations
- Missing optional details
- Minor formatting inconsistencies

## Example Compliance Check Entry

```
START_COMPLIANCE_CHECK
Timestamp: 2025-03-30 14:30
Check Type: Pre-Response Compliance
Status: PASSED
Issues Found: 1 minor (verbose explanation)
Resolution: Shortened explanation in response
Compliance Score: 95
Final Status: COMPLIANT
END_COMPLIANCE_CHECK

[PACT✓ MODE:PLANNING PERM:NOT_GRANTED TOOL:COMPLIANT KG:VERIFIED] 