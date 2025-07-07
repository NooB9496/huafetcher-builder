FROM ubuntu:latest

ENV CI=1
ENV PYTHONBREAKSYSTEMPACKAGES=1
ENV PATH="/home/buildozer/venv/bin:$PATH"

RUN set -eux \
  && apt-get update -yqq \
  && DEBIAN_FRONTEND=noninteractive apt-get install -yqq --no-install-recommends \
    autoconf \
    automake \
    autotools-dev \
    build-essential \
    default-jdk \
    git \
    libcrypto++-dev \
    libffi-dev \
    libltdl-dev \
    libssl-dev \
    libtool \
    python3 \
    python3-dev \
    python3-pip \
    python3-venv \
    sed \
    unzip \
    zip \
    zlib1g-dev \
  && useradd -ms /bin/bash buildozer \
  && python3 -m venv /home/buildozer/venv \
  && /home/buildozer/venv/bin/pip install --upgrade pip setuptools wheel \
  && /home/buildozer/venv/bin/pip install buildozer cython kivy \
  && chown -R buildozer:buildozer /home/buildozer

USER buildozer
WORKDIR /home/buildozer
