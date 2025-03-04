#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

image=$(echo "$IMAGES" | jq -r '."chainguard-base".ref')

# Test basic runs
docker run --rm "$image"
docker run --rm "$image" apk --version | grep "apk-tools .*"

# Test root user default
docker run --rm --entrypoint '' "$image" whoami | grep "^root$"

# Test busybox presence
docker run --rm "$image" busybox | grep "^BusyBox .* multi-call binary."

# Test base image usage
cat <<EOF | docker build -t version -
FROM ${image}
RUN apk --version
ENTRYPOINT ["apk"]
EOF
docker run --rm version --version | grep "^apk-tools "

# Test custom entrypoint
cat <<EOF | docker build -t version-entrypoint -
FROM ${image}
RUN apk --version
RUN mkdir -p /usr/local/bin && \
   echo '#!/bin/sh' > /usr/local/bin/hello && \
   echo 'apk --version' >> /usr/local/bin/hello && \
   chmod +x /usr/local/bin/hello
ENTRYPOINT ["hello"]
EOF
docker run --rm version-entrypoint | grep "^apk-tools "