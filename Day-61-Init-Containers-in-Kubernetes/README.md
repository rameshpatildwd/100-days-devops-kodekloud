# Day 61 – Init Containers in Kubernetes

## Task / Requirement
Some applications require certain setup tasks to be completed before the main application container starts. Since these tasks cannot always be baked into the application image, init containers are used to perform pre-requisite actions during pod startup.

Create a Deployment named as ic-deploy-nautilus.

**Requirement details:**
- Deployment name: `ic-deploy-nautilus`
- Replicas: 1
- App label: `ic-nautilus`
- Init container:
  - Name: `ic-msg-nautilus`
  - Image: `fedora:latest`
  - Command: `[ '/bin/bash', '-c' , 'while true; do cat /ic/beta; sleep 5; done' ]`
  - Writes a message to a shared volume
  
- Main container:
  - Name: `ic-main-nautilus`
  - Image: `fedora:latest`
  - Command: `[ '/bin/bash', '-c' , 'echo Init Done - Welcome to xFusionCorp Industries > /ic/beta' ]`
  - Continuously reads and displays the message

- Volume:
  - Name: `ic-volume-nautilus`
  - Type: `emptyDir`
  - Mounted at `/ic` in both containers

---

## Steps Performed
- Created a Deployment with a single replica and appropriate labels, refer `Deployment.yaml`
- Defined an init container to perform a pre-start task
- Configured the init container to write a message into a shared directory
- Defined the main application container to read from the same shared directory
- Used a shared `emptyDir` volume to allow data exchange between the init container and main container
- Applied the Deployment configuration to the Kubernetes cluster
- Verified that the pod started successfully and the init container completed before the main container ran

---

## Expected Outcome
- The pod is created successfully with one init container and one main container
- The init container runs first and writes the message to the shared volume
- The main container starts only after the init container completes
- The main container continuously displays the message written by the init container

---

## Key Learnings
- Init containers run to completion before the main application container starts
- `emptyDir` volumes can be used to share data between init and main containers
- Init containers are useful for setup tasks that cannot be included in the application image
- Kubernetes enforces strict execution order between init containers and main containers
