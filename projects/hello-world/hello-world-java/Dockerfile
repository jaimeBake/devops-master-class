# Build a JAR File
#FROM maven:3.8.3-openjdk-17 AS stage1
#WORKDIR /home/app
#COPY . /home/app/
#RUN mvn -f /home/applications/developpements/28minutesCours/devops-master-class/projects/hello-world/hello-world-java/pom.xml clean package

# Create an Image
#FROM openjdk:17-jdk-alpine
#EXPOSE 5000
#COPY --from=stage1 /home/applications/developpements/28minutesCours/devops-master-class/projects/hello-world/hello-world-java/target/hello-world-java.jar hello-world-java.jar
#ENTRYPOINT ["sh", "-c", "java -jar /hello-world-java.jar"]



FROM maven:3.8.3-openjdk-17 AS stage1
WORKDIR /home/app
COPY . /home/app/
RUN mvn -f pom.xml clean install

# Create an Image
FROM openjdk:17-jdk-alpine
EXPOSE 5000
COPY --from=stage1 /home/app/target/hello-world-java.jar hello-world-java.jar
ENTRYPOINT ["sh", "-c", "java -jar /hello-world-java.jar"]
