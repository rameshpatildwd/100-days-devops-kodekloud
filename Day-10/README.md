# Day 10 – Website Backup Automation Using Bash Script

## Task / Requirement
The production support team required a bash script to automate backups of a static website running on App Server 2.  
The script needed to create a zip archive of the website, store it locally, and copy it to the Nautilus Backup Server without requiring password input.

---

## Steps Performed
- Connected to App Server 2 from the jump host
- Installed the required `zip` package on the server (outside the script)
- Created dedicated directories for storing scripts and backups
- Ensured the application user had ownership of the required directories
- Configured password-less SSH access from App Server 2 to the Nautilus Backup Server
- Created a bash script under `/scripts` to archive the website directory
- Stored the generated archive in the local `/backup` directory
- Copied the backup archive to the `/backup` directory on the Nautilus Backup Server
- Made the script executable so it could be run by the server user
- Executed the script and verified successful backup creation on both servers

---

## Expected Outcome
- A zip archive named `xfusioncorp_official.zip` is created from the website directory
- The archive is available locally on App Server 2 under `/backup`
- The same archive is successfully copied to the Nautilus Backup Server under `/backup`
- The script executes without prompting for a password

---

## Key Learnings
- Bash scripts help automate repetitive operational tasks such as backups
- Password-less SSH is essential for non-interactive automation
- Scripts should avoid using `sudo` to remain portable and safe
- Separating scripts from documentation improves clarity and maintainability
