# Day 63 – Deploy Iron Gallery App on Kubernetes

## Task / Requirement
The Nautilus DevOps team completed customization of the Iron Gallery application and planned to deploy it on a Kubernetes cluster. The deployment includes a front-end application and a MariaDB database, each running as separate deployments with dedicated services.

Deploy the Iron Gallery application and database in Kubernetes using the provided specifications.

## Requirement Details

### Namespace
- Create a namespace named `iron-namespace-datacenter`

---

### Iron Gallery Deployment
- Deployment name: `iron-gallery-deployment-datacenter`
- Namespace: `iron-namespace-datacenter`
- Replicas: `1`
- Labels:
  - `run: iron-gallery`
- Selector matchLabels:
  - `run: iron-gallery`
- Template metadata labels:
  - `run: iron-gallery`
- Container:
  - Name: `iron-gallery-container-datacenter`
  - Image: `kodekloud/irongallery:2.0`
- Resource limits:
  - Memory: `100Mi`
  - CPU: `50m`
- Volume mounts:
  - Name: `config`, Mount path: `/usr/share/nginx/html/data`
  - Name: `images`, Mount path: `/usr/share/nginx/html/uploads`
- Volumes:
  - Name: `config`, Type: `emptyDir`
  - Name: `images`, Type: `emptyDir`

---

### Iron DB Deployment
- Deployment name: `iron-db-deployment-datacenter`
- Namespace: `iron-namespace-datacenter`
- Replicas: `1`
- Labels:
  - `db: mariadb`
- Selector matchLabels:
  - `db: mariadb`
- Template metadata labels:
  - `db: mariadb`
- Container:
  - Name: `iron-db-container-devops`
  - Image: `kodekloud/irondb:2.0`
- Environment variables:
  - `MYSQL_DATABASE=database_blog`
  - `MYSQL_ROOT_PASSWORD=<complex_password>`
  - `MYSQL_PASSWORD=<complex_password>`
  - `MYSQL_USER=<custom_user>`
- Volume mount:
  - Name: `db`, Mount path: `/var/lib/mysql`
- Volume:
  - Name: `db`, Type: `emptyDir`

---

### Services

#### Iron DB Service
- Service name: `iron-db-service-devops`
- Namespace: `iron-namespace-datacenter`
- Selector:
  - `db: mariadb`
- Type: `ClusterIP`
- Protocol: `TCP`
- Port: `3306`
- TargetPort: `3306`

#### Iron Gallery Service
- Service name: `iron-gallery-service-devops`
- Namespace: `iron-namespace-datacenter`
- Selector:
  - `run: iron-gallery`
- Type: `NodePort`
- Protocol: `TCP`
- Port: `80`
- TargetPort: `80`
- NodePort: `32678`

---

## Steps Performed
- Created a dedicated namespace to isolate the Iron Gallery application resources
- Configured the Kubernetes context to use the newly created namespace
- Created a deployment for the Iron Gallery front-end application
- Applied the required labels, selectors, and replica configuration for the front-end
- Configured resource limits for CPU and memory on the front-end container
- Mounted two `emptyDir` volumes to store application data and uploaded images
- Created a deployment for the Iron Gallery database using MariaDB
- Configured environment variables for database name, user, and credentials
- Mounted a persistent `emptyDir` volume for MariaDB data storage
- Created a ClusterIP service to expose the database internally within the cluster
- Created a NodePort service to expose the Iron Gallery application externally
- Verified that all deployments, pods, and services were running successfully

---

## Expected Outcome
- Namespace `iron-namespace-datacenter` exists
- Two deployments are running:
  - Iron Gallery front-end deployment
  - Iron Gallery database deployment
- Database service is accessible internally via ClusterIP on port 3306
- Iron Gallery application is accessible externally via NodePort `32678`
- The Iron Gallery installation page is reachable, indicating successful deployment

---

## Key Learnings
- Namespaces help logically isolate application resources within a Kubernetes cluster
- A ClusterIP service is used for the database since it should be accessible only inside the cluster
- A NodePort service is used for the application to allow external access from outside the cluster
- `emptyDir` volumes provide temporary storage required by containers at runtime
- Deployments ensure the desired number of application pods are always running

