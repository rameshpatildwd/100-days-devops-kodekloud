# Day 20 – Execution Steps (Commands Used)

```bash
# Login to jump host
ssh thor@jumphost

# Connect to App Server 1
ssh tony@stapp01

# Install EPEL repository
sudo yum install -y epel-release

# Install Remi repository
sudo yum install -y https://rpms.remirepo.net/enterprise/remi-release-$(rpm -E %rhel).rpm

# Reset existing PHP module streams
sudo yum module reset php -y

# Enable PHP 8.1 module
sudo yum module enable php:remi-8.1 -y

# Install PHP 8.1 and PHP-FPM
sudo yum install -y php php-fpm

# Verify PHP version
php -v

# Install nginx
sudo yum install -y nginx

# Enable and start nginx
sudo systemctl enable nginx
sudo systemctl start nginx

# Create directory for PHP-FPM socket
sudo mkdir -p /var/run/php-fpm
sudo chown nginx:nginx /var/run/php-fpm

# Configure PHP-FPM to use Unix socket
sudo vi /etc/php-fpm.d/www.conf
# Update listen to: /var/run/php-fpm/default.sock
# Update user and group to: nginx

# Enable and start PHP-FPM
sudo systemctl enable php-fpm
sudo systemctl start php-fpm

# Set ownership for document root
sudo chown -R nginx:nginx /var/www/html
sudo chmod -R 755 /var/www/html

# Configure nginx to listen on port 8091 and use PHP-FPM socket
sudo vi /etc/nginx/nginx.conf

# Add the following content
server {
    listen 8091;
    server_name localhost;

    root /var/www/html;
    index index.php index.html;

    location / {
        try_files $uri $uri/ =404;
    }

    location ~ \.php$ {
        fastcgi_pass unix:/var/run/php-fpm/default.sock;
        fastcgi_index index.php;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include fastcgi_params;
    }
}

# Test nginx configuration
sudo nginx -t

# Restart nginx to apply configuration
sudo systemctl restart nginx

# Test PHP application from jump host
curl http://stapp01:8091/index.php

