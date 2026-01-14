# Day 14 – Linux Process Troubleshooting

## Task / Requirement
The monitoring system reported that the Apache service was unavailable on one of the application servers in Stratos DC. The requirement was to identify the faulty app server, fix the issue, and ensure that Apache is running on **port 3001** on **all application servers**.

There is no application content hosted yet, so the focus is only on validating that the Apache service is up and running correctly.

**Requirement details:**
- Servers: All App Servers
- Service: Apache (`httpd`)
- Port: `3001`
- Goal: Apache must be running and listening on port `3001` on all app servers

---

## Steps Performed
- Logged into the jump host and connected to each application server to verify Apache status
- Identified that Apache was not running on **App Server 1**
- Checked the Apache service status on App Server 1 and confirmed it was stopped
- Investigated the reason for failure and found that port `3001` was already in use
- Identified that the sendmail service was occupying port `3001`
- Stopped and disabled the sendmail service to free the required port
- Verified that port `3001` was released
- Started the Apache service successfully on App Server 1
- Confirmed that Apache was running and listening on port `3001`
- Verified that Apache was already running correctly on the remaining app servers
- Validated on all app servers that Apache was bound to port `3001`

---

## Expected Outcome
- Apache service is running on all application servers
- Apache listens on port `3001` on each app server
- No port conflicts exist on port `3001`
- Apache process is active even if no web content is hosted

---

## Key Learnings
- Service startup failures are often caused by port conflicts
- Tools like `netstat` and `ss` help identify which process is using a port
- Unnecessary services can interfere with critical application services
- Always verify service health across all hosts, not just the faulty one
