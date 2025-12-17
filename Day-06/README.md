# Day 6: Create a Cron Job

## Task / Requirement
To test automation readiness, the system administration team required a sample cron job to be configured on all app servers in the Stratos Datacenter.  
Install the required cron packages and configure a cron job for the root user.

**Requirement details:**
- Servers: App Server 1, App Server 2, App Server 3
- Package: `cronie`
- Service: `crond`
- Schedule: Every 5 minutes
- Command: `echo hello > /tmp/cron_text`
- User: `root`

---

## Steps Performed
- Logged into each app server from the jump server using SSH
- Installed the `cronie` package
- Started and enabled the `crond` service
- Added a cron job for the root user
- Verified that the cron job was configured correctly

---

## Commands Used
```bash
# Login to the app server
ssh username@appserver01

# Install cron package
sudo yum install -y cronie

# Start and enable cron service
sudo systemctl start crond
sudo systemctl enable crond

# Edit root user's crontab
sudo crontab -e

# Add the following cron entry
*/5 * * * * echo hello > /tmp/cron_text

# Verify cron configuration
sudo crontab -l
```

---

## Key Learnings

- Cron jobs are used to automate recurring tasks on Linux systems
- Root cron jobs must be configured using `sudo crontab -e`
- The `crond` service must be running for cron jobs to execute
- Cron runs with a minimal environment, so using absolute paths is a good practice
- Verifying cron jobs helps ensure scheduled tasks are working as expected

---