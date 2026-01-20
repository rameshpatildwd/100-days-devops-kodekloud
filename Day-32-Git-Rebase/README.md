# Day 32 – Git Rebase

## Task / Requirement
The development team is working on a feature branch while new commits have already been pushed to the `master` branch. To keep the feature branch up to date without introducing a merge commit, the requirement is to rebase the feature branch on top of the latest `master` branch.

After rebasing, the updated feature branch must be pushed to the remote repository.

**Requirement details:**
- Server: Storage Server (`ststor01`)
- Repository: `/usr/src/kodekloudrepos/games`
- Source branch: `master`
- Target branch: `feature`
- Action: Rebase feature branch onto master
- Constraint: Do not lose feature branch changes
- Push required after rebase

---

## Steps Performed
- Logged into the Storage Server from the jump host
- Navigated to the cloned Git repository
- Verified that the current branch is `feature`
- Reviewed the existing commit history
- Fetched the latest changes from the remote repository
- Rebased the feature branch on top of the updated master branch
- Verified that the feature commits were replayed correctly
- Pushed the rebased feature branch to the remote repository
- Verified the updated commit history

---

## Commands Used

```bash
# Login to Storage Server
ssh natasha@ststor01

# Navigate to the repository
cd /usr/src/kodekloudrepos/games

# Verify current branch (should be on feature branch)
git branch

# View commit history
git log --oneline

# Fetch latest changes from remote
git fetch origin

# Rebase feature branch onto master
git rebase origin/main

# Verify repository status
git status

# Verify commit history after rebase
git log --oneline

# Push rebased feature branch to remote
git push origin feature --force

# Verify final commit history
git log --oneline
```

---

## Expected Outcome
- Feature branch contains all its original changes
- Feature branch is rebased on top of the latest master branch
- No merge commit is created
- Commit history is linear and clean
- Updated feature branch is pushed to the remote repository

---

## Key Learnings
- `git rebase` reapplies commits from one branch on top of another branch
- Rebase keeps commit history linear by avoiding merge commits
- Rebasing does not remove feature branch changes
- Rebasing rewrites commit history
- A force push is required when rebased history already exists on the remote
- Rebase should be used carefully on shared branches
- `git merge` preserves history by creating a merge commit, while `git rebase` rewrites history for a cleaner, linear timeline
