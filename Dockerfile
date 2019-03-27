FROM redis
EXPOSE 6379:6379

FROM java:8-jre
ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
RUN mkdir -p "$CATALINA_HOME"
WORKDIR $CATALINA_HOME
ENV TOMCAT_MAJOR 8
ENV TOMCAT_VERSION 8.0.32
COPY target/*.war /usr/local/tomcat/webapps/
EXPOSE 8088
CMD ["catalina.sh", "run"]