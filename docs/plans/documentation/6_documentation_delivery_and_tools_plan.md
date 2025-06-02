# 6. PACT-System Documentation Delivery and Tools Plan

This document details the plan for documentation delivery platforms and the tools used throughout the documentation lifecycle for the PACT-System.

## Documentation Delivery Platforms

- [ ] **1. GitHub Repository (Primary Source)**:
    - [ ] All documentation source files (Markdown, diagrams, etc.) will be version controlled in the main PACT-System Git repository ([../../](../../)).
    - [ ] `README.md` files in key directories ([../../docs/](../../docs/)`, [../../core/](../../core/), `[../../protocols/](../../protocols/), etc.) will serve as primary navigation within the repository.
    - [ ] Ensure documentation changes are tied to code changes via Pull Requests (see [../vcs_strategy.md](../vcs_strategy.md)).
    - [ ] Utilize GitHub features for issue tracking related to documentation (see [../vcs_strategy.md](../vcs_strategy.md)).

- [ ] **2. Documentation Website (Static Site)**:
    - [ ] **`[Decision]`** Evaluate and select a static site generator (SSG) for creating a user-friendly documentation website (e.g., Docusaurus, VuePress, MkDocs, Jekyll, Hugo).
        - [ ] Criteria: Ease of use, Markdown support, theming capabilities, search functionality, versioning support, plugin ecosystem, build speed, community support.
    - [ ] Set up the chosen SSG to build from Markdown sources in the repository.
    - [ ] Design a theme or customize an existing one for a professional look and feel, consistent with PACT-System branding (if any).
    - [ ] Implement effective search functionality for the website.
    - [ ] Implement support for documentation versioning on the website if PACT-System itself is versioned.
    - [ ] Ensure the website is responsive and accessible on various devices.
    - [ ] Plan for hosting the documentation website (e.g., GitHub Pages, Netlify, Vercel, self-hosted).
    - [ ] Automate website deployment via CI/CD pipeline (see [../testing_and_verification/6_test_infrastructure_plan.md](../testing_and_verification/6_test_infrastructure_plan.md)).

- [ ] **3. Interactive Documentation (Future Consideration)**:
    - [ ] If advanced features are desired (e.g., embedded code playgrounds, interactive tutorials, configuration builders, API explorers), evaluate SSG plugins or dedicated platforms that support these.
    - [ ] This is a lower priority for initial setup.

- [ ] **4. Offline Documentation (Optional/On-Demand)**:
    - [ ] **`[Research]`** Investigate tools and processes for generating PDF versions of key guides or the entire documentation set (e.g., using Pandoc, LaTeX-based toolchains, or SSG PDF export plugins).
    - [ ] (If implemented) Provide downloadable PDF guides for offline access.
    - [ ] (If implemented) Consider offline-capable web documentation (e.g., Progressive Web App features if using a capable SSG).
    - [ ] (If implemented) Consider packaging documentation with software releases.
    - [ ] (If implemented) Explore e-book formats (e.g., EPUB) for comprehensive guides if there is a demand.

## Documentation Tools

- [ ] **1. Content Creation Tools**:
    - [ ] **Markdown Editors**: Team members can use their preferred Markdown editor (e.g., VS Code with Markdown plugins, Obsidian, Typora, iA Writer).
        - [ ] Recommend Markdown linters/previewers for consistency.
    - [ ] **Diagramming Tools**: 
        - [ ] **`[Decision]`** Select preferred tools for creating diagrams (architecture, flow charts, etc.) (e.g., diagrams.net/draw.io, Mermaid.js for text-based diagrams in Markdown, PlantUML, Lucidchart, Excalidraw).
        - [ ] Establish conventions for diagram style and export formats (e.g., SVG, PNG).
        - [ ] Define storage location for diagram source files and exported assets ([../../docs/images/](../../docs/images/)).
    - [ ] **Code Snippet Management**: 
        - [ ] Ensure code snippets in Markdown are correctly formatted and, where possible, sourced from actual, testable code files to prevent drift.
        - [ ] Consider tools or practices for managing and embedding versioned code snippets.
    - [ ] **Screenshot and Video Tools (If Used)**:
        - [ ] Select tools for capturing and annotating screenshots.
        - [ ] Select tools for screen recording and video editing if video tutorials are created.

- [ ] **2. Documentation Generation (Static Site Generator - see above)**:
    - [ ] Configure chosen SSG (Docusaurus, VuePress, etc.).
    - [ ] Develop/customize templates and themes.
    - [ ] Set up build scripts.

- [ ] **3. API Documentation Generators (If Applicable)**:
    - [ ] If PACT-System includes code libraries with APIs, evaluate tools for generating API reference documentation from source code comments (e.g., TypeDoc for TypeScript, Haddock for Haskell, Sphinx for Python with autodoc).
    - [ ] Integrate API doc generation into the main documentation build process.

- [ ] **4. BDD Documentation Generators (If BDD is adopted - see [3_bdd_integration_for_docs_plan.md](3_bdd_integration_for_docs_plan.md))**:
    - [ ] Evaluate tools that can generate human-readable reports or documentation from Gherkin feature files (e.g., Pickles, Relish).

- [ ] **5. Collaboration Tools**:
    - [ ] **Version Control**: Git (GitHub/GitLab/etc.) for all documentation source files (as per [../vcs_strategy.md](../vcs_strategy.md)).
    - [ ] **Review and Approval Workflows**: Utilize Pull Requests for all documentation changes, requiring reviews (see [../vcs_strategy.md](../vcs_strategy.md)).
    - [ ] **Collaborative Editing (Optional)**: For initial drafts or brainstorming, consider tools like HedgeDoc (CodiMD), Google Docs, or shared Markdown platforms before committing to Git.
    - [ ] **Feedback Collection**: Use GitHub Issues for tracking documentation bugs and improvement requests. Consider dedicated feedback forms on a documentation website (see [7_documentation_metrics_and_evaluation_plan.md](7_documentation_metrics_and_evaluation_plan.md)).

- [ ] **6. Testing Tools (see also [../testing_and_verification/5_documentation_testing_plan.md](../testing_and_verification/5_documentation_testing_plan.md))**:
    - [ ] **Link Checkers**: Implement automated tools to check for broken internal and external links (e.g., `markdown-link-check`, SSG built-in checkers).
    - [ ] **Accessibility Validators**: Use tools to check for WCAG compliance for any generated web documentation (e.g., Axe, WAVE).
    - [ ] **Markdown Linters**: Enforce consistent Markdown style and formatting (e.g., `markdownlint`).
    - [ ] **User Testing Platforms (Optional)**: For formal usability testing of documentation, consider platforms or methods for structured user feedback. 