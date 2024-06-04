#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# Install curl
apk add curl

# Fetch certs
curl https://raw.githubusercontent.com/neuvector/manifests/main/build/share/etc/neuvector/certs/internal/ca.cert -o ca.cert
curl https://raw.githubusercontent.com/neuvector/manifests/main/build/share/etc/neuvector/certs/internal/cert.key -o cert.key
curl https://raw.githubusercontent.com/neuvector/manifests/main/build/share/etc/neuvector/certs/internal/cert.pem -o cert.pem

# Create secret
kubectl create ns neuvector
kubectl create secret generic internal-cert -n neuvector --from-file=cert.key --from-file=cert.pem --from-file=ca.cert
