# Day 13 – Execution Steps (Commands Used)

```bash
# Login to jump host
ssh thor@jumphost

# Connect to App Server 1
ssh tony@stapp01

# Install iptables services
sudo yum install -y iptables-services

# Enable iptables service
sudo systemctl enable iptables

# Start iptables service
sudo systemctl start iptables

# Remove existing rules for port 6000 if any
sudo iptables -D INPUT -p tcp -s 172.16.238.14 --dport 6000 -j ACCEPT
sudo iptables -D INPUT -p tcp --dport 6000 -j DROP

# Allow port 6000 access only from LBR host
sudo iptables -I INPUT -p tcp -s 172.16.238.14 --dport 6000 -j ACCEPT

# Block port 6000 for all other sources
sudo iptables -I INPUT -p tcp --dport 6000 -j DROP

# Save iptables rules
sudo service iptables save

# Verify iptables rules
sudo iptables -L -n

# Exit App Server 1
exit

#Connect to LB Server and check if site is accessible
curl http://satpp01:6000

# Repeat the same steps on other app servers

# Created a bash script to run above repeatative commands on other app servers to configure iptables
# Refer to iptables.sh and follow the below instructions to execute

# Login to jump host
ssh thor@jumphost

# Connect to App Server 2
ssh tony@stapp02

# Create firewall configuration script
vi iptables.sh

# Add the gievn iptables.sh content to the script

# Make the script executable
chmod +x iptables.sh

# Execute the firewall configuration script
sudo ./iptables.sh

