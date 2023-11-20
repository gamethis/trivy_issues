FROM dahicks/sample:latest as build

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN useradd --no-log-init -r -g root bonkey

#USER bonkey