FROM ubuntu:latest AS build

RUN apt-get update
RUN apt-get install openjdk-17-jdk -y
COPY . .

RUN ./gradlew bootJar --no-daemon

FROM  openjdk:17-jdk-slim
VOLUME /tmp                   # Temporary location to run
EXPOSE 8080                   # Provide port number
ADD target/spring-petclinic-3.1.0-SNAPSHOT.jar spring-petclinic-3.1.0-SNAPSHOT.jar 
ENTRYPOINT ["java","-jar","/spring-petclinic-3.1.0-SNAPSHOT.jar"] 