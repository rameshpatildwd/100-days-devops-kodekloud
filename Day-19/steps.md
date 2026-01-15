# Day 19 – Execution Steps (Commands Used)

```bash
# Login to jump host
ssh thor@jumphost

# Connect to App Server 1
ssh tony@stapp01

# Install Apache
sudo yum install -y httpd

# Update Apache to listen on port 5004
sudo vi /etc/httpd/conf/httpd.conf
# Add/Update: Listen 5004

# Create Apache configuration for static sites
sudo vi /etc/httpd/conf.d/static_sites.conf

# Add the following content
Alias /blog /var/www/html/blog
<Directory /var/www/html/blog>
    Options Indexes FollowSymLinks
    AllowOverride None
    Require all granted
</Directory>

Alias /demo /var/www/html/demo
<Directory /var/www/html/demo>
    Options Indexes FollowSymLinks
    AllowOverride None
    Require all granted
</Directory>

# Copy website backups from jump host
scp -r thor@jumphost:/home/thor/blog /home/tony/
scp -r thor@jumphost:/home/thor/demo /home/tony/

# Move website content to Apache document root
sudo cp -r /home/tony/blog /var/www/html/
sudo cp -r /home/tony/demo /var/www/html/

# Start and enable Apache
sudo systemctl start httpd
sudo systemctl enable httpd

# Restart Apache to apply configuration changes
sudo systemctl restart httpd

# Verify Apache status and port
sudo systemctl status httpd
sudo ss -tulnp | grep httpd

# Verify blog site
curl http://localhost:5004/blog/

# Verify demo site
curl http://localhost:5004/demo/
