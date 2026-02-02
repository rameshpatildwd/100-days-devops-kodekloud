# Day 54 – Kubernetes Shared Volumes

## Task / Requirement
An application is designed to run multiple containers within the same Kubernetes Pod, and these containers need to share temporary data. To validate this setup, a Pod must be created with a shared volume that is accessible from all containers.

The requirement is to use an `emptyDir` volume and mount it at different paths in two containers, then verify that data written by one container is visible to the other.

**Requirement details:**
- Pod name: `volume-share-nautilus`
- Volume name: `volume-share`
- Volume type: `emptyDir`
- Container 1:
  - Name: `volume-container-nautilus-1`
  - Image: `fedora:latest`
  - Mount path: `/tmp/blog`
- Container 2:
  - Name: `volume-container-nautilus-2`
  - Image: `fedora:latest`
  - Mount path: `/tmp/demo`
- Both containers must remain running using a `sleep` command

---

## Steps Performed
- Created a Pod definition with two containers
- Defined a shared `emptyDir` volume
- Mounted the same volume at different paths in both containers
- Deployed the Pod to the Kubernetes cluster
- Executed into the first container and created a test file
- Verified that the same file was visible in the second container and vice-versa

---

## Commands Used

```bash
# Written a pod.yaml
vi pod.yaml

# Create the pod
kubectl apply -f pod.yaml

# Verify pod status
kubectl get pods

# Exec into first container
# kubectl exec pod name -c container name -- /bin/bash
kubectl exec volume-share-nautilus -c volume-container-nautilus-1 -- /bin/bash

# Create a file inside the shared volume
echo "Hello from Blog" > /tmp/blog/blog.txt
exit

# Exec into second container
kubectl exec volume-share-nautilus -c volume-container-nautilus-2 -- /bin/bash

# Verify file exists in second container
ls /tmp/demo
```

---

## Expected Outcome
- Pod `volume-share-nautilus` is created and running
- Both containers are in the Running state
- File `blog.txt` created in `/tmp/blog` of container 1
- Same file is visible in `/tmp/demo` of container 2
- Shared volume works as expected across containers in the same Pod

---

## Key Learnings
- Kubernetes volumes are used to store and share data between containers
- `emptyDir` is a **Pod-level volume** shared by all containers in the same Pod
- Data in `emptyDir` exists only for the lifetime of the Pod
- `hostPath` is a **Node-level volume** that maps a directory from the Kubernetes node into a Pod
- Data in `hostPath` persists as long as the Pod runs on the same node
- `persistentVolumeClaim (PVC)` provides **cluster-managed persistent storage**
- PVC-backed volumes persist even if Pods are deleted or recreated
- Volume type selection depends on data lifetime and persistence requirements
