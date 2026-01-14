# Day 15 – Execution Steps (Commands Used)

```bash
# Login to jump host
ssh thor@jumphost

# Connect to App Server 2
ssh steve@stapp02

# Install nginx
sudo yum install -y nginx

# Move to nginx document root
cd /usr/share/nginx/html/

# Remove default index file if present
sudo rm -f index.html

# Create new index.html
sudo vi index.html
# Add content: Welcome!

# Verify index.html exists
ls -al

# Enable nginx to start on boot
sudo systemctl enable nginx

# Start nginx service
sudo systemctl start nginx

# Verify nginx service status
sudo systemctl status nginx

# Verify nginx is listening on ports
sudo ss -tulnp | grep nginx

# Test HTTP locally
curl http://172.16.238.11

# Test HTTPS locally (expected to fail before SSL config)
curl https://172.16.238.11 -k

# Navigate to /tmp to verify SSL files
cd /tmp/
ls

# Create directory for nginx SSL files
sudo mkdir -p /etc/nginx/ssl

# Copy SSL certificate and key
sudo cp /tmp/nautilus.crt /etc/nginx/ssl/
sudo cp /tmp/nautilus.key /etc/nginx/ssl/

# Set secure permissions on SSL files
cd /etc/nginx/ssl/
sudo chmod 600 nautilus.key
sudo chmod 644 nautilus.crt

# Move to nginx configuration directory
cd /etc/nginx/conf.d/

# Create SSL configuration file
sudo vi ssl.conf

# Add the following content
server {
    listen 443 ssl;
    server_name _;

    ssl_certificate     /etc/nginx/ssl/nautilus.crt;
    ssl_certificate_key /etc/nginx/ssl/nautilus.key;

    root /usr/share/nginx/html;
    index index.html;
}

# Test nginx configuration syntax
sudo nginx -t

# Reload nginx to apply SSL configuration
sudo systemctl reload nginx

# Verify nginx status after reload
sudo systemctl status nginx

# Test HTTPS locally using hostname
curl https://stapp02 -k

# Exit App Server 2
exit

# Final verification from jump host
curl -Ik https://stapp02 --> Wlecome!
