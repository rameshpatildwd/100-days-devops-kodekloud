# Day 21 – Set Up Git Repository on Storage Server

## Task / Requirement
The Nautilus development team requested the setup of a centralized Git repository on the Storage Server to support a new application development project.

The requirement is to install Git and create a **bare Git repository** with an exact name and path.

**Requirement details:**
- Server: Storage Server (`ststor01`)
- Package: Git
- Repository type: Bare repository
- Repository path: `/opt/beta.git`

---

## Steps Performed
- Logged into the Storage Server from the jump host
- Installed Git using the system package manager
- Verified Git installation
- Created the required directory for the repository
- Initialized a bare Git repository at the specified location
- Verified that the repository structure was created successfully

---

## Commands Used

```bash
# Login to Storage Server
ssh natasha@ststor01

# Install Git
sudo yum install -y git

# Verify Git installation
git --version

# Create directory for bare repository
sudo mkdir -p /opt/beta.git

# Navigate to repository directory
cd /opt/beta.git

# Initialize bare Git repository
sudo git init --bare

# Verify repository structure
ls -al
```

---

## Key Learnings
- Non-bare Git repositories include a working directory and a hidden `.git/` folder containing metadata
- Bare Git repositories contain only Git metadata (`HEAD`, `objects`, `refs`, `hooks`) and no working tree
- `git init` creates a non-bare repository by default
- `git init --bare` creates a bare repository
- Bare repositories are used as centralized or shared remote repositories
- Pushing to a non-bare repository on a shared server can cause branch and working tree conflicts
- Repository type can be verified using `git config --get core.bare`
- Bare repositories do not allow file edits or branch checkouts

