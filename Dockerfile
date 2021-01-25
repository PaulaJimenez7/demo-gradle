FROM openjdk:15-jdk as javabuild
WORKDIR /build/
COPY . /build/
RUN ./gradlew assemble

FROM openjdk:15-jdk
ARG JAR_FILE=build/libs/*.jar
COPY --from=javabuild /build/${JAR_FILE} app.jar 
ENTRYPOINT ["java","-jar","/app.jar"]