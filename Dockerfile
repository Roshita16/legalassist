FROM tomcat:9.0.85-jdk17

# Clean default apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR
COPY ./legalassist.war /usr/local/tomcat/webapps/legalassist.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
