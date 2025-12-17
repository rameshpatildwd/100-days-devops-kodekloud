# Day 3: Secure Root SSH Access

## Task / Requirement
Following a security audit, direct SSH login for the root user needed to be disabled on all app servers in the Stratos Datacenter.

Disable direct SSH root login on all app servers.

**Requirement details:**
- Servers: App Server 1, App Server 2, App Server 3
- Configuration: Disable root login over SSH

---

## Steps Performed
- Logged into each app server from the jump server using SSH
- Edited the SSH daemon configuration file
- Updated the configuration to disallow root login
- Restarted the SSH service to apply the changes

---

## Commands Used
```bash
# Login to the app server
ssh username@appserver01

# Edit SSH configuration
sudo vi /etc/ssh/sshd_config

# Update the following parameter
PermitRootLogin no

# Restart SSH service
sudo systemctl restart sshd
```

---

## Key Learnings
- Disabling direct root SSH login is a fundamental security hardening practice
- Administrative access should be performed using normal users with sudo privileges
- SSH configuration changes require a service restart or reload to take effect
- Always ensure at least one sudo-enabled user exists before disabling root SSH access

---