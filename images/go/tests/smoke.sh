#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

image=$(echo "$IMAGES" | jq -r '.go.ref')

docker run --rm "${image}" version
docker run --rm --entrypoint sh "${image}" -c 'go version'
docker run --rm --entrypoint '' "${image}" go version

docker run --rm --entrypoint '' "${image}" whoami | grep '^root$'

docker run --rm --entrypoint git "${image}" version
docker run --rm --entrypoint ssh "${image}" -V

docker pull "${image}"

cat <<EOF | docker build -t go-version -
FROM ${image}
RUN go version
ENTRYPOINT ["go", "version"]
EOF

docker run --rm go-version | grep "go version"

cat <<EOF | docker build -t go-version-entrypoint -
FROM ${image}
RUN go version
RUN mkdir -p /usr/local/bin && \
   echo '#!/bin/sh' > /usr/local/bin/hello && \
   echo 'go version' >> /usr/local/bin/hello && \
   chmod +x /usr/local/bin/hello
ENTRYPOINT ["hello"]
EOF

docker run --rm go-version-entrypoint | grep "go version"

mkdir -p /workspace
cp -r hello /workspace/
cd /workspace/hello
docker run --rm \
  -v $(pwd):/hello \
  -w /hello \
  "${image}" build .

