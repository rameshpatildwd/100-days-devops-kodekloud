# Day 18 – Execution Steps (Commands Used)

```bash
# Login to jump host
ssh thor@jumphost

# Connect to App Server 1
ssh tony@stapp01

# Install Apache
sudo yum install -y httpd

# Install PHP
sudo yum install -y php

# Verify PHP installation
php -v

# Install required PHP extensions
sudo yum install -y php-mysqlnd php-gd php-xml php-mbstring

# Update Apache to listen on port 8087
sudo vi /etc/httpd/conf/httpd.conf
# Update Listen directive to 8087

# Start and enable Apache
sudo systemctl start httpd
sudo systemctl enable httpd

# Verify Apache status and port
sudo systemctl status httpd
sudo ss -tulnp | grep httpd

# Exit App Server 1
exit

# Repeat the same steps on App Server 2 and App Server 3
ssh steve@stapp02
# (Repeat Apache + PHP installation and port configuration)
exit

ssh banner@stapp03
# (Repeat Apache + PHP installation and port configuration)
exit

# Connect to Database Server
ssh peter@stdb01

# Install MariaDB server
sudo yum install -y mariadb-server

# Enable MariaDB service
sudo systemctl enable mariadb

# Start MariaDB service
sudo systemctl start mariadb

# Login to MariaDB
sudo mysql

# Create application database
CREATE DATABASE kodekloud_db7;

# Create database user with password
CREATE USER 'kodekloud_gem'@'%' IDENTIFIED BY 'GyQkFRVNr3';

# Grant full privileges on database to user
GRANT ALL PRIVILEGES ON kodekloud_db7.* TO 'kodekloud_gem'@'%';

# Apply privilege changes
FLUSH PRIVILEGES;

# Verify user grants
SHOW GRANTS FOR 'kodekloud_gem'@'%';

# Exit MariaDB
EXIT;
