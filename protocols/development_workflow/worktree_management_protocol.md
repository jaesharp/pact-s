# Worktree Management Protocol

This protocol ensures work is always performed in the correct context and changes are isolated appropriately.

## Worktree Protocol

### Create Dedicated Worktree for Each Issue

```bash
git worktree add -b feature/{issue-name} ../worktrees/{issue-name}
```

### Switch to the Correct Worktree Before Beginning Work

```bash
cd ../worktrees/{issue-name}
```

### Verify Current Worktree

```bash
git worktree list | grep "\[$(git rev-parse --abbrev-ref HEAD)\]"
```

## Worktree Documentation

### In-Memory Tracking

- Add worktree location to `CurrentSessionState` entity
- Record branch name and issue relationship
- Track worktree status (active, stale, archived)

### Resumption Process

- When using `@@resume`, verify current directory matches expected worktree
- Include worktree switching commands if necessary
- Update worktree status in knowledge graph

### Consistency Requirements

- Maintain identical directory structure across worktrees
- Isolate feature-specific changes to appropriate worktrees
- Document any breaking changes that affect other worktrees

## Verification Steps

Before committing changes:

1. Verify current directory is in correct worktree
2. Confirm current branch matches issue being worked on
3. Ensure worktree is up-to-date with main/develop branches
4. Include worktree information in commit messages 