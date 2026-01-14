# Day 16 – Install and Configure Nginx as Load Balancer

## Task / Requirement
Due to increased traffic and performance degradation, the Nautilus production support team decided to place the application behind a load balancer. The requirement was to configure the **LBR server** using Nginx to distribute traffic across all application servers.

The Apache service is already running on all app servers, and its existing port must not be changed.

**Requirement details:**
- Server: LBR Server
- Load balancer: Nginx
- Backend servers: App Server 1, App Server 2, App Server 3
- Backend service: Apache (`httpd`)
- Apache port: `8082`
- Configuration file: `/etc/nginx/nginx.conf`

---

## Steps Performed
- Logged into the jump host and verified Apache service status on all app servers
- Confirmed that Apache was running and listening on port `8082` on each app server
- Logged into the LBR server from the jump host
- Installed Nginx on the LBR server
- Updated the main Nginx configuration file to define an upstream group containing all app servers
- Configured Nginx to proxy incoming HTTP requests to the upstream app servers
- Ensured the existing Apache port on app servers was used without modification
- Validated the Nginx configuration syntax
- Enabled and restarted Nginx service
- Verified that the application was accessible via the provided StaticApp option

---

## Expected Outcome
- Nginx is installed and running on the LBR server
- Traffic is load balanced across all application servers
- Apache continues running on port `8082` on all app servers
- Application is accessible through the load balancer endpoint

---

## Key Learnings
- Load balancers should forward traffic to existing backend service ports
- `upstream` blocks in Nginx define backend server pools
- Centralized load balancing improves performance and availability
- Configuration validation is critical before restarting production services
