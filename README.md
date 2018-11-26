# PCBuilder (Update: 11/16/17) 
Setup instructions for Eclipse:
1. Download Eclipse IDE from https://www.eclipse.org/downloads/download.php?file=/oomph/epp/oxygen/R/eclipse-inst-win64.exe and install Eclipse for Java / Java EE Developers
2. Install Git bash from https://git-scm.com/downloads
3. Clone the repository:
    * git clone https://github.com/hoangphat1908/PCBuilder.git
4. Open the project directory from Eclipse
5. Check JDK / JRE versions: 
    * Navigate to Window->Preferences->Java->Installed JREs->Execution Environments
    * Click on JavaSE-1.8(installed JDK) in Execution Environments tab-> Check jre1.8.0_144 in Compatible JREs (with perfect match tag)
    * Apply and Close
6. Run configuration:
    * Right click on the project and select Run as->Maven install
    * Navigate to Run->Run Configurations
    * Right click on Maven Build->New
    * Type in:
        * Name: Run PCBuilder
        * Base directory: Workspace->OK
        * Goals: tomcat7:run
    * Run
7. Open web application by navigate to http://localhost:8080/

Setup instructions for MySQL database:
1. Install MySQL Server from https://dev.mysql.com/downloads/installer/
2. Set username "root" with password as "abc123" (Our database use username "root" and password "abc123")
3. Import database schema:
    * Open terminal and navigate to PCBuilder\src\main\mysql
    * mysql -u root -p < database.sql
    * Type in password: "abc123" 
3. Import data:
    * mysql -u root -p < data.sql
    * Type in password: "abc123" 
    * The application is ready to be used
5. To connect to database:
    * mysql -u root -p
    * Type in password: "abc123" 
    * use db
    * Type queries: show tables, select * from user, etc

## Notes:
  1. The tomcat server is running until the running console is stopped
  2. Everytime the project is saved, the server will automatically refresh
 


