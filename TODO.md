# Global Project TODO List

This file tracks high-level TODO items that span across multiple components or require project-wide attention.

## Recent Findings: Link Formatting and Broken Links

During a recent check for link integrity, the following issues were identified:

1. **Link Formatting Issue (RESOLVED)**: 
   - Many markdown links were using a non-standard format with backticks: ``` \`[text](url)\` ```
   - This has been fixed by converting to standard markdown format: `[text](url)`
   - A script (.tmp/fix_markdown_links.sh) was created to automate this fix across all markdown files

2. **Broken Links Detected**:
   - Several referenced files don't exist yet and need to be created:
     - `./docs/glossary.md` (referenced in multiple files)
     - `./docs/.assets/images/` and `./docs/.assets/diagrams/` directories
   - Many links still point to outdated paths:
     - References to `./.plans/` directory instead of `./docs/plans/`
     - References to now-moved protocol files
   - See the output of `make check-links-recursive` for a complete list of broken links

3. **Comprehensive Link Audit Results**:
   - A full check of all markdown files revealed approximately 170 broken links
   - Most common issues:
     - References to old file paths (e.g., `./.plans/` instead of `./docs/plans/`)
     - References to protocol files using incorrect paths (many now in subdirectories)
     - References to documentation files that have been moved or restructured
     - References to files that don't exist yet and need to be created
   - Key files with many broken links:
     - `./README.md` (20 broken links)
     - `./docs/plans/documentation/1_documentation_types_and_content_plan.md` (18 broken links)
     - `./docs/plans/master_project_plan.md` (13 broken links)
     - `./protocols/README.md` (10 broken links)

4. **Next Steps for Link Correction**:
   - [ ] Create missing critical files like `./docs/glossary.md`
   - [x] Create missing directories like `./docs/.assets/images/` and `./docs/.assets/diagrams/`
   - [ ] Systematically fix broken links in highest-priority files:
     - [ ] `./README.md` (primary project documentation)
     - [ ] `./protocols/README.md` (central index for protocols)
     - [ ] `./docs/plans/master_project_plan.md` (primary planning document)
   - [ ] Update remaining broken links to point to correct locations
   - [ ] Set up a regular link checking process as part of the workflow

## Highest Priority: Post-Refactoring Integrity and Consistency Pass

This section outlines the immediate, highest-priority tasks to ensure the integrity and consistency of project documentation following the major refactoring of planning documents into `docs/plans/` and its subdirectories.

- [ ] **1. Comprehensive Internal Link Correction (Highest Priority)**
    - **Context**: Significant restructuring of planning documents into `docs/plans/` and new subdirectories.
    - **Task**: Systematically execute the existing "Update Internal Links in Planning Documents" task (detailed below under "General Tasks"). This is the absolute prerequisite for further reviews.
    - **Method**:
        - [ ] Start with files at `[./docs/plans/](./docs/plans/)` level (e.g., `development_roadmap_and_tasks.md`, etc.).
        - [ ] Proceed to each subdirectory: `documentation/`, `ontology_and_formalism/`, `testing_and_verification/`, `language_and_config/` (updating their READMEs and then their specific plan files).
        - [ ] Update links within `[./protocols/](./protocols/)` subdirectories as needed (especially `development_workflow/` which now contains VCS protocols).
        - [ ] Utilize local Markdown link checker tools after edits for verification, if possible.

- [ ] **2. Task Status Update in All Checklists**
    - **Context**: All active planning documents are now in checklist format.
    - **Task**: Systematically execute the existing "Review and Update Statuses in All Planning Documents" task (detailed below under "General Tasks"). This provides an accurate baseline of project state after link correction.

- [ ] **3. Glossary Development (Initial Pass)**
    - **Context**: Consistent terminology is crucial across the refactored documents.
    - **Task**: Prioritize initial population of [./docs/glossary.md](./docs/glossary.md)` with core PACT-System terms as defined in `[./README.md](./README.md)` and `[./core/principles.md](./core/principles.md).
    - **Reference**: This is an existing task in [./docs/plans/master_project_plan.md](./docs/plans/master_project_plan.md).

