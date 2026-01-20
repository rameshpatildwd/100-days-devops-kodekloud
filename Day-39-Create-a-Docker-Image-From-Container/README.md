# Day 39 – Create a Docker Image From Container

## Task / Requirement
A developer made changes inside a running container and wants to preserve those changes as a reusable Docker image. The DevOps team is required to create a new Docker image from the existing container.

**Requirement details:**
- Server: Application Server 1 (`stapp01`)
- Source container: `ubuntu_latest`
- New image name: `ecommerce:devops`

---

## Steps Performed
- Logged into Application Server 1
- Verified that the target container was running
- Identified the container ID of `ubuntu_latest`
- Created a new Docker image from the running container
- Verified that the new image was created successfully

---

## Commands Used

```bash
# Login to Application Server 1
ssh tony@stapp01

# Verify running containers
docker ps

# Create a new image from the running container
# docker commit CONTAINER REPOSITORY:TAG
docker commit 7e373497140d ecommerce:devops

# Verify newly created image
docker images
```
---

## Expected Outcome
- A new Docker image named `ecommerce:devops` is created
- The image contains the current state of the `ubuntu_latest` container
- The image is available locally for reuse or deployment
- Original container remains unchanged and running

---

## Key Learnings
- `docker commit` creates a new image from a container’s current state
- Container changes can be preserved without rebuilding an image
- The new image includes filesystem changes made inside the container
- `docker images` is used to verify newly created images
- `docker commit` is useful for quick backups or debugging, but not a replacement for Dockerfiles
- `docker commit` needs to be executed from docker host