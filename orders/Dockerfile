FROM maven:3-jdk-8 AS build
WORKDIR /tmp

copy src /tmp/src
copy pom.xml /tmp/

run mvn clean package

#from adoptopenjdk/openjdk8:alpine
FROM weaveworksdemos/msd-java:jre-latest
COPY --from=build /tmp/target/orders.jar /orders.jar

run chmod a+rx ./orders.jar

USER ${SERVICE_USER}

ARG BUILD_DATE
ARG BUILD_VERSION
ARG COMMIT

LABEL org.label-schema.vendor="fatimahalobaidan" \
  org.label-schema.build-date="${BUILD_DATE}" \
  org.label-schema.version="${BUILD_VERSION}" \
  org.label-schema.name="Socks Shop: orders" \
  org.label-schema.description="REST API for orders service" \
  org.label-schema.url="https://github.com/microservices-demo/orders" \
  org.label-schema.vcs-url="github.com:microservices-demo/orders.git" \
  org.label-schema.vcs-ref="${COMMIT}" \
  org.label-schema.schema-version="1.0"

ENTRYPOINT ["/opt/java/openjdk/bin/java","-jar","./orders.jar", "--port=80"]
