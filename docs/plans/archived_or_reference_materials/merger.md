# PACTS Merge Plan: Projects/PACTS/ and Projects/PES/PACTS/ into Projects/PES/PACTS/

**Note:** The final target root for this merged content is `prompt-critical-ai/PACT-S/`. The paths within this document reflect the intermediate merge target of `Projects/PES/PACTS/` and internal relative paths like `PES/PACTS/...` should be understood as relative to that intermediate target during the merge operation itself. Post-merge, paths within the new project will be relative to the `PACT-S` root.

This document outlines the plan to merge the contents of `Projects/PACTS/` and `Projects/PES/PACTS/` into a new consolidated directory: `Projects/PES/PACTS/`.

## Source Directories:

1.  `S1: Projects/PACTS/`
2.  `S2: Projects/PES/PACTS/`

## Target Directory:

*   `T: Projects/PES/PACTS/`

## Merge Strategy:

The general strategy is to copy all unique files and directories from S1 and S2 into T.
For directories that exist in both S1 and S2 (i.e., `docs/`, `src/`, `tools/`), their contents will be merged. Since there are no filename conflicts within these common directories at the first level, all files will be copied.
The guiding principles for this merge are derived from the PACTS (Permission, Accountability, C (Consent, Compliance, Competency, Clarity), Transparency, System) framework.

## File and Directory Mapping (Summary of Contents):

### 1. Root Level of T (`Projects/PES/PACTS/`):
    *   **Creation of New `README.md` for T:** (Defines PACTS, where C includes Consent, Compliance, Competency, Clarity; synthesizes S1/README.md, S1/index.md)
    *   **From S1 (`Projects/PACTS/`):**
        *   `.idea/`: (IDE workspace files: `workspace.xml`, `modules.xml`, etc., and `inspectionProfiles/`) -> `T/.idea/`
        *   `.github/`: (`.DS_Store`, `ISSUE_TEMPLATE/`, `pull_request_template.md`, `workflows/`) -> `T/.github/`
        *   `.refactor/`: (MD files: `USER_DOCS_STRAT.md`, `VCS.md`, etc.) -> `T/.refactor/`
        *   `core/`: (`principles.md`) -> `T/core/`
        *   `memory/`: (`graph_access.md`, `index.md`) -> `T/memory/`
        *   `prompts/`: (`templates/`, `config.dhall`) -> `T/prompts/`
        *   `protocols/`: (Multiple MD files: `mode_transition.md`, `pact_compliance.md`, etc.) -> `T/protocols/`
        *   `tests/`: (`.gitignore`, `Makefile`, `scripts/`, `tool_call_protocol_test.md`, `index.md`) -> `T/tests/`
        *   `verification/`: (`index.md`) -> `T/verification/`
    *   **From S2 (`Projects/PES/PACTS/`):**
        *   `prompting-techniques-deepseek-r1.md`: To be placed in `T/prompts/prompting-techniques-deepseek-r1.md`.
        *   `from-ClipifyLive/`: (`.DS_Store`, `README.md`, `.pactify.prompt`, subdirs: `pact-docs/`, `migration/`, `tools/`, `z3/`, `pact/`, `docs/`, `governance/`, `verification/`) -> `T/from-ClipifyLive/`
        *   `governance-framework/`: (`.DS_Store`, `README.md`, various MD files, subdirs: `progress/`, `transcripts/`) -> `T/governance-framework/`
        *   `plans/`: (`.DS_Store`, subdir: `future-research/`) -> `T/plans/`

### 2. Merged `docs/` Directory (`T/docs/`):
    *   **From S1 (`Projects/PACTS/docs/`):**
        *   `Makefile` -> `T/docs/Makefile`
        *   `src/` (containing `promptbase.tex`, `pacts.tex`) -> `T/docs/src/`
    *   **From S2 (`Projects/PES/PACTS/docs/`):** (empty)

### 3. Merged `src/` Directory (`T/src/`):
    *   **From S1 (`Projects/PACTS/src/`):**
        *   `types/` (containing `index.ts`) -> `T/src/types/`
        *   `core/` (containing `version-manager.ts`) -> `T/src/core/`
    *   **From S2 (`Projects/PES/PACTS/src/`):** (empty)

