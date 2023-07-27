#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# The image can be used as a base image.
cat <<EOF | docker build -t go-version -
FROM ${IMAGE_NAME}
RUN go version
ENTRYPOINT ["go", "version"]
EOF

docker run --rm go-version | grep "go version"
