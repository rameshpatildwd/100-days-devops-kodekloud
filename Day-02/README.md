# Day 2: Temporary User Setup with Expiry

## Task / Requirement
As part of a temporary assignment, a developer required access for a limited duration on App Server 3.  
Create a user named `javed` on App Server 3 with an expiry date set to `2024-04-15`.

**Requirement details:**
- Username: `javed` (lowercase)
- Server: App Server 3
- Account expiry date: `2024-04-15`

---

## Steps Performed
- Logged into App Server 3 from the jump server using SSH
- Created a temporary user named `javed` with an account expiry date
- Verified the account expiry configuration to ensure it was set correctly

---

## Commands Used
```bash
# Login to App Server 3
ssh username@appserver03

# Create user with expiry date
sudo useradd -e 2024-04-15 javed

# Verify account expiry details
sudo chage -l javed
```

---

## Key Learnings
- Temporary user access can be controlled using account expiry dates
- The `useradd -e` option helps enforce time-bound access without manual intervention
- `chage -l` is useful for validating password and account aging information
- Account expiry disables login access but does not automatically delete the user

---