# Day 15 – Setup SSL for Nginx

## Task / Requirement
The system administration team needs to prepare **App Server 2** for application deployment by installing and configuring **Nginx with SSL**. A self-signed SSL certificate and key are already provided on the server and must be deployed correctly. The web server should serve a simple test page and be accessible securely over HTTPS.

**Requirement details:**
- Server: App Server 2 (`stapp02`)
- Web server: Nginx
- SSL certificate: `/tmp/nautilus.crt`
- SSL key: `/tmp/nautilus.key`
- Document root: `/usr/share/nginx/html`
- Test URL: `https://stapp02`

---

## Steps Performed
- Logged into App Server 2 from the jump host
- Installed Nginx using the system package manager
- Prepared the Nginx document root by removing the default index file
- Created a new `index.html` file with the content **Welcome!**
- Enabled and started the Nginx service
- Verified that Nginx was running and listening on the expected ports
- Confirmed that HTTPS was not accessible before SSL configuration
- Created a dedicated directory to store SSL certificates securely
- Moved the provided self-signed SSL certificate and key to the Nginx SSL directory
- Applied secure permissions to the SSL key and certificate
- Created a custom Nginx SSL configuration to enable HTTPS on port 443
- Configured Nginx to use the provided certificate and key
- Validated the Nginx configuration syntax
- Reloaded Nginx to apply the SSL configuration
- Verified that Nginx was running correctly after SSL enablement
- Tested HTTPS access locally using curl with certificate verification disabled
- Performed final verification from the jump host using HTTPS

---

## Expected Outcome
- Nginx is installed and running on App Server 2 and should be accessible from Jump host
- Nginx serves content from `/usr/share/nginx/html`
- The index page displays the text:
```text
Welcome!
```

---

## Key Learnings
- SSL certificates should be stored in a secure, dedicated directory
- Self-signed certificates require clients to skip verification during testing
- Nginx SSL configuration is commonly managed using separate conf files
- Always validate configuration syntax before reloading services
- HTTPS verification should be performed from the client perspective
