# Day 37 – Copy File to Docker Container

## Task / Requirement
The DevOps team needs to securely transfer confidential data from the Docker host to a running container on the application server.

The requirement is to copy an encrypted file from the host system into a specific directory inside the container without modifying the file.

**Requirement details:**
- Server: Application Server 2 (`stapp02`)
- Container name: `ubuntu_latest`
- Source file (host): `/tmp/nautilus.txt.gpg`
- Destination path (container): `/home/`
- Constraint: File must not be modified during transfer

---

## Steps Performed
- Verified that the target Docker container was running
- Copied the encrypted file from the Docker host into the container
- Verified that the file exists inside the container at the specified location

---

## Commands Used

```bash
#Verify target docker container is running
docker ps

# Copy encrypted file from Docker host to container
docker cp /tmp/nautilus.txt.gpg ubuntu_latest:/home/

# Verify file exists inside the container
docker exec ubuntu_latest ls /home/
```

---

## Expected Outcome
- File `nautilus.txt.gpg` is successfully copied into the container
- File is present at `/home/nautilus.txt.gpg` inside the container
- File size and contents remain unchanged
- Container continues running without interruption

---

## Key Learnings
- `docker cp` is used to copy files between the host and a running container
- Containers do not need to be stopped to copy files into them
- `docker exec` allows command execution inside a running container
- Docker supports secure file transfer without altering file contents
- `docker cp` preserves file content but does not preserve file ownership from the host
- Files copied using `docker cp` become owned by the container user (usually root)
- `docker cp` works in both directions (host → container and container → host)
- File paths inside the container must already exist for the copy to succeed
