FROM python:3.11-slim

ENV CI=1
ENV PYTHONBREAKSYSTEMPACKAGES=1
ENV DEBIAN_FRONTEND=noninteractive
ENV PATH="/home/buildozer/venv/bin:$PATH"

# Instalacja zależności systemowych i Buildozer + Kivy
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

# Dodaj użytkownika
RUN useradd -ms /bin/bash buildozer

# Stwórz środowisko venv i zainstaluj wymagane pakiety
RUN python -m venv /home/buildozer/venv \
  && /home/buildozer/venv/bin/pip install --upgrade pip setuptools wheel \
  && /home/buildozer/venv/bin/pip install \
     cython==0.29.36 \
     buildozer \
     kivy

USER buildozer
WORKDIR /home/buildozer
