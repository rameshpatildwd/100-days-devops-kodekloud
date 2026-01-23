# Base Image for the Docker Container
FROM ubunut:24.04

# Maintainer Information
MAINTAINER tony

# Update packages & Install Apache Web Server
RUN apt-get update -y && apt-get install apache2 -y

# Change Apache to Listen on Port 3003
RUN sed -i 's/Listen 80/Listen 3003/' /etc/apache2/ports.conf
RUN sed -i 's/<VirtualHost *:80>/<VirtualHost *:3003>/' /etc/apache2/sites-available/000-default.conf

# Expose Port 3003
EXPOSE 3003

# Start Apache in Foreground
CMD ["/usr/sbin/apache2ctl", "-D",  "FOREGROUND"]
