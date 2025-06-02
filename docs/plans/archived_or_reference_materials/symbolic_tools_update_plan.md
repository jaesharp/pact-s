# Plan for Updating Symbolic Tool References

This document outlines the plan to update `tools/symbolic_tool_references.md` based on tools identified in `tools/reference_implementations/tools_synthesis_report.md`.

## 1. Current Symbolic Tool Groups (from `symbolic_tool_references.md`)

*   **Knowledge Graph Operations (Generic):** `READ_ENTIRE_GRAPH`, `SEARCH_NODES`, `OPEN_SPECIFIC_NODES`, `CREATE_ENTITIES`, `CREATE_RELATIONS`, `ADD_OBSERVATIONS`, `DELETE_ENTITIES`, `DELETE_RELATIONS`, `DELETE_OBSERVATIONS`.
*   **Advanced Reasoning Tools:** `DEEPSEEK_THINKING`.
*   **Z3 Solver Tools (Generic):** `Z3_SOLVER_ADD`, `Z3_SOLVER_REPLACE`, `Z3_SOLVER_DELETE`, `Z3_SOLVER_SOLVE`.
*   **Web Access Tools (Basic):** `FETCH_URL`, `BROWSER_INITIALIZE`, `BROWSER_NAVIGATE`, `BROWSER_SEARCH`.

## 2. Additional Tools Identified (from `tools_synthesis_report.md`)

*   **Knowledge Graph (Age-based/Cypher specific):**
    *   `mcp_Toolbase_in_knowledge_graph_list_age_graphs`
    *   `mcp_Toolbase_in_knowledge_graph_get_age_schema`
    *   `mcp_Toolbase_in_knowledge_graph_read_age_cypher`
    *   `mcp_Toolbase_in_knowledge_graph_write_age_cypher`
    *   `mcp_Toolbase_in_knowledge_graph_create_age_graph`
    *   `mcp_Toolbase_in_knowledge_graph_drop_age_graph`
*   **Z3 Solver (Specific MCP Toolbase implementations):**
    *   `mcp_Toolbase_via_z3_sat_smt_clear_model`
    *   `mcp_Toolbase_via_z3_sat_smt_add_item`
    *   `mcp_Toolbase_via_z3_sat_smt_replace_item`
    *   `mcp_Toolbase_via_z3_sat_smt_delete_item`
    *   `mcp_Toolbase_via_z3_sat_smt_get_model`
    *   `mcp_Toolbase_via_z3_sat_smt_solve_model`
*   **Web Browser (Comprehensive Suite):**
    *   `mcp_Toolbase_with_web_browser_initialize_browser`
    *   `mcp_Toolbase_with_web_browser_go_to_url`
    *   `mcp_Toolbase_with_web_browser_search_google`
    *   `mcp_Toolbase_with_web_browser_click_element`
    *   `mcp_Toolbase_with_web_browser_input_text`
    *   `mcp_Toolbase_with_web_browser_inspect_page`
    *   `mcp_Toolbase_with_web_browser_validate_page`
    *   `mcp_Toolbase_with_web_browser_scroll_down`
    *   `mcp_Toolbase_with_web_browser_scroll_up`
    *   `mcp_Toolbase_with_web_browser_wait`

## 3. Proposed Changes to `symbolic_tool_references.md`

### A. Update `DEEPSEEK_THINKING` Implementation
*   **Current Default:** `mcp_mana_get_deepseek_thinker`
*   **Proposed Default (from report):** `mcp_deep_reasoner_get_deepseek_thinker`
*   **Action:** Update the `default` and potentially add `mcp_mana_get_deepseek_thinker` to `alternate` in the JSON registry for `DEEPSEEK_THINKING`.

