# AI Agent Global Rules

These rules apply globally to all interactions and projects.

## 1. Git Operations (Critical)
- **NO Unauthorized Commits/Pushes**: 
  - NEVER execute `git commit` or `git push` without explicit user confirmation.
  - Always pause and show the `git status` or staged changes for review.
- **Verification First**:
  - Before requesting to commit, verify that the active changes (staged files) are correct and complete.
  - If a command fails (e.g., push rejected), DO NOT force push (`--force`) without explicit authorization.
- **Branching**:
  - For non-trivial changes, always propose creating a new branch first.

## 2. File Operations
- **Preserve User Intent**:
  - Do not assume you should follow a "standard" workflow if the user has requested a specific deviation (e.g., excluding specific files).
- **Safe Reverts**:
  - If a user rejects a change, revert it immediately to the previous stable state rather than leaving it half-broken.

## 3. Communication
- **Confirm Before Acting**:
  - When in doubt, ask. Do not assume "silence" or "ambiguous commands" as permission to proceed with destructive actions.
