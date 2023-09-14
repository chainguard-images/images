#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# Using registry.local:5000 as the FROM in `docker build` fails with
# current versions of docker that use containerd under the hood.
# Pre-pulling it uses docker's heuristics for allowing insecure registries.
docker pull ${IMAGE_NAME}

# The image can be used as a base image.
cat <<EOF | docker build -t go-version -
FROM ${IMAGE_NAME}
RUN go version
ENTRYPOINT ["go", "version"]
EOF

docker run --rm go-version | grep "go version"
