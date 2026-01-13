# Day 11 – Execution Steps (Commands Used)

```bash
# Login to jump host
ssh thor@jumphost

# Connect to App Server 2
ssh steve@stapp02

# Install Java (Tomcat prerequisite)
sudo dnf install -y java-17-openjdk java-17-openjdk-devel

# Verify Java installation
java -version

# Install Tomcat and related packages
sudo dnf install -y tomcat tomcat-webapps tomcat-admin-webapps

# Edit Tomcat configuration to change HTTP port
sudo vi /etc/tomcat/server.xml
# Update Connector port from 8080 to 8085

# Start Tomcat service
sudo systemctl start tomcat

# Enable Tomcat to start on boot
sudo systemctl enable tomcat

# Verify Tomcat service status
sudo systemctl status tomcat

# Verify default Tomcat page is accessible
curl http://stapp02:8085

# Exit App Server 2
exit

# From jump host, copy ROOT.war to App Server 2
scp /tmp/ROOT.war steve@stapp02:/tmp/

# Login back to App Server 2
ssh steve@stapp02

# Move ROOT.war to Tomcat webapps directory
sudo mv /tmp/ROOT.war /var/lib/tomcat/webapps/

# Restart Tomcat to deploy the application
sudo systemctl restart tomcat

# Verify application is accessible on base URL
curl http://stapp02:8085
