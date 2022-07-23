

ARG BASE_IMAGE_TAG
FROM bitnami/java:${BASE_IMAGE_TAG}

# ------ install essentials ------
RUN install_packages curl unzip

WORKDIR /srv

# ------ install EnvConsul ------
ENV ENVCONSUL_VERSION=0.12.1
RUN curl https://releases.hashicorp.com/envconsul/${ENVCONSUL_VERSION}/envconsul_${ENVCONSUL_VERSION}_linux_amd64.zip --output  /tmp/envconsul.zip && \
    unzip /tmp/envconsul.zip -d /usr/local/bin/ && \
    rm /tmp/envconsul.zip
