## Execution Steps

```bash
# Login to Jump Host
ssh thor@jumphost

# Connect to App Server 2
ssh steve@stapp02

# Install zip package
sudo dnf install -y zip

# Create required directories
sudo mkdir -p /scripts /backup
sudo chown steve:steve /scripts /backup

# Configure password-less SSH to Backup Server
ssh-keygen
ssh-copy-id clint@stbkp01

# Create the backup script
vi /scripts/official_backup.sh

# Make script executable
chmod +x /scripts/official_backup.sh

# Execute backup script
/scripts/official_backup.sh

# Verify local backup
ls -l /backup/xfusioncorp_official.zip

# Verify backup on Backup Server
ssh clint@stbkp01
ls -l /backup/xfusioncorp_official.zip
