# Day 25 – Git Branch, Commit, Merge, and Push Workflow

## Task / Requirement
The development team requested a complete Git workflow to introduce a new file using a feature branch and merge it back into the master branch.

The task is to create a new branch, add and commit a file, merge the changes into `master`, and push both branches to the remote repository.

**Requirement details:**
- Server: Storage Server (`ststor01`)
- Repository path: `/usr/src/kodekloudrepos/beta`
- New branch: `devops`
- Source branch: `master`
- File to add: `/tmp/index.html`
- Remote: `origin`

---

## Steps Performed
- Logged into the Storage Server from the jump host
- Navigated to the existing Git repository
- Created a new branch from the master branch
- Switched to the new branch
- Copied the provided file into the repository
- Added and committed the file in the new branch
- Switched back to the master branch
- Merged the feature branch into master
- Pushed both branches to the remote repository

---

## Commands Used

```bash
# Login to Storage Server
ssh natasha@ststor01

# Navigate to the repository
cd /usr/src/kodekloudrepos/beta

# Verify existing branches
git branch

# Create new branch from master
git branch devops

# Switch to new branch
git checkout devops

# Copy index.html into repository
cp /tmp/index.html .

# Stage changes
git add index.html

# Commit changes
git commit -m "Add index.html"

# Switch back to master branch
git checkout master

# Merge devops branch into master
git merge devops

# Push devops branch to origin
git push origin devops

# Push master branch to origin
git push origin master
```

---

## Expected Outcome
- A new branch named `devops` exists
- `index.html` is added and committed in the repository
- Changes from devops are merged into master
- Both devops and master branches are pushed to the remote repository

---

## Key Learnings
- Feature branches allow isolated development before merging into master
- Files must be added and committed before they can be merged
- Merging integrates branch changes into the target branch
- Explicitly pushing branches ensures changes are available in the remote repository
- Avoid using sudo with Git to prevent permission issues