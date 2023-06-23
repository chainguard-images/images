#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

docker run -u root --entrypoint sh --rm "${IMAGE_NAME}" -c "pip install numpy; python -c 'import numpy; print(numpy.__version__)'"
