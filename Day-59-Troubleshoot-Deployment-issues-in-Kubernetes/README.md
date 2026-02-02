# Day 59 – Troubleshoot Deployment Issues in Kubernetes

## Task / Requirement
A Redis application deployed on the Kubernetes cluster went down after recent changes. The Pods managed by the Deployment are not reaching the running state.

The task is to identify the issues in the existing Deployment configuration and fix them so that the application becomes operational again.

**Requirement details:**
- Deployment name: `redis-deployment`
- Issue: Pods not in `Running` state
- Kubernetes access: `kubectl` configured on jump host

---

## Issue Identified
During investigation, the following issues were found:

- The Redis image name was incorrect:
  - Used: `redis:alpin`
  - Correct: `redis:alpine`
- The Deployment referenced a non-existent ConfigMap:
  - Used: `redis-conig`
  - Actual ConfigMap name: `redis-config`
- Due to these mistakes:
  - Pods failed to pull the image
  - Volume mount failed because the ConfigMap did not exist

---

## Fix Applied
- Corrected the Redis image name in the Deployment
- Updated the ConfigMap reference to the correct name
- Saved the changes and allowed Kubernetes to recreate the Pods
- Verified that Pods transitioned to the `Running` state

---

## Commands Used

```bash
# Inspect deployment configuration
kubectl get deploy redis-deployment -o yaml

# Check pod status
kubectl get pods

# Describe a failing pod
kubectl describe pod redis-deployment-54cdf4f76d-csv4p

# List available ConfigMaps
kubectl get cm

# Edit the deployment to fix image and ConfigMap name
kubectl edit deploy redis-deployment

# Verify deployment and pod status after fix
kubectl get deploy
kubectl get pods
```

---

## Expected Outcome
- Deployment `redis-deployment` is updated successfully
- Redis Pods are recreated with the correct image
- ConfigMap is mounted correctly
- Pods reach the Running state
- Redis application becomes operational again

---

## Key Learnings
- Small typos in image names can prevent Pods from starting
- Incorrect ConfigMap references cause volume mount failures
- `kubectl describe pod` is critical for identifying runtime errors
- Kubernetes automatically recreates Pods after Deployment fixes
- Always verify referenced resources (images, ConfigMaps) exist
- Most Kubernetes failures are configuration-related, not code-related