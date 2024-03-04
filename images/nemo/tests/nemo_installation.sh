#!/usr/bin/env bash
# Tests nemo with a sample script to verify its functionality

set -o errexit -o nounset -o errtrace -o pipefail -x

my_d=$(cd "${0%/*}" && pwd)
exit_code=1
CONTAINER_NAME="nemo-test-container"

run_scripts() {
  docker run --rm -d -v "${my_d}/nemo_quickstart.py":/tmp/nemo_quickstart.py --name $CONTAINER_NAME $IMAGE_NAME -c "python /tmp/nemo_quickstart.py"
  trap "docker logs $CONTAINER_NAME && docker rm -f $CONTAINER_NAME" EXIT
  exit_code=$?
  if [ $exit_code -eq 0 ]; then
      printf "Test ran successfully"
    return 0
  fi
  echo "FAILED: Unable to run test scripts"
  exit 1
}

run_scripts

