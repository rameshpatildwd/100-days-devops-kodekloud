# Day 26 – Git Manage Remotes

## Task / Requirement
The DevOps team needs to update Git remotes for an existing project repository. A new remote repository has been added on the Git server, and the local repository must be updated to push changes to this new remote.

**Requirement details:**
- Server: Storage Server (`ststor01`)
- Local repository: `/usr/src/kodekloudrepos/games`
- New remote name: `dev_games`
- New remote URL: `/opt/xfusioncorp_games.git`
- Branch to update: `master`
- File to add: `/tmp/index.html`

---

## Steps Performed
- Logged into the Storage Server from the jump host
- Navigated to the existing local Git repository
- Verified existing Git remotes
- Added a new Git remote pointing to the specified repository
- Copied the provided file into the local repository
- Added and committed the file on the master branch
- Pushed the master branch to the newly added remote

---

## Commands Used

```bash
# Login to Storage Server
ssh natasha@ststor01

# Navigate to the repository
cd /usr/src/kodekloudrepos/games

# Verify existing Git remotes
git remote -v

# Add new remote
git remote add dev_games /opt/xfusioncorp_games.git

# Verify new remote is added
git remote -v

# Copy index.html into repository
cp /tmp/index.html .

# Stage the file
git add index.html

# Commit the change
git commit -m "Add index.html"

# Push master branch to new remote
git push dev_games master
```

---

## Expected Outcome
- A new Git remote named `dev_games` is added to the repository
- `index.html` is committed to the master branch
- Master branch is successfully pushed to `/opt/xfusioncorp_games.git`
- Local repository remains unchanged apart from the committed file

---

## Key Learnings
- Git remotes define where repository changes are pushed or pulled from
- Multiple remotes can exist for a single Git repository
- git remote add is used to configure new remotes
- Changes must be committed before they can be pushed
- Branches can be pushed to any configured remote