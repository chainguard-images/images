#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

if [[ "${IMAGE_NAME}" == "" ]]; then
	echo "Must set IMAGE_NAME environment variable. Exiting."
	exit 1
fi

docker run --rm "${IMAGE_NAME}" --version
docker run --rm "${IMAGE_NAME}" help
docker run --rm "${IMAGE_NAME}" ec2 help
docker run --rm "${IMAGE_NAME}" ec2 run-instances help
