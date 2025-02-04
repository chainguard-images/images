#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

image=$(echo "$IMAGES" | jq -r '.busybox.ref')

docker run --rm "$image" ls >/dev/null

# The image runs as nonroot by default.
docker run --rm --entrypoint '' "$image" whoami | grep "^nonroot$"

# The image contains many common utilities (some in /usr/bin and some in /bin)
for cmd in awk basename cat chmod chown cp cut date dirname du echo egrep expr find grep head id ln ls mkdir mktemp mv printf pwd rm rmdir sed sh sort tail tar tee test touch tr uname uniq wc xargs; do
  docker run --rm "$image" which "$cmd" | grep "/bin/$cmd$"
done

# The image can be used as a base image.
cat <<EOF | docker build -t version -
FROM ${image}
RUN busybox
ENTRYPOINT ["busybox"]
EOF
docker run --rm version | grep "BusyBox .* multi-call binary."

