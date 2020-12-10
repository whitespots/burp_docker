#!/bin/sh

name="burpsuite_pro"
version="$BURP_SUITE_PRO_VERSION"
file_name="$HOME/${name}_v$version.jar"
checksum="$BURP_SUITE_PRO_CHECKSUM"

# Download the JAR file.
curl \
  -o "$file_name" \
  "https://portswigger.net/burp/releases/download?product=pro&version=$version&type=Jar" -v

echo "$checksum *$file_name" | sha256sum -c || exit