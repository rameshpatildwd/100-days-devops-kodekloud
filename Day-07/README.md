# Day 7: Linux SSH Authentication

## Task / Requirement
The system administration team configured scripts on the jump host that run at regular intervals and perform operations on all app servers in the Stratos Datacenter.  
To enable these scripts, password-less SSH access is required from user `thor` on the jump host to all app servers through their respective sudo users.

Set up password-less authentication from user `thor` on the jump host to all app servers through their respective sudo users.

**Requirement details:**
- Source user: `thor`
- Source host: Jump Host
- Destination hosts: App Server 1, App Server 2, App Server 3
- Access type: Password-less SSH
- Target users: Respective sudo users on each app server (e.g., `tony` on App Server 1)

---

## Steps Performed
- Switched to user `thor` on the jump host
- Generated an SSH key pair for user `thor` (if not already present)
- Copied the public SSH key to the respective sudo users on all app servers
- Verified password-less SSH access from the jump host to each app server

---

## Commands Used
```bash
# Switch to thor user on jump host
su - thor

# Generate SSH key pair (if not already present)
ssh-keygen

# Copy public key to App Server 1 (example: user tony)
# Below command copies /home/thor/id_rsa.pub to authorized_keys of /home/tony/.ssh/
ssh-copy-id tony@appserver01

# Repeat for other app servers
ssh-copy-id user@appserver02
ssh-copy-id user@appserver03

# Verify password-less SSH access
ssh tony@appserver01
```

---

## Key Learnings
- Password-less SSH access is set up using SSH keys
- `ssh-copy-id` helps copy public keys to remote servers securely
- SSH login access and sudo permissions are configured separately
- Password-less SSH is required for automation and scheduled scripts

---