# Day 28 – Git Cherry Pick

## Task / Requirement
The development team is working with two branches in a Git repository: `master` and `feature`. One of the commits from the `feature` branch needs to be applied to the `master` branch without merging the entire branch.

The specific commit to be applied is identified by its commit message **“Update info.txt”**. After applying the commit, the changes must be pushed to the remote repository.

**Requirement details:**
- Server: Storage Server (`ststor01`)
- Repository: `/usr/src/kodekloudrepos/official`
- Source branch: `feature`
- Target branch: `master`
- Commit to cherry-pick: Commit with message `Update info.txt`
- Remote: `origin`

---

## Steps Performed
- Logged into the Storage Server from the jump host
- Navigated to the cloned Git repository
- Verified the available branches in the repository
- Identified the commit hash associated with the commit message `Update info.txt`
- Switched to the `master` branch
- Cherry-picked the specific commit from the `feature` branch into `master`
- Verified that the commit was successfully applied
- Pushed the updated `master` branch to the remote repository

---

## Commands Used

```bash
# Login to Storage Server
ssh natasha@ststor01

# Navigate to the repository
cd /usr/src/kodekloudrepos/official

# List available branches
git branch

# View commit history to identify required commit
git log --oneline

# Switch to master branch
git checkout master

# Cherry-pick the required commit
git cherry-pick <commit-hash>

# Verify commit history after cherry-pick
git log --oneline

# Push changes to remote repository
git push origin master
```

---

## Expected Outcome
- The commit with message Update info.txt is applied to the master branch
- Only the selected commit is merged, not the entire feature branch
- Commit history on master reflects the cherry-picked commit
- Changes are successfully pushed to the remote repository

---

## Key Learnings
- `git cherry-pick` is used to merge a specific commit from another branch to the current branch
- Cherry-picking is useful when only selected changes are needed
- Unlike merge, cherry-pick does not bring all commits from a branch
- Identifying the correct commit hash is critical before cherry-picking
- Cherry-picked changes must be pushed explicitly to the remote repository