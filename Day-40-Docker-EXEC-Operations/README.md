# Day 40 – Docker EXEC Operations

## Task / Requirement
A DevOps team member was configuring services inside a running Docker container but is unavailable to complete the work. The remaining task is to install and configure Apache inside the container and ensure the service is running correctly.

The requirement is to install Apache inside the running container, change the listening port, and keep the container running with Apache active.

**Requirement details:**
- Server: Application Server 3 (`stapp03`)
- Container name: `kkloud`
- Web server: Apache (`apache2`)
- Apache port: `5001`
- Constraint: Apache must listen on all interfaces, not a specific IP

---

## Steps Performed
- Logged into Application Server 3
- Verified that the `kkloud` container was running
- Accessed the running container shell
- Installed Apache using the package manager
- Updated Apache configuration to listen on port `5001`
- Updated the virtual host configuration to match the new port
- Restarted the Apache service inside the container
- Verified that Apache was running
- Tested Apache locally inside the container
- Ensured the container remained in a running state

---

## Commands Used

```bash
# Login to Application Server 3
ssh banner@stapp03

# Verify running containers
docker ps

# Access the running container
docker exec -it kkloud bash

# Install Apache inside the container
apt install -y apache2

# Navigate to Apache configuration directory
cd /etc/apache2/

# Update Apache to listen on port 5001
sed -i 's/Listen 80/Listen 5001/' ports.conf

# Verify updated listening port
grep Listen ports.conf

# Update virtual host to use port 5001
sed -i 's/<VirtualHost \*:80>/<VirtualHost *:5001>/' sites-enabled/000-default.conf

# Restart Apache service
service apache2 restart

# Verify Apache service status
service apache2 status

# Verify Apache processes
ps -ef | grep apache2

# Test Apache locally inside container
curl http://localhost:5001
```

---

## Expected Outcome
- Apache is installed inside the kkloud container
- Apache listens on port 5001 on all interfaces
- Apache service is running successfully inside the container
- Container remains in a running state
- Apache responds to requests on `http://localhost:5001`

---

## Key Learnings
- `docker exec` allows executing commands inside a running container
- Services can be installed and configured inside containers at runtime
- Apache listening ports are controlled via `ports.conf`
- `Virtual host` configuration must match the `listening port`
- Containers remain running as long as their main process is active
- Runtime container changes are not persistent unless committed to an image