# Response Tag System Protocol

## 1. Introduction and Purpose for Users

This document explains the standardized tags used in PACT-System agent interactions to structure communication, making it easier to follow and ensuring clarity. When interacting with a PACT-System compliant agent, you may notice consistent tags that visually structure its responses. 

The Response Tag System aims to:

*   **Create a Consistent Visual Language**: Helps in identifying different types of information quickly.
*   **Enhance Readability**: Visually separates different content types within a response.
*   **Improve Scanability**: Allows users (and other systems) to quickly find the most important information or status updates.
*   **Ensure Consistent Communication Patterns**: Standardizes how an agent reports intentions, actions, results, and next steps.
*   **Provide Context Continuity**: Aids in maintaining context between interactions.

Tips for reading agent responses that use this system:

*   Quickly scan for tags to find the most important information.
*   Look for warnings highlighted with the `[⚠️ Warning]` tag.
*   Check `[✅ Success]` / `[❌ Error]` tags to see outcomes of operations.
*   Find the `[➤ Next]` tag to understand what the agent proposes to do next or what is expected.

## 2. Protocol Definition

This protocol outlines standardized tags for structured communication by PACT-System agents.

### 2.1. Purpose of the Protocol

*(This section rephrases the original "Purpose" section of the operational document slightly for flow after the new intro)*
Formalizing a Response Tag System helps:

*   Standardize how agents articulate intent, actions, and outcomes.
*   Provide clear, machine-parseable (and human-readable) status indicators.
*   Support automated auditing and review of agent behavior.
*   Reinforce PACT-System principles of Transparency and Clarity.

### 2.2. Standard Tags

| Tag           | Format         | Purpose                                       |
|---------------|----------------|-----------------------------------------------|
| Purpose       | `[ℹ️ Purpose]` | Explain intent before tool calls or actions.  |
| Success       | `[✅ Success]` | Indicate successful operations or outcomes.   |
| Warning       | `[⚠️ Warning]` | Highlight potential issues or caveats.        |
| Error         | `[❌ Error]`   | Indicate failed operations or problems.       |
| Next          | `[➤ Next]`     | Indicate next logical steps or proposed actions.|

### 2.3. Usage Guidelines

#### 2.3.1. Tool Call "Reasoning Fence"

Every tool call initiated by the agent MUST be surrounded by a "reasoning fence" pattern:

```
[ℹ️ Purpose] I'll {action} {what} to {reason} which will help {goal}.

<TOOL CALL HERE>

[✅/❌/⚠️] Result: {outcome}.
```
This pattern creates a clear separation between the reasoning for a tool call, the tool call itself (which might be elided or summarized in communication logs), and the documented result.

#### 2.3.2. End-Response Tagging

Every agent response, particularly those that do not complete a user's overarching task or that involve multiple steps, should conclude with relevant summary tags, followed by the PACT-System compliance verification token. The general order is:

1.  **Outcome Tags**: `[✅ Success]` or `[❌ Error]` summarizing key outcomes of the steps taken in the current turn.
2.  **Warning Tags**: Any `[⚠️ Warning]` tags highlighting concerns, limitations, or important considerations for the user.
3.  **Next Step Tag**: The `[➤ Next]` tag indicating the agent's proposed next actions or what is pending.
4.  **PACT-System Compliance Verification Token**: (e.g., `[PACT✓ MODE:PLANNING PERM:NOT_GRANTED TOOL:YES KG:VERIFIED]` - see `pact_compliance_protocol.md` for details on this token).

*Example of End-Response Tagging:*
```
[✅ Success] Successfully analyzed the provided data and identified key patterns.
[⚠️ Warning] The analysis for section B is partial due to data anomoly X.
[➤ Next: Refine analysis for section B after clarifying data anomoly X with the user.]
[PACT✓ MODE:PLANNING PERM:NOT_GRANTED TOOL:N/A KG:VERIFIED]
```

### 2.4. Usage Rules

1.  **Standard Format**: Always use the standard format and emoji for each tag as defined above.
2.  **Contextual Use**: Tags should be used appropriately throughout responses to structure information, not just as part of the reasoning fence or end-response block if it aids clarity.
3.  **End-Response Summary**: Utilize tags at the end of responses to clearly summarize key information and status.
4.  **Multiple Tags**: Multiple distinct tags (e.g., a Success and a Warning) can appear at the end to summarize different aspects of the turn.
5.  **Pending Work**: Always include the `[➤ Next]` tag if the overall task or user query isn't fully complete.
6.  **Order of End Tags**: Strive for the order: Success/Error, then Warnings, then Next, before the PACT-System token.
7.  **Token Placement**: The PACT-System compliance token is the final element.

### 2.5. Verification (Agent Self-Check)

Before submitting responses, an agent adhering to this protocol should verify:

1.  All tool calls have proper `[ℹ️ Purpose]` tags before and an appropriate result tag (`[✅ Success]`, `[❌ Error]`, `[⚠️ Warning]`) after.
2.  End-response tags (if used) summarize key information clearly.
3.  Next steps (if the task is ongoing) are clearly indicated with the `[➤ Next]` tag.
4.  Tags follow the proper formatting and ordering conventions.
5.  The PACT-System compliance token is present and accurate as the final part of the response.

### 2.6. Examples of Individual Tags

**Purpose Tag Example:**
```
[ℹ️ Purpose] I'll examine the project's directory structure to understand the current file organization.
```

**Success Tag Example:**
```
[✅ Success] The PACT-System ontology plan has been drafted and saved to `.plans/pacts_ontology_and_xml_workflow.md`.
```

**Warning Tag Example:**
```
[⚠️ Warning] The symbolic tool reference for `CREATE_USER` does not yet have a `dev_env_mcp` profile defined.
```

**Error Tag Example:**
```
[❌ Error] Failed to move the file `old_path/file.txt` because the source path was not found.
```

**Next Tag Example:**
```
[➤ Next: I will proceed to read the content of `VCS.md` from the `.refactor` directory.]
```

*(Note: The PACT✓ compliance token itself is detailed in the `pact_compliance_protocol.md`)* 