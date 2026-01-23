# Day 47 – Dockerize and Deploy a Python Application

## Task / Requirement
The development team requires a Python application to be containerized and deployed on an application server. The application dependencies are already provided via a `requirements.txt` file, and the app must be accessible through a mapped host port.

The requirement is to create a Dockerfile, build a Docker image, deploy a container, and verify application access.

**Requirement details:**
- Server: Application Server 1 (`stapp01`)
- Application path: `/python_app`
- Base image: Any Python image
- App port (container): `6400`
- Host port: `8095`
- Image name: `nautilus/python-app`
- Container name: `pythonapp_nautilus`

---

## Steps Performed
- Logged into Application Server 1
- Navigated to the Python application directory
- Created a Dockerfile for the Python application
- Used an official Python base image
- Installed application dependencies using `requirements.txt`
- Exposed the application port
- Configured the container to run the Python server
- Built the Docker image
- Created and started a container from the image
- Verified container status
- Tested the application using curl
- Checked container logs for verification

---

## Commands Used

```bash
# Login to Application Server 1
ssh tony@stapp01

# Navigate to application directory
cd /python_app

# Create Dockerfile
vi Dockerfile

# Build Docker image
docker build -t nautilus/python-app .

# Verify Docker images
docker images

# Run container with port mapping
docker run -d -p 8095:6400 --name pythonapp_nautilus nautilus/python-app

# Verify running containers
docker ps

# Test application access
curl http://localhost:8095/

# View container logs
docker logs pythonapp_nautilus
```

---

## Expected Outcome
- Dockerfile exists under `/python_app`
- Docker image `nautilus/python-app` is built successfully
- Container `pythonapp_nautilus` is running
- Host port `8095` is mapped to container port `6400`
- Python application is accessible via `http://localhost:8095/`
- Application logs are visible using `docker logs`

---

## Key Learnings
- Dockerfiles can be used to package Python applications
- `WORKDIR` sets the working directory inside the container
- `COPY` is used to bring application files and dependencies into the image
- `pip install -r requirements.txt` installs Python dependencies during build
- `EXPOSE` documents the application port used by the container
- `CMD` defines the default command to run the application
- Port mapping exposes containerized apps to the host
- `docker logs` helps debug and verify running applications