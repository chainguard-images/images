#!/bin/bash

set -euo pipefail

chmod 777 -R /data
cp -r /tests/* /data

apk add icu tzdata openssl

UNAME=$(uname -m)
if [ "$UNAME" == "x86_64" ]; then
  UNAME="linux-x64"
else
  UNAME="linux-arm64"
fi

printf "$UNAME" > /tmp/arch