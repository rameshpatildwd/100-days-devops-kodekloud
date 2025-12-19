# Day 9: MariaDB Troubleshooting

## Task / Requirement
There was a critical issue in the Nautilus application where the application was unable to connect to the database.  
The production support team identified that the `mariadb` service was down on the database server.

Investigate the issue and restore the MariaDB service on the database server in the Stratos Datacenter.

**Requirement details:**
- Server: Database Server
- Service: MariaDB
- Issue: Service down / application unable to connect to database
- Goal: Restore database connectivity by fixing the MariaDB service

---

## Steps Performed
- Logged into the database server from the jump host
- Checked the MariaDB service status and confirmed it was in a failed state
- Investigated the MariaDB data directory
- Identified that the required data directory `/var/lib/mysql` was missing
- Created the missing data directory
- Fixed ownership of the directory to the `mysql` user
- Restarted the MariaDB service
- Verified that the database service was running successfully

---

## Commands Used
```bash
# Check MariaDB service status
systemctl status mariadb

# Check if MariaDB data directory exists
ls -ld /var/lib/mysql

# Create the data directory if missing
sudo mkdir /var/lib/mysql

# Set correct ownership for MariaDB
sudo chown -R mysql:mysql /var/lib/mysql

# Start MariaDB service
sudo systemctl start mariadb

# Verify service status
systemctl status mariadb

# Validate database access
sudo mysql
```

---

## Key Learnings

- MariaDB requires /var/lib/mysql as its data directory to store database files
- If the data directory is missing or incorrectly owned, MariaDB fails to start
- Always verify required filesystem paths when a service fails silently
- Fixing the root cause is more effective than reinstalling or restarting blindly
- In production, the database data directory contains critical data, and its absence can result in data loss
- In production environments, the MariaDB data directory contains critical application data and must be restored from backups or mounts if missing

---
