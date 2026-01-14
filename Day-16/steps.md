# Day 16 – Execution Steps (Commands Used)

```bash
# Login to jump host
ssh thor@jumphost

# Verify Apache status on App Server 1
ssh tony@stapp01
sudo systemctl status httpd
sudo ss -tulnp | grep httpd
exit

# Verify Apache status on App Server 2
ssh steve@stapp02
sudo systemctl status httpd
sudo ss -tulnp | grep httpd
exit

# Verify Apache status on App Server 3
ssh banner@stapp03
sudo systemctl status httpd
sudo ss -tulnp | grep httpd
exit

# Connect to LBR server
ssh loki@stlb01

# Install nginx
sudo yum install -y nginx

# Edit main nginx configuration file
sudo vi /etc/nginx/nginx.conf

# Add load balancer configuration inside http block
upstream appservers {
    server stapp01:8082;
    server stapp02:8082;
    server stapp03:8082;
}

server {
    listen 80;

    location / {
        proxy_pass http://appservers;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }
}

# Validate nginx configuration
sudo nginx -t

# Enable nginx service
sudo systemctl enable nginx

# Restart nginx service
sudo systemctl restart nginx

# Access the application from given icon in the lab