### 4. Merged `tools/` Directory (`T/tools/`):
    *   **Goal:** (Consolidate tool documentation, align with symbolic references and PACTS principles, where C includes Consent, Compliance, Competency, Clarity)
    *   **Direct copies from S1 (`Projects/PACTS/tools/`) to `T/tools/`:**
        *   `symbolic_tool_references.md`
        *   `tool_call_template.md`
        *   `index.md` (Tool Precedence Guide)
        *   `compliance_tracker.md`
    *   **New synthesized files in `T/tools/`:**
        *   `deepseek_guide.md` (Synthesized from S1/tools/advanced_tools_guide.md, S1/tools/tool_reference_quick_guide.md, S2/tools/tools_synthesis_report.md)
        *   `z3_guide.md` (Synthesized from S1/tools/advanced_tools_guide.md, S1/tools/tool_reference_quick_guide.md, S2/tools/z3_best_practices.md, S2/tools/tools_synthesis_report.md)
    *   **From S2 (`Projects/PES/PACTS/tools/`):**
        *   `z3_pact_verification_example.py` -> `T/tools/examples/z3_pact_verification_example.py`
        *   `tools_synthesis_report.md` -> `T/tools/reference_implementations/tools_synthesis_report.md`
    *   **Source files for synthesis (not directly copied):**
        *   `S1/tools/advanced_tools_guide.md`
        *   `S1/tools/tool_reference_quick_guide.md`
        *   `S2/tools/z3_best_practices.md`

### 5. System Files:
*   `.DS_Store` files will generally not be copied. The OS may recreate them.

## Execution Checklist:

**Phase 1: Directory Creation in Target (`T: Projects/PES/PACTS/`)**
- [x] `mkdir -p Projects/PES/PACTS` (Already done - conceptually, the target folder name changes)
- [x] `mkdir -p Projects/PES/PACTS/.plans` (Already done - conceptually, the target folder name changes)
- [x] `mkdir -p PES/PACTS/.idea`
- [x] `mkdir -p PES/PACTS/.github`
- [x] `mkdir -p PES/PACTS/.refactor`
- [x] `mkdir -p PES/PACTS/core`
- [x] `mkdir -p PES/PACTS/memory`
- [x] `mkdir -p PES/PACTS/prompts`
- [x] `mkdir -p PES/PACTS/protocols`
- [x] `mkdir -p PES/PACTS/tests`
- [x] `mkdir -p PES/PACTS/verification`
- [x] `mkdir -p PES/PACTS/from-ClipifyLive`
- [x] `mkdir -p PES/PACTS/governance-framework`
- [x] `mkdir -p PES/PACTS/plans`
- [x] `mkdir -p PES/PACTS/docs`
- [x] `mkdir -p PES/PACTS/docs/src`
- [x] `mkdir -p PES/PACTS/src`
- [x] `mkdir -p PES/PACTS/src/types`
- [x] `mkdir -p PES/PACTS/src/core` (for `PACTS/src/core/`)
- [x] `mkdir -p PES/PACTS/tools`
- [x] `mkdir -p PES/PACTS/tools/examples`
- [x] `mkdir -p PES/PACTS/tools/reference_implementations`

**Phase 2: File Copy Operations**
*(Note: Use `cp -R` for directories where entire content is copied, and `cp` for individual files. Be mindful of overwriting if commands are run multiple times, though the target is a new directory.)*

*   **Root Level & Unique Directories from S1 (`Projects/PACTS/`) to T:**
    - [x] Copy `Projects/PACTS/README.md` to `PES/PACTS/README.md.source-S1-README` (for synthesis by AI).
    - [x] Copy `Projects/PACTS/index.md` to `PES/PACTS/index.md.source-S1-index` (for synthesis by AI).
    - [x] `cp -R /Users/j/Projects/PACTS/.idea/. PES/PACTS/.idea/`
    - [x] `cp -R /Users/j/Projects/PACTS/.github/. PES/PACTS/.github/`
    - [x] `cp -R /Users/j/Projects/PACTS/.refactor/. PES/PACTS/.refactor/`
    - [x] `cp -R /Users/j/Projects/PACTS/core/. PES/PACTS/core/` (top-level core)
    - [x] `cp -R /Users/j/Projects/PACTS/memory/. PES/PACTS/memory/`
    - [x] `cp -R /Users/j/Projects/PACTS/prompts/. PES/PACTS/prompts/`
    - [x] `cp -R /Users/j/Projects/PACTS/protocols/. PES/PACTS/protocols/`
    - [x] `cp -R /Users/j/Projects/PACTS/tests/. PES/PACTS/tests/`
    - [x] `cp -R /Users/j/Projects/PACTS/verification/. PES/PACTS/verification/`

*   **Unique Items from S2 (`Projects/PES/PACTS/`) to T:**
    - [x] `cp /Users/j/Projects/PES/PACTS/prompting-techniques-deepseek-r1.md PES/PACTS/prompts/`
    - [x] `cp -R /Users/j/Projects/PES/PACTS/from-ClipifyLive/. PES/PACTS/from-ClipifyLive/`
    - [x] `cp -R /Users/j/Projects/PES/PACTS/governance-framework/. PES/PACTS/governance-framework/`
    - [x] `cp -R /Users/j/Projects/PES/PACTS/plans/. PES/PACTS/plans/`

*   **Merged `docs/` Directory:**
    - [x] `cp /Users/j/Projects/PACTS/docs/Makefile PES/PACTS/docs/Makefile`
    - [x] `cp -R /Users/j/Projects/PACTS/docs/src/. PES/PACTS/docs/src/`

