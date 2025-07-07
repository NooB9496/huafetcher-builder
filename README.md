# Huafetcher Builder (Dockerized)

This project allows you to build a **huafetcher** Android app in an isolated environment using Docker, without the need to install local dependencies.

## 📦 Requirements

- Docker installed on Linux/macOS/WSL
- `bash` (to run `build.sh`)

## 🚀 How to build the APK

1. **Clone the repository:**
```bash
git clone https://codeberg.org/rusi/huafetcher.git
cd huafetcher
Run the build script:
./build.sh

Once done, you will find the APK file in:
./build/huafetcher-0.23-armeabi-v7a_arm64-v8a-debug.apk

## 📁 Directory structure
huafetcher-builder/
├── build.sh # Main script to run the build process in Docker
├── Dockerfile # Docker image with Buildozer configuration + dependencies
└── build/ # Directory of built APKs (mounted from Docker)

## 🔧 What does build.sh do?
Creates a build/ directory
Builds a huafetcher-builder Docker image
Starts a container that:
Clones the huafetcher repository (if it doesn't exist)
Builds the APK with Buildozer
Copies the APK to a local ./build directory

## ✅ Changes from the original repository
The Dockerfile is based on python:3.11-slim and contains:
Buildozer + Kivy + dependencies (Java, NDK, Cython, etc.)
Build automation via build.sh
No need to manually install Android SDK/NDK or Python 3.11 locally

## 🧪 Tested on
Ubuntu 22.04 + Docker
Android 11+ (APK installation and operation)

## 📤 Installing the APK on your device
After generation:
adb install ./build/huafetcher-*.apk
Or send to phone via email, USB, Google Drive, etc.

## 📜 License
See the LICENSE file from the huafetcher (Codeberg) repository.
