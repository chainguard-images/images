#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

image=$(echo "$IMAGES" | jq -r '.hollywood.ref')

# verify /bin/sh exists (required by byobu)
docker run --rm --entrypoint /bin/sh "$image" -c "echo ok"

# verify core binaries are installed
docker run --rm --entrypoint /bin/bash "$image" -c "
  set -e
  for cmd in hollywood byobu tmux cmatrix htop ccze jp2a tree atop grep sed ps; do
    command -v \$cmd > /dev/null || { echo \"MISSING: \$cmd\"; exit 1; }
  done
  echo 'All core binaries present'
"

# verify hollywood script is executable with correct shebang
docker run --rm --entrypoint /bin/bash "$image" -c "
  set -e
  test -x /usr/bin/hollywood || { echo 'hollywood not executable'; exit 1; }
  head -1 /usr/bin/hollywood | grep -q '#!/usr/bin/env bash' || { echo 'wrong shebang'; exit 1; }
"

# verify hollywood widget scripts are present
docker run --rm --entrypoint /bin/bash "$image" -c "
  set -e
  test -d /usr/lib/hollywood || { echo 'widget dir missing'; exit 1; }
  count=\$(ls /usr/lib/hollywood/ | wc -l)
  test \$count -gt 0 || { echo 'no widget scripts found'; exit 1; }
  echo \"Found \$count widget scripts\"
"

# verify tmux and byobu versions
docker run --rm --entrypoint /bin/bash "$image" -c "
  set -e
  tmux -V
  head -1 /usr/bin/byobu | grep -q '/bin/sh' || { echo 'byobu shebang wrong'; exit 1; }
"

# verify widget binaries are functional
docker run --rm --entrypoint /bin/bash "$image" -c "
  set -e
  cmatrix -V 2>&1 | head -1
  htop --version | head -1
  tree --version | head -1
  ccze --version 2>&1 | head -1
  jp2a --version 2>&1 | head -1
  echo 'All widget binaries functional'
"

# verify image runs as nonroot
docker run --rm --entrypoint /bin/bash "$image" -c "
  set -e
  uid=\$(id -u)
  test \$uid -eq 65532 || { echo \"Expected UID 65532, got \$uid\"; exit 1; }
  echo \"Running as UID \$uid (nonroot)\"
"

# verify hollywood starts successfully
# hollywood forks byobu/tmux and may exit after the session ends, so we
# accept either: still running with expected processes, or exited cleanly (code 0)
docker run -dt --name hollywood-test "$image"
trap "docker rm -f hollywood-test 2>/dev/null || true" EXIT

# Give hollywood time to initialize byobu/tmux panes
sleep 5

status=$(docker inspect hollywood-test --format '{{.State.Status}}')
exitCode=$(docker inspect hollywood-test --format '{{.State.ExitCode}}')

if [ "$status" = "running" ]; then
  procs=$(docker exec hollywood-test ps aux)
  echo "$procs"
  echo "$procs" | grep -q "[t]mux" || { echo "FAIL: tmux not running"; exit 1; }
  echo "PASS: hollywood running with tmux"
elif [ "$exitCode" = "0" ]; then
  echo "PASS: hollywood started and exited cleanly (exit code 0)"
else
  echo "FAIL: container exited with non-zero exit code $exitCode"
  docker logs hollywood-test
  exit 1
fi
