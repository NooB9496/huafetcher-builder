#!/bin/bash -ex

mkdir -p build
chmod 777 build
docker rmi huafetcher-builder || true
docker build --no-cache -t huafetcher-builder .
docker run -it --platform linux/amd64 \
  -v $PWD/build/:/build \
  huafetcher-builder \
  bash -c '
    source /home/buildozer/venv/bin/activate \
    && pip install --break-system-packages buildozer Cython kivy \
    && cd /home/buildozer \
    && if [ -e huafetcher ]; then cd huafetcher; git checkout master; git reset --hard; git pull; else git clone https://codeberg.org/rusi/huafetcher.git; cd huafetcher; fi \
    && buildozer -v android debug \
    && cp /home/buildozer/huafetcher/bin/*.apk /build/
  '
