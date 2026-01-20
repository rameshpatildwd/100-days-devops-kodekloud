# Day 38 – Pull Docker Image

## Task / Requirement
The DevOps team needs to prepare a containerized environment for application testing. As part of this preparation, a specific Docker image must be pulled and re-tagged for local usage.

The requirement is to pull the `busybox:musl` image and create a new local tag for the same image.

**Requirement details:**
- Server: Application Server 2 (`stapp02`)
- Image to pull: `busybox:musl`
- New tag to create: `busybox:local`

---

## Steps Performed
- Logged into Application Server 2
- Pulled the `busybox:musl` image from Docker Hub
- Verified that the image was downloaded successfully
- Created a new local tag `busybox:local` for the same image
- Verified that both tags point to the same image ID

---

## Commands Used

```bash
#Login to app02 from Jump host
ssh steve@stapp02

# Pull busybox image with musl tag
docker pull busybox:musl

# List available Docker images
docker images

# Create a new local tag for the image
docker tag busybox:musl busybox:local

# Verify image tags
docker images
```

---

## Expected Outcome
- Docker image `busybox:musl` is available locally
- A new tag `busybox:local` is created
- Both tags reference the same image ID
- No duplicate image data is created

---

## Key Learnings
- `docker pull` downloads images from a container registry
- Docker images can have multiple tags pointing to the same image ID
- `docker tag` creates a new reference without duplicating the image
- Re-tagging images is useful for local testing and version management
- Image verification helps confirm successful tagging