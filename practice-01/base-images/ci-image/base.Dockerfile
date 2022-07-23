

FROM docker:20.10

# ------ install essentials ------
RUN apk update && apk add --no-cache git openssh-client curl tar unzip py3-pip

# ------ install Vault ------
ARG VAULT_VERSION=1.11.0
RUN curl https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip --output /tmp/vault.zip && \
    unzip /tmp/vault.zip -d /usr/local/bin/ && \
    rm /tmp/vault.zip

# ------ install Helm ------
ARG HELM_VERSION=v3.9.0
RUN curl https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz --output /tmp/helm.tar.gz && \
    tar -zxvf /tmp/helm.tar.gz && \
    mv linux-amd64/helm /usr/local/bin/ && \
    rm /tmp/helm.tar.gz
RUN helm plugin install https://github.com/chartmuseum/helm-push

# ------ install j2cli ------
RUN pip install j2cli
