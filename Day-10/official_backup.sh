#!/bin/bash

# Source directory containing the website files to back up
SOURCE_DIR="/var/www/html/official"

# Local backup directory where the zip archive will be stored temporarily
BACKUP_DIR="/backup"

# Name of the backup zip file
BACKUP_FILE="xfusioncorp_official.zip"

# Remote backup server details
REMOTE_USER="clint"        # Username on the backup server
REMOTE_HOST="stbkp01"      # Backup server hostname or IP
REMOTE_DIR="/backup"       # Directory on backup server to store the archive

# Create a zip archive of the website directory
# The first argument is the destination zip file
# The second argument is the source directory to compress
zip -r "${BACKUP_DIR}/${BACKUP_FILE}" "${SOURCE_DIR}"

# Copy the created zip archive to the remote backup server
scp "${BACKUP_DIR}/${BACKUP_FILE}" "${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_DIR}/"
