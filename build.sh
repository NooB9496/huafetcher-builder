#!/bin/bash -ex

mkdir -p build
chmod 777 build
docker rmi huafetcher-builder || true
docker build -t huafetcher-builder .
docker run -it \
  --platform linux/amd64 \
  -v huafetcher-builder-buildozer:/home/buildozer \
  -v $PWD/build/:/build \
  huafetcher-builder \
  bash -c 'set -eux \
    ; pip install \
      buildozer \
      Cython \
      kivy \
    ; export PATH=/home/buildozer/.local/bin:$PATH \
    ; cd /home/buildozer \
    ; if [ -e huafetcher ] \
    ; then \
        cd huafetcher \
    ;   git checkout master \
    ;   git reset --hard \
    ;   git config pull.rebase true \
    ;   git pull \
    ; else \
        git clone https://codeberg.org/rusi/huafetcher.git \
    ;   cd huafetcher \
    ; fi \
    ; buildozer -v android debug \
    ; cp /home/buildozer/huafetcher/bin/*.apk /build/ \
  '
