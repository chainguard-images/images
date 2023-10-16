#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

container_name="aws-flb-${RANDOM}"
docker run --rm -d --name="${container_name}" "${IMAGE_NAME}"
trap "docker rm -f ${container_name}" EXIT

lookup_config_text="stream processor started"
config_text_present=false
for i in {1..10}; do
  if ! docker logs "${container_name}" 2>&1 | grep -i "${lookup_config_text}"; then sleep 1;
  else config_text_present=true; break;
  fi
done
if ! "${config_text_present}"; then exit 1; fi
