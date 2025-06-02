# PACT-System Tools: Guides, References, and Protocols

This directory contains essential documentation related to the tools and tool-like mechanisms utilized within or governed by the PACT-System framework. This includes:

*   Detailed guides for using specific advanced tools (e.g., reasoning engines, formal solvers).
*   Specifications for symbolic tool referencing and environment-specific mappings.
*   Templates and protocols for standardized tool invocation by PACT-System agents.
*   Best practices for common operational tools used by AI assistants during development or interaction.
*   Mechanisms for tracking compliance related to tool usage.

Refer to the main PACT-System [README.md](../README.md) for an overview of how tooling fits into the overall framework and its principles.

---

## Index of Key Tool Documents

*   **Core Tooling Protocols & References:**
    *   [`symbolic_tool_references.md`](./symbolic_tool_references.md): The definitive registry of symbolic tool names, their descriptions, parameters, and mappings to concrete implementations across different environment profiles.
    *   [`tool_call_template.md`](./tool_call_template.md): Specifies the standard format and reasoning requirements for agent tool calls under PACT-System.
    *   [`compliance_tracker.md`](./compliance_tracker.md): Outlines a system for tracking PACT-System compliance events, including those related to tool usage.
    *   [`edit_file_tool_best_practices.md`](./edit_file_tool_best_practices.md): Best practices for using the `edit_file` tool, crucial for AI-driven file modifications.

*   **Advanced Tool Guides:**
    *   [`deep_reasoning_models_prompting_guide.md`](./deep_reasoning_models_prompting_guide.md): Comprehensive guide on prompting and utilizing deep reasoning models (e.g., `DEEPSEEK_THINKING`).
    *   [`z3_guide.md`](./z3_guide.md): Detailed guide for using the Z3 SMT Solver for formal verification and constraint solving within the PACT-System.

*   **Tool Usage Examples:**
    *   [`examples/README.md`](./examples/README.md) (to be created): Index for specific examples of tool usage.

*   **Reference Implementations (Contextual):**
    *   [`reference_implementations/tools_synthesis_report.md`](./reference_implementations/tools_synthesis_report.md): A report detailing a specific set of tool capabilities from a previous project iteration, used to inform some symbolic tool definitions.

---

## Tool Usage Precedence and General Guidelines

This section outlines the recommended precedence of tools for different types of tasks and provides general guidelines for their usage within the PACT-System.

### Tool Precedence by Task Category

Follow this tool precedence for common tasks:

#### Code Analysis and Search

1.  **First**: `codebase_search` (Symbolic: `CODEBASE_SEMANTIC_SEARCH`) for semantic understanding and exploration.
2.  **Second**: `grep_search` (Symbolic: `CODEBASE_REGEX_SEARCH`) for exact pattern matches or regular expressions.
3.  **Third**: `file_search` (Symbolic: `FILE_SYSTEM_SEARCH_BY_NAME`) for finding specific files when part of the name is known.
4.  **Last**: `list_dir` (Symbolic: `FILE_SYSTEM_LIST_DIRECTORY`) for directory exploration when other search methods are insufficient.

#### File Operations

1.  **First**: `read_file` (Symbolic: `FILE_READ`) to examine file contents.
2.  **Second**: `edit_file` (Symbolic: `FILE_EDIT`) for making changes (with `reapply` if needed - see [`edit_file_tool_best_practices.md`](./edit_file_tool_best_practices.md)).
3.  **Last**: `delete_file` (Symbolic: `FILE_DELETE`) when removal is necessary and confirmed.

#### Terminal Operations

*   `run_terminal_cmd` (Symbolic: `TERMINAL_RUN_COMMAND`):
    *   Always check memory/KG (e.g., `ToolMetadata`) for information about the command and its expected behavior before execution.
    *   Prioritize read-only commands (e.g., `ls`, `cat`, `grep` via terminal) over write operations.
    *   **CRITICAL**: For any commands that modify files outside a very narrow, defined scope, or delete files/directories, or have potential system-wide impact, explicit user permission and confirmation are mandatory *before* proposing the command.
    *   If a command fails due to missing dependencies, consult memory/KG for known solutions or ask the user for guidance before attempting to install anything.

