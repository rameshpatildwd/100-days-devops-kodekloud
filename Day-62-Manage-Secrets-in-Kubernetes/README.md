# Day 62 – Manage Secrets in Kubernetes

## Task / Requirement
Some applications require sensitive information such as passwords or license keys to be stored securely. The Nautilus DevOps team decided to use Kubernetes Secrets to manage such data inside the cluster.

Create a Kubernetes secret from an existing file and consume it inside a pod by mounting it as a volume.

**Requirement details:**
- Secret name: `news`
- Source file: `/opt/news.txt` (on jump host)
- Pod name: `secret-xfusion`
- Container name: `secret-container-xfusion`
- Image: `ubuntu:latest`
- Secret mount path inside container: `/opt/demo`
- Pod should remain in running state for verification

---

## Steps Performed
- Verified the contents of the secret file present on the jump host
- Created a generic Kubernetes secret using the file containing sensitive data: `kubectl create secret generic news --from-file=news.txt`
- Confirmed that the secret was created successfully in the cluster: `kubectl get secrets`
- Defined a pod configuration to consume the secret
- Configured the pod to mount the secret as a volume inside the container
- Used a sleep command to keep the container running
- Applied the pod configuration to the cluster
- Verified that the pod reached the running state
- Executed into the container to confirm the secret was accessible at the mounted path

---

## Expected Outcome
- A Kubernetes secret named `news` exists in the cluster
- The pod `secret-xfusion` is in running state
- The secret is mounted inside the container at `/opt/demo`
- The secret file is readable from within the container at the mounted location

---

## Key Learnings
- Kubernetes Secrets provide a secure way to store sensitive information
- Secrets can be created directly from files using Kubernetes commands
- Secrets can be mounted into pods as volumes
- Mounting secrets avoids hardcoding sensitive data into container images
- Verifying secrets inside running pods ensures correct configuration
