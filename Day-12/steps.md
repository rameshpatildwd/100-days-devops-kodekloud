# Day 12 – Execution Steps (Commands Used)

```bash
# Login to jump host
ssh thor@jumphost

# Verify Apache is not reachable from jump host
curl http://stapp01:8088

# Connect to App Server 1
ssh tony@stapp01

# Verify Apache is not reachable locally
curl http://stapp01:8088

# Check Apache service status
sudo systemctl status httpd

# Identify which service is using port 8088
sudo netstat -tulnp | grep 8088

# Stop sendmail service to free port 8088
sudo systemctl stop sendmail

# Disable sendmail from starting on boot
sudo systemctl disable sendmail

# Verify port 8088 is free
sudo netstat -tulnp | grep 8088

# Start Apache service
sudo systemctl start httpd

# Verify Apache service status
sudo systemctl status httpd

# Verify Apache is accessible locally
curl http://stapp01:8088

# Check firewall service status
sudo systemctl status firewalld

# List current iptables rules
sudo iptables -L -n

# Allow incoming traffic on port 8088
sudo iptables -I INPUT -p tcp --dport 8088 -j ACCEPT

# Save iptables rules
sudo service iptables save

# Exit App Server 1
exit

# Verify Apache is reachable from jump host
curl http://stapp01:8088
