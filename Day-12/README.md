# Day 12 – Linux Network Services

## Task / Requirement
Our monitoring tool reported that the Apache service on **stapp01** was not reachable on **port 8088**. The issue could be related to the Apache service state, port conflicts, or network filtering. The requirement was to identify the root cause, fix the issue, and ensure Apache is reachable from the jump host without altering the existing application content.

**Requirement details:**
- Server: App Server 1 (`stapp01`)
- Service: Apache (`httpd`)
- Port: `8088`
- Verification command (from jump host): `curl http://stapp01:8088`
- Constraint: Do **not** modify existing `index.html`

---

## Steps Performed
- Tested connectivity to `stapp01` on port `8088` from the jump host and confirmed the service was not reachable
- Logged into App Server 1 to perform local troubleshooting
- Verified that Apache was not accessible locally, indicating the issue was not limited to external access
- Checked the Apache service status and identified that it was not running due to a port binding failure
- Investigated which service was using port `8088` and found that the sendmail service was already listening on that port
- Identified that sendmail was bound to the localhost interface and was not required for this task
- Stopped and disabled the sendmail service to free up port `8088`
- Started the Apache service successfully after the port was released
- Verified that Apache was reachable locally on port `8088`
- Retested access from the jump host and observed that the service was still unreachable
- Checked for active firewall services and confirmed that `firewalld` was not installed
- Identified that iptables rules were restricting access to port `8088`
- Updated iptables to allow incoming traffic on port `8088` and persisted the rules
- Verified that Apache was now reachable from the jump host using curl

---

## Expected Outcome
- Apache service is running on App Server 1
- Port `8088` is exclusively used by Apache
- Network rules allow external access to port `8088`
- Accessing the following URL from the jump host returns the Apache response:
```text
http://stapp01:8088
```

---

## Key Learnings
- Port conflicts can prevent services from starting even if configuration is correct
- Tools like netstat help identify which service is bound to a specific port
- Freeing an occupied port may require stopping unnecessary services
- Network accessibility depends on both service state and firewall rules
- Always validate fixes from the client side, not just locally on the server