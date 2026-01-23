# Day 45 – Resolve Dockerfile Issues

## Task / Requirement
The DevOps team encountered errors while building a Docker image due to issues in an existing Dockerfile. The task is to identify and fix the Dockerfile so that the image builds successfully.

**Constraints:**
- Do not change the base image
- Do not modify existing data files (e.g., `index.html`, certificates)
- Fix only the Dockerfile syntax or instruction usage
- Dockerfile location: `/opt/docker/Dockerfile`
- Server: Application Server 1 (`stapp01`)

---

## Issue Identified
- The Dockerfile was using `IMAGE` instruction instead of `FROM` instruction for base image
- The Dockerfile incorrectly used `ADD` instructions with shell commands.
- `ADD` is meant for copying files, not executing commands.
- Shell commands like `sed` must be executed using `RUN`.

---

## Fix Applied
- Replaced invalid `ADD` instructions with `RUN` instructions.
- Preserved the base image and all existing data/configurations.
- Ensured Apache configuration changes are applied during image build.

---

## Commands Used

```bash
# Login to Application Server 1
ssh tony@stapp01

# Navigate to Dockerfile directory
cd /opt/docker/

# Build Docker image after fixing Dockerfile
docker build -t test .

# Verify image build
docker images
```
---

## Expected Outcome
- Docker image builds successfully without errors
- Apache listens on port 8080
- SSL-related Apache modules are enabled
- Certificate and key files are copied correctly
- Application content (index.html) is available in the container image

---

## Key Learnings
- `FROM` must be the first valid instruction in a Dockerfile
- `ADD` and `COPY` are used only for copying files into images
- `COPY` is preferred for simple file copying, while `ADD` supports additional features like URL downloads and archive extraction
- Shell commands must be executed using the `RUN` instruction
- Misusing Dockerfile instructions leads to build-time failures
- `CMD` provides default arguments for a container and can be overridden at runtime
- `ENTRYPOINT` defines the main command that always runs when the container starts
- `CMD` works best for flexible commands, while `ENTRYPOINT` is used for fixed executables
- Debugging Dockerfiles often involves understanding instruction intent