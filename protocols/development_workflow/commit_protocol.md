# PACT-System Commit Protocol

This protocol outlines the conventions for writing commit messages and best practices for making commits in the PACT-System project.

## Conventional Commits Standard

- [ ] **Adherence to Specification**: All commits MUST follow the [Conventional Commits](https://www.conventionalcommits.org/) specification v1.0.0.
- [ ] **Commit Message Structure**: The commit message SHOULD be structured as follows:
    ```
    <type>[optional scope]: <description>
    
    [optional body]
    
    [optional footer(s)]
    ```
    - [ ] **Header**: The first line (`<type>[optional scope]: <description>`) is mandatory.
        - [ ] `<type>`: Must be one of the allowed types (see below).
        - [ ] `[optional scope]`: If used, the scope must be enclosed in parentheses and describe the section of the codebase affected (see below).
        - [ ] `<description>`: A concise summary of the code changes. It must be in the imperative, present tense (e.g., "add feature" not "added feature" or "adds feature"). It should not be capitalized and must not end with a period.
    - [ ] **Body (Optional)**: 
        - [ ] MAY be included to provide additional contextual information about the code changes.
        - [ ] Must be separated from the header by one blank line.
        - [ ] Written in the imperative, present tense.
        - [ ] Should explain the *what* and *why* vs. *how*.
    - [ ] **Footer(s) (Optional)**:
        - [ ] MAY be included and must be separated from the body by one blank line (or from the header if no body).
        - [ ] Commonly used for referencing issues (e.g., `Closes #123`, `Fixes #456`) or indicating breaking changes.
        - [ ] **Breaking Changes**: A commit that introduces a breaking API change MUST indicate this in the type/scope of the header, or by appending `BREAKING CHANGE:` (or `BREAKING-CHANGE:`) as a footer, followed by a description of the breaking change.

## Defined Commit Types

- [ ] **Use one of the following allowed types in the commit message header:**
    - [ ] **`feat`**: A new feature for the user or PACT-System itself (correlates with MINOR in SemVer when in `develop`).
    - [ ] **`fix`**: A bug fix for the user or PACT-System (correlates with PATCH in SemVer when in `develop`).
    - [ ] **`docs`**: Documentation only changes (e.g., to Markdown files, code comments).
    - [ ] **`style`**: Changes that do not affect the meaning of the code (e.g., white-space, formatting, missing semi-colons, linting fixes that are not `fix` or `feat`).
    - [ ] **`refactor`**: A code change that neither fixes a bug nor adds a feature (e.g., renaming a variable, improving internal structure without changing behavior).
    - [ ] **`perf`**: A code change that improves performance.
    - [ ] **`test`**: Adding missing tests or correcting existing tests. Does not change production code.
    - [ ] **`build`**: Changes that affect the build system or external dependencies (e.g., Gulp, Broccoli, npm, Makefiles).
    - [ ] **`ci`**: Changes to CI configuration files and scripts (e.g., GitHub Actions workflow files).
    - [ ] **`chore`**: Other changes that don't modify `src` or `test` files (e.g., updating build tasks, package manager configs, `.gitignore`).
    - [ ] **`revert`**: If the commit reverts a previous commit, it should begin with `revert: `, followed by the header of the reverted commit. The body should say: `This reverts commit <hash>.`, where the hash is the SHA of the commit being reverted.

## Defined Scopes

- [ ] **If a scope is used, select from the following (or define new agreed-upon scopes):**
    - [ ] `permission`: Changes related to the permission system components or logic.
    - [ ] `accountability`: Changes related to accountability tracking, logging, or audit trails.
    - [ ] `compliance`: Changes related to compliance verification, policy enforcement, or protocol adherence.
    - [ ] `transparency`: Changes related to transparency reporting or explanation generation.
    - [ ] `core`: Changes to core PACT-System functionality not covered by other scopes.
    - [ ] `tools`: Changes to utility tools, scripts, or supporting PACT-System tooling.
    - [ ] `protocols`: Changes to the definition or documentation of PACT-System protocols.
    - [ ] `verification`: Changes to formal verification models or verification mechanisms.
    - [ ] `memory`: Changes to system memory management, state persistence, or Knowledge Graph interaction.
    - [ ] `tests`: Changes specifically within test suites or testing infrastructure (often used with `type: test`).
    - [ ] `docs`: Changes specifically within documentation files (often used with `type: docs`).
    - [ ] `config`: Changes related to configuration files (e.g., Dhall, JSON, YAML).
    - [ ] `agent`: Changes specific to a reference agent implementation or agent core logic.

## Commit Best Practices Protocol

- [ ] **Atomic Commits**:
    - [ ] Each commit SHOULD represent a single logical change or unit of work.
    - [ ] Keep commits focused and as small as practically possible while remaining complete.
    - [ ] Avoid mixing unrelated changes in a single commit (e.g., a feature implementation and a formatting fix for an unrelated file).
- [ ] **Complete Commits**:
    - [ ] A commit SHOULD include all related changes (code, tests, documentation updates) for the logical unit of work it represents.
    - [ ] The codebase SHOULD remain in a working, buildable, and testable state after each commit on primary integration branches (`develop`, `main`). Feature branches may have intermediate commits that are later squashed or rebased.
    - [ ] Avoid committing partial features or broken code to shared branches.
- [ ] **Clear and Descriptive Messages**:
    - [ ] Write commit messages that are clear, concise, and descriptive, enabling others (and your future self) to understand the change.
    - [ ] The header (`<type>[optional scope]: <description>`) should be self-contained and understandable on its own.
    - [ ] Use the optional body to explain *why* the change was made, the problem it solves, or any important context, rather than *how* it was made (the code shows the *how*).
    - [ ] Reference relevant issue/ticket numbers in the commit body or footer (e.g., `Closes #123`, `Addresses #456`).
- [ ] **Commit Frequency and History Management**:
    - [ ] Commit frequently during local development on a feature branch to save progress.
    - [ ] Before creating a Pull Request, use interactive rebase (`git rebase -i`) to clean up the feature branch history: squash trivial/fixup commits, reword messages for clarity, and ensure each commit in the PR is meaningful and atomic.
    - [ ] Ensure all local commits pass relevant tests before pushing or creating a PR.

## Automated Enforcement

- [ ] Implement commit message validation using pre-commit hooks (e.g., via `commitlint` and `husky`) to enforce Conventional Commits format (see [../git_hooks_protocol.md](../git_hooks_protocol.md)` if created, or `[../../docs/plans/vcs_strategy.md](../../docs/plans/vcs_strategy.md)). 