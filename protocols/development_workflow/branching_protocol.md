# PACT-System Branching Protocol

This protocol outlines the branching model and naming conventions to be used for PACT-System project development.

## GitFlow Branching Model Principles

- [ ] **Adopt a modified GitFlow branching model with the following core branches and purposes:**
    - [ ] **`main` Branch**:
        - [ ] Contains production-ready, stable code only.
        - [ ] Must always be in a deployable state.
        - [ ] Is a protected branch; direct pushes are disallowed. Changes are merged via Pull Requests (PRs) from `release/` or `hotfix/` branches, requiring approvals.
        - [ ] Commits to `main` are tagged with version numbers (e.g., `v1.0.0`, `v1.0.1`).
    - [ ] **`develop` Branch**:
        - [ ] Serves as the primary integration branch for ongoing feature development.
        - [ ] Contains the latest successfully integrated development changes.
        - [ ] Should generally be stable and buildable, but may contain unreleased features.
        - [ ] Is a protected branch; direct pushes are disallowed. Changes are merged via PRs from `feature/` branches.

## Supporting Branch Types

- [ ] **Feature Branches (`feature/*`)**:
    - [ ] **Purpose**: Develop new features or make significant changes.
    - [ ] **Naming**: `feature/[issue-number]-[brief-description]` (e.g., `feature/42-add-user-authentication`).
    - [ ] **Source**: Branched from `develop`.
    - [ ] **Merge Target**: Merged back into `develop` via a Pull Request.
    - [ ] **Lifecycle**: Deleted after successful merge into `develop`.
- [ ] **Release Branches (`release/*`)**:
    - [ ] **Purpose**: Prepare for a new production release. Allows for final bug fixes, documentation updates, and release-specific tasks (e.g., updating version numbers, changelogs).
    - [ ] **Naming**: `release/v[major].[minor].[patch]` (e.g., `release/v1.2.0`).
    - [ ] **Source**: Branched from `develop` when `develop` has accumulated enough features for a release.
    - [ ] **Merge Target(s)**:
        - [ ] Merged into `main` (and tagged) via a Pull Request for the official release.
        - [ ] Merged back into `develop` to ensure any fixes made during release prep are incorporated into ongoing development.
    - [ ] **Lifecycle**: Can be deleted after merging to `main` and `develop`, or kept for historical reference if needed.
- [ ] **Hotfix Branches (`hotfix/*`)**:
    - [ ] **Purpose**: Address critical bugs discovered in the production version (`main`) that require immediate fixing.
    - [ ] **Naming**: `hotfix/v[major].[minor].[patch+1]` or `hotfix/[issue-number]-[brief-description]` (e.g., `hotfix/v1.2.1`, `hotfix/77-critical-login-bug`).
    - [ ] **Source**: Branched directly from `main` (from the commit corresponding to the tagged production version).
    - [ ] **Merge Target(s)**:
        - [ ] Merged into `main` (and tagged with a new patch version) via a Pull Request.
        - [ ] Merged back into `develop` (or current `release/` branch if one is active) to ensure the fix is included in future development and releases.
    - [ ] **Lifecycle**: Deleted after successful merge to `main` and `develop` (or active `release/`).
- [ ] **Documentation Branches (`docs/*`)**:
    - [ ] **Purpose**: For changes that only affect documentation (e.g., user guides, API references, READMEs, planning documents).
    - [ ] **Naming**: `docs/[brief-description]` (e.g., `docs/update-contributing-guide`).
    - [ ] **Source**: Can be branched from any relevant branch (`develop` for new feature docs, `main` for corrections to released docs, specific `feature/` branches if docs are tied to a feature).
    - [ ] **Merge Target**: Merged into the appropriate target branch (e.g., `develop`, `main`, or feature branch) via a Pull Request.

## Branch Naming Conventions Protocol

- [ ] **Lowercase and Hyphens**: Use lowercase letters and hyphens (`-`) for word separation in branch names. Avoid underscores or camelCase.
- [ ] **Issue/Ticket Number Prefix (for applicable types)**: For `feature/`, `bugfix/` (if used as a type distinct from `hotfix/`), and potentially `hotfix/` branches, prefix with the relevant issue/ticket number from the project's issue tracker.
- [ ] **Concise but Descriptive Suffix**: The `[brief-description]` part of the branch name should clearly indicate the branch's purpose.
- [ ] **Follow Standard Patterns**: Adhere to the `type/[issue-number]-[brief-description]` or `type/[brief-description]` patterns shown above.
    - `feature/42-add-permission-system`
    - `bugfix/57-fix-compliance-check`
    - `docs/update-readme`
    - `release/v1.2.0`
    - `hotfix/v1.2.1` 