FOM redis
-v ./data:/data
EXPOSE 6379:6379
CMD["redis-server","--appendonly","yes"] 

FROM java:8-jre
ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
RUN mkdir -p "$CATALINA_HOME"
WORKDIR $CATALINA_HOME
ENV TOMCAT_MAJOR 8
ENV TOMCAT_VERSION 8.0.32
ENV TOMCAT_TGZ_URL https://www.apache.org/dist/tomcat/tomcat-$TOMCAT_MAJOR/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz
ADD ./target/*.war $CATALINA_HOME/webapps/
EXPOSE 8081
CMD ["catalina.sh", "run"]