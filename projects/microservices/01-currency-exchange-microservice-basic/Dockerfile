FROM maven:3.8.3-openjdk-17 AS build
WORKDIR /home/app
COPY . /home/app
RUN mvn -f pom.xml clean install

FROM openjdk:17-alpine
VOLUME /tmp
EXPOSE 8000
COPY --from=build /home/app/target/*.jar app.jar
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar" ]