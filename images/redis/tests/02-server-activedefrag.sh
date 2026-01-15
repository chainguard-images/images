#!/usr/bin/env bash
set -o errexit -o nounset -o errtrace -o pipefail -x

# shellcheck disable=SC1091
source ../libs/libs.sh

image="$(get_test_image "redis")"
container="redis-defragtest--${RANDOM}"

docker run -d --name "$container" "$image"

tw dgrep "$container" --retry 5 --timeout 2s \
    -e "Server initialized" \
    -e " Ready to accept connections"

# set activedefrag config
docker exec -i "$container" redis-cli config set activedefrag yes | grep OK

# Check if the setting was applied
docker exec -i "$container" redis-cli config get activedefrag | grep "yes"
