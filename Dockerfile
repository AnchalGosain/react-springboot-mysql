# Stage 1 - Build Application

FROM maven:3.9.9-eclipse-temurin-8 AS build

# Working directory
WORKDIR /app

#Copy content
COPY . .

RUN mvn clean package -DskipTests

# Stage 2 - Run Application

FROM eclipse-temurin:8-jre
COPY --from=build /app/target/*.jar app.jar

# Spring Boot default port

EXPOSE 8080

# Start application

ENTRYPOINT ["java","-jar","app.jar"]
