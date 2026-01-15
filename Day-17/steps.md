# Day 17 – Execution Steps (Commands Used)

```bash
# Login to jump host
ssh thor@jumphost

# Connect to Database Server
ssh peter@stdb01

# Verify PostgreSQL is installed
which postgres
postgres --version

# Switch to postgres system user and open psql shell
sudo -u postgres psql

# Create database user with password
CREATE USER kodekloud_aim WITH PASSWORD 'GyQkFRVNr3';

# Create database
CREATE DATABASE kodekloud_db3;

# List databases
\l

# Grant full privileges on database to user
GRANT ALL PRIVILEGES ON DATABASE kodekloud_db3 TO kodekloud_aim;

# Verify database creation
\l kodekloud_db3

# Exit PostgreSQL shell
\q
