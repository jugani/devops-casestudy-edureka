# Dockerfile
FROM adoptopenjdk:11-jre-hotspot as builder

# Add Maintainer Info
LABEL maintainer="cpb.95.2012@gmail.com"

# Make port 8080 available to the world outside this container
EXPOSE 8080

# The application's jar file
ARG JAR_FILE=/mnt/artefact/spring-petclinic-2.2.0.BUILD-SNAPSHOT.jar

# Add the application's jar to the container
ADD ${JAR_FILE} petclinic.jar

# Run the jar file 
ENTRYPOINT ["java","-jar","/petclinic.jar"]










