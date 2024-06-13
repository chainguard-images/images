#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

docker pull ${IMAGE_NAME}

cat <<EOF | docker build -t go-version -
FROM ${IMAGE_NAME}
RUN go version
ENTRYPOINT ["go", "version"]
EOF

docker run --rm go-version | grep "go version"
