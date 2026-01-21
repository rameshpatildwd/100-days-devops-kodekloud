# Day 34 – Git Hook (Post-Update)

## Task / Requirement
The development team wants to automate release tagging whenever changes are pushed to the `master` branch. This must be done using a Git hook so that tags are created automatically on the central repository without manual intervention.

The requirement is to merge the `feature` branch into `master`, configure a `post-update` hook on the bare repository, and ensure that every push to `master` creates a release tag in the format `release-YYYY-MM-DD` based on the current date.

**Requirement details:**
- Server: Storage Server (`ststor01`)
- User: `natasha`
- Bare repository path: `/opt/games.git`
- Working repository path: `/usr/src/kodekloudrepos/games`
- Branch to monitor: `master`
- Hook type: `post-update`
- Tag format: `release-YYYY-MM-DD`
- Constraint: Do not change repository or directory permissions

---

## Steps Performed
- Logged into the Storage Server as user `natasha`
- Navigated to the working Git repository
- Verified available branches
- Switched to the `master` branch
- Merged the `feature` branch into `master`
- Identified the internal reference name for the `master` branch
- Navigated to the hooks directory of the bare repository
- Created a `post-update` hook from the sample hook
- Implemented logic to:
  - Detect pushes to `refs/heads/master`
  - Generate a release tag using the current date
- Made the hook executable
- Pushed changes to the remote repository to trigger the hook
- Verified that the release tag was created successfully

---

## Commands Used

```bash
# Login to Storage Server
ssh natasha@ststor01

# Navigate to working repository
cd /usr/src/kodekloudrepos/games

# Verify branches
git branch

# Switch to master branch
git checkout master

# Merge feature branch into master
git merge feature

# Noted the refname for master branch
git for-each-ref

# Navigate to bare repository hooks directory
cd /opt/games.git/hooks

# Create post-update hook
cp post-update.sample post-update
vi post-update

#copy the script from post-update file, save and exit

# Make hook executable
chmod +x post-update

# Push changes to trigger hook
cd /usr/src/kodekloudrepos/games
git push origin master

# Fetch and verify tags
git fetch --tags
git tag
```

---

## Expected Outcome
- `feature branch` is merged into `master`
- A `post-update` hook exists in the bare repository
- Every push to the `master` branch automatically creates a `release` tag
- Tag name follows the format `release-YYYY-MM-DD`
- Tags are visible after fetching from the remote repository

---

## Key Learnings
- `Git hooks` automate actions in response to Git events
- `post-update` is a server-side hook triggered after a successful push
- Branch names map to internal references like `master` = `refs/heads/master`
- Hooks must be executable to function correctly
- Bare repositories are the correct place for server-side hooks
- Automated tagging improves release consistency and traceability