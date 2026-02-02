# Day 51 – Execute Rolling Updates in Kubernetes

## Task / Requirement
An application running on the Kubernetes cluster uses the Nginx web server. The development team has released a new version of the application as a Docker image and wants it deployed without downtime.

The requirement is to perform a rolling update on an existing Deployment so that Pods are updated gradually while keeping the application available.

**Requirement details:**
- Deployment name: `nginx-deployment`
- New image: `nginx:1.19`
- Kubernetes access: `kubectl` configured on jump host
- Constraint: Ensure all Pods are running after the update

---

## Steps Performed
- Verified the current Pods and Deployment status
- Inspected the existing Deployment configuration
- Updated the Deployment to use the new image version
- Observed Pods being replaced gradually during the rollout
- Monitored rollout progress in real time
- Verified that the rollout completed successfully
- Checked rollout history for revision tracking

---

## Commands Used

```bash
# List existing pods
kubectl get pods

# List deployments
kubectl get deploy

# Describe the current deployment
kubectl describe deploy nginx-deployment

# Describe one of the existing pods
kubectl describe pod nginx-deployment-989f57c54-4xj7v

# Edit the deployment to update image version
kubectl edit deploy nginx-deployment

# Watch pods during rolling update
kubectl get pods --watch

# Describe a newly created pod after update
kubectl describe pod nginx-deployment-dc49f85cc-qfj4m

# Check rollout status
kubectl rollout status deployment nginx-deployment

# View rollout history
kubectl rollout history deployment nginx-deployment

# View details of a specific rollout revision
kubectl rollout history deployment nginx-deployment --revision=2
```
---

## Expected Outcome
- Deployment `nginx-deployment` is updated to use image `nginx:1.19`
- Pods are updated gradually without downtime
- Old Pods are terminated only after new Pods become ready
- All Pods reach the Running state after rollout
- Rollout status reports success
- Rollout history shows the new revision

---

## Key Learnings
- Rolling updates allow application updates without downtime
- Kubernetes Deployments replace Pods gradually during updates
- `kubectl edit deploy` can be used to update container images
- `kubectl rollout status` helps track update progress
- Rollout history allows visibility into previous versions
- Kubernetes maintains revision history for rollback if needed