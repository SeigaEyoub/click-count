# Pull base image 
From tomcat:8-jre8 

# Maintainer 
MAINTAINER "youremailaddress" 

# Copy to images tomcat path 
ADD web.xml /usr/local/tomcat/conf/ 
ADD obclient.properties /etc/ 
ADD WebClient.properties /etc/ 
ADD target/*.war /usr/local/tomcat/webapps/ 
EXPOSE 8081
