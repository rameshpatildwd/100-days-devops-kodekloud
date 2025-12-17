# Day 1: Linux User Setup with Non-Interactive Shell

## Task / Requirement
The system administration team required the creation of a user account for a backup agent tool with a non-interactive shell on App Server 2.  
Create a user named `siva` with a non-interactive shell on App Server 2.

**Requirement details:**
- Username: `siva`
- Server: App Server 2
- Shell: Non-interactive (`/sbin/nologin`)

---

## Steps Performed
- Logged into App Server 2 from the jump server using SSH
- Created a user named `siva` with a non-interactive shell
- Verified that the user was created successfully with the correct shell assigned

---

## Commands Used
```bash
# Login to App Server 2
ssh username@appserver02

# Create non-interactive user
sudo useradd -s /sbin/nologin siva

# Verify user and shell
getent passwd siva
```

---

## Key Learnings
- System users should use non-interactive shells to block direct login access
- `/sbin/nologin` is the standard shell for service accounts
- Always validate user configuration after creation

---