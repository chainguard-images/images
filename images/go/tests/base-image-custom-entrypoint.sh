#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# Using registry.local:5000 as the FROM in `docker build` fails with
# current versions of docker that use containerd under the hood.
# Pre-pulling it uses docker's heuristics for allowing insecure registries.
docker pull ${IMAGE_NAME}

# The image can be used as a base image with a custom entrypoint.
cat <<EOF | docker build -t go-version-entrypoint -
FROM ${IMAGE_NAME}
RUN go version
RUN mkdir -p /usr/local/bin && \
   echo '#!/bin/sh' > /usr/local/bin/hello && \
   echo 'go version' >> /usr/local/bin/hello && \
   chmod +x /usr/local/bin/hello
ENTRYPOINT ["hello"]
EOF

docker run --rm go-version-entrypoint | grep "go version"
