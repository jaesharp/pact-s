# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to Semantic Versioning (though no version is formally set yet).

## [Unreleased] - YYYY-MM-DD (Current Development Post-Merge)

### Added
- **`prompt-critical-ai/PACT-S/CHANGELOG.md`**: This changelog file.
- **`prompt-critical-ai/PACT-S/LICENSE-MIT`**: MIT License file.
- **`prompt-critical-ai/PACT-S/LICENSE-BSD`**: BSD 3-Clause License file.
- **`prompt-critical-ai/PACT-S/tools/edit_file_tool_best_practices.md`**: Guide for AI on using the `edit_file` tool.
- **New Symbolic Tool Definitions** in `prompt-critical-ai/PACT-S/tools/symbolic_tool_references.md` for more granular KG, Z3, and Web Access operations, including environment profile support.
- **Initial Brainstorming Plan** for PACT-System Ontology and XML/XSD Workflow: `prompt-critical-ai/PACT-S/.plans/pacts_ontology_and_xml_workflow.md`.
- **Markdown Link Checking Infrastructure**:
  - Added `Makefile` with targets for checking standard and custom Markdown links
  - Added script to fix non-standard link formatting
  - Created missing critical files and directories:
    - `docs/glossary.md` - Initial glossary of PACT-S terminology
    - `docs/.assets/images/` and `docs/.assets/diagrams/` directories with README files
  - Updated `TODO.md` with findings about link formatting issues

### Changed
- **Project Nomenclature**: Shifted from PACTS (with C³ - Compliance, Consent, Competency) to **PACT-System**. 
    - Formal Name: `PACT-System`
    - Instances/General: `PACTS`
    - Short System Name: `PACT-S`
    - Singular Agreement/Record: `pact` (lowercase)
    - The 'C' in PACT-System now represents four dimensions: **Consent, Compliance, Competency, and Clarity**.
    - All key documents (`README.md`, tool guides, planning files) updated to reflect this new nomenclature.
- **`prompt-critical-ai/PACT-S/README.md`**:
    - Major revision to align with PACT-System naming and the four dimensions of 'C'.
    - Emphasis shifted from general "AI safety" to user alignment, sole consent, and responsibility for agent actions.
    - Conceptual code example changed from TypeScript to Haskell.
    - License section updated to reflect dual MIT/BSD licensing.
- **`prompt-critical-ai/PACT-S/tools/symbolic_tool_references.md`**:
    - Restructured from embedded JSON to a Markdown-native format for improved readability and maintainability (Schema Version 2.0).
    - Incorporated support for **Environment Profiles** to map symbolic names to concrete tool implementations for different environments (e.g., `dev_env_mcp`).
    - Updated default implementations for several tools based on `tools_synthesis_report.md`.
    - Removed "Backwards Compatibility" and "Implementation Status" sections, as PACTS-NG (now PACT-System as conceptualized in this folder) does not prioritize it.
- **`prompt-critical-ai/PACT-S/tools/deep_reasoning_models_prompting_guide.md`** (formerly `deepseek_guide.md`):
    - Renamed and content generalized to apply to a broader class of deep reasoning models, using specific engines like DeepSeek-R1 as examples.
- **`prompt-critical-ai/PACT-S/tools/reference_implementations/tools_synthesis_report.md`**:
    - Generalized by removing ClipifyLive-specific sections (Development Phases, Project Architecture) to better serve as a generic reference for tool capabilities and example implementations within a PACT-System context.
- **Copyright Information**: Updated in `LICENSE-MIT` and `LICENSE-BSD` to "Copyright (c) 2025 Prompt-Critical.{AI Systems Engineering} and PACT-S contributors".
- **Markdown Link Formatting**: Converted non-standard backticked link format `` \`[text](url)\` `` to standard markdown format `[text](url)` across all project documentation

### Integrated & Refactored (from former `.refactor/` and `from-ClipifyLive/`)
- Moved and updated strategic documents (`USER_DOCS_STRAT.md`, `VCS.md`, `LANG_SELECT_CONFIG_SELECTION.md`, `TESTING_STRAT.md`, `DIRECTORY_STRUCTURES.md`, `DOC_ALIGNMENT.md`) from `.refactor/` into the `.plans/` directory with new names (e.g., `documentation_strategy.md`, `vcs_strategy.md`, etc.) and updated nomenclature.
- Moved and integrated detailed PACTS operational files from `from-ClipifyLive/pact/` into the main `prompt-critical-ai/PACT-S/` structure:
    - Protocol files (e.g., `mode_transition.md`, `permission_verification.md`, `tool_usage_protocol.md`) moved to `protocols/` and updated.
    - Memory/KG structure and access protocol documents (`memory/index.md`, `memory/graph_access.md`) synthesized into `memory/README.md`.
    - Core principles document (`core/principles.md`) updated.
    - `project_context.md` moved to `.plans/historical_project_context_and_advanced_concepts.md`.
    - `.pactify.prompt` moved to `.plans/reference_agent_prompt_directives.md`.
- Processed human-readable documentation from `from-ClipifyLive/pact-docs/`:
    - Relevant content merged into corresponding operational documents (e.g., `protocols/mode_transition.md`, `protocols/response_tags.md`, `tests/README.md`, `verification/README.md`, `memory/README.md`).
    - `knowledge_graph_migration.md` moved to `docs/knowledge_management/kg_apache_age_example.md`.
    - Superseded or empty source files/directories within `from-ClipifyLive/pact-docs/` were deleted.
- Verified that content from `from-ClipifyLive/pact/tests/`, `from-ClipifyLive/pact/tools/`, `from-ClipifyLive/z3/`, `from-ClipifyLive/tools/`, and `from-ClipifyLive/migration/pacts/*` was largely redundant or superseded by already integrated/updated PACT-S project files.

### Removed
- **"Last Updated" dates** from `README.md`, `deep_reasoning_models_prompting_guide.md`, `z3_guide.md`, and `symbolic_tool_references.md` to avoid manual upkeep for these living documents.
- **Specific ClipifyLive project references** from core PACT-System documents to ensure the framework is presented generally.
- **`prompt-critical-ai/PACT-S/from-ClipifyLive/` directory** and its remaining contents after processing and integration.

### Fixed
- Resolved various path issues during the merge process, ensuring files were copied to their correct locations within `prompt-critical-ai/PACT-S/`.
- Corrected earlier misinterpretations of the PACTS acronym and its components through iterative refinement.
- Fixed non-standard markdown link format in multiple documentation files by removing unnecessary backticks

## [Pre-Merge State] - YYYY-MM-DD (Represents state of original PACTS & PES/PACTS sources)

- Initial state of `PACTS/` and `PES/PACTS/` directories before merging into the `prompt-critical-ai/PACT-S` project structure.
- `PACTS/` contained a PACTS (Permission, Accountability, Consent/Compliance, Transparency System) definition with a focus on ClipifyLive and a JSON-based symbolic tool registry.
- `PES/PACTS/` contained related documents, including some tool guides and a tools synthesis report specific to ClipifyLive. 