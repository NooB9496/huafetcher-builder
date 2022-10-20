#!/bin/bash -ex

mkdir -p build
docker rmi huafetcher-builder || true
docker build -t huafetcher-builder .
docker run --rm -u0 \
  -v $PWD/build/:/build \
  huafetcher-builder \
  bash -c 'cp /home/buildozer/huafetcher/bin/*.apk /build/'
