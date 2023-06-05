#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

if [[ "${IMAGE_NAME}" == "" ]]; then
    echo "Must set IMAGE_NAME environment variable. Exiting."
    exit 1
fi

docker run --rm $IMAGE_NAME --version > /dev/null

TMPDIR="$(mktemp -d)"
chmod go+wrx "${TMPDIR}"
cd "${TMPDIR}"

docker pull cgr.dev/chainguard/static
docker save cgr.dev/chainguard/static > static.tar

docker run --rm -v "$PWD":/work --workdir=/work $IMAGE_NAME --source docker-archive static.tar -j out.json
cat out.json | grep "efficiencyScore"
