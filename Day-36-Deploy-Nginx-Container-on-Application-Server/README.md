# Day 36 – Deploy Nginx Container on Application Server

## Task / Requirement
The DevOps team needs to validate container-based application deployments by running an Nginx container on the application server.

The requirement is to deploy an Nginx container using the Alpine image, ensure it is running, and expose it on the default HTTP port.

**Requirement details:**
- Server: Application Server 2 (`stapp02`)
- Container name: `nginx_2`
- Image: `nginx:alpine`
- Container state: Running

---

## Steps Performed
- Logged into Application Server 2
- Pulled the Nginx Alpine image (automatically during container run)
- Created and started an Nginx container in detached mode
- Exposed container port 80 to host port 80
- Verified that the container image exists locally
- Verified that the container is running

---

## Commands Used

```bash
# Login to Application Server 2
ssh steve@stapp02

# Run nginx container using alpine image
docker run -d -p 80:80 --name nginx_2 nginx:alpine

# List available Docker images
docker images

# Verify running containers
docker ps
```

---

## Expected Outcome
- Docker container named `nginx_2` is created
- Nginx Alpine image is present locally
- Container is running in detached mode
- Port 80 is exposed and mapped correctly
- Nginx service is accessible through the container

---

## Key Learnings
- Containers can be started directly using `docker run`
- `-d` runs the container in detached mode
- `--name` assigns a custom name to the container
- Port mapping (`-p 80:80`) maps **host port 80** to **container port 80**, allowing access to the containerized service from outside
- Lightweight images like `nginx:alpine` are suitable for fast deployments
- `docker ps` is used to verify running containers
