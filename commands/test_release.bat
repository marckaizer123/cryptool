@echo off

@SETLOCAL
set path=%USERPROFILE%\AppData\Local\Android\Sdk\platform-tools

adb install build\app\outputs\flutter-apk\app-armeabi-v7a-release.apk
