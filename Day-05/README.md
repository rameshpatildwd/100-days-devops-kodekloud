# Day 5: SElinux Installation and Configuration

## Task / Requirement
Following security audits, the system administration team decided to introduce SELinux for improved security.  
For testing purposes, SELinux needed to be installed and permanently disabled on App Server 2 without rebooting the server.

**Requirement details:**
- Server: App Server 2
- Action: Install required SELinux packages
- Configuration: Permanently disable SELinux
- Reboot: Not required at this stage

---

## Steps Performed
- Logged into App Server 2 from the jump server using SSH
- Installed the required SELinux packages
- Edited the SELinux configuration file to disable SELinux permanently
- Ensured no reboot was performed as per the requirement

---

## Commands Used
```bash
# Login to App Server 2
ssh username@appserver02

# Install SELinux packages
sudo yum install -y selinux-policy selinux-policy-targeted policycoreutils

# Edit SELinux configuration
sudo vi /etc/selinux/config

# Update the following parameter
SELINUX=disabled
```

---

## Key Learnings
- SELinux can be managed temporarily using runtime commands or permanently via configuration files
- `setenforce` affects the current runtime state and does not persist across reboots
- Changes made in `/etc/selinux/config` take effect only after a system reboot
- Permanent SELinux changes should be planned around maintenance windows

---