- [ ] **4. Thematic Consistency Review (Per Planning Subdirectory)**
    - **Context**: Ensure coherence within each newly created set of detailed plans.
    - **Task**: After link fixing and status updates, perform a thematic review for each planning subdirectory in [./docs/plans/](./docs/plans/) (`documentation/`, `ontology_and_formalism/`, `testing_and_verification/`, `language_and_config/`):
        - [ ] Review for consistent terminology, referencing the (newly populated) [./docs/glossary.md](./docs/glossary.md).
        - [ ] Ensure the main `README.md` in each subdirectory clearly serves as an overview/index and complements (without excessive duplication) its detailed sub-plan files.
        - [ ] Actively add/strengthen cross-references between related detailed plan files within and across subdirectories.
        - [ ] Identify any checklist items in `docs/plans/` files that are prescriptive enough to be protocols and note them for potential migration to [./protocols/](./protocols/).

- [ ] **5. Review and Refine [./protocols/README.md](./protocols/README.md) and Structure**
    - **Context**: Protocol documents have been reorganized into subdirectories.
    - **Task**:
        - [ ] Review the main [./protocols/README.md](./protocols/README.md) for accuracy of structure, completeness of listed protocols, and clarity of reasoning hints and selection guidance.
        - [ ] Ensure all protocols are correctly located in their designated subdirectories.

## General Tasks

- [ ] **Update Internal Links in Planning Documents**:
    - **Context**: All planning documents were moved from a root `.plans/` directory to `docs/plans/`. Many detailed plans were also broken out into new subdirectories within `docs/plans/` (e.g., [./docs/plans/documentation/](./docs/plans/documentation/)`, `[./docs/plans/ontology_and_formalism/](./docs/plans/ontology_and_formalism/)`, `[./docs/plans/testing_and_verification/](./docs/plans/testing_and_verification/)).
    - **Task**: Systematically review all Markdown files within [./docs/plans/](./docs/plans/) and its subdirectories to ensure all internal relative Markdown links correctly point to their new locations.
    - **Key files/directories to check for outdated links**:
        - [./docs/plans/development_roadmap_and_tasks.md](./docs/plans/development_roadmap_and_tasks.md)
        - [./docs/plans/directory_structure_plan.md](./docs/plans/directory_structure_plan.md)
        - (Old `language_configuration_strategy.md` - now [./docs/plans/language_and_config/README.md](./docs/plans/language_and_config/README.md) and its sub-files)
        - (Old `multi_repo_architecture_docs_plan.md` - now [./docs/plans/future-research/multi_repo_architecture_docs_plan.md](./docs/plans/future-research/multi_repo_architecture_docs_plan.md))
        - [./docs/plans/vcs_strategy.md](./docs/plans/vcs_strategy.md)
        - All files within [./docs/plans/documentation/](./docs/plans/documentation/)
        - All files within [./docs/plans/ontology_and_formalism/](./docs/plans/ontology_and_formalism/)
        - All files within [./docs/plans/testing_and_verification/](./docs/plans/testing_and_verification/)
        - All files within [./docs/plans/language_and_config/](./docs/plans/language_and_config/)
        - All files within [./docs/plans/archived_or_reference_materials/](./docs/plans/archived_or_reference_materials/)
        - All files within [./docs/plans/future-research/](./docs/plans/future-research/)
    - **Note**: Links in [./docs/plans/README.md](./docs/plans/README.md)` (the main index for plans) and `[./docs/plans/master_project_plan.md](./docs/plans/master_project_plan.md) have already been updated.
    - **Additional Check**: Specifically verify no links point to the now-deleted `docs/developer_guides/` directory, especially for `worktree_management_protocol.md` which is now in [./protocols/development_workflow/worktree_management_protocol.md](./protocols/development_workflow/worktree_management_protocol.md).

- [ ] **Review and Update Statuses in All Planning Documents**:
    - **Context**: Many planning documents have been reformatted into checklists.
    - **Task**: Review all checklist items across all files in [./docs/plans/](./docs/plans/) and its subdirectories. Update the status (e.g., `[x]`, `[ ]`) of tasks to reflect current project progress accurately.

## Future Refinements & Long-Term Consistency Checks

