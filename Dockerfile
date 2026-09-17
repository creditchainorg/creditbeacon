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
ARG FEATURES
ARG PROFILE=release
ARG CARGO_USE_GIT_CLI=true
ENV FEATURES=$FEATURES
ENV PROFILE=$PROFILE
ENV CARGO_NET_GIT_FETCH_WITH_CLI=$CARGO_USE_GIT_CLI
ENV CARGO_INCREMENTAL=1

WORKDIR /creditbeacon
COPY . .
# Persist the registry and target file across builds. See: https://docs.docker.com/build/cache/optimize/#use-cache-mounts
RUN --mount=type=cache,target=/usr/local/cargo/registry \
    --mount=type=cache,target=/creditbeacon/target \
    make

FROM ubuntu:22.04
RUN apt-get update && apt-get -y upgrade && apt-get install -y --no-install-recommends \
  libssl-dev \
  ca-certificates \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
COPY --from=builder /usr/local/cargo/bin/creditbeacon /usr/local/bin/creditbeacon
RUN ln -s /usr/local/bin/creditbeacon /usr/local/bin/lighthouse
ENTRYPOINT ["creditbeacon"]
