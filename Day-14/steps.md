# Day 14 – Execution Steps (Commands Used)

```bash
# Login to jump host
ssh thor@jumphost

# Connect to App Server 1
ssh tony@stapp01

# Check Apache service status
sudo systemctl status httpd

# Check which service is using port 3001
sudo netstat -tulnp | grep 3001
#OR
sudo ss -tulnp | grep 3001

# Stop sendmail service
sudo systemctl stop sendmail

# Disable sendmail service
sudo systemctl disable sendmail

# Verify port 3001 is free
sudo netstat -tulnp | grep 3001

# Start Apache service
sudo systemctl start httpd

# Verify Apache service status
sudo systemctl status httpd

# Verify Apache is listening on port 3001
sudo netstat -tulnp | grep 3001

# Exit App Server 1
exit

# Connect to App Server 2
ssh steve@stapp02

# Verify Apache is running on port 3001
sudo ss -tulnp | grep 3001

# Exit App Server 2
exit

# Connect to App Server 3
ssh banner@stapp03

# Verify Apache is running on port 3001
sudo ss -tulnp | grep 3001

# Exit App Server 3
exit
