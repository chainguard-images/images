#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

if [[ "${IMAGE_NAME}" == "" ]]; then
    echo "Must set IMAGE_NAME environment variable. Exiting."
    exit 1
fi

CLONE_URL=${CLONE_URL:-"https://github.com/chainguard-images/git.git"}

CLONEDIR="$(mktemp -d)"
chmod go+wrx "${CLONEDIR}"

# TODO: re-enable this delete. After performing the clone
# in some cases, this results in a "permission denied" error
# trap "rm -rf ${CLONEDIR}" EXIT

# Try cloning a repo and check for README.md
pushd "${CLONEDIR}"
docker run --rm -v "${PWD}":/w -w /w $IMAGE_NAME clone --depth 1 $CLONE_URL .
popd
find "${CLONEDIR}/README.md" && echo "Smoketest passed."
