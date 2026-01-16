# Day 24 – Git Create Branches

## Task / Requirement
The Nautilus development team wants to introduce new features while keeping the existing codebase stable. To support this, a new Git branch must be created from the `master` branch without making any code changes.

**Requirement details:**
- Server: Storage Server (`ststor01`)
- Repository path: `/usr/src/kodekloudrepos/official`
- Source branch: `master`
- New branch: `xfusioncorp_official`
- Constraint: Do **not** modify any code

---

## Steps Performed
- Logged into the Storage Server from the jump host
- Navigated to the existing Git repository
- Ensured the repository was on the `master` branch
- Created a new branch from the `master` branch
- Verified that the new branch was created successfully

---

## Commands Used

```bash
# Login to Storage Server
ssh natasha@ststor01

# Navigate to the repository
cd /usr/src/kodekloudrepos/official

# Switch to master branch
git checkout master

# Create new branch from master
git branch xfusioncorp_official

# Verify branches
git branch
```

---

## Expected Outcome
- A new branch named xfusioncorp_official exists in the repository
- The branch is created from the master branch
- No code or repository content is modified

---

## Key Learnings
- Git branches allow parallel development without affecting the main codebase
- Creating a branch does not modify files or commit history
- New branches are created from the currently checked-out branch
- git branch can be used to both create and list branches