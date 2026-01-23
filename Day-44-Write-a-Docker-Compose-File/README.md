# Day 44 – Write a Docker Compose File

## Task / Requirement
The application development team wants to host static website content using a containerized Apache (httpd) web server. The setup must be done using Docker Compose to simplify container management.

The requirement is to define and run a container using a Docker Compose file, configure port mapping, and mount an existing host directory as a volume inside the container.

**Requirement details:**
- Server: Application Server 2 (`stapp02`)
- Docker Compose file path: `/opt/docker/docker-compose.yml`
- Image: `httpd:latest`
- Container name: `httpd`
- Host port: `6100`
- Container port: `80`
- Host volume: `/opt/dba`
- Container volume: `/usr/local/apache2/htdocs`
- Constraint: Do not modify data inside the mounted directories

---

## Steps Performed
- Logged into Application Server 2
- Navigated to the Docker Compose directory
- Created a Docker Compose file with required configuration
- Defined service using `httpd:latest` image
- Configured container name explicitly
- Configured port mapping between host and container
- Mounted host directory into the container as a volume
- Started the container using Docker Compose
- Verified that the container was running successfully

---

## Commands Used

```bash
# Login to Application Server 2
ssh steve@stapp02

# Navigate to docker compose directory
cd /opt/docker/

# Create docker-compose file
sudo vi docker-compose.yml

# Start services defined in docker-compose file
docker compose up -d

# Verify running containers
docker ps
```

---

## Expected Outcome
- Docker Compose file exists at `/opt/docker/docker-compose.yml`
- Container named `httpd` is created and running
- `Host port 6100` is mapped to `container port 80`
- Host directory `/opt/dba` is mounted into the container
- Apache serves content from the mounted directory
- Container remains running without errors

---

## Key Learnings
- `Docker Compose` is a tool used to define and run multi-container Docker applications using a YAML file
- Docker Compose simplifies container configuration compared to long docker run commands
- Services, networks, and volumes can be managed together in one file
- `docker compose up -d` creates and starts containers defined in the compose file
- `docker compose down` stops and removes containers created by the compose file
- Volumes in Docker Compose are defined under the volumes section of a service
- Volume mounting in Docker Compose works the same as -v in docker run
- Bind mounts allow containers to directly use host directories
- Explicit container naming avoids auto-generated container names
- Docker Compose improves consistency and repeatability across environments

