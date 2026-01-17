# Day 30 – Git Hard Reset

## Task / Requirement
The development team used a Git repository only for testing and pushed multiple temporary commits. They now want to clean up the repository by removing unnecessary commits and resetting the branch history to a known stable state.

The requirement is to reset the repository so that only the **initial commit** and the commit with message **“add data.txt file”** remain in the history, and then push the cleaned history to the remote repository.

**Requirement details:**
- Server: Storage Server (`ststor01`)
- Repository path: `/usr/src/kodekloudrepos/apps`
- Target commit: Commit with message `add data.txt file`
- Action: Hard reset and force push
- Constraint: Commit history must contain only two commits

---

## Steps Performed
- Logged into the Storage Server from the jump host
- Navigated to the Git repository
- Reviewed the existing commit history
- Identified the commit hash corresponding to `add data.txt file`
- Performed a hard reset to move HEAD and branch pointer to the target commit
- Verified that only the required commits remained in the local history
- Force pushed the updated history to the remote repository
- Verified the final commit history

---

## Commands Used

```bash
# Login to Storage Server
ssh natasha@ststor01

# Navigate to the repository
cd /usr/src/kodekloudrepos/apps

# View commit history
git log --oneline

# Hard reset to the required commit
git reset --hard <commit-hash>

# Verify updated commit history
git log --oneline

# Force push changes to remote repository
git push origin --force

# Verify final commit history
git log --oneline
```

---

## Expected Outcome
- Repository history contains only:
    - Initial commit
    - add data.txt file commit
- All other test commits are removed
- Local and remote repositories have identical commit history
- Working tree matches the state of the target commit

---

## Key Learnings
- `git reset --hard` moves HEAD, the branch pointer, and the working tree to a specific commit
- A hard reset permanently removes commits from the local commit history
- `git reset` rewrites history and should be used cautiously, whereas `git revert` preserves history and is safer for shared branches
- A force push is required when rewritten history must replace the remote history
- `git reset --hard` should be avoided on shared or production branches
- History rewriting is suitable only for test or tightly controlled repositories
