
FROM tomcat:8

#copy war to webapps of tomcat

COPY target/*.war /usr/local/tomcat/webapps/
expose 8088