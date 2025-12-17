# Day 4: Script Execution Permissions

## Task / Requirement
In order to automate backup processes, a bash script named `xfusioncorp.sh` was deployed on App Server 1, but it did not have executable permissions.  
Grant executable permissions to `/tmp/xfusioncorp.sh` on App Server 1 and ensure that all users can execute the script.

**Requirement details:**
- Server: App Server 1
- Script path: `/tmp/xfusioncorp.sh`
- Access: All users should be able to execute the script

---

## Steps Performed
- Logged into App Server 1 from the jump server using SSH
- Navigated to the `/tmp` directory
- Updated the script permissions to allow read and execute access for all users
- Verified the updated permissions
- Confirmed successful execution of the script

---

## Commands Used
```bash
# Login to App Server 1
ssh username@appserver01

# Navigate to script location
cd /tmp

# Grant read and execute permissions to all users
sudo chmod 555 xfusioncorp.sh
# OR
sudo chmod a+rx xfusioncorp.sh

# Verify permissions
ls -l xfusioncorp.sh

# Execute the script
./xfusioncorp.sh
```

---

## Key Learnings

- Scripts require both read and execute permissions to run correctly
- Using chmod a+rx follows the principle of least privilege
- Avoid using overly permissive modes like 777 in production environments
- Always verify file permissions before and after making changes

---