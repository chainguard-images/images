#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

echo "${IMAGE_NAME}"

# Make a file in the current directory and run the cedar tool on it.

cat <<EOF > semgrep-sample.py
from lib import get_user_input, safe_get_user_input, secure_eval
user_input = get_user_input()
eval(user_input)
EOF

trap "rm -f semgrep-sample.py" EXIT

docker run --rm -v "${PWD}:/work" -w /work "${IMAGE_NAME}" scan --config auto .
