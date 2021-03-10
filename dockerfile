FROM openjdk:8-jdk-alpine
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]



#FROM jenkins:2.60.3-alpine
#ENV JFiles="C:\\jenkins_home"
#ENV JFiles=C:\jenkins_home/jenkins_home
#WORKDIR ${JFiles}
#ADD  /spring-petclinic/jenkins_home/ /var/jenkins_home
#COPY /jenkins_home/ /var/jenkins_home
