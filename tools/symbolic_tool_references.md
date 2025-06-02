# Symbolic Tool References

This document defines the system for using symbolic tool references within the PACT-System framework. This approach enables consistent documentation and discussion of tool capabilities, abstracting away the specific function names that may vary across different agent implementations or environments.

## Overview

The Symbolic Tool Reference system provides an abstraction layer between the conceptual PACT-System tool and its concrete implementation. This allows:

1.  Documentation to use consistent symbolic names.
2.  Different agent environments to map these symbolic names to their specific function calls.
3.  Preservation of operational intent and defined restrictions, while allowing flexibility in naming and implementation details.
4.  Evolution of tool implementations without necessarily breaking high-level PACT-System protocol documentation that refers to symbolic names.

## Schema Version: 2.0 (Markdown-centric format with Environment Profiles)

This version reflects a shift to a direct Markdown representation for improved human readability and editability, and includes support for environment-specific implementation profiles.

--- 

## Knowledge Graph (KG) Tools

### Tool: `READ_ENTIRE_GRAPH`

*   **Description**: Retrieves the entire knowledge graph.
*   **Restrictions**: `NEVER_USE_DIRECTLY` - This operation can be very resource-intensive and is generally too large for typical context windows.
*   **Allowed Alternatives**: `SEARCH_NODES`, `OPEN_SPECIFIC_NODES`.
*   **Explanation**: Retrieving the entire graph can lead to truncation and loss of critical information; prefer targeted access methods.
*   **Implementations**:
    *   **Reference Default**: `mcp_mana_read_graph`
    *   **Profiles**:
        *   `dev_env_mcp`: `mcp_mana_read_graph`
    *   **Alternates**:
        *   `in_knowledge_graph_read_graph`
        *   `kg_get_all`

### Tool: `SEARCH_NODES`

*   **Description**: Search for specific nodes matching a query.
*   **Parameters**:
    *   `query`: (String) String containing search terms.
*   **Restrictions**: None.
*   **Recommended**: True.
*   **Implementations**:
    *   **Reference Default**: `mcp_mana_search_nodes`
    *   **Profiles**:
        *   `dev_env_mcp`: `mcp_mana_search_nodes`
    *   **Alternates**:
        *   `in_knowledge_graph_search_nodes`
        *   `kg_search`

### Tool: `OPEN_SPECIFIC_NODES`

*   **Description**: Retrieve specific nodes by name.
*   **Parameters**:
    *   `names`: (Array of Strings) Node names to retrieve.
*   **Restrictions**: None.
*   **Recommended**: True.
*   **Implementations**:
    *   **Reference Default**: `mcp_mana_open_nodes`
    *   **Profiles**:
        *   `dev_env_mcp`: `mcp_mana_open_nodes`
    *   **Alternates**:
        *   `in_knowledge_graph_open_nodes`
        *   `kg_get_by_name`

### Tool: `CREATE_ENTITIES`

*   **Description**: Create new knowledge graph entities.
*   **Parameters**:
    *   `entities`: (Array of Objects) Entity objects with name, type, and observations.
*   **Restrictions**: None.
*   **Recommended**: True.
*   **Implementations**:
    *   **Reference Default**: `mcp_mana_create_entities`
    *   **Profiles**:
        *   `dev_env_mcp`: `mcp_mana_create_entities`
    *   **Alternates**:
        *   `in_knowledge_graph_create_entities`
        *   `kg_add_entities`

### Tool: `CREATE_RELATIONS`

*   **Description**: Create new relations between entities.
*   **Parameters**:
    *   `relations`: (Array of Objects) Relation objects with `from`, `to`, and `type`.
*   **Restrictions**: None.
*   **Recommended**: True.
*   **Implementations**:
    *   **Reference Default**: `mcp_mana_create_relations`
    *   **Profiles**:
        *   `dev_env_mcp`: `mcp_mana_create_relations`
    *   **Alternates**:
        *   `in_knowledge_graph_create_relations`
        *   `kg_add_relations`

### Tool: `KG_LIST_GRAPHS`

*   **Description**: Lists all available graphs in a graph database (e.g., an Age-based one).
*   **Parameters**: None.
*   **Restrictions**: None.
*   **Recommended**: True.
*   **Implementations**:
    *   **Reference Default**: `mcp_Toolbase_in_knowledge_graph_list_age_graphs`
    *   **Profiles**:
        *   `dev_env_mcp`: `mcp_Toolbase_in_knowledge_graph_list_age_graphs`