### B. Knowledge Graph Operations
*   **Proposal:** Add new, more specific symbolic names for Age/Cypher operations rather than just listing them as alternates under generic names. This provides better clarity for these distinct operations.
*   **New Symbolic Entries (JSON):**
    *   `KG_LIST_GRAPHS` (default: `mcp_Toolbase_in_knowledge_graph_list_age_graphs`)
    *   `KG_GET_SCHEMA` (default: `mcp_Toolbase_in_knowledge_graph_get_age_schema`, params: `graph_name`)
    *   `KG_CYPHER_READ` (default: `mcp_Toolbase_in_knowledge_graph_read_age_cypher`, params: `graph_name`, `query`)
    *   `KG_CYPHER_WRITE` (default: `mcp_Toolbase_in_knowledge_graph_write_age_cypher`, params: `graph_name`, `query`, restrictions: ["Requires careful review due to write access"], recommended: false)
    *   `KG_CREATE_GRAPH` (default: `mcp_Toolbase_in_knowledge_graph_create_age_graph`, params: `graph_name`)
    *   `KG_DROP_GRAPH` (default: `mcp_Toolbase_in_knowledge_graph_drop_age_graph`, params: `graph_name`, restrictions: ["HIGHLY_DANGEROUS_OPERATION"], recommended: false)
*   **Action:** Add these to the JSON registry and the markdown list of "Knowledge Graph Operations".

### C. Z3 Solver Tools
*   **Proposal:** Add new symbolic names for clear/get model. For add/replace/delete/solve, decide if the `_ITEM` or `_MODEL` suffix implies a distinct enough operation from the current generic symbolic names.
*   **New Symbolic Entries (JSON):**
    *   `Z3_SOLVER_CLEAR_MODEL` (default: `mcp_Toolbase_via_z3_sat_smt_clear_model`, alternates: ["via_z3_sat_smt_clear_model"])
    *   `Z3_SOLVER_GET_MODEL` (default: `mcp_Toolbase_via_z3_sat_smt_get_model`, alternates: ["via_z3_sat_smt_get_model"])
*   **Question for User:** For `add`, `replace`, `delete`, `solve` operations, the report lists e.g. `mcp_Toolbase_via_z3_sat_smt_add_item` and `mcp_Toolbase_via_z3_sat_smt_solve_model`. 
    *   Should we create new symbolic names like `Z3_SOLVER_ADD_ITEM` and `Z3_SOLVER_SOLVE_MODEL`?
    *   Or, should the existing generic symbolic names (`Z3_SOLVER_ADD`, `Z3_SOLVER_SOLVE`) be updated to have these `mcp_Toolbase_...` versions as their `default` implementations?
*   **Action:** Add `Z3_SOLVER_CLEAR_MODEL` and `Z3_SOLVER_GET_MODEL` to JSON and markdown list. Based on user decision, update/add other Z3 symbolic names and map their default implementations from the report.

### D. Web Access Tools
*   **Proposal:** Expand the existing list with more granular browser interaction tools.
*   **New/Updated Symbolic Entries (JSON & Markdown list):**
    *   `BROWSER_INITIALIZE` (update default: `mcp_Toolbase_with_web_browser_initialize_browser`)
    *   `BROWSER_NAVIGATE` (update default: `mcp_Toolbase_with_web_browser_go_to_url`)
    *   `BROWSER_SEARCH` (update default: `mcp_Toolbase_with_web_browser_search_google`)
    *   `BROWSER_CLICK_ELEMENT` (new, default: `mcp_Toolbase_with_web_browser_click_element`)
    *   `BROWSER_INPUT_TEXT` (new, default: `mcp_Toolbase_with_web_browser_input_text`)
    *   `BROWSER_INSPECT_PAGE` (new, default: `mcp_Toolbase_with_web_browser_inspect_page`)
    *   `BROWSER_VALIDATE_PAGE` (new, default: `mcp_Toolbase_with_web_browser_validate_page`)
    *   `BROWSER_SCROLL_DOWN` (new, default: `mcp_Toolbase_with_web_browser_scroll_down`)
    *   `BROWSER_SCROLL_UP` (new, default: `mcp_Toolbase_with_web_browser_scroll_up`)
    *   `BROWSER_WAIT` (new, default: `mcp_Toolbase_with_web_browser_wait`)
*   **Action:** Update existing and add new entries to JSON registry and markdown list.

## 4. Review and Decision Points for User

*   Confirm the approach for Z3 solver item/model specific operations (new symbolic names vs. updating defaults of generic ones).
*   Review the overall set of proposed new symbolic names and their mappings.

## 5. Next Step after User Review

*   Once decisions are made, I will propose the `edit_file` call to update `tools/symbolic_tool_references.md` accordingly. 