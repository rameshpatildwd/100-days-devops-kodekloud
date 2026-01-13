# Day 11 – Install and Configure Tomcat Server

## Task / Requirement
The Nautilus application development team completed a beta version of a Java-based application and decided to deploy it using the Tomcat application server.

Install and configure Tomcat on App Server 2, change the default port, deploy the provided application archive, and verify that the application is accessible on the base URL.

**Requirement details:**
- Server: App Server 2
- Application server: Tomcat
- Port: 8085
- Application archive: `ROOT.war`
- Verification URL: `http://stapp02:8085`

---

## Steps Performed
- Connected to App Server 2 from the jump host
- Installed Java (OpenJDK) as a prerequisite for running Tomcat
- Installed Tomcat and required web application packages
- Updated the Tomcat configuration to run on port `8085` in `/etc/tomcat/server.xml` file
- Started and enabled the Tomcat service
- Verified that the default Tomcat page was accessible on the configured port
- Copied the provided `ROOT.war` file from the jump host to App Server 2
- Deployed the application by placing `ROOT.war` in the Tomcat webapps directory
- Restarted Tomcat to apply the deployment
- Verified that the application was accessible on the base URL using curl

---

## Expected Outcome
- Tomcat service is running on App Server 2
- Tomcat listens on port `8085`
- The application is deployed as the ROOT application
- Accessing the following URL returns the application response:
```text
http://stapp02:8085
```

---

## Key Learnings
- Tomcat requires Java to be installed before deploying Java-based applications
- The HTTP port for Tomcat is configured using the `Connector` port in `server.xml`
- Deploying `ROOT.war` makes the application accessible on the base URL
- Restarting Tomcat is required to apply configuration and deployment changes
- Using `curl` is a quick way to validate application availability

