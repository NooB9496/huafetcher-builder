FROM --platform=linux/amd64 ubuntu
#FROM ubuntu

# Disable download progress logging for buildozer
ENV CI=1

RUN set -eux \
  ; apt-get update -yqq \
  ; DEBIAN_FRONTEND=noninteractive apt-get install -yqq --no-install-recommends \
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
    sed \
    unzip \
    zip \
    zlib1g-dev \
  ; useradd -ms /bin/bash buildozer \
  ; cd /home/buildozer \
  ; git clone https://codeberg.org/vanous/huafetcher.git \
  ; chown -R buildozer:root /home/buildozer

USER buildozer
WORKDIR /home/buildozer/huafetcher

RUN set -eux \
  ; sed  -i -e '/android\.arch =/ s/arch = .*/archs = arm64-v8a/' buildozer.spec \
  ; grep android.arch buildozer.spec \
  ; pip install \
    buildozer \
    Cython \
    kivy

ENV PATH=/home/buildozer/.local/bin:$PATH

RUN set -eux \
  ; buildozer -v android debug

#  ; yes | buildozer -v android debug
