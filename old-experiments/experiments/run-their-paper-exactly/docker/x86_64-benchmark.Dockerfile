FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    gcc \
    g++ \
    git \
    curl \
    ca-certificates \
    python3 \
    python3-pip \
    hyperfine \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace
