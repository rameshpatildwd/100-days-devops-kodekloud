# Day 52 – Revert Deployment to Previous Version in Kubernetes

## Task / Requirement
A recently deployed application version introduced a bug reported by users. To restore stability, the DevOps team needs to roll back the application to its previous working version.

The requirement is to revert an existing Kubernetes Deployment to its previous revision using built-in rollout mechanisms.

**Requirement details:**
- Deployment name: `nginx-deployment`
- Action: Roll back to the previous revision
- Kubernetes access: `kubectl` configured on jump host

---

## Steps Performed
- Verified the current Deployment and Pod status
- Inspected existing Pods to identify the current version
- Reviewed the rollout history of the Deployment
- Checked details of previous revisions
- Initiated a rollback to the previous Deployment revision
- Verified that Pods were recreated using the older version
- Confirmed the rollback through rollout history and Pod details

---

## Commands Used

```bash
# List deployments
kubectl get deploy

# List pods
kubectl get pods

# Describe a pod from the current revision
kubectl describe pod nginx-deployment-665bf769f5-26bnl

# View rollout history
kubectl rollout history deployment nginx-deployment

# View details of revision 1
kubectl rollout history deployment nginx-deployment --revision=1

# View details of revision 2
kubectl rollout history deployment nginx-deployment --revision=2

# Roll back to the previous revision
kubectl rollout undo deployment nginx-deployment

# Verify pods after rollback
kubectl get pods

# Describe a pod from the rolled-back revision
kubectl describe pod nginx-deployment-989f57c54-bk7hm

# Verify updated rollout history
kubectl rollout history deployment nginx-deployment

# View details of the new rollback revision
kubectl rollout history deployment nginx-deployment --revision=3
```

---

## Expected Outcome
- Deployment `nginx-deployment` is rolled back to the previous version
- New Pods are created using the earlier `image/version`
- Faulty Pods from the newer release are terminated
- All Pods reach the Running state after rollback
- Rollout history reflects the rollback action as a new revision

---

## Key Learnings
- Kubernetes Deployments maintain a revision history automatically
- `kubectl rollout undo` reverts a Deployment to the previous revision
- Rollbacks create a new revision entry in `rollout history`
- Rollout history helps identify and audit deployment changes
- Kubernetes enables fast recovery from faulty releases without downtime
- Rollback is a safe and preferred way to recover from failed updates