### Tool: `KG_GET_SCHEMA`

*   **Description**: Retrieves the schema for a specified graph (e.g., an Age-based one).
*   **Parameters**:
    *   `graph_name`: (String) Name of the graph to get schema for.
*   **Restrictions**: None.
*   **Recommended**: True.
*   **Implementations**:
    *   **Reference Default**: `mcp_Toolbase_in_knowledge_graph_get_age_schema`
    *   **Profiles**:
        *   `dev_env_mcp`: `mcp_Toolbase_in_knowledge_graph_get_age_schema`

### Tool: `KG_CYPHER_READ`

*   **Description**: Executes read-only Cypher queries against a graph.
*   **Parameters**:
    *   `graph_name`: (String) Name of the graph.
    *   `query`: (String) Cypher query string.
*   **Restrictions**: None.
*   **Recommended**: True.
*   **Implementations**:
    *   **Reference Default**: `mcp_Toolbase_in_knowledge_graph_read_age_cypher`
    *   **Profiles**:
        *   `dev_env_mcp`: `mcp_Toolbase_in_knowledge_graph_read_age_cypher`

### Tool: `KG_CYPHER_WRITE`

*   **Description**: Executes write Cypher queries to modify a graph.
*   **Parameters**:
    *   `graph_name`: (String) Name of the graph.
    *   `query`: (String) Cypher query string.
*   **Restrictions**: `Requires careful review due to write access`.
*   **Recommended**: False.
*   **Implementations**:
    *   **Reference Default**: `mcp_Toolbase_in_knowledge_graph_write_age_cypher`
    *   **Profiles**:
        *   `dev_env_mcp`: `mcp_Toolbase_in_knowledge_graph_write_age_cypher`

### Tool: `KG_CREATE_GRAPH`

*   **Description**: Creates new graph namespaces (e.g., an Age-based one).
*   **Parameters**:
    *   `graph_name`: (String) Name for the new graph.
*   **Restrictions**: None.
*   **Recommended**: True.
*   **Implementations**:
    *   **Reference Default**: `mcp_Toolbase_in_knowledge_graph_create_age_graph`
    *   **Profiles**:
        *   `dev_env_mcp`: `mcp_Toolbase_in_knowledge_graph_create_age_graph`

### Tool: `KG_DROP_GRAPH`

*   **Description**: Removes entire graphs from the database (e.g., an Age-based one).
*   **Parameters**:
    *   `graph_name`: (String) Name of the graph to drop.
*   **Restrictions**: `HIGHLY_DANGEROUS_OPERATION`.
*   **Recommended**: False.
*   **Implementations**:
    *   **Reference Default**: `mcp_Toolbase_in_knowledge_graph_drop_age_graph`
    *   **Profiles**:
        *   `dev_env_mcp`: `mcp_Toolbase_in_knowledge_graph_drop_age_graph`

---

## Advanced Reasoning Tools

### Tool: `DEEPSEEK_THINKING`

*   **Description**: Utilizes a deep reasoning model (e.g., DeepSeek-R1) for advanced reasoning tasks.
*   **Parameters**:
    *   `originPrompt`: (String) Problem or question to analyze.
*   **Restrictions**: None.
*   **Recommended**: True.
*   **Implementations**:
    *   **Reference Default**: `mcp_deep_reasoner_get_deepseek_thinker`
    *   **Profiles**:
        *   `dev_env_mcp`: `mcp_deep_reasoner_get_deepseek_thinker`
    *   **Alternates**:
        *   `mcp_mana_get_deepseek_thinker`
        *   `get_deepseek_thinker`
        *   `deepseek_r1_reasoning`

---

## Z3 Solver Tools

### Tool: `Z3_SOLVER_CLEAR_MODEL`

*   **Description**: Resets/clears the current Z3 model.
*   **Parameters**: None.
*   **Restrictions**: None.
*   **Recommended**: True.
*   **Implementations**:
    *   **Reference Default**: `mcp_Toolbase_via_z3_sat_smt_clear_model`
    *   **Profiles**:
        *   `dev_env_mcp`: `mcp_Toolbase_via_z3_sat_smt_clear_model`
    *   **Alternates**:
        *   `via_z3_sat_smt_clear_model`

### Tool: `Z3_SOLVER_ADD`

*   **Description**: Adds a Z3 item/script segment to the model.
*   **Parameters**:
    *   `index`: (Integer) Index for the item.
    *   `content`: (String) String of Python/Z3 code.
