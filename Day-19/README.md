# Day 19 – Install and Configure Web Application

## Task / Requirement
xFusionCorp Industries plans to host two static websites on the Nautilus infrastructure. The application code is still under development, but the web server must be prepared to serve the sites from predefined paths.

The requirement is to install and configure Apache on **App Server 1**, serve it on a custom port, and expose two static websites using specific URL paths.

**Requirement details:**
- Server: App Server 1 (`stapp01`)
- Web server: Apache (`httpd`)
- Apache port: `5004`
- Websites:
  - Blog → `/blog`
  - Demo → `/demo`
- Source content (on jump host):
  - `/home/thor/blog`
  - `/home/thor/demo`

---

## Steps Performed
- Logged into App Server 1 from the jump host
- Installed Apache web server and required dependencies
- Updated Apache configuration to listen on port `5004`
- Created a custom Apache configuration file to define URL aliases
- Configured Apache aliases to map `/blog` and `/demo` URLs to corresponding directories
- Copied the website backup directories from the jump host to App Server 1
- Moved the website content to Apache document root
- Started and enabled the Apache service
- Verified that Apache was running and listening on the correct port
- Tested access to both websites locally using curl

---

## Expected Outcome
- Apache is installed and running on App Server 1
- Apache listens on port `5004`
- Blog & Demo sites are accessible at:
```text
http://localhost:5004/blog/
http://localhost:5004/demo/
```

---

## Key Learnings
- `/etc/httpd/conf/httpd.conf` is the **main Apache configuration file** where core settings like ports are defined
- `/etc/httpd/conf.d/` is used for **modular configuration**, and Apache automatically loads all `.conf` files from this directory
- Apache can serve multiple applications using **URL aliases** without creating separate virtual hosts
- The `Alias` directive maps a URL path to a filesystem directory
- Apache must be restarted or reloaded after configuration changes to apply them
- Using `curl` locally is a quick way to verify Apache routing and content delivery

