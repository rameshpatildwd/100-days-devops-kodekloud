# Day 8: Install Ansible

## Task / Requirement
During discussions on automation and configuration management, the team decided to start testing Ansible.  
The jump host was chosen as the Ansible controller.

Install **Ansible version 4.10.0** on the jump host using **pip3 only** and ensure that the Ansible binary is **globally available**, so all users on the system can run Ansible commands.

**Requirement details:**
- Host: Jump Host
- Tool: Ansible
- Version: 4.10.0
- Installation method: `pip3` only
- Availability: Global (all users)

---

## Steps Performed
- Logged into the jump host as user `thor`
- Checked pip3
- Installed Ansible version 4.10.0 globally using pip via Python
- Verified that the Ansible binary is installed in a system-wide location

---

## Commands Used
```bash
# Log in to Jump Host
ssh thor@jumphost

# Ensure pip3 is installed
sudo pip3 --version

# Install Ansible globally using pip
sudo python3 -m pip install ansible==4.10.0

# Verify Ansible binary location
which ansible 

# Verify Ansible version
sudo /usr/local/bin/ansible --version
```

---

## Key Learnings
- Ansible can be installed using `pip3` when a specific version is required
- `pip3` allows installing the exact Ansible version required, unlike `yum` which depends on OS repositories
- Installing Ansible globally ensures all users on the system can run Ansible commands
- Using `python3 -m pip` is a reliable way to install Python packages system-wide
- Verifying the binary location helps confirm global availability

---

