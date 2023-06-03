#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

if [[ "${IMAGE_NAME}" == "" ]]; then
    echo "Must set IMAGE_NAME environment variable. Exiting."
    exit 1
fi

TMPDIR="$(mktemp -d)"

# Make the file readable and writable by all since we use a non-root user
sudo chmod -R 755 "${TMPDIR}"

cat > ${TMPDIR}/main.tf <<EOF
terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
    }
  }
}

provider "random" {}

resource "random_string" "random" {
  length = 16
}

output "random" {
  value = random_string.random.result
}
EOF

docker run --rm \
  -v "${TMPDIR}:/work" \
  -w /work \
  "${IMAGE_NAME}" init

docker run --rm \
  -v "${TMPDIR}:/work" \
  -w /work \
  "${IMAGE_NAME}" apply --auto-approve
