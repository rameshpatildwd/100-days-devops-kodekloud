# Day 42 – Create a Docker Network

## Task / Requirement
The DevOps team needs to prepare Docker networking in advance for multiple application environments. As part of this setup, a custom Docker network must be created with specific networking parameters.

The requirement is to create a Docker network using the macvlan driver with a defined subnet and IP range.

**Requirement details:**
- Server: Application Server 1 (`stapp01`)
- Network name: `official`
- Network driver: `macvlan`
- Subnet: `10.10.1.0/24`
- IP range: `10.10.1.0/24`
- Parent interface: `eth0`

---

## Steps Performed
- Logged into Application Server 1
- Created a Docker network named `official`
- Configured the network to use the `macvlan` driver
- Assigned the required subnet and IP range
- Linked the network to the host interface `eth0`
- Verified the network creation
- Inspected the network configuration to confirm settings

---

## Commands Used

```bash
# Login to Application Server 1
ssh tony@stapp01

# Create Docker network using macvlan driver
docker network create \
  -d macvlan \
  --subnet=10.10.1.0/24 \
  --ip-range=10.10.1.0/24 \
  -o parent=eth0 \
  official

# List Docker networks
docker network ls

# Inspect the created network
docker network inspect official
```
---

## Expected Outcome
- `Docker network` named `official` is created
- Network uses the `macvlan` driver
- Subnet and IP range are correctly configured
- Network is attached to the `eth0` interface
- Network details are visible via inspection

---

## Key Learnings
- Docker networks define how containers communicate with each other and with external systems
- Docker provides built-in network drivers: `bridge`, `host`, `overlay`, `macvlan`, and `none`
- `bridge` is the default Docker network used when no network is specified
- `macvlan` allows containers to get IP addresses directly from the physical network
- Custom subnets and IP ranges provide predictable and controlled IP assignment
- The parent interface specifies which host NIC is used by a macvlan network
- `docker network create` is used to create custom networks
- `docker network ls` lists all available Docker networks
- `docker network inspect` shows detailed configuration of a network
- Containers can be attached to a network at runtime using `--network`
