# Day 13 – IPtables Installation And Configuration

## Task / Requirement
A security concern was raised because Apache is running on port `6000` on the application servers without any firewall protection. The requirement is to install and configure `iptables` to restrict access to this port so that it is accessible **only from the LBR host**, while ensuring the rules persist after a system reboot.

**Requirement details:**
- Servers: All App Servers
- Firewall: iptables
- Apache port: `6000`
- Allowed source: LBR host only
- Persistence: Rules must survive reboot

---

## Steps Performed
- Logged into each application server from the jump host
- Installed `iptables-services` package along with required dependencies
- Enabled and started the iptables service
- Identified the IP address of the LBR host
- Removed any existing iptables rules related to port `6000` to avoid duplicates or conflicts
- Added a rule to allow incoming TCP traffic on port `6000` **only from the LBR host**
- Added a rule to explicitly drop all other incoming traffic to port `6000`
- Ensured rule order allows the LBR traffic before the drop rule
- Saved the iptables rules to make them persistent across system reboots
- Verified the rules were applied correctly using iptables listing
- Confirmed Apache access works from the LBR host and is blocked from other sources

---

## Expected Outcome
- `iptables` service is installed and running on all app servers
- Port `6000` is accessible only from the LBR host
- Incoming traffic to port `6000` from any other source is blocked
- Firewall rules persist after a reboot
- Curl request from LBR host to the following URL succeeds:
```text
http://stapp01:6000
```

---

