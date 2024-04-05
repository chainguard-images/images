#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

container_name="argocd-extension-installer-${RANDOM}"

docker run \
       -e EXTENSION_URL=https://github.com/argoproj-labs/argocd-extension-metrics/releases/download/v1.0.1/extension.tar.gz \
       -e EXTENSION_CHECKSUM_URL=https://github.com/argoproj-labs/argocd-extension-metrics/releases/download/v1.0.1/extension_checksums.txt \
        --name="${container_name}" "${IMAGE_NAME}"

# Check if the extension is installed by looking into the logs
docker logs "${container_name}" | grep "UI extension installed successfully"