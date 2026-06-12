FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    curl \
    git \
    unzip \
    xz-utils \
    zip \
    wget \
    openjdk-17-jdk \
    clang \
    cmake \
    ninja-build \
    pkg-config \
    libgtk-3-dev \
    libglu1-mesa

WORKDIR /opt

RUN git clone https://github.com/flutter/flutter.git

ENV PATH="/opt/flutter/bin:${PATH}"

RUN flutter doctor

WORKDIR /app

CMD ["/bin/bash"]