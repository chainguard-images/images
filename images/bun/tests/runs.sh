#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

TMPDIR="$(mktemp -d)"
chmod go+wrx $TMPDIR
cd $TMPDIR

docker run -w /src -v $(pwd):/src $IMAGE_NAME init
docker run -w /src -v $(pwd):/src $IMAGE_NAME run index.ts | grep "Hello via Bun!"
