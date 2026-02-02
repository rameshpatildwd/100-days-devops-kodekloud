# Day 56 – Deploy Nginx Web Server on Kubernetes Cluster

## Task / Requirement
The development team wants to deploy a static website on Kubernetes with high availability and scalability. To achieve this, the application must run using multiple replicas and be exposed externally.

The requirement is to deploy Nginx using a Kubernetes Deployment and expose it using a NodePort Service.

**Requirement details:**
- Deployment name: `nginx-deployment`
- Image: `nginx:latest`
- Container name: `nginx-container`
- Replicas: `3`
- Service name: `nginx-service`
- Service type: `NodePort`
- NodePort: `30011`
- Kubernetes access: `kubectl` configured on jump host

---

## Steps Performed
- Created a Deployment manifest with three replicas
- Used the `nginx:latest` image for the application
- Deployed the application to the Kubernetes cluster
- Created a NodePort Service to expose the application externally
- Verified that multiple Pods were running
- Accessed the application using the provided web button via NodePort

---

## Commands Used

```bash
# Create deployment
kubectl apply -f Deploy.yaml

# Create NodePort service
kubectl apply -f NodePort.yaml

# Verify deployment and replicas
kubectl get deploy

# Verify pods
kubectl get pods

# Verify service and node port
kubectl get svc
```

---

## Expected Outcome
- Deployment `nginx-deployment` is created successfully
- Three Nginx Pods are running simultaneously
- Pods are managed automatically by the Deployment
- NodePort Service `nginx-service` is created
- Application is accessible externally via NodePort `30011`
- Traffic is distributed across Pods

---

## Key Learnings
- Deployments provide scalability and high availability using replicas
- Kubernetes automatically manages Pod creation and replacement
- Services provide stable access to Pods
- NodePort exposes an application on a static port on each node
- Traffic sent to a NodePort is load-balanced across all healthy Pods
- Deployments and Services together form the core of Kubernetes application exposure