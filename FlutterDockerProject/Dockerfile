FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    curl \
    git \
    unzip \
    xz-utils \
    zip \
    libglu1-mesa \
    wget

WORKDIR /opt

RUN git clone https://github.com/flutter/flutter.git

WORKDIR /opt/flutter

RUN git checkout 3.24.0

ENV PATH="/opt/flutter/bin:${PATH}"

RUN flutter doctor

CMD ["flutter", "--version"]