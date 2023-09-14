#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

TMPDIR="$(mktemp -d)"
chmod go+wrx "${TMPDIR}"
cd "${TMPDIR}"

cat > ./main.tf <<EOF
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
  -v "${PWD}":/work \
  -w /work \
  "${IMAGE_NAME}" init

docker run --rm \
  -v "${PWD}":/work \
  -w /work \
  "${IMAGE_NAME}" apply --auto-approve
