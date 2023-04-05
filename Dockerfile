FROM ubuntu:16.04
ARG JAR_FILE=.mvn/wrapper/maven-wrapper.jar
ADD ${JAR_FILE} /tmp/maven-wrapper.jar

RUN apt-get update && apt-get install -y indy-cli
