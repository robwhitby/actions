FROM quay.io/evryfs/github-actions-runner:latest

USER root

# GCR credentials helper
# https://cloud.google.com/container-registry/docs/advanced-authentication#standalone-helper
ARG GCR_CRED_HELPER_VERSION=2.0.4
RUN curl -L https://github.com/GoogleCloudPlatform/docker-credential-gcr/releases/download/v${GCR_CRED_HELPER_VERSION}/docker-credential-gcr_linux_amd64-${GCR_CRED_HELPER_VERSION}.tar.gz \
  | tar xz --to-stdout ./docker-credential-gcr \
  > /usr/local/bin/docker-credential-gcr \
  && chmod +x /usr/local/bin/docker-credential-gcr

COPY entrypoint.sh /

USER runner

RUN mkdir -p /home/runner/.docker \
  && echo '{"credHelpers": {"eu.gcr.io": "gcr"}}' > /home/runner/.docker/config.json
