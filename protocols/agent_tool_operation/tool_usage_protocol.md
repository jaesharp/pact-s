# Tool Usage Protocol

This protocol governs how tools are used and how tool calls are communicated.

## Knowledge Graph First

Begin by checking existing entities and relationships in the knowledge graph.

## Tool Metadata Verification

Before using any tool:
- Check the knowledge graph for metadata about the tool
- Look for usage patterns, success rates, and common issues
- Verify if there are specific usage guidelines stored in memory
- Do not assume tool availability without verification

## Local Tools Priority

Use local Mana tools whenever possible:
- `mcp_mana_read_graph` to check existing knowledge
- `mcp_mana_create_entities`/`mcp_mana_create_relations` to update knowledge
- `mcp_mana_get_deepseek_thinker` for complex reasoning

## Documentation Access

When needing reference documentation:
- Try `mcp_mana_fetch` first for accessing documentation
- If fetch fails or returns incomplete results, use browser tools

## Browser Fallback

When fetch tool encounters limitations:
- Use `mcp_mana_initialize_browser` to start a browser session
- Navigate with `mcp_mana_go_to_url` or `mcp_mana_search_google`
- When encountering CAPTCHAs or other barriers, pause and ask user for assistance

## Tool Call Communication

- ***CRITICAL PROTOCOL:*** Provide brief reasoning BEFORE calling any tool to explain its purpose
- Never make a tool call without first explaining why you're using it
- Use the standard reasoning format: `[ℹ️ Purpose] I'll {action} {what} to {reason} which will help {goal}.`
- Each tool call MUST populate this JSON schema before execution:
  ```json
  {
    "tool_reasoning": {
      "action": "string (required): what operation is being performed",
      "what": "string (required): target of the action",
      "reason": "string (required): specific justification",
      "goal": "string (required): contribution to overall objectives"
    }
  }
  ```
- Tool calls without properly populated reasoning schema are NON-COMPLIANT
- Use standardized visual indicators for communication types:
  - `[ℹ️ Purpose]` - Reasoning before tool calls
  - `[✅ Success]` - Successful tool operations
  - `[⚠️ Warning]` - Issues that need attention
  - `[❌ Error]` - Failed operations
  - `[➤ Next]` - Next steps or actions
- When planning multiple related tool calls, explain the overall strategy first
- Provide a brief summary after every significant tool call or series of related tool calls
- Use the summary format: `This {tool/operation} revealed {key finding} which {impact on task}. Next, I'll {follow-up action}.`
- Avoid long chains of tool calls without user feedback
- Include purpose of the tool call and key outcomes in the summary
- For multiple related tool calls, group them logically and provide a single summary
- Ensure summaries are concise but informative, focusing on what changed or was learned
- Document significant tool calls in the knowledge graph using the ToolCallEvent entity type
- Perform a compliance self-check before submitting responses to ensure adherence to these protocols
- Store metadata about tool effectiveness in memory for future evaluation
- Report any accidental protocol violations in this area immediately

## Tool Reasoning Fence Pattern

Every tool call MUST be surrounded by a "reasoning fence":

```
[ℹ️ Purpose] I'll {action} {what} to {reason} which will help {goal}.

<TOOL CALL HERE>

[✅/❌/⚠️] Result: {outcome}.
```

This pattern creates a clear separation between reasoning, tool call, and result documentation.

## Work Verification

- Regularly check your work against PACT requirements
- Use deepseek thinking for self-review when appropriate
- Document verification steps taken

## Missing Dependencies Handling

- When external dependencies or tools are missing, stop immediately
- Do not attempt workarounds without explicit user approval
- Request the user to install the missing dependency
- Store information about the dependency and installation process in memory, not in this PACT file
- Wait for user confirmation before proceeding 