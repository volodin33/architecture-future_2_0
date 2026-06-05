FROM jenkins/jenkins:lts-jdk17

USER root

ARG DOCKER_VERSION=27.3.1
RUN set -eux; \
    arch="$(dpkg --print-architecture)"; \
    case "$arch" in \
      amd64) dockerArch=x86_64 ;; \
      arm64) dockerArch=aarch64 ;; \
      *) echo "unsupported arch: $arch" >&2; exit 1 ;; \
    esac; \
    curl -fsSL "https://download.docker.com/linux/static/stable/${dockerArch}/docker-${DOCKER_VERSION}.tgz" -o /tmp/docker.tgz; \
    tar -xzf /tmp/docker.tgz -C /usr/local/bin --strip-components=1 docker/docker; \
    rm /tmp/docker.tgz; \
    docker --version