*   **Restrictions**: None.
*   **Recommended**: True.
*   **Implementations**:
    *   **Reference Default**: `mcp_Toolbase_via_z3_sat_smt_add_item`
    *   **Profiles**:
        *   `dev_env_mcp`: `mcp_Toolbase_via_z3_sat_smt_add_item`

### Tool: `Z3_SOLVER_REPLACE`

*   **Description**: Replaces a Z3 item/script segment in the model.
*   **Parameters**:
    *   `index`: (Integer) Index of the item to replace.
    *   `content`: (String) String of new Python/Z3 code.
*   **Restrictions**: None.
*   **Recommended**: True.
*   **Implementations**:
    *   **Reference Default**: `mcp_Toolbase_via_z3_sat_smt_replace_item`
    *   **Profiles**:
        *   `dev_env_mcp`: `mcp_Toolbase_via_z3_sat_smt_replace_item`

### Tool: `Z3_SOLVER_DELETE`

*   **Description**: Deletes a Z3 item/script segment from the model.
*   **Parameters**:
    *   `index`: (Integer) Index of the item to delete.
*   **Restrictions**: None.
*   **Recommended**: True.
*   **Implementations**:
    *   **Reference Default**: `mcp_Toolbase_via_z3_sat_smt_delete_item`
    *   **Profiles**:
        *   `dev_env_mcp`: `mcp_Toolbase_via_z3_sat_smt_delete_item`

### Tool: `Z3_SOLVER_GET_MODEL`

*   **Description**: Retrieves the current content of the Z3 Python model.
*   **Parameters**: None.
*   **Restrictions**: None.
*   **Recommended**: True.
*   **Implementations**:
    *   **Reference Default**: `mcp_Toolbase_via_z3_sat_smt_get_model`
    *   **Profiles**:
        *   `dev_env_mcp`: `mcp_Toolbase_via_z3_sat_smt_get_model`
    *   **Alternates**:
        *   `via_z3_sat_smt_get_model`

### Tool: `Z3_SOLVER_SOLVE`

*   **Description**: Solves the current Z3 model.
*   **Parameters**:
    *   `timeout`: (Float) Timeout in seconds.
*   **Restrictions**: None.
*   **Recommended**: True.
*   **Implementations**:
    *   **Reference Default**: `mcp_Toolbase_via_z3_sat_smt_solve_model`
    *   **Profiles**:
        *   `dev_env_mcp`: `mcp_Toolbase_via_z3_sat_smt_solve_model`
    *   **Alternates**:
        *   `via_z3_sat_smt_solve_model`

---

## Web Access Tools

### Tool: `FETCH_URL`

*   **Description**: Fetches the content of a given URL.
*   **Parameters**:
    *   `url`: (String) The URL to fetch.
*   **Restrictions**: None.
*   **Recommended**: True.
*   **Implementations**:
    *   **Reference Default**: `mcp_Toolbase_fetch_url`
    *   **Profiles**:
        *   `dev_env_mcp`: `mcp_Toolbase_fetch_url`

### Tool: `BROWSER_INITIALIZE`

*   **Description**: Initializes a web browser session.
*   **Parameters**:
    *   `browser_name`: (String, Optional) Name of the browser to use (e.g., "chrome", "firefox"). Defaults to system default if not provided by implementation.
*   **Restrictions**: None.
*   **Recommended**: True.
*   **Implementations**:
    *   **Reference Default**: `mcp_Toolbase_with_web_browser_initialize_browser`
    *   **Profiles**:
        *   `dev_env_mcp`: `mcp_Toolbase_with_web_browser_initialize_browser`

### Tool: `BROWSER_NAVIGATE`

*   **Description**: Navigates the browser to a specified URL.
*   **Parameters**:
    *   `url`: (String) The URL to navigate to.
*   **Restrictions**: None.
*   **Recommended**: True.
*   **Implementations**:
    *   **Reference Default**: `mcp_Toolbase_with_web_browser_go_to_url`
    *   **Profiles**:
        *   `dev_env_mcp`: `mcp_Toolbase_with_web_browser_go_to_url`

### Tool: `BROWSER_SEARCH`

*   **Description**: Performs a search query using a search engine in the browser.
*   **Parameters**:
    *   `query`: (String) The search query.
*   **Restrictions**: None.
*   **Recommended**: True.
*   **Implementations**:
    *   **Reference Default**: `mcp_Toolbase_with_web_browser_search_google`
    *   **Profiles**:
        *   `dev_env_mcp`: `mcp_Toolbase_with_web_browser_search_google`

