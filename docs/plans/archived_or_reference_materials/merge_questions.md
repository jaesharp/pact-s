# PACTS Merge - Outstanding Questions

This document lists questions to be resolved for the PACTS merge process.

## Root-Level Markdown Files (`PACTS/index.md`, `PACTS/README.md`, `PES/PACTS/prompting-techniques-deepseek-r1.md`):

1.  **PACTS Acronym Definition & Reconciliation:**
    *   You've clarified that the framework is **PACTS (Permission, Accountability, C (Consent, Compliance, Competency, Clarity), Transparency, System)**.
    *   `PACTS/index.md` currently defines PACTS with **Consent** (Permission, Accountability, Consent, Transparency System) and seems specific to a "ClipifyLive project", last updated March 31, 2025.
    *   `PACTS/README.md` currently defines PACTS with **Compliance** (Permission, Accountability, Compliance, Transparency System) and appears to be a more general framework description with Typescript examples.
    *   The aspects of **Consent, Compliance, Competency, and Clarity** will need to be clearly delineated and integrated under the C umbrella within the new PACTS definition.
    *   **Affirmation:** The new `README.md` will be created to reflect the full PACTS framework. It will synthesize relevant content from `PACTS/index.md` (for the Consent aspect and ClipifyLive context) and `PACTS/README.md` (for the Compliance aspect and general framework). The Competency and Clarity aspects, along with a clear explanation of C (Consent, Compliance, Competency, Clarity), will be integrated as a core part of this new definition. Is this correct?
[Correct]
2.  **Location for `prompting-techniques-deepseek-r1.md`:**
    *   This file is currently in `PES/PACTS/`. It contains guidance for a specific AI model.
    *   **Decision:** This file (and any others matching `prompting-techniques-deepseek*.md`) will be placed in `prompts/` for now. Its final location can be reassessed after reviewing the contents of the `prompts/` directory from `Projects/PACTS/`.
[correct]
## Next Steps:

*   Please provide your decisions on the questions above in this file.
*   Once these are clarified, we will proceed to examine the contents of the `tools/` directories and then the remaining files as per the merge plan. 