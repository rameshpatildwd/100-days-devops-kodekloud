# Day 49 – Deploy Applications with Kubernetes Deployments

## Task / Requirement
The DevOps team is using Kubernetes Deployments to manage application lifecycle and ensure reliability. As part of this task, a Deployment needs to be created to run an Nginx application.

The requirement is to create a Kubernetes Deployment using the `nginx:latest` image with the correct deployment name.

**Requirement details:**
- Deployment name: `nginx`
- Image: `nginx:latest`
- Kubernetes access: `kubectl` is pre-configured on jump host

---

## Steps Performed
- Used `kubectl` to create a Deployment
- Specified the deployment name explicitly
- Used the `nginx:latest` image with tag
- Verified that the Deployment was created successfully
- Confirmed that the corresponding Pod was running

---

## Commands Used

```bash
# Create nginx deployment
kubectl create deployment nginx --image=nginx:latest

# Verify deployment
kubectl get deployments

# Verify pods created by deployment
kubectl get pods

# Describe deployment for details
kubectl describe deployment nginx
```
---

## Expected Outcome
- Deployment named `nginx` is created successfully
- Deployment uses the `nginx:latest` image
- At least one Pod is created and managed by the Deployment
- Pod reaches the `Running` state
- Deployment details are visible using `kubectl` commands

---

## Key Learnings
- A Deployment manages Pods declaratively in Kubernetes
- Deployments ensure desired state and handle Pod recreation automatically
- Kubernetes supports two ways of creating resources: **imperative** and **declarative**
- Imperative method uses direct commands (e.g., `kubectl create deployment`) for quick actions
- Declarative method uses YAML manifests applied via `kubectl apply`
- Declarative approach is preferred for production as it is version-controlled and repeatable
- Deployments use ReplicaSets internally to manage Pods
- Pods created by Deployments should not be managed directly
- Kubernetes Deployments are preferred over standalone Pods for long-running applications
