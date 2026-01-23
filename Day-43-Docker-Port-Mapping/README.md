# Day 43 – Docker Port Mapping

## Task / Requirement
The DevOps team needs to deploy an application using an Nginx container and make it accessible through a specific port on the host machine.

The requirement is to pull the required image, run a container, and map a host port to the container’s HTTP port while keeping the container running.

**Requirement details:**
- Server: Application Server 2 (`stapp02`)
- Image: `nginx:stable`
- Container name: `cluster`
- Host port: `8088`
- Container port: `80`
- Container state: Running

---

## Steps Performed
- Logged into Application Server 2
- Pulled the `nginx:stable` Docker image
- Verified that the image was downloaded successfully
- Created and started an Nginx container in detached mode
- Mapped host port `8088` to container port `80`
- Verified that the container was running
- Tested access to the Nginx service using curl

---

## Commands Used

```bash
# Login to Application Server 2
ssh steve@stapp02

# Pull nginx stable image
docker pull nginx:stable

# List Docker images
docker images

# Run nginx container with port mapping
docker run -d -p 8088:80 --name cluster nginx:stable

# Verify running containers
docker ps

# Test nginx service via host port
curl http://localhost:8088
```

---

## Expected Outcome
- Docker image `nginx:stable` is available locally
- Container named `cluster` is created and running
- `Host port 8088` is mapped to `container port 80`
- Nginx service is accessible via `http://localhost:8088`
- Container remains running without errors

---

## Key Learnings
- Port mapping allows external access to containerized services
- `-p host_port:container_port` defines port forwarding rules
- Nginx listens on port 80 inside the container by default
- Containers can expose services without modifying application code
- `docker ps` confirms container runtime state