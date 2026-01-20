# Day 31 – Git Stash

## Task / Requirement
The development team had previously stashed some in-progress changes in a Git repository and now wants to restore a specific stash entry. After restoring the changes, they need to commit and push them to the remote repository.

**Requirement details:**
- Server: Storage Server (`ststor01`)
- Repository path: `/usr/src/kodekloudrepos/official`
- Stash to restore: `stash@{1}`
- Action: Apply stash, commit changes, and push to origin

---

## Steps Performed
- Logged into the Storage Server from the jump host
- Navigated to the affected Git repository
- Listed available stashed changes
- Identified the stash entry with identifier `stash@{1}`
- Applied the selected stash to restore the changes
- Verified the restored changes using Git status
- Staged and committed the restored changes
- Pushed the commit to the remote repository
- Verified the updated commit history

---

## Commands Used

```bash
# Login to Storage Server
ssh natasha@ststor01

# Navigate to the repository
cd /usr/src/kodekloudrepos/official

# List available stashes
git stash list

# Apply the required stash
git stash apply stash@{1}

# Check repository status
git status

# Stage restored changes
git add .

# Commit restored changes
git commit -m "restore stash@{1}"

# Push changes to remote repository
git push origin main

# Verify commit history
git log --oneline
```

---

## Expected Outcome
- Stashed changes from stash@{1} are restored in the working tree
- Restored changes are committed to the repository
- Changes are successfully pushed to the remote main branch
- Repository history reflects the new commit

---

## Key Learnings
- `git stash` temporarily saves uncommitted changes without creating a commit
- `git stash list` displays all available stashes
- `git stash apply` restores stashed changes but keeps them in the stash list
- `git stash pop` restores stashed changes and removes them from the stash list
- Restored changes must be committed before pushing to a remote repository
- Git stash is useful for switching context without losing work
