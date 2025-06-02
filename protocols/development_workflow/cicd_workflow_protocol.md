# PACT-System CI/CD Workflow and Git Hooks Protocol

This protocol outlines the Continuous Integration/Continuous Deployment (CI/CD) workflows and local Git hook configurations for the PACT-System project, aimed at automating checks and ensuring code quality and consistency.

## Git Hooks Protocol (Local Enforcement)

- [ ] **Implement Pre-commit Hooks** (e.g., using Husky and lint-staged, or similar tools - see [../../docs/plans/vcs_strategy.md](../../docs/plans/vcs_strategy.md) for tool discussion):
    - [ ] **Code Formatting**: Automatically run code formatters (e.g., Prettier, Black, gofmt) on staged files.
        - [ ] Enforce consistent code style across the project.
        - [ ] Automatically fix simple formatting issues where possible.
    - [ ] **Linting**: Run linters (e.g., ESLint, Pylint, Flake8, staticcheck) on staged files.
        - [ ] Check for common code quality issues, potential bugs, and style guide violations.
    - [ ] **Commit Message Validation**: Verify that the commit message adheres to the Conventional Commits format (see [./commit_protocol.md](./commit_protocol.md)).
        - [ ] Check for valid type, scope (if used), and description.
        - [ ] Potentially check for issue references if required by project policy.
    - [ ] **Documentation Linting/Checking (Optional Pre-commit)**:
        - [ ] Run Markdown linters on staged documentation files.
        - [ ] Optionally, run fast checks like local link validation.

- [ ] **Implement Pre-push Hooks**:
    - [ ] **Test Execution (Fast Tests)**:
        - [ ] Run critical unit tests or a fast subset of tests to catch obvious errors before pushing.
        - [ ] Ensure all selected pre-push tests pass.
        - [ ] Optionally, check local test coverage if configured.
    - [ ] **Build Verification (Optional Pre-push)**:
        - [ ] Ensure the project builds successfully locally (can be time-consuming, make optional or configurable).
    - [ ] **Dependency Check (Optional Pre-push)**:
        - [ ] Check for known vulnerable dependencies if a fast local check is available.

## CI/CD Workflow Protocol (Server-Side Automation - e.g., GitHub Actions)

Refer to [../../docs/plans/testing_and_verification/6_test_infrastructure_plan.md](../../docs/plans/testing_and_verification/6_test_infrastructure_plan.md) for overall test infrastructure planning.

- [ ] **1. Pull Request (PR) Workflow / Branch Protection Workflow**:
    - [ ] **Trigger**: This workflow MUST run on every push to a branch associated with an open Pull Request, and on every PR creation targeting `main` or `develop` (or other protected branches).
    - [ ] **Mandatory Checks for PR Merge (Status Checks)**:
        - [ ] **Build Project**: Compile/build all necessary PACT-System components and artifacts.
        - [ ] **Code Formatting & Linting**: Verify code style and linting across the relevant codebase.
        - [ ] **Unit Tests**: Execute the complete unit test suite. All tests must pass.
        - [ ] **Integration Tests**: Execute the complete integration test suite. All tests must pass.
        - [ ] **Documentation Build & Tests**: Build any generated documentation and run documentation tests (e.g., link checking, doctests). All checks must pass.
        - [ ] **PACT-System Compliance Tests (Subset)**: Run critical automated PACT-System compliance tests relevant to the changes.
    - [ ] **Optional/Informational Checks for PRs**:
        - [ ] **Code Coverage**: Generate and report code coverage. (May have a minimum threshold later).
        - [ ] **System Tests (Subset/On-Demand)**: Optionally run a subset of system tests, or allow manual triggering for long-running system tests on a PR.
        - [ ] **Dependency Analysis**: Check for vulnerable dependencies or license incompatibilities.
    - [ ] **Status Reporting**: All check statuses MUST be reported back to the Pull Request interface.
    - [ ] **Merge Blocking**: PRs MUST be blocked from merging if any *Mandatory Checks* fail.

- [ ] **2. Main Branch Workflow (`main`, `develop`)**:
    - [ ] **Trigger**: This workflow MUST run on every successful merge/push to `main` and `develop` branches.
    - [ ] **Actions**:
        - [ ] Perform the full suite of tests (Unit, Integration, System, Compliance, Documentation).
        - [ ] Build all production/release artifacts.
        - [ ] Generate and publish comprehensive code coverage reports (if applicable).
        - [ ] Build and deploy the latest documentation to a staging or development environment (if applicable).
        - [ ] For `main` branch: Prepare for a potential release (e.g., if using continuous deployment for non-production environments or if it triggers a release candidate process).

- [ ] **3. Release Automation Workflow** (see also [./versioning_and_release_protocol.md](./versioning_and_release_protocol.md)):
    - [ ] **Trigger**: This workflow SHOULD be triggered automatically when a new version tag (e.g., `v1.2.3`) is pushed to the `main` branch.
    - [ ] **Actions**:
        - [ ] Build final release artifacts (binaries, packages, containers).
        - [ ] Generate final release notes from [../../CHANGELOG.md](../../CHANGELOG.md) or commit history.
        - [ ] Publish packages to registries (e.g., npm, PyPI, Docker Hub) if applicable.
        - [ ] Create a GitHub Release (or equivalent) with the tag, release notes, and attached artifacts.
        - [ ] Deploy documentation for the new version to the production documentation site.
        - [ ] Announce the release (optional automated step, e.g., posting to a chat channel).

## General CI/CD Principles

- [ ] **Idempotency**: CI/CD jobs should be idempotent (running them multiple times with the same input produces the same result).
- [ ] **Atomicity**: Key stages (like deployments) should be atomic or have rollback capabilities.
- [ ] **Security**: Securely manage any secrets or credentials used by CI/CD workflows (e.g., using GitHub Secrets).
- [ ] **Efficiency**: Optimize CI/CD workflows for speed and resource usage (e.g., caching dependencies, parallelizing jobs).
- [ ] **Visibility**: Provide clear logs and status reporting for all CI/CD jobs. 