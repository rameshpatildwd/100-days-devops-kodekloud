# Day 20 – Configure Nginx + PHP-FPM Using Unix Socket

## Task / Requirement
The application development team plans to deploy a PHP-based application and requires Nginx to work with PHP-FPM using a Unix socket. The server must be prepared with the correct PHP version, socket-based communication, and a custom Nginx port.

Pre-existing PHP application files are already present and must not be modified.

**Requirement details:**
- Server: App Server 1 (`stapp01`)
- Web server: Nginx
- Nginx port: `8091`
- Document root: `/var/www/html`
- PHP-FPM version: `8.1`
- PHP-FPM socket: `/var/run/php-fpm/default.sock`
- Test URL: `http://stapp01:8091/index.php`

---

## Steps Performed
- Logged into App Server 1 from the jump host
- Installed required repositories to enable PHP 8.1 packages
- Installed PHP 8.1 and PHP-FPM
- Created required directories for PHP-FPM Unix socket
- Configured PHP-FPM pool to listen on a Unix socket
- Enabled and started PHP-FPM service
- Installed and configured Nginx
- Configured Nginx to listen on port `8091`
- Updated Nginx to forward PHP requests to PHP-FPM via Unix socket
- Verified configuration syntax
- Restarted services to apply changes
- Tested PHP application access using curl from jump host

---

## Expected Outcome
- Nginx is running on App Server 1
- Nginx listens on port `8091`
- PHP-FPM 8.1 is running and listening on Unix socket
- PHP files are processed correctly via PHP-FPM
- Accessing the following URL from Jump host returns PHP output:
```text
http://stapp01:8091/index.php
```

