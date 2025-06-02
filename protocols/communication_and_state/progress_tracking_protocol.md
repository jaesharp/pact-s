# Progress Tracking Protocol

This protocol outlines how to track progress and maintain session state.

## Session State Entity

Create and maintain a special `CurrentSessionState` entity in the knowledge graph with these observations:
- Current phase and subphase being worked on
- Last completed task and next pending task
- Current file being edited (if applicable)
- Key decisions made in the current session
- Any blockers or pending questions
- Test status and last test run result
- On-disk state verification information

## Resumption Checkpoint Format

Use the following format to create resumption checkpoints in the knowledge graph:

```
1. Current Phase: [Phase name]
2. Current Task: [Task description]
3. Completion Status: [x/y tasks completed]
4. Current File: [file path]
5. Next Action: [Specific next action]
6. Context: [Any important context]
7. Blockers: [Any blocking issues]
8. Test Status: [PASS/FAIL with details]
9. On-Disk State: [Key files and their states]
```

## @@resume Command Response

When the user issues the "@@resume" command:

1. Immediately query the knowledge graph for the `CurrentSessionState` entity
2. Verify on-disk state matches in-memory state by checking:
   - File existence and content (key files only)
   - Directory structure (project organization)
   - Git status (if applicable)
3. Run tests to verify code is functioning as expected
4. Update knowledge graph with current state verification
5. Provide a concise summary of where work left off
6. List the next 3 immediate actions to take
7. Highlight any blockers that need resolution
8. Report test status and any discrepancies found
9. Continue work exactly from that point without unnecessary recaps

## Implementation Plan Tracking

For each phase, maintain:

### Pre-implementation Documentation

- Store comprehensive documentation in the knowledge graph
- Include all requirements, design decisions, and task breakdowns

### Task Tracking

- Keep a checklist of tasks with completion status
- Use consistent status indicators: ✅ Completed, ⏳ In Progress, ⏱️ Pending, ❌ Blocked

### Code Snapshots

- Store crucial code snippets in the knowledge graph for reference
- Include file paths and line numbers for easy navigation

### Decision Log

- Track key decisions made during implementation
- Include rationale and alternatives considered

### Test Status Tracking

- Record test execution after every major modification
- Include test status (PASS/FAIL), coverage metrics, and any failures
- Track testing verification steps taken
- Document any test modifications made

## Verification Protocol

For continuous verification:

### Run Tests After Every Major Modification

- Execute relevant test suite after each significant change
- Record test results in the knowledge graph
- Update `CurrentSessionState` with test status

### State Synchronization Verification

- Periodically check that on-disk state matches knowledge graph state
- Verify file contents match expectations
- Ensure directory structure matches architecture plan
- Confirm code organization follows documented structure

### Test Suite Verification

- Run comprehensive tests before marking any phase complete
- Verify test coverage meets thresholds
- Ensure all requirements have corresponding tests
- Document all test verifications in the knowledge graph

Update the session state after completing each significant task or before extended breaks. 