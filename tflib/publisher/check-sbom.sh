#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail

TMP=$(mktemp)

if ! cosign download attestation \
   --predicate-type="https://spdx.dev/Document" \
  "${IMAGE_NAME}" | jq -r .payload | base64 -d | jq .predicate > "${TMP}" ; then
  if env | grep ACTIONS_ID_TOKEN_REQUEST_URL ; then
    # The ID token endpoint in actions is available, so things SHOULD fail.
    exit 1
  fi
  # To support running things locally, where we don't currently support signing,
  # make the absence of the attestation non-fatal.
  echo Skipping SBOM test due to missing attestation.
  exit 0
fi

NTIA_IMAGE=${NTIA_IMAGE:-cgr.dev/chainguard/ntia-conformance-checker:latest@sha256:81544707e540e890fb73023b40f459fcdd08ffc4772868e12dc60de96a5cf4de}

cat ${TMP}

docker run --rm -v ${TMP}:/sbom.json ${NTIA_IMAGE} --file /sbom.json
