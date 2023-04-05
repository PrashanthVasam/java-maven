FROM ubuntu:16.04

ADD "${{ secrets.JAR_FILE }}"/maven-wrapper.jar

RUN apt-get update && apt-get install -y indy-cli
