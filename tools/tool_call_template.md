# PACT Tool Call Template

## Standard Format

Every tool call MUST begin with a reasoning statement formatted as follows:

```
[ℹ️ Purpose] I'll {action} {what} to {reason} which will help {goal}.
```

### Key Elements

- **Purpose**: Indicator that reasoning follows
- **Action**: The operation being performed (create, read, update, delete, etc.)
- **What**: The specific target of the action (file, entity, relation, etc.)
- **Reason**: Specific justification for this particular operation
- **Goal**: How this contributes to overall objectives

### MANDATORY ENFORCEMENT

Tool calls without proper reasoning format are NON-COMPLIANT and MUST NOT be executed.
Non-compliant tool calls must be corrected before proceeding.
A compliance score penalty will be applied for each non-compliant tool call.

## Examples by Operation Type

### Knowledge Graph Reading
```
[ℹ️ Purpose] I'll read the knowledge graph to check the current implementation status which will help determine which phases have been completed.
```

### Knowledge Graph Updating
```
[ℹ️ Purpose] I'll create a Status Tracker entity to document implementation progress which will help maintain an accurate record of project status.
```

### File Operations
```
[ℹ️ Purpose] I'll edit the makefile to add new test targets which will help streamline the testing process.
```

## Result Documentation

### Success Format
```
[✅ Success] Successfully created {what}. {Brief outcome summary}.
```

### Error Format
```
[❌ Error] Failed to {action} {what} due to {reason}. {Mitigation if applicable}.
```

### Warning Format
```
[⚠️ Warning] {Issue description}. {Impact}. {Recommendation}.
```

### Next Steps Format
```
[➤ Next] I'll {next action} to {reason}.
```

## Tool Call Patterns

1. **Single Operation**
   - Purpose statement
   - Tool call
   - Result documentation

2. **Related Series**
   - Initial purpose statement (comprehensive)
   - Multiple related tool calls
   - Summary of overall outcome
   - Next steps

3. **Dependent Operations**
   - Initial purpose statement
   - First tool call
   - Evaluation of result
   - Conditional follow-up tool calls
   - Summary of overall outcome

## Important Rules

1. ALWAYS include purpose statement before ANY tool call
2. Use consistent formatting for visual indicators
3. Document outcomes after significant operations
4. Summarize results after related series of operations
5. Clearly indicate next steps after tool call completion
6. ENFORCE reasoning pattern for ALL tool calls without exception
7. Report compliance violations immediately
8. Track compliance score across interactions 