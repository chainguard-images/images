#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# Running with and without a command doesn't error
docker run --rm $IMAGE_NAME
docker run --rm $IMAGE_NAME apk --version | grep "apk-tools .*"

# The image runs as root by default.
docker run --rm --entrypoint '' $IMAGE_NAME whoami | grep "^root$"

# The image contains busybox.
docker run --rm $IMAGE_NAME busybox | grep "^BusyBox .* multi-call binary."

# The image can be used as a base image.
cat <<EOF | docker build -t version -
FROM ${IMAGE_NAME}
RUN apk --version
ENTRYPOINT ["apk"]
EOF
docker run version --version | grep "^apk-tools "

# The image can be used as a base image with a custom entrypoint.
cat <<EOF | docker build -t version-entrypoint -
FROM ${IMAGE_NAME}
RUN apk --version
RUN mkdir -p /usr/local/bin && \
   echo '#!/bin/sh' > /usr/local/bin/hello && \
   echo 'apk --version' >> /usr/local/bin/hello && \
   chmod +x /usr/local/bin/hello
ENTRYPOINT ["hello"]
EOF
docker run version-entrypoint | grep "^apk-tools "
