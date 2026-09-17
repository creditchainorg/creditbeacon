# `lcli` requires the full project to be in scope, so this should be built either:
#  - from the `lighthouse` dir with the command: `docker build -f ./lcli/Dockerflie .`
#  - from the current directory with the command: `docker build -f ./Dockerfile ../`
FROM rust:1.88.0-bullseye AS builder
# Debian 11 left the live mirrors when its LTS ended (2026-08-31): the security index still lists
# updates whose files now return 404, so `apt-get upgrade` fails. Read packages from the dated
# snapshot archive instead, which also makes this stage reproducible. Move the date deliberately.
RUN printf '%s\n' \
      'deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20260825T000000Z bullseye main' \
      'deb [check-valid-until=no] http://snapshot.debian.org/archive/debian-security/20260825T000000Z bullseye-security main' \
      'deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20260825T000000Z bullseye-updates main' \
      > /etc/apt/sources.list
RUN apt-get update && apt-get -y upgrade && apt-get install -y cmake libclang-dev
COPY . lighthouse
ARG FEATURES
ENV FEATURES=$FEATURES
RUN cd lighthouse && make install-lcli

FROM ubuntu:22.04
RUN apt-get update && apt-get -y upgrade && apt-get clean && rm -rf /var/lib/apt/lists/*
COPY --from=builder /usr/local/cargo/bin/lcli /usr/local/bin/lcli