#### Knowledge Graph Operations

*   **Retrieval**: `READ_ENTIRE_GRAPH` (RESTRICTED: NEVER USE) -> [`SEARCH_NODES`](./symbolic_tool_references.md#tool-search_nodes) -> [`OPEN_SPECIFIC_NODES`](./symbolic_tool_references.md#tool-open_specific_nodes) -> [`KG_CYPHER_READ`](./symbolic_tool_references.md#tool-kg_cypher_read) (for complex specific queries).
*   **Storage**: [`CREATE_ENTITIES`](./symbolic_tool_references.md#tool-create_entities) -> [`CREATE_RELATIONS`](./symbolic_tool_references.md#tool-create_relations) -> [`ADD_OBSERVATIONS`](./symbolic_tool_references.md#tool-add_observations).
*   **Deletion**: [`DELETE_OBSERVATIONS`](./symbolic_tool_references.md#tool-delete_observations) -> [`DELETE_RELATIONS`](./symbolic_tool_references.md#tool-delete_relations) -> [`DELETE_ENTITIES`](./symbolic_tool_references.md#tool-delete_entities) (all with caution and appropriate checks).

Refer to [`symbolic_tool_references.md`](./symbolic_tool_references.md) for detailed definitions of these symbolic tool names and their mappings.

#### Web Access

1.  **First**: [`FETCH_URL`](./symbolic_tool_references.md#tool-fetch_url) for direct retrieval of a known URL's content.
2.  **Second**: `web_search` (Symbolic: `WEB_SEARCH_QUERY`) for general internet searches when a specific URL is not known.
3.  **Last**: Browser automation tools (Symbolic sequence: [`BROWSER_INITIALIZE`](./symbolic_tool_references.md#tool-browser_initialize) -> [`BROWSER_NAVIGATE`](./symbolic_tool_references.md#tool-browser_navigate) -> etc.) for complex interactions or when direct fetching/searching is insufficient.

#### Complex Reasoning

*   [`DEEPSEEK_THINKING`](./symbolic_tool_references.md#tool-deepseek_thinking): For tasks requiring deep reasoning, analysis, or problem-solving. Refer to the [`deep_reasoning_models_prompting_guide.md`](./deep_reasoning_models_prompting_guide.md).
*   **Z3 Solver Suite** (e.g., [`Z3_SOLVER_ADD`](./symbolic_tool_references.md#tool-z3_solver_add), [`Z3_SOLVER_SOLVE`](./symbolic_tool_references.md#tool-z3_solver_solve)): For formal verification, constraint satisfaction. Refer to the [`z3_guide.md`](./z3_guide.md).

### Advanced Tool Usage Notes

*   **Symbolic Tool References**: Always consult and use the symbolic names defined in [`symbolic_tool_references.md`](./symbolic_tool_references.md) in PACT-System documentation and agent reasoning. Implementations should resolve these to concrete tool calls via environment profiles or other configured mechanisms.
*   **Combined Workflows**: Advanced tools like `DEEPSEEK_THINKING` and the Z3 solver suite can be used in synergistic workflows for enhanced problem-solving, as detailed in their respective guides.

### External Dependencies Management

*   **Tool Information Storage**: Prefer storing detailed metadata about specific tool versions, their historical effectiveness, known issues, and specific installation/setup guides in the Knowledge Graph (`ToolMetadata` entities) rather than embedding all such details directly in PACT-System protocol files.
*   **Dependency Handling Protocol**:
    1.  Before using any external tool or assuming a dependency, query the KG for `ToolMetadata` and `Dependency` information.
    2.  If a dependency is missing or a tool is unavailable, consult KG/memory for standard installation procedures or known workarounds for the current environment profile.
    3.  If no information is found, **STOP** and consult the user for guidance. Do not attempt to install software or modify the environment without explicit permission.
    4.  After resolution (e.g., user installs dependency), update the KG with this new information for future reference.
*   **Verification Before Use**: Always attempt to verify a tool's existence or a command's availability in the current environment (as per its symbolic mapping) before proposing its use in an implementation step. 