### Tool: `BROWSER_CLICK_ELEMENT`

*   **Description**: Clicks a specified element on the current web page.
*   **Parameters**:
    *   `element_id`: (String) Identifier for the element (e.g., CSS selector, XPath, ID).
*   **Restrictions**: None.
*   **Recommended**: True.
*   **Implementations**:
    *   **Reference Default**: `mcp_Toolbase_with_web_browser_click_element`
    *   **Profiles**:
        *   `dev_env_mcp`: `mcp_Toolbase_with_web_browser_click_element`

### Tool: `BROWSER_INPUT_TEXT`

*   **Description**: Inputs text into a specified form field or element on the current web page.
*   **Parameters**:
    *   `element_id`: (String) Identifier for the input element.
    *   `text`: (String) The text to input.
*   **Restrictions**: None.
*   **Recommended**: True.
*   **Implementations**:
    *   **Reference Default**: `mcp_Toolbase_with_web_browser_input_text`
    *   **Profiles**:
        *   `dev_env_mcp`: `mcp_Toolbase_with_web_browser_input_text`

### Tool: `BROWSER_INSPECT_PAGE`

*   **Description**: Retrieves information about the current web page structure or content (e.g., HTML source, specific element attributes).
*   **Parameters**: 
    *   `detail_level`: (String, Optional) e.g., "source", "dom_tree", "element_attributes".
    *   `element_id`: (String, Optional) Identifier if inspecting a specific element.
*   **Restrictions**: None.
*   **Recommended**: True.
*   **Implementations**:
    *   **Reference Default**: `mcp_Toolbase_with_web_browser_inspect_page`
    *   **Profiles**:
        *   `dev_env_mcp`: `mcp_Toolbase_with_web_browser_inspect_page`

### Tool: `BROWSER_VALIDATE_PAGE`

*   **Description**: Performs validation checks on the current web page (e.g., accessibility, HTML validity).
*   **Parameters**: 
    *   `validation_type`: (String) e.g., "accessibility", "html".
*   **Restrictions**: None.
*   **Recommended**: True.
*   **Implementations**:
    *   **Reference Default**: `mcp_Toolbase_with_web_browser_validate_page`
    *   **Profiles**:
        *   `dev_env_mcp`: `mcp_Toolbase_with_web_browser_validate_page`

### Tool: `BROWSER_SCROLL_DOWN`

*   **Description**: Scrolls the browser window down.
*   **Parameters**: 
    *   `amount`: (String/Integer, Optional) e.g., "page", "pixels_value".
*   **Restrictions**: None.
*   **Recommended**: True.
*   **Implementations**:
    *   **Reference Default**: `mcp_Toolbase_with_web_browser_scroll_down`
    *   **Profiles**:
        *   `dev_env_mcp`: `mcp_Toolbase_with_web_browser_scroll_down`

### Tool: `BROWSER_SCROLL_UP`

*   **Description**: Scrolls the browser window up.
*   **Parameters**: 
    *   `amount`: (String/Integer, Optional) e.g., "page", "pixels_value".
*   **Restrictions**: None.
*   **Recommended**: True.
*   **Implementations**:
    *   **Reference Default**: `mcp_Toolbase_with_web_browser_scroll_up`
    *   **Profiles**:
        *   `dev_env_mcp`: `mcp_Toolbase_with_web_browser_scroll_up`

### Tool: `BROWSER_WAIT`

*   **Description**: Pauses browser automation for a specified duration or until a condition is met.
*   **Parameters**:
    *   `duration_seconds`: (Float, Optional) Time to wait in seconds.
    *   `condition_script`: (String, Optional) A script whose true evaluation ends the wait.
*   **Restrictions**: None.
*   **Recommended**: True.
*   **Implementations**:
    *   **Reference Default**: `mcp_Toolbase_with_web_browser_wait`
    *   **Profiles**:
        *   `dev_env_mcp`: `mcp_Toolbase_with_web_browser_wait`

---

## Reference Resolution System

Each agent implementation or environment utilizing PACT-System must include a reference resolution mechanism. This system is responsible for mapping the symbolic tool references used in PACT-System protocols and documentation (like this file) to the actual, concrete function calls or tool invocation commands available in that specific environment.

This can be achieved through:

*   **Environment Profiles (Preferred for PACT-System)**: As defined in this document, the agent identifies its current environment profile (e.g., via a startup configuration or environment variable) and uses this profile to look up the specific concrete tool name from the `profiles` object within each symbolic tool definition. If a tool is not listed under the current profile, or the profile itself is not found, the agent may fall back to using the `reference_default` implementation or defined `alternates`.
*   **Configuration Files**: An external configuration file (e.g., JSON, YAML, Dhall) loaded by the agent at runtime, providing a direct map from symbolic names to environment-specific tool names. This file would be specific to the deployment environment.
*   **Hard-coded Mapping**: Within an agent's codebase, a direct mapping (e.g., a dictionary or switch statement) that translates symbolic names to its implemented functions. This is less flexible for updates.
*   **Dynamic Discovery/Registration**: (Future PACT-System Consideration) A system where tools, upon startup in an environment, register themselves and the symbolic PACT-System capabilities they fulfill with a central PACT-System service or registry.

The chosen resolution method should be documented for each PACT-System-compliant agent or system.

---

## Documentation Standards

All PACT-System framework documentation, protocols, and agent reasoning logs that refer to tool usage SHOULD use the symbolic tool references defined in this document, rather than concrete implementation names. This ensures clarity, consistency, and portability of PACT-System principles across different environments.

