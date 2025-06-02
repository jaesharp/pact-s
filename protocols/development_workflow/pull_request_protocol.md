# PACT-System Pull Request (PR) Protocol

This protocol outlines the process and requirements for creating, reviewing, and merging Pull Requests in the PACT-System project.

## PR Creation Protocol

- [ ] **1. Preparation Before Creating a PR**:
    - [ ] Ensure all automated tests (unit, integration, etc., as applicable) pass locally on the feature branch.
    - [ ] Rebase the feature branch onto the latest state of the target branch (e.g., `develop`) to incorporate recent changes and resolve potential conflicts locally.
    - [ ] Clean up commit history on the feature branch using interactive rebase (`git rebase -i`) if necessary. Aim for a series of atomic, well-messaged commits (see [./commit_protocol.md](./commit_protocol.md)).
    - [ ] Ensure all relevant documentation (code comments, user guides, API docs) has been updated to reflect the changes in the PR.
    - [ ] Verify adherence to all relevant PACT-System protocols for the changes being introduced.

- [ ] **2. Using the PR Template**:
    - [ ] Utilize the project's official Pull Request template (to be defined, likely in `.github/PULL_REQUEST_TEMPLATE.md`).
    - [ ] Fill in all required sections of the template thoroughly and accurately.
        - [ ] **Description**: Clearly describe the purpose of the PR, the problem it solves, or the feature it adds.
        - [ ] **Related Issues**: Link to all relevant issues in the issue tracker (e.g., "Closes #123", "Addresses #456").
        - [ ] **Changes Made**: Summarize the key changes introduced by the PR.
        - [ ] **Testing Performed**: Describe the testing done to verify the changes (manual, automated, specific scenarios tested).
        - [ ] **PACT-S Compliance**: Briefly state how the changes adhere to PACT-System principles and relevant protocols.
        - [ ] **Screenshots/GIFs (if applicable)**: For UI changes, include visual aids.
        - [ ] **Checklist**: Ensure all items in the PR template's checklist are addressed.

- [ ] **3. PR Naming Conventions**:
    - [ ] Follow the pattern: `[Type] Brief description (#issue)` where `[Type]` aligns with Conventional Commit types (e.g., `feat`, `fix`, `docs`, `refactor`).
    - [ ] Example: `[feat] Add user authentication service (#42)`
    - [ ] Example: `[fix] Correct calculation error in reporting module (#57)`

## PR Review Protocol

- [ ] **1. Review Requirements & Assignment**:
    - [ ] At least one (or a specified number of) approval(s) from designated reviewers/maintainers is required before merging.
    - [ ] All automated CI checks (build, tests, linting, etc. - see [./cicd_workflow_protocol.md](./cicd_workflow_protocol.md)) MUST pass.
    - [ ] There should be no unresolved review conversations or requested changes.
    - [ ] Assign appropriate reviewers to the PR.

- [ ] **2. Review Focus Areas**:
    - [ ] **Code Correctness and Quality**: Does the code work as intended? Is it well-structured, readable, and maintainable? Does it follow project coding standards?
    - [ ] **Test Coverage**: Are there sufficient tests (unit, integration) for the changes? Do existing tests still pass? Do new tests adequately cover new functionality and edge cases?
    - [ ] **Documentation Completeness & Accuracy**: Is the PR adequately documented (code comments, user docs, API docs)? Do the changes require updates to existing documentation, and have these been made?
    - [ ] **Adherence to Project Standards & Protocols**: Do the changes adhere to Conventional Commits ([./commit_protocol.md](./commit_protocol.md)`), branching model (`[./branching_protocol.md](./branching_protocol.md)), and other relevant PACT-System protocols?
    - [ ] **Functionality**: Does the change meet the requirements of the linked issue(s)?
    - [ ] **Security & Performance**: Are there any obvious security vulnerabilities or performance regressions introduced?
    - [ ] **Impact Assessment**: Consider the potential impact on other parts of the system.

- [ ] **3. Review Process & Etiquette**:
    - [ ] Reviewers SHOULD strive to provide feedback within a reasonable timeframe (e.g., 24-48 hours during workdays).
    - [ ] Feedback SHOULD be constructive, specific, and actionable.
    - [ ] PR authors MUST address all review comments and requested changes, or provide clear justification if a change is not made.
    - [ ] Request re-review from the original reviewers after addressing feedback.
    - [ ] Use review tools (e.g., GitHub's review interface) effectively for comments and change suggestions.

## PR Merge Protocol

- [ ] **1. Merge Requirements (Final Check)**:
    - [ ] All required review approvals obtained.
    - [ ] All CI status checks passing.
    - [ ] No unresolved review conversations.
    - [ ] Feature branch is reasonably up-to-date with the target branch (rebase if necessary to resolve major conflicts or incorporate critical updates).

- [ ] **2. Merge Strategy**:
    - [ ] **Feature Branches (to `develop`)**: Default to squash merging (`git merge --squash`) to maintain a clean, linear history on `develop`. The squashed commit message SHOULD be well-crafted, summarizing the feature and referencing the PR and issues.
    - [ ] **Release and Hotfix Branches (to `main` and `develop`)**: Typically use regular merge commits (`git merge --no-ff`) to preserve the branch history for these important integration points.
    - [ ] The person merging the PR is responsible for ensuring the merge commit message is appropriate (e.g., includes PR number: `Merge pull request #123 from feature/branch-name`).

- [ ] **3. Post-Merge Actions**:
    - [ ] The feature branch SHOULD be deleted after its PR is successfully merged (often automated by GitHub/GitLab).
    - [ ] Ensure related issues in the issue tracker are correctly closed or updated.
    - [ ] Update any project boards or task tracking systems. 