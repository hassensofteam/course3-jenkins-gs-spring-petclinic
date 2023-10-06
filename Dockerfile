#
# Build stage
#
FROM maven:3.5.2-jdk-8-alpine AS MAVEN_TOOL_CHAIN
COPY . .
RUN mvn clean install

#
# Package stage
#
FROM openjdk:11-jdk-slim
COPY --from=build /target/spring-petclinic-3.1.0-SNAPSHOT.jar demo.jar
# ENV PORT=8080
EXPOSE 8080
ENTRYPOINT ["java","-jar","demo.jar"]