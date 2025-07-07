FROM python:3.11-slim

ENV CI=1
ENV PYTHONBREAKSYSTEMPACKAGES=1
ENV DEBIAN_FRONTEND=noninteractive
ENV PATH="/home/buildozer/venv/bin:$PATH"

# Systemowe zależności
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    unzip \
    zip \
    openjdk-17-jdk \
    autoconf \
    automake \
    autotools-dev \
    libcrypto++-dev \
    libffi-dev \
    libltdl-dev \
    libssl-dev \
    libtool \
    zlib1g-dev \
    curl \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Tworzenie użytkownika
RUN useradd -ms /bin/bash buildozer
USER buildozer
WORKDIR /home/buildozer

# Tworzenie venv i instalacja zależności jako buildozer (ważne!)
RUN python3 -m venv /home/buildozer/venv && \
    /home/buildozer/venv/bin/pip install --upgrade pip setuptools wheel && \
    /home/buildozer/venv/bin/pip install \
      cython==0.29.36 \
      buildozer \
      kivy

