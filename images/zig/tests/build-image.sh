#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# Using registry.local:5000 as the FROM in `docker build` fails with
# current versions of docker that use containerd under the hood.
# Pre-pulling it uses docker's heuristics for allowing insecure registries.
docker pull ${IMAGE_NAME}

cat <<EOF | docker build -t zig-test -
FROM ${IMAGE_NAME} AS build

WORKDIR /build

RUN zig init-exe && \
    zig build

FROM scratch

COPY --from=build /build/zig-out/bin/build /hello

ENTRYPOINT ["./hello"]
EOF

docker run --rm zig-test
