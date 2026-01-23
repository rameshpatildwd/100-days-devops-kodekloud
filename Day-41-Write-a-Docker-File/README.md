# Day 41 – Write a Dockerfile

## Task / Requirement
The application development team requires a custom Docker image for testing purposes. The image must be built using Ubuntu 24.04 as the base image and Apache must be configured to listen on a non-default port.

The requirement is to create a Dockerfile and build a custom image without modifying any Apache configuration other than the listening port.

**Requirement details:**
- Server: Application Server 1 (`stapp01`)
- Dockerfile path: `/opt/docker/Dockerfile`
- Base image: `ubuntu:24.04`
- Web server: Apache (`apache2`)
- Apache port: `3003`
- Constraint: Do not modify document root or other Apache settings

---

## Steps Performed
- Logged into Application Server 1
- Navigated to the Docker build directory
- Created a Dockerfile with Ubuntu 24.04 as the base image
- Installed Apache inside the image
- Updated Apache configuration to listen on port `3003`
- Exposed the required port
- Built the custom Docker image
- Verified that the image was created successfully

---

## Commands Used

```bash
# Login to Application Server 1
ssh tony@stapp01

# Navigate to Docker build directory
cd /opt/docker/

# Create Dockerfile
sudo vi Dockerfile

# Build the custom Docker image
docker build -t apache-ubuntu:24.04 .

# Verify Docker images
docker images
```
---

## Expected Outcome
- `Dockerfile` exists at `/opt/docker/Dockerfile`
- Custom Docker image is built successfully
- `Apache` is installed inside the image
- `Apache` is configured to listen on port 3003
- Image is available locally for container deployment

---

## Key Learnings
- `Dockerfiles` define the instructions for building custom images
- Base images provide the foundation for custom containers
- Apache listening ports can be changed without altering other configurations
- Docker images must run services in the foreground
- `docker build` creates reusable images from Dockerfiles