This section lists tasks for ongoing refinement and ensuring long-term coherence of the project documentation and plans, to be addressed after the highest priority items are completed.

- [ ] **1. Evaluate and Enhance Visualizations in Planning Documents**:
    - **Context**: Some planning documents contain ASCII art or simple textual diagrams.
    - **Task**: Review these visualizations for clarity and effectiveness.
    - **Considerations**:
        - [ ] Should they be replaced/augmented with more formal diagrams (e.g., Mermaid.js, linked image files)?
        - [ ] If creating new diagrams, establish conventions for tools and styles (see [./docs/plans/documentation/2_information_architecture_plan.md](./docs/plans/documentation/2_information_architecture_plan.md)).
        - [ ] Determine storage for diagram sources if they become complex (e.g., [./docs/.assets/images/](./docs/.assets/images/)` or `[./docs/.assets/diagrams/](./docs/.assets/diagrams/)).

- [ ] **2. Refine [./docs/plans/future-research/](./docs/plans/future-research/) Organization & Links**:
    - **Context**: [./docs/plans/future_research_directions.md](./docs/plans/future_research_directions.md)` lists broad topics; `[./docs/plans/future-research/](./docs/plans/future-research/) (the directory) contains specific explorations (like multi-repo architecture).
    - **Task**: Ensure a clear relationship and effective cross-linking between `future_research_directions.md` and any detailed plans or documents within the `future-research/` directory.
    - [ ] As new research topics from `future_research_directions.md` are explored, create corresponding sub-documents or subdirectories within [./docs/plans/future-research/](./docs/plans/future-research/).

- [ ] **3. Content Review of Archived Materials**:
    - **Context**: Files were moved to [./docs/plans/archived_or_reference_materials/](./docs/plans/archived_or_reference_materials/).
    - **Task**: (Lower priority) Conduct a quick review of these archived files.
    - **Goal**: Identify if any unique, still-relevant checklist items, specific unresolved questions, or valuable conceptual nuggets were missed during refactoring and should be extracted or noted in active plans.
    - [ ] Example: Ensure outcomes of `symbolic_tools_update_plan.md` are fully reflected in current [./tools/symbolic_tool_references.md](./tools/symbolic_tool_references.md)` and related ontology plans (`[./docs/plans/ontology_and_formalism/](./docs/plans/ontology_and_formalism/)).

- [ ] **4. Standardize Task Tagging Conventions**:
    - **Context**: Tags like `[Task]`, `[Decision]`, `[Documentation]`, `[Research]` are used in checklists.
    - **Task**: Formalize the set of allowed tags and their meanings.
    - [ ] Document these tag conventions in [./docs/plans/README.md](./docs/plans/README.md)` (the main index for plans) or in `[./CONTRIBUTING.md](./CONTRIBUTING.md).
    - [ ] During the "Thematic Consistency Review" (from Highest Priority tasks), ensure consistent application of these tags across all planning documents.

- [ ] **5. Refine [./docs/plans/master_project_plan.md](./docs/plans/master_project_plan.md) Item Descriptions**:
    - **Context**: The `master_project_plan.md` now links to many subdirectory `README.md` files which act as indexes.
    - **Task**: Review checklist item descriptions in `master_project_plan.md` that point to these overview/index READMEs.
    - [ ] Ensure descriptions accurately reflect that the link leads to a collection of plans or an overview, rather than a single monolithic plan document if the wording is currently ambiguous (e.g., adjust "(see [./docs/plans/ontology_and_formalism/README.md](./docs/plans/ontology_and_formalism/README.md)`) to be clearer, like "(see plans within `[./docs/plans/ontology_and_formalism/](./docs/plans/ontology_and_formalism/))" where appropriate).

- [ ] **6. Review Overall Plan Inter-linkage for Navigability**:
    - **Context**: After individual file link correction, a higher-level review of how easily one can navigate between related concepts across the *entire* `docs/plans/` structure.
    - **Task**: Perform a usability check focused on navigating between the `master_project_plan.md`, the main `docs/plans/README.md`, subdirectory READMEs, and specific detailed plans. Identify areas where more "See also" links or clearer introductory pointers in READMEs could improve understanding of how different planning areas connect. 