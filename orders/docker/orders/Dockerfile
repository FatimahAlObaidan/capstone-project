FROM maven:3-jdk-11 as build
WORKDIR /tmp/

copy . /tmp/src
copy pom.xml /tmp/

FROM weaveworksdemos/msd-java:jre-latest
WORKDIR /usr/src/app
COPY --from=build /tmp/target/orders/*.jar /orders.jar
COPY *.jar ./app.jar
RUN chmod +x /usr/local/bin/java.sh
RUN  chmod a+rx ./orders.jar
RUN	chown -R ${SERVICE_USER}:${SERVICE_GROUP} ./app.jar

USER ${SERVICE_USER}

ENTRYPOINT ["/usr/local/bin/java.sh","-jar","./app.jar", "--port=80"]
