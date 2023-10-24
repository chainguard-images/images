#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

echo "${IMAGE_NAME}"

docker run --rm "${IMAGE_NAME}" --version

# Make a file in the current directory and run the cedar tool on it.

cat <<EOF > sample.cedar
permit (
  principal == User::"alice",
  action == Action::"view",
  resource in Album::"jane_vacation"
);
EOF

trap "rm -f sample.cedar" EXIT

docker run --rm -e RUST_BACKTRACE=full -v "${PWD}:/work" -w /work "${IMAGE_NAME}" check-parse --policies /work/sample.cedar
