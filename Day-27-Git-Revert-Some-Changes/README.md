# Day 27 – Git Revert Some Changes

## Task / Requirement
The development team reported an issue with the most recent commit pushed to a Git repository. To safely undo the changes without rewriting history, the requirement is to revert the latest commit and create a new revert commit.

**Requirement details:**
- Server: Storage Server (`ststor01`)
- Repository path: `/usr/src/kodekloudrepos/media`
- Action: Revert the latest commit (HEAD)
- Target: Previous commit (initial commit)
- Commit message: `revert media` (all lowercase)

---

## Steps Performed
- Logged into the Storage Server from the jump host
- Navigated to the affected Git repository
- Verified the existing commit history
- Reverted the latest commit using Git revert
- Provided the required commit message during the revert
- Verified that a new revert commit was created
- Confirmed repository state after the revert

---

## Commands Used

```bash
# Login to Storage Server
ssh natasha@ststor01

# Navigate to the repository
cd /usr/src/kodekloudrepos/media

# Verify repository contents
ls

# View commit history
git log --oneline

# Revert the latest commit
git revert HEAD
# Enter commit message: revert media, save & close

# Verify updated commit history
git log --oneline

# Verify repository contents after revert
ls
```
---

## Expected Outcome
- A new commit is created that reverts the changes from the latest commit
- Commit history now contains:
    - Initial commit
    - Faulty commit
    - Revert commit
- Repository state reflects the previous (stable) version
- No commit history is rewritten

---

## Key Learnings
- git revert safely undoes changes by creating a new commit
- Reverting does not remove commit history
- git revert HEAD targets the most recent commit
- Revert is preferred over reset for shared repositories