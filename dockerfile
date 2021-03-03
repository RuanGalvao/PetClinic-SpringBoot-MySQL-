FROM openjdk:8-jdk-alpine
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} petclinic.jar
ENTRYPOINT ["java","-jar","/petclinic.jar"]

FROM jenkins/jenkins:lts
USER root
RUN apt-get update && apt-get install -y maven
