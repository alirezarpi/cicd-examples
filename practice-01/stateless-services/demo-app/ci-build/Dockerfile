

# -------------- Build Stage --------------
FROM gradle:jdk17 as Build

WORKDIR /app
COPY . .
RUN ./gradlew bootJar && mv /app/build/libs/*.jar /app/build/libs/app.jar


# -------------- Serve Stage --------------
FROM <your-repository-url>/infrastructure/ci-cd/java-base-image:17-debian-11 as Serve

ARG CI_PROJECT_NAME 

COPY --from=Build /app/build/libs/ .
COPY ci-cd/stateless-services/$CI_PROJECT_NAME/ci-build/entrypoint.d .

ARG VAULT_ADDR
ARG CONSUL_HTTP_ADDR 
ENV VAULT_ADDR $VAULT_ADDR
ENV CONSUL_HTTP_ADDR $CONSUL_HTTP_ADDR

ARG SECRET_PATH 
ARG VARIABLE_PATH 
RUN sed "s@TMP_SECRET_PATH@$SECRET_PATH@g;s@TMP_VARIABLE_PATH@$VARIABLE_PATH@g;" /srv/envconsul.entrypoint.config.hcl.template | tee /srv/envconsul.entrypoint.config.hcl

CMD ["/usr/local/bin/envconsul", "-once", "-log-level", "info", "-config","/srv/envconsul.entrypoint.config.hcl"]