*   **Merged `src/` Directory:**
    - [x] `cp -R /Users/j/Projects/PACTS/src/types/. PES/PACTS/src/types/`
    - [x] `cp -R /Users/j/Projects/PACTS/src/core/. PES/PACTS/src/core/`

*   **Merged `tools/` Directory (Source files for synthesis):**
    - [x] Copy `/Users/j/Projects/PACTS/tools/advanced_tools_guide.md` to `PES/PACTS/tools/advanced_tools_guide.md.source-S1` (for synthesis by AI).
    - [x] Copy `/Users/j/Projects/PACTS/tools/tool_reference_quick_guide.md` to `PES/PACTS/tools/tool_reference_quick_guide.md.source-S1` (for synthesis by AI).
    - [x] Copy `/Users/j/Projects/PES/PACTS/tools/tools_synthesis_report.md` to `PES/PACTS/tools/tools_synthesis_report.md.source-S2` (for synthesis by AI, before moving to reference_implementations).
    - [x] Copy `/Users/j/Projects/PES/PACTS/tools/z3_best_practices.md` to `PES/PACTS/tools/z3_best_practices.md.source-S2` (for synthesis by AI).
    
*   **Merged `tools/` Directory (Direct copies and specific placements from plan):**
    - [x] `cp /Users/j/Projects/PACTS/tools/symbolic_tool_references.md PES/PACTS/tools/`
    - [x] `cp /Users/j/Projects/PACTS/tools/tool_call_template.md PES/PACTS/tools/`
    - [x] `cp /Users/j/Projects/PACTS/tools/index.md PES/PACTS/tools/` (Tool Precedence Guide)
    - [x] `cp /Users/j/Projects/PACTS/tools/compliance_tracker.md PES/PACTS/tools/`
    - [x] `cp /Users/j/Projects/PES/PACTS/tools/z3_pact_verification_example.py PES/PACTS/tools/examples/`

**Phase 3: AI-Driven Content Synthesis**
- [x] **Synthesize `PES/PACTS/README.md`:**
    *   AI will read `README.md.source-S1-README` and `index.md.source-S1-index`.
    *   AI will then create the new `Projects/PES/PACTS/README.md` based on PACTS principles (where C includes Consent, Compliance, Competency, Clarity).
- [x] **Synthesize `PES/PACTS/tools/deepseek_guide.md`:**
    *   AI will read `advanced_tools_guide.md.source-S1` (DeepSeek sections), `tool_reference_quick_guide.md.source-S1` (DeepSeek sections), and `tools_synthesis_report.md.source-S2` (DeepSeek capabilities).
    *   AI will then create the new `Projects/PES/PACTS/tools/deepseek_guide.md`.
- [x] **Synthesize `PES/PACTS/tools/z3_guide.md`:**
    *   AI will read `advanced_tools_guide.md.source-S1` (Z3 sections), `tool_reference_quick_guide.md.source-S1` (Z3 sections), `z3_best_practices.md.source-S2`, and `tools_synthesis_report.md.source-S2` (Z3 capabilities).
    *   AI will then create the new `Projects/PES/PACTS/tools/z3_guide.md`.
- [x] **Move `tools_synthesis_report.md.source-S2`:** After its content is used for synthesis, move this file to `Projects/PES/PACTS/tools/reference_implementations/tools_synthesis_report.md`.
- [x] **Cleanup source files for synthesis:** Delete the `.source-S1`, `.source-S1-README`, `.source-S1-index`, and `.source-S2` suffixed files from `Projects/PES/PACTS/` and `Projects/PES/PACTS/tools/` after synthesis is complete and verified.

**Phase 4: Post-Merge Review and Cleanup (Manual Steps by User)**
- [ ] Review the AI-synthesized `T/README.md`.
- [ ] Review the AI-synthesized `T/tools/deepseek_guide.md` and `T/tools/z3_guide.md`.
- [ ] Review `T/tools/reference_implementations/tools_synthesis_report.md` (if kept) to ensure no critical information was missed during synthesis.
- [ ] Thoroughly review the entire `Projects/PES/PACTS/` structure and file placements.
- [ ] Resolve any remaining logical conflicts or redundancies.
- [ ] Consider initializing `Projects/PES/PACTS/` as a new Git repository.

## Post-Merge Actions:
*   (Original post-merge actions remain relevant)
*   Review the contents of `Projects/PES/PACTS/` to ensure all files and directories are correctly placed.
*   Resolve any potential logical conflicts or redundancies discovered after the physical merge (e.g., if `README.md` and other documents have overlapping purposes [prompting-techniques-deepseek-r1.md is now planned for `prompts/`]).
*   Consider initializing `Projects/PES/PACTS/` as a new Git repository.