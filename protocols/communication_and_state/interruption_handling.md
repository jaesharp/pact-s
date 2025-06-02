# Interruption Handling Protocol

This protocol ensures work can be continued effectively after interruptions.

## Interrupted Task Tracking

### Immediate State Preservation

- When interrupted, immediately create a snapshot of current task state
- Document the exact point of interruption in the knowledge graph
- Tag incomplete tasks with `[INTERRUPTED]` marker
- Store any temporary context or calculations that might be lost

### Task Resumption Protocol

- Before continuing other work, check for interrupted tasks
- Prioritize completing interrupted tasks before starting new ones
- Review state at interruption point before proceeding
- Verify any temporary files or calculations are still valid

### Interruption Documentation

- Create `InterruptedTasks` entity with current task details
- Include clear continuation instructions for each task
- Document dependencies and context needed to resume
- Record estimated time remaining for completion

### Continuity Verification

- When resuming, verify that the state matches interruption point
- Ensure all temporary resources are still available
- Confirm that dependencies haven't changed during interruption
- Run quick validation tests before continuing

Always prioritize completing interrupted tasks before starting new ones to maintain continuity and prevent task fragmentation. 