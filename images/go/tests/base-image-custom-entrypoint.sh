#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

docker pull ${IMAGE_NAME}

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
