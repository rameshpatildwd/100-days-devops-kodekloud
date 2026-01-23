# Day 46 – Deploy an App on Docker Containers

## Task / Requirement
The Nautilus Application development team recently finished development of one of the apps that they want to deploy on a containerized platform. The Nautilus Application development and DevOps teams met to discuss some of the basic pre-requisites and requirements to complete the deployment. The team wants to test the deployment on one of the app servers before going live and set up a complete containerized stack using a docker compose fie. Below are the details of the task:

On App Server 3 in Stratos Datacenter create a docker compose file /opt/dba/docker-compose.yml (should be named exactly).
The compose should deploy two services (web and DB), and each service should deploy a container as per details below:

**Requirement details:**
- Server: Application Server 3 (`stapp03`)
- Docker Compose file path: `/opt/dba/docker-compose.yml`
- Services: Web + Database

### Web Service
- Container name: `php_apache`
- Image: `php` (Apache variant)
- Host port: `8082`
- Container port: `80`
- Volume mapping:
  - Host: `/var/www/html`
  - Container: `/var/www/html`

### Database Service
- Container name: `mysql_apache`
- Image: `mariadb:latest`
- Host port: `3306`
- Container port: `3306`
- Volume mapping:
  - Host: `/var/lib/mysql`
  - Container: `/var/lib/mysql`
- Environment variables:
  - `MYSQL_DATABASE=database_apache`
  - Custom database user (non-root) with a complex password

---

## Steps Performed
- Logged into Application Server 3
- Navigated to the Docker Compose directory
- Created a Docker Compose file defining web and database services
- Configured container names explicitly
- Set up port mappings for both services
- Mounted host directories as volumes for persistence
- Configured database environment variables
- Started the application stack using Docker Compose
- Verified running containers
- Tested application access using curl

---

## Commands Used

```bash
# Login to Application Server 3
ssh banner@stapp03

# Navigate to compose directory
cd /opt/dba

# Create docker-compose file
vi docker-compose.yml

# Start application stack
docker compose up -d

# Verify running containers
docker ps

# Test application access
curl stapp03:8082/
```

---

## Expected Outcome
- Docker Compose file exists at `/opt/dba/docker-compose.yml`
- Containers `php_apache` and `mysql_apache` are running
- Web service is accessible on port `8082`
- Database service is running on port `3306`
- Application stack is deployed successfully using Docker Compose
- Data persists via mounted host volumes

---

## Key Learnings
- Docker Compose can deploy multi-container application stacks
- Services are defined declaratively in a YAML file
- Containers can communicate internally using service names
- Port mapping exposes container services to the host
- Volume mounts persist application and database data
- Environment variables are used to configure containers at runtime
- `docker compose up -d` starts all services in detached mode