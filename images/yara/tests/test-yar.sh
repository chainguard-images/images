#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# Grep checks for the expected output
docker run --rm -v "${PWD}:/work" -w /work "${IMAGE_NAME}" test.yar /usr/bin/yara | grep test_rule | grep /usr/bin/yara
