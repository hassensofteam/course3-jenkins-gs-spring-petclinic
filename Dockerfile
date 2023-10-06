FROM ubuntu:latest AS build

RUN apt-get update
RUN apt-get install openjdk-17-jdk -y
COPY . .

RUN ./gradlew bootJar --no-daemon

FROM openjdk:17-jdk-slim

EXPOSE 8080

# Set the working directory in the container
# WORKDIR /libs

# Create a directory named 'app' inside the container
# RUN mkdir libs

COPY --from=build spring-petclinic-3.1.0-SNAPSHOT.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]