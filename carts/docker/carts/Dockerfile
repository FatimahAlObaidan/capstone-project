from bryandollery/maven-repo as build

WORKDIR /tmp/

COPY . /tmp/src/
COPY pom.xml /tmp/
RUN mvn clean package


FROM weaveworksdemos/msd-java:jre-latest


WORKDIR /usr/src/app
COPY --from=build /tmp/target/carts/*.jar /carts.jar
RUN chmod +x /usr/local/bin/java.sh
RUN  chmod a+rx ./carts.jar

USER ${SERVICE_USER}

ARG BUILD_DATE
ARG BUILD_VERSION
ARG COMMIT

LABEL org.label-schema.vendor="fatimahalobaidan" \
  org.label-schema.build-date="${BUILD_DATE}" \
  org.label-schema.version="${BUILD_VERSION}" \
  org.label-schema.name="Socks Shop: Cart" \
  org.label-schema.description="REST API for Cart service" \
  org.label-schema.url="https://github.com/microservices-demo/carts" \
  org.label-schema.vcs-url="github.com:microservices-demo/carts.git" \
  org.label-schema.vcs-ref="${COMMIT}" \
  org.label-schema.schema-version="1.0"

ENTRYPOINT ["/usr/local/bin/java.sh","-jar","./app.jar", "--port=80"]
