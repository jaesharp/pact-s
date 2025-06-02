# Directory Structure Alignment Plan

## Overview

This document outlines a plan to establish and maintain a clear directory structure for the PACT-System project, ensuring that the actual structure aligns with what's described in the documentation and meets the needs of the project.

## Current Issues (Historical Context from Merge)

1.  **Incomplete Directories**: [x] (Addressed during merge and subsequent verifications)
    *   Several directories were marked as "Currently under development" in original source `index.md`.
    *   Some core directories were initially missing expected implementation files.

2.  **Structure Inconsistency**: [x] (Largely addressed during merge and subsequent verifications)
    *   Original source directory structures did not always match their documentation.
    *   Purpose for some directories was initially unclear.

3.  **Missing Essential Directories**: [x] (Addressed during merge and subsequent verifications)
    *   Initial test structure was incomplete (e.g., `tests/scripts/` now restored).
    *   Example directories were not consistently present (`examples/` at root now created).
    *   Initial documentation structure was sparse.
    *   `from-ClipifyLive/` was located and copied.

## Target Directory Structure for PACT-System (Root: `prompt-critical-ai/PACT-S/` - Name for reference, not hardcoded in links)

This is the target top-level structure. Sub-directory contents will be detailed within each top-level directory's `README.md` or further planning documents.

```
./
├── .github/             # GitHub-specific files (workflows, issue templates, PR templates)
├── .idea/               # IDE-specific settings (e.g., IntelliJ)
├── .plans/              # Project planning documents (like this one, merger history, ontology plan)
├── .refactor/           # Documents related to refactoring efforts (now integrated into .plans or for archival review)
├── CHANGELOG.md         # Project changelog
├── LICENSE-BSD          # BSD 3-Clause License text
├── LICENSE-MIT          # MIT License text
├── README.md            # Main project overview, PACT-System definition, principles
├── core/                # Core PACT-System principles, foundational concepts (e.g., principles.md)
├── docs/                # User guides, conceptual documentation, architecture, .tex sources
│   ├── src/             # Source .tex files for PDF/ relatório generation
│   └── ...              # Other guides (architecture.md, etc.)
├── evaluations/         # (Kept for now, purpose TBD - for testing/evaluating PACT-System effectiveness)
├── examples/            # Example implementations or use-cases of the PACT-System (distinct from tools/examples)
├── from-ClipifyLive/    # (Copied from PES/PACTS-OLD/, review for relevance or archival)
├── governance-framework/  # (Copied from source, review for integration into PACT-System docs/protocols or archival)
├── memory/              # PACT-System Memory pillar: knowledge persistence, state tracking, graph access protocols
├── plans/               # (Copied from S2 PES/PACTS-OLD, review for relevance or integration into .plans or archival)
├── prompts/             # Standardized prompts, templates (Dhall configs, etc.) for agent interaction
│   └── templates/
├── protocols/           # PACT-System operational protocols, procedures, compliance checklists
├── src/                 # Source code for any PACT-System reference implementation or core libraries
│   ├── core/            # Core implementation (e.g., version-manager.ts)
│   └── types/           # Type definitions (e.g., index.ts)
├── tests/               # Test suites (unit, integration, e2e), test plans, fixtures
│   └── scripts/         # Test execution scripts
├── tools/               # Utility tools, scripts, and guides for PACT-System operations & supporting tools
│   ├── examples/        # Specific examples of using tools (e.g., z3_pact_verification_example.py)
│   ├── reference_implementations/ # e.g., tools_synthesis_report.md
│   └── ...              # Tool guides (deep_reasoning, z3, edit_file_best_practices, symbolic_references, etc.)
└── verification/        # PACT-System Verification pillar: evidence of compliance, audit artifacts, validation rules/reports
```

## Directory Structure Plan (Ongoing Maintenance & Evolution)

*Note: Initial directory creation based on merged sources is now complete. This plan now focuses on ongoing best practices and content population/review.*

### Phase A: Directory Purpose Definition & Documentation
- [ ] **README Files for Top-Level Directories**:
    - [ ] Ensure each top-level directory in the structure above has a [README.md](../README.md) briefly explaining its purpose and the type of content it holds. (Partially complete, see master plan for specifics on `docs`, `examples`, `tools/reference_implementations`, `src`, `prompts`, `core`)
    - [ ] These READMEs should link to more detailed plans or documents where appropriate (e.g., [../core/README.md](../core/README.md)` might link to the main project `[../README.md](../README.md)'s principles section).
- [ ] **Document Naming Conventions**:
    - [ ] Establish and document consistent naming conventions for new files and directories within the [.plans/](./)` directory or a general project contribution guide (e.g. `[../CONTRIBUTING.md](../CONTRIBUTING.md)).

### Phase B: Content Alignment & Review (Ongoing)
- [ ] **Review `from-ClipifyLive/` and `governance-framework/` (Archived/Legacy)**:
    - [ ] Determine which contents are still relevant to the generalized PACT-System.
    - [ ] Integrate relevant parts into the main [../docs/](../docs/)`, `[../protocols/](../protocols/), or other appropriate directories.
    - [ ] Archive or remove purely project-specific or superseded content.
- [ ] **Review `plans/` (from PES/PACTS-OLD - Archived/Legacy)**:
    - [ ] Assess content (e.g., `future-research/` within `.plans/`) for relevance.
    - [ ] Integrate into [.plans/](./)` or `[../docs/](../docs/) if still active, or archive.
- [ ] **Refine [../core/](../core/)`, [../memory/](../memory/)`, [../protocols/](../protocols/), `[../tests/](../tests/), `[../verification/](../verification/) Content**:
    - [ ] As the PACT-System evolves, ensure these directories are populated with meaningful content aligned with the main [../README.md](../README.md) definitions of the PACT-System pillars.

### Phase C: Directory Structure Maintenance & Governance
- [ ] **Guidelines for New Directories**:
    - [ ] Document guidelines for proposing and adding new top-level or significant sub-directories (e.g., in [../CONTRIBUTING.md](../CONTRIBUTING.md) or a development practices guide).
- [ ] **Visual Directory Map**:
    - [ ] Consider creating/maintaining a visual map (e.g., using `tree` command output or a diagram) in [../docs/](../docs/) as the project matures.
- [ ] **Automation (Future Consideration)**:
    - [ ] Scripts to validate directory structure or generate new module skeletons with placeholder READMEs.

## Implementation Priority (for new content and refinement)

- [ ] **High Priority**:
    - [ ] Clarifying purpose of top-level directories via READMEs. (Ongoing, see Phase A & master plan)
    - [ ] Reviewing and integrating/archiving content from `from-ClipifyLive/`, `governance-framework/`, and `plans/` (legacy source folders).
    - [ ] Populating [../protocols/](../protocols/) with core PACT-System operational protocols.
- [ ] **Medium Priority**:
    - [ ] Developing content for [../core/](../core/)`, [../memory/](../memory/)`, `[../tests/](../tests/), `[../verification/](../verification/) beyond initial stubs.
    - [ ] Expanding [../examples/](../examples/) with more PACT-System use-cases.
- [ ] **Low Priority**:
    - [ ] Advanced automation for structure validation/generation.

## Success Criteria (for ongoing structure health)

*   Directory structure remains aligned with the documented target structure (shown above) or is formally updated via a plan.
*   Each significant directory has a [README.md](../README.md) clarifying its purpose.
*   No "Currently under development" notes remain for established structural elements.
*   New developers can easily understand the project layout and where to find/place files.
