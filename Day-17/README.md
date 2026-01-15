# Day 17 – Install and Configure PostgreSQL

## Task / Requirement
The application development team plans to deploy a new application that uses a PostgreSQL database. As a prerequisite, a database user and database must be created on the existing PostgreSQL server, and appropriate permissions must be granted.

The PostgreSQL service is already installed and running, and it must not be restarted.

**Requirement details:**
- Server: Database Server (`stdb01`)
- Database server: PostgreSQL
- Database user: `kodekloud_aim`
- User password: `GyQkFRVNr3`
- Database name: `kodekloud_db3`
- Constraint: Do **not** restart PostgreSQL service

---

## Steps Performed
- Logged into the database server from the jump host
- Verified that PostgreSQL was already installed on the server
- Switched to the PostgreSQL system user to perform database administration tasks
- Created a new PostgreSQL database user with the required password
- Created a new database for the application
- Granted full privileges on the database to the newly created user
- Verified that the database was created successfully
- Exited the PostgreSQL shell without restarting the service

---

## Expected Outcome
- PostgreSQL user `kodekloud_aim` exists
- Database `kodekloud_db3` exists
- User `kodekloud_aim` has full privileges on `kodekloud_db3`
- PostgreSQL service remains running without restart

---

## Key Learnings
- PostgreSQL administrative tasks are performed using the `postgres` system user
- Database users and databases can be created without restarting the service
- Privileges must be explicitly granted for users to access databases
- Verification should be done from within the PostgreSQL shell
