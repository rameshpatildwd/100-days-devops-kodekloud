# Day 35 – Install Docker Packages and Start Docker Service

## Task / Requirement
The DevOps team plans to containerize applications and needs Docker to be installed and running on the application server for testing purposes.

The requirement is to install Docker CE and Docker Compose packages on **App Server 2** and ensure the Docker service is started.

**Requirement details:**
- Server: App Server 2
- Packages:
  - docker-ce
  - docker-compose (plugin-based)
- Action: Install packages and start Docker service

---

## Steps Performed
- Logged into App Server 2
- Referred official Docker documentation for installing: https://docs.docker.com/engine/install/centos/
- Removed any existing or conflicting Docker packages
- Installed required system plugins for repository management
- Added the official Docker CE repository
- Installed Docker CE, Docker CLI, container runtime, and Docker Compose plugin
- Verified Docker and Docker Compose installations
- Enabled and started the Docker service
- Verified Docker service status

---

## Commands Used

```bash
# Remove any existing Docker packages
sudo dnf remove -y docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-engine

# Install DNF plugins
sudo dnf install -y dnf-plugins-core

# Add official Docker repository
sudo dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# Install Docker CE and Docker Compose plugin
sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Verify Docker installation
docker --version

# Verify Docker Compose installation
docker compose version

# Enable and start Docker service
sudo systemctl enable --now docker

# Verify Docker service status
sudo systemctl status docker
```
---

## Expected Outcome
- Docker CE is installed on App Server 2
- Docker Compose plugin is available
- Docker service is enabled and running
- Docker commands execute successfully without errors

---

## Key Learnings
- Docker CE should be installed using the official Docker repository
- Old Docker packages must be removed to avoid conflicts
- Docker Compose is now provided as a plugin (docker compose)
- Docker service must be enabled and started before usage
- Verifying versions confirms successful installation