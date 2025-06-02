# Best Practices for Using the `edit_file` Tool

This document outlines best practices for me (the AI assistant) when using the `edit_file` tool to modify or create files. Adhering to these practices is crucial for ensuring edits are applied accurately and reliably.

## 1. Tool Purpose and Key Arguments

*   **Purpose**: To propose specific line-by-line changes to an existing file or to create a new file with specified content.
*   **Key Arguments**:
    *   `target_file` (string): The path to the file to be modified or created, relative to the workspace root (e.g., `tools/some_file.md`). This argument should be specified first and verified carefully.
    *   `code_edit` (string): Contains the actual changes or the full content for a new file.
    *   `instructions` (string): A single, first-person sentence describing the intended edit (e.g., "I will add a new configuration parameter."). This aids the apply model.

## 2. The Critical Role of `// ... existing code ...`

*   When editing an existing file, any unchanged lines or blocks of code *between your edits* **MUST** be represented by a comment appropriate to the file type:
    *   Markdown: `<!-- ... existing code ... -->` (though `// ... existing code ...` is often accepted by the tool for .md files as well)
    *   Python/Shell: `# ... existing code ...`
    *   JSON: This is tricky as JSON doesn't support comments. For JSON, it's often safer to provide the entire modified JSON structure if feasible, or very carefully delineate the changed section within its parent object/array, ensuring the overall structure remains valid JSON.
    *   Generic/Default: `// ... existing code ...`
*   **Why it's critical**: This comment tells the underlying apply model to preserve the sections of the file you are not explicitly changing. Omitting it for spans of pre-existing code will likely lead to those lines being **deleted**.
*   Provide enough context around your edits with unchanged lines to resolve ambiguity, but avoid repeating very large blocks of unchanged code.

## 3. Strategy for Small, Targeted Line Changes (The "Sandwich" Method)

This method is preferred for high precision when changing one or a few contiguous lines, like updating a checklist item:

1.  **Start with `// ... existing code ...`**: Represents all content before the immediate vicinity of your change.
2.  **Include Accurate Unchanged Context Before**: Provide at least one or two full, unchanged lines immediately preceding the line(s) you intend to modify. This acts as a precise anchor.
3.  **Provide the Changed Line(s)**: Show the line(s) with the edit applied.
4.  **Include Accurate Unchanged Context After**: Provide at least one or two full, unchanged lines immediately following the modified line(s). This completes the "sandwich" and further locks in the location.
5.  **End with `// ... existing code ...`**: Represents all content after the immediate vicinity of your change.

*   **Example (Updating a Markdown Checklist Item):**
    To change `- [ ] Item B` to `- [x] Item B` in:
    ```markdown
    - [x] Item A
    - [ ] Item B
    - [ ] Item C
    ```
    A robust `code_edit` would be:
    ```
    // ... existing code ...
    - [x] Item A
    - [x] Item B
    - [ ] Item C
    // ... existing code ...
    ```
    **Instruction**: "I will mark Item B as complete in the checklist."

*   **Common Pitfall Avoided**: Previously, I sometimes failed by having the `code_edit` block inaccurately reflect the state of *subsequent* unchanged lines (e.g., showing Item C as `[x]` when it was still `[ ]` in the file). The "sandwich" method with accurate surrounding context prevents this.

## 4. Strategy for Larger Changes or New Files

*   **Replacing Entire Sections**: If a whole function, configuration block, or markdown section needs rewriting, it's often best to delineate the start and end of that section with `// ... existing code ...` and provide the complete new version of that section.
*   **Creating New Files**: The `code_edit` should contain the *entire desired content* of the new file. The `instructions` should state that a new file is being created.

## 5. The `instructions` Argument

*   Always provide a clear, concise, first-person instruction.
*   This helps the apply model understand the intent, especially if the `code_edit` has minor ambiguities.
*   Example: "I will add a new symbolic tool reference for `KG_LIST_GRAPHS` to the JSON registry and the markdown list."

## 6. Path Verification (`target_file`)

*   Double-check that the `target_file` path is correct and **relative to the workspace root** (e.g., `some_folder/file.ext` or `tools/another_file.md`).
*   Avoid common errors like prepending an extra `Projects/` if the workspace root is already `/Users/j/Projects` (and assuming the PACTS project will be the new workspace root for these relative paths).

## 7. Reviewing Tool Output

*   Pay close attention to the `edit_file_response` diff. If it shows "no changes made" when a change was expected, or if the diff is not what was intended, it indicates an issue with the `code_edit` block's context or precision. Re-evaluate the `code_edit` against the actual current content of the file.
*   The `reapply` tool can be considered if an edit seems correct but was misapplied by the standard apply model.

By following these best practices, particularly the "sandwich" method for targeted edits and ensuring the `code_edit` accurately reflects the parts of the file *not* being changed in that step, the reliability of the `edit_file` tool can be significantly improved. 