FROM maven:3.5-jdk-8-alpine as base-build 

COPY pom.xml /tmp/
COPY src /tmp/src/
WORKDIR /tmp/
RUN mvn package

RUN ["/usr/local/bin/mvn-entrypoint.sh", "mvn", "clean", "--fail-never"]
RUN mvn package

FROM tomcat:8.5-alpine
WORKDIR /usr/tomcat/webapps
COPY --from=base-build /tmp/target/clickCount.war /usr/local/tomcat/webapps/clickCount.war
EXPOSE 8080
CMD ["catalina.sh", "run"]