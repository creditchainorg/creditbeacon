FROM rust:1.88.0-bullseye AS builder
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
