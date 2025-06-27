# Use official Tomcat 9 with JDK 11 image
FROM tomcat:9-jdk11

# Remove default ROOT app if exists
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy the WAR file built by Maven from target folder into Tomcat webapps folder and rename to ROOT.war for root context
COPY target/*.war /usr/local/tomcat/webapps/ROOT.war

# Set permission to the WAR file
RUN chmod 755 /usr/local/tomcat/webapps/ROOT.war

# Expose default Tomcat port
EXPOSE 8080

# Start Tomcat server
CMD ["catalina.sh", "run"]
