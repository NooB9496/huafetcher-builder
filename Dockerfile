FROM ubuntu:latest

# Ustawienia środowiska
ENV CI=1
ENV PYTHONBREAKSYSTEMPACKAGES=1
ENV DEBIAN_FRONTEND=noninteractive
ENV PATH="/home/buildozer/venv/bin:$PATH"

# Instalacja zależności systemowych i Python 3.11
RUN set -eux \
  && apt-get update -yqq \
  && apt-get install -yqq --no-install-recommends \
    software-properties-common \
    build-essential \
    curl \
    wget \
    git \
    unzip \
    zip \
    autoconf \
    automake \
    autotools-dev \
    default-jdk \
    libcrypto++-dev \
    libffi-dev \
    libltdl-dev \
    libssl-dev \
    libtool \
    zlib1g-dev \
    python3.11 \
    python3.11-dev \
    python3.11-venv \
    python3-pip \
    sed \
  && update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.11 1

# Dodanie użytkownika
RUN useradd -ms /bin/bash buildozer

# Tworzenie środowiska virtualenv
RUN python3.11 -m venv /home/buildozer/venv \
  && /home/buildozer/venv/bin/pip install --upgrade pip setuptools wheel \
  && /home/buildozer/venv/bin/pip install \
        cython==0.29.36 \
        buildozer \
        kivy

# Przejście na użytkownika buildozer
USER buildozer
WORKDIR /home/buildozer
