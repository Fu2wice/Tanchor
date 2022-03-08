FROM ubuntu:20.04

RUN apt-get update && \
apt-get install -y --no-install-recommends \
        openjdk-11-jdk

# build jar
ADD . /code
WORKDIR /code
RUN ./gradlew clean build --stacktrace

RUN rm ./platform/build/libs/platform*-plain.jar
COPY ./platform/build/libs/platform*.jar /app/anchor-platform.jar

RUN mkdir /config
ENV STELLAR_ANCHOR_CONFIG=file:/config/anchor-config.yaml

EXPOSE 8080 8081

ENTRYPOINT ["java", "-jar", "/app/anchor-platform.jar"]


