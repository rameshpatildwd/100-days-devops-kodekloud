# Day 49 – Deploy Pods in Kubernetes

## Task / Requirement
The DevOps team has started working with Kubernetes for application management. As part of the initial Kubernetes setup, a basic Pod needs to be created using the `httpd` image.

The requirement is to deploy a Pod with a specific name, label, and container configuration using a Kubernetes manifest file.

**Requirement details:**
- Pod name: `pod-httpd`
- Container name: `httpd-container`
- Image: `httpd:latest`
- Label: `app=httpd_app`
- Kubernetes access: `kubectl` is pre-configured on jump host

---

## Steps Performed
- Created a Kubernetes Pod definition in `pod.yaml`
- Defined Pod metadata including name and labels
- Configured container name and image with explicit tag
- Applied the Pod manifest to the Kubernetes cluster
- Verified Pod creation and runtime status
- Inspected Pod details for validation

---

## Commands Used

```bash
# Apply the pod manifest
kubectl apply -f pod.yaml

# Verify pod status
kubectl get pods

# Describe pod for detailed information
kubectl describe pod pod-httpd
```
---

## Expected Outcome
- Pod named `pod-httpd` is created successfully
- Pod reaches the `Running` state
- Container `httpd-container` runs using `httpd:latest` image
- Pod is labeled with `app=httpd_app`
- Container listens on port `80`
- Pod details and events are visible using `kubectl` commands

---

## Key Learnings
- A Pod is the smallest deployable unit in Kubernetes
- Pods encapsulate one or more containers that share networking and storage
- Labels are used to organize and identify Kubernetes resources
- Kubernetes follows a declarative model using `YAML` manifests
- `kubectl apply` creates or updates resources in the cluster
- `kubectl get pods` provides a quick status overview
- `kubectl describe` helps troubleshoot and understand Pod behavior