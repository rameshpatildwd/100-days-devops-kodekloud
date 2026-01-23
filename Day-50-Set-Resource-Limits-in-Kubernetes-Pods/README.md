# Day 50 – Set Resource Limits in Kubernetes Pods

## Task / Requirement
The DevOps team observed performance issues in Kubernetes-hosted applications due to uncontrolled resource usage. To prevent resource exhaustion and ensure fair scheduling, resource requests and limits need to be defined for a Pod.

The requirement is to create a Pod with explicit CPU and memory requests and limits.

**Requirement details:**
- Pod name: `httpd-pod`
- Container name: `httpd-container`
- Image: `httpd:latest`
- Resource requests:
  - Memory: `15Mi`
  - CPU: `100m`
- Resource limits:
  - Memory: `20Mi`
  - CPU: `100m`
- Kubernetes access: `kubectl` is pre-configured on jump host

---

## Steps Performed
- Created a Kubernetes Pod manifest with resource requests and limits
- Defined CPU and memory requests for scheduling
- Defined CPU and memory limits to cap resource usage
- Applied the Pod manifest to the Kubernetes cluster
- Verified Pod creation and runtime status
- Inspected Pod details to confirm resource configuration

---

## Commands Used

```bash
# Apply the pod manifest with resource limits
kubectl apply -f resource-limits.yaml

# Verify pod status
kubectl get pods

# Describe pod to verify resource configuration
kubectl describe pod httpd-pod
```

---

## Expected Outcome
- Pod `httpd-pod` is created successfully
- Container `httpd-container` runs using `httpd:latest`
- Pod is scheduled based on defined resource requests
- Container resource usage is capped by defined limits
- Resource configuration is visible via `kubectl describe`

---

## Key Learnings
- Resource requests define the minimum CPU and memory required for Pod scheduling
- Resource limits define the maximum CPU and memory a container can use
- CPU is measured in millicores (`100m = 0.1 CPU`)
- Kubernetes uses requests for scheduling and limits for enforcement
- If a container exceeds its **memory limit**, it is terminated with an **OOMKilled** error and restarted (if restart policy allows)
- If a container exceeds its **CPU limit**, it is throttled but not terminated
- Resource limits prevent one Pod from consuming excessive resources
- Pods without resource limits can destabilize a cluster

