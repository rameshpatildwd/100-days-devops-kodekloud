# Day 22 – Clone Git Repository on Storage Server

## Task / Requirement
The DevOps team previously created a Git repository that is now required by the application development team. The task is to clone this existing repository on the Storage Server without modifying the source repository or changing permissions on any directories.

**Requirement details:**
- Server: Storage Server (`ststor01`)
- User: `natasha`
- Source repository: `/opt/official.git`
- Target directory: `/usr/src/kodekloudrepos/official`
- Constraint: Do **not** modify repository content or directory permissions

---

## Steps Performed
- Logged into the Storage Server from the jump host as the `natasha` user
- Verified that the source Git repository exists at the specified location
- Verified that the destination parent directory exists
- Cloned the Git repository from the local filesystem path to the required destination
- Verified that the repository was cloned successfully

---

## Commands Used

```bash
# Login to Storage Server
ssh natasha@ststor01

# Verify source repository exists
ls /opt/official.git/

# Verify destination parent directory exists
ls -ld /usr/src/kodekloudrepos

# Clone the Git repository to the required location
git clone /opt/official.git /usr/src/kodekloudrepos/official

# Verify cloned repository
ls /usr/src/kodekloudrepos/official
```

---

## Expected Outcome
- Git repository from /opt/official.git is successfully cloned
- The cloned repository exists at: `/usr/src/kodekloudrepos/official`

---

## Key Learnings
- `git clone` creates a complete local copy of an existing Git repository
- Cloning copies all branches, commit history, and repository metadata
- Git repositories can be cloned from local filesystem paths, not just remote URLs
- Cloning a repository does not modify the source repository
- Bare repositories are commonly used as clone sources on servers
- Verifying source and destination paths helps avoid accidental overwrites
