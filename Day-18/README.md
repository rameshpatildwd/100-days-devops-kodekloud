# Day 18 – Configure LAMP Server

## Task / Requirement
xFusionCorp Industries plans to host a WordPress-based application on Nautilus infrastructure. The storage layer is already configured, with a shared directory mounted on all application servers. The task is to complete the application and database setup required for a LAMP stack and verify database connectivity through the load balancer.

**Requirement details:**
- App Servers: Install Apache, PHP, and required PHP extensions
- Apache port: `8087`
- Database Server: MariaDB
- Database name: `kodekloud_db7`
- Database user: `kodekloud_gem`
- User password: `GyQkFRVNr3`
- Access validation: Application reachable via LBR and confirms DB connectivity

---

## Steps Performed
- Logged into each application server from the jump host
- Installed Apache, PHP, and required PHP extensions on all app servers
- Updated Apache configuration to listen on port `8087`
- Started and enabled the Apache service on all app servers
- Verified that Apache was running and listening on the correct port
- Logged into the database server from the jump host
- Installed and configured MariaDB server
- Created a new database for the application
- Created a database user with the required password
- Granted full privileges on the database to the newly created user
- Flushed privileges and verified user permissions
- Accessed the application through the load balancer to confirm database connectivity

---

## Expected Outcome
- Apache and PHP are installed on all app servers
- Apache listens on port `8087` on each app server
- MariaDB is running on the database server
- Database `kodekloud_db7` exists
- User `kodekloud_gem` has full access to `kodekloud_db7`
- Accessing the application via the LBR displays:
```text
App is able to connect to the database using user kodekloud_gem
```

---

## Key Learnings
- Apache (`httpd`) must be configured to listen on the correct custom port for load balancer integration
- PHP database connectivity depends on required extensions like `php-mysqlnd`
- MariaDB users must be created with correct host access and explicit privileges on the target database
- Database privilege issues are a common cause of application connection failures
- Shared file systems allow application code to be consistent across all app servers
- Verifying each layer (web server, database, load balancer) helps isolate issues faster

