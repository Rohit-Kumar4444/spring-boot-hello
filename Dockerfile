#this is spring boot dockerfile
FROM  openjdk:11-jre-slim
WORKDIR /app
COPY target/spring-boot-2-hello-world-1.0.2-SNAPSHOT.jar /app/app.jar
EXPOSE 8080
<<<<<<< Updated upstream
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
=======
ENTRYPOINT ["java", "-jar", "/app/app.jar"] 
>>>>>>> Stashed changes
