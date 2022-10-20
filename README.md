# huafetcher-builder
huafetcher is a "Kivy GUI for huami-token. Works on desktop and as Android apk. Downloads key and aGPS data, unzips it into /storage/emulated/0".
The APK is currently only available as 32-bit binary. But Google Pixel 7 (pro) - and probably more phones in the future - no longer support running 32-bit binaries.

This script `huafetcher-builder` builds huafetcher as arm64-v8a binary using docker. It will not require you to install
anything else on your machine but docker and is tested to work on MacOS (should work on Linux and WSL, too).

Run via
```
./build.sh
```

and get the binary approx. 15 minutes later from `./build/` folder.

Then install via

```
adb install huafetcher-0.23-arm64-v8a-debug.apk
```
