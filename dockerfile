ARG JFROG_REGISTRY
ARG JFROG_DOCKER_REPO

FROM ${JFROG_REGISTRY}/${JFROG_DOCKER_REPO}/eclipse-temurin:17-jre
WORKDIR /app

RUN groupadd -r appuser && useradd -r -g appuser appuser

COPY target/*.jar app.jar
RUN chown appuser:appuser app.jar

USER appuser

ENTRYPOINT ["java", "-jar", "app.jar"]