*   When referring to a tool, use its symbolic name (e.g., [`SEARCH_NODES`](#tool-search_nodes)).
*   When discussing parameters, refer to the parameter names as defined under the symbolic tool's "Parameters" section.
*   If restrictions or recommendations are noted for a symbolic tool, these should be heeded in all PACT-System-compliant operations.

---

## Implementation Guidelines

### For Tool Providers/Integrators (mapping concrete tools to PACT-System symbolic names)

1.  **Register in this Document**: When a concrete tool is intended to fulfill a PACT-System symbolic tool capability within a specific environment profile, add or update its entry under the relevant symbolic tool's `Implementations -> Profiles -> <your_env_profile_id>` section. If it's a new primary reference implementation, update `reference_default`.
2.  **Parameter Mapping**: If your concrete tool's parameter names or structures differ from those defined for the symbolic tool, document this clearly for users of your environment profile. The PACT-System framework ideally encourages concrete tools to align with the symbolic parameter definitions where possible, or for adaptors to be created.
3.  **Adhere to Restrictions**: Ensure your tool, when invoked via its symbolic name, respects any `Restrictions` defined for that symbolic tool.

### For PACT-System Protocol & Documentation Authors

1.  **Exclusive Use of Symbolic Names**: Always use the symbolic tool references (e.g., [`KG_CYPHER_READ`](#tool-kg_cypher_read)) when describing procedures, rules, or examples involving tool use.
2.  **Parameter Consistency**: Refer to parameters using the names specified in the "Parameters" section for each symbolic tool in this document.
3.  **Respect Restrictions**: If a symbolic tool is marked with `Restrictions` or as `Recommended: False`, ensure your protocols reflect this and guide users accordingly (e.g., by requiring additional permissions or justifications for its use).

### For PACT-System Agent Implementers (consuming symbolic names)

1.  **Implement Resolution**: Your agent MUST implement a Reference Resolution System (see above) to map symbolic names to the correct concrete tool calls for its operational environment.
2.  **Parameter Contract Compliance**: Ensure that when your agent resolves a symbolic name and calls a concrete tool, it correctly maps the symbolic parameters (and their expected types/structures) to what the concrete tool expects.
3.  **Support or Fallback**: Aim to support all symbolic tools relevant to the agent's function. For any unsupported symbolic tools that might be encountered (e.g., in shared protocols), provide a graceful fallback mechanism (e.g., reporting inability, asking for user guidance).

*(Note: Standard Development tools like file operations, codebase search, and terminal commands are also part of PACT-System but may be defined in a separate, more general 'Core System Tools' reference or assumed to be available with standard symbolic representations like `READ_FILE`, `EDIT_FILE`, `RUN_TERMINAL_CMD` etc. Their detailed symbolic reference definitions are TBD if not covered by existing system capabilities.)*

---

## Standard Symbolic Reference Groups

This section provides a quick overview of defined symbolic tools, grouped by common operational categories. Refer to the main tool definition sections (linked by name using Markdown anchor links, e.g., `#tool-SYMBOLIC_NAME` which typically converts to `#tool-symbolic_name` with underscores, or similar based on Markdown rendering) for full details.

### Knowledge Graph Operations

- [`READ_ENTIRE_GRAPH`](#tool-read_entire_graph)
- [`SEARCH_NODES`](#tool-search_nodes)
- [`OPEN_SPECIFIC_NODES`](#tool-open_specific_nodes)
- [`CREATE_ENTITIES`](#tool-create_entities)
- [`ADD_OBSERVATIONS`](#tool-add_observations)
- [`CREATE_RELATIONS`](#tool-create_relations)
- [`DELETE_ENTITIES`](#tool-delete_entities)
- [`DELETE_RELATIONS`](#tool-delete_relations)
- [`DELETE_OBSERVATIONS`](#tool-delete_observations)
- [`KG_LIST_GRAPHS`](#tool-kg_list_graphs)
- [`KG_GET_SCHEMA`](#tool-kg_get_schema)
- [`KG_CYPHER_READ`](#tool-kg_cypher_read)
- [`KG_CYPHER_WRITE`](#tool-kg_cypher_write)
- [`KG_CREATE_GRAPH`](#tool-kg_create_graph)
- [`KG_DROP_GRAPH`](#tool-kg_drop_graph)

### Advanced Reasoning Tools

- [`DEEPSEEK_THINKING`](#tool-deepseek_thinking)

### Z3 Solver Tools

- [`Z3_SOLVER_CLEAR_MODEL`](#tool-z3_solver_clear_model)
- [`Z3_SOLVER_ADD`](#tool-z3_solver_add)
- [`Z3_SOLVER_REPLACE`](#tool-z3_solver_replace)
- [`Z3_SOLVER_DELETE`](#tool-z3_solver_delete)
- [`Z3_SOLVER_GET_MODEL`](#tool-z3_solver_get_model)
- [`Z3_SOLVER_SOLVE`](#tool-z3_solver_solve)

### Web Access Tools

- [`FETCH_URL`](#tool-fetch_url)
- [`BROWSER_INITIALIZE`](#tool-browser_initialize)
- [`BROWSER_NAVIGATE`](#tool-browser_navigate)
- [`BROWSER_SEARCH`](#tool-browser_search)
- [`BROWSER_CLICK_ELEMENT`](#tool-browser_click_element)
- [`BROWSER_INPUT_TEXT`](#tool-browser_input_text)
- [`BROWSER_INSPECT_PAGE`](#tool-browser_inspect_page)
- [`BROWSER_VALIDATE_PAGE`](#tool-browser_validate_page)
- [`BROWSER_SCROLL`](#tool-browser_scroll)
- [`BROWSER_WAIT`](#tool-browser_wait)

*(Note: Standard Development tools like file operations, codebase search, and terminal commands are also part of the PACT-System but may be defined in a separate, more general 'Core System Tools' reference or assumed to be available with standard symbolic representations like `READ_FILE`, `EDIT_FILE`, `RUN_TERMINAL_CMD` etc. Their detailed symbolic reference definitions are TBD if not covered by existing system capabilities.)*

---

## Extension Mechanism

This symbolic reference document can be extended by:

1.  **Adding a New Tool Section**: Create a new `### Tool: NEW_SYMBOLIC_NAME` section following the established Markdown structure (Description, Parameters, Restrictions, Recommended, Implementations with Reference Default & Profiles). The H3 header will automatically generate an anchor like `#tool-new_symbolic_name` (case-insensitive, underscores generally preserved or converted to hyphens by renderers).
2.  **Updating Standard Groups**: Add the new [`NEW_SYMBOLIC_NAME`](#tool-new_symbolic_name) (using underscores in the link to match the H3 anchor target) to the appropriate list in the "Standard Symbolic Reference Groups" section.
3.  **Incrementing Schema Version**: If the structural way tools are defined changes (beyond adding new tools), increment the `Schema Version` at the top of this document.

---

## Usage Example (Illustrative)

When PACT-System documentation or an agent's internal reasoning refers to an operation like "searching nodes in the knowledge graph," it would use the symbolic name:

```markdown
To find relevant entities, the agent will use the `SEARCH_NODES` capability (see [`SEARCH_NODES`](#tool-search_nodes) definition).
```

An agent operating in the `dev_env_mcp` environment, upon encountering `SEARCH_NODES`, would resolve it (via its Reference Resolution System) to the concrete tool `mcp_mana_search_nodes` (as per its profile) and invoke it with the appropriate parameters.

If a PACT-System protocol states:

```markdown
[PROTOCOL STEP 3.1] If direct entity access is required, use `OPEN_SPECIFIC_NODES` with the list of known entity IDs (refer to [`OPEN_SPECIFIC_NODES`](#tool-open_specific_nodes) for details).
```
This provides a clear, implementation-agnostic instruction.