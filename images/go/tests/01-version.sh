#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

docker run --rm $IMAGE_NAME version
docker run --rm --entrypoint sh $IMAGE_NAME -c "go version"
docker run --rm --entrypoint '' $IMAGE_NAME go version

# The image runs as root by default.
docker run --rm --entrypoint '' $IMAGE_NAME whoami | grep "^root$"

# The image contains git and ssh.
docker run --rm --entrypoint git $IMAGE_NAME version
docker run --rm --entrypoint ssh $IMAGE_NAME -V

# The image can be used as a base image.
cat <<EOF | docker build -t go-version -
FROM ${IMAGE_NAME}
RUN go version
ENTRYPOINT ["go", "version"]
EOF
docker run go-version | grep "go version"

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
docker run go-version-entrypoint | grep "go version"
