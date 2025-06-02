# PACT-System Versioning and Release Protocol

This protocol outlines the standards for versioning PACT-System components and the process for preparing and executing releases.

## Versioning Protocol

- [ ] **1. Semantic Versioning (SemVer)**:
    - [ ] The PACT-System project and its individually versioned components MUST adhere to [Semantic Versioning](https://semver.org/) (SemVer) v2.0.0.
    - [ ] Version numbers take the form `MAJOR.MINOR.PATCH`.
    - [ ] Increment the:
        - [ ] `MAJOR` version when incompatible API changes are made.
        - [ ] `MINOR` version when functionality is added in a backward-compatible manner.
        - [ ] `PATCH` version when backward-compatible bug fixes are made.

- [ ] **2. Version Bumping Logic**:
    - [ ] **Automated Version Detection (Primary Method)**:
        - [ ] Utilize Conventional Commits ([./commit_protocol.md](./commit_protocol.md)) to automatically determine the appropriate version bump for the next release.
        - [ ] `feat` type commits (new features) SHOULD trigger a `MINOR` version bump.
        - [ ] `fix` type commits (bug fixes) SHOULD trigger a `PATCH` version bump.
        - [ ] Commits with `BREAKING CHANGE:` in the footer or `!` after the type/scope (e.g., `feat!: ...`) MUST trigger a `MAJOR` version bump.
        - [ ] Tooling (e.g., `standard-version` or similar) SHOULD be used to automate version bumping and changelog generation based on commit history (see [../../docs/plans/vcs_strategy.md](../../docs/plans/vcs_strategy.md)).
    - [ ] **Manual Override**: In rare cases, manual adjustment of the version number may be necessary but MUST be justified and documented in the release notes.

- [ ] **3. Versioned Artifacts & Files**:
    - [ ] The canonical version number for a component SHOULD be maintained in a standard project file (e.g., `package.json` for Node.js projects, `pyproject.toml` for Python, a dedicated `VERSION` file, etc.).
    - [ ] The [../../CHANGELOG.md](../../CHANGELOG.md) MUST be updated with each new release, detailing changes.
    - [ ] Git tags MUST be used to mark release commits on the `main` branch (e.g., `v1.2.3`). Tags MUST follow SemVer precisely.

- [ ] **4. Pre-release Versions**:
    - [ ] For testing or development releases (alpha, beta, release candidates), pre-release identifiers MAY be used.
    - [ ] Pre-release versions SHOULD follow the SemVer specification, e.g., `X.Y.Z-alpha.N`, `X.Y.Z-beta.N`, `X.Y.Z-rc.N` (where N is a non-negative integer).
    - [ ] Increment the pre-release number (N) for each subsequent pre-release of the same version.

## Release Process Protocol

- [ ] **1. Release Preparation** (typically on a `release/*` branch, see [./branching_protocol.md](./branching_protocol.md)):
    - [ ] Create a release branch (e.g., `release/v1.2.0`) from `develop` when `develop` has accumulated the desired set of features and fixes for the next release.
    - [ ] Update version numbers in relevant project files (e.g., `package.json`, `VERSION` file) to the target release version.
    - [ ] Generate or finalize the [../../CHANGELOG.md](../../CHANGELOG.md) for the upcoming release. This should be based on conventional commit messages since the last release.
    - [ ] Perform final testing on the release branch: 
        - [ ] Execute all relevant test suites (unit, integration, system, compliance - see [../README.md](../README.md) for links to specific test plans).
        - [ ] Conduct any necessary manual QA or exploratory testing.
    - [ ] Address any bugs found during release testing with commits directly to the release branch. These fixes must also be merged back into `develop`.
    - [ ] Ensure all documentation is up-to-date with the changes included in the release.

- [ ] **2. Release Execution**:
    - [ ] **Merge to `main`**: Once the release branch is stable and approved, merge it into the `main` branch via a Pull Request (see [./pull_request_protocol.md](./pull_request_protocol.md)). This merge commit on `main` represents the official release.
    - [ ] **Tag Release**: Immediately after merging to `main`, tag the merge commit with the precise version number (e.g., `git tag -a v1.2.0 -m "Release version 1.2.0"`).
    - [ ] **Merge back to `develop`**: Merge the release branch (or the `main` branch at the release tag) back into `develop` to ensure any fixes or changes made during release preparation are incorporated into ongoing development.
    - [ ] **Push Tags**: Push the new tag to the remote repository (e.g., `git push origin v1.2.0`).

- [ ] **3. Release Documentation & Communication**:
    - [ ] Create a GitHub Release (or equivalent for other platforms) based on the Git tag.
    - [ ] Include comprehensive release notes in the GitHub Release. These should summarize key features, bug fixes, and any breaking changes. The [../../CHANGELOG.md](../../CHANGELOG.md) can be a primary source for this.
    - [ ] Highlight major changes and their benefits to users.
    - [ ] Link to relevant documentation for new features or significant changes.
    - [ ] Announce the release through appropriate channels (e.g., project communication channels, mailing lists).

- [ ] **4. Post-Release (Hotfixes)**:
    - [ ] If critical bugs are found in a production release on `main`, they MUST be addressed using a `hotfix/*` branch as per the [./branching_protocol.md](./branching_protocol.md).
    - [ ] Hotfixes also result in a new tagged release on `main` (incrementing the PATCH version) and must be merged back to `develop`. 