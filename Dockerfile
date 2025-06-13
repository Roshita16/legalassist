# 👉 Base image with Tomcat + JDK 17
FROM tomcat:9.0-jdk17-temurin

# 🧹 Throw away default Tomcat examples
RUN rm -rf /usr/local/tomcat/webapps/*

# 🚀 Copy your built WAR into Tomcat and call it ROOT.war
COPY target/*.war /usr/local/tomcat/webapps/ROOT.war

# 🌐 Tomcat listens on 8080; Render will expose it automatically
EXPOSE 8080

# 🏃 Start Tomcat
CMD ["catalina.sh", "run"]
