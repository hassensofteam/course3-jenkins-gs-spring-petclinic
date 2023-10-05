FROM ubuntu:latest AS build

RUN apt-get update
RUN apt-get install openjdk-17-jdk -y
COPY . .
RUN ./gradlew bootJar --no-daemon
# Use an official OpenJDK runtime as a parent image

# Set the working directory inside the container
WORKDIR /app

# Copy the application JAR file into the container at /app
COPY target/spring-petclinic-3.1.0-SNAPSHOT.jar /app/app.jar

# Expose the port that the application will run on
EXPOSE 8080

# Command to run the application when the container starts
CMD ["java", "-jar", "app.jar"]
