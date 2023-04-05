FROM ubuntu:16.04
ARG JAR_FILE=.mvn/wrapper/maven-wrapper.jar
ADD ${JAR_FILE} /tmp/maven-wrapper.jar


