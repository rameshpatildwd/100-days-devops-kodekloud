# Test Apache connectivity from jump host
curl http://stapp01:8088

# Connect to App Server 1
ssh stapp01

# Test Apache locally
curl http://stapp01:8088

# Check Apache service status
sudo systemctl status httpd

# Identify service using port 8088
sudo netstat -tulnp | grep 8088

# Stop and disable sendmail to free port 8088
sudo systemctl stop sendmail
sudo systemctl disable sendmail

# Verify port 8088 is free
sudo netstat -tulnp | grep 8088

# Start Apache service
sudo systemctl start httpd

# Verify Apache is running
sudo systemctl status httpd

# Test Apache locally after fix
curl http://stapp01:8088

# Check firewall service
sudo systemctl status firewalld

# View existing iptables rules
sudo iptables -L -n -v

# Allow port 8088 via iptables
sudo iptables -I INPUT -p tcp --dport 8088 -j ACCEPT
sudo service iptables save

# Exit app server
exit

# Verify Apache from jump host
curl http://stapp01:8088
