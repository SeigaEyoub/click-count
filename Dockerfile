FROM tomcat:8.5-alpine
ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
RUN mkdir -p "$CATALINA_HOME"
COPY target/*.war /usr/local/tomcat/webapps/
EXPOSE 8088
CMD ["catalina.sh", "run"]

FROM redis
EXPOSE 6379:6379