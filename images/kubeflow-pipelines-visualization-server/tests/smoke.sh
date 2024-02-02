#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

port=8888 # Default port of visualization-server
uid="visualization-server"

start_container() {
  docker run --name $uid --rm -d -p $port:$port ${IMAGE_NAME}
  trap "docker logs $uid; docker kill $uid" EXIT
  sleep 10
}

start_container

# Sample test cases:
# https://github.com/kubeflow/pipelines/blob/master/backend/src/apiserver/visualization/test_server.py

# Simply send a request to the server and expect an OK 200 response.
# If the payload contains a Python 'Traceback', then there is a library
# "import" issue, and the test must fail.
TEST_no_lib_issues() {
  local type="$1"
  echo "Testing type=$type"
  response=$(curl --fail "localhost:${port}" \
                   --form "type=${type}" \
                   --form 'source="gs://ml-pipeline/data.csv"')
  local http_status=$?
  if [ $http_status -eq 0 ]; then
    if echo "$response" | grep -iq "traceback"; then
      echo "ERROR: Response for type=$type contains a Python 'Traceback'! Please fix the library issue."
      exit 1
    fi
  fi
}

# visualization-server should not supposed to run on CPU-only machines.
# If one of the the "kernel died" message or "Could not find CUDA drivers" is
# printed, then we can ensure there is no any library-related issue.
TEST_assert_gpu_fail() {
  grep -iq -e "Kernel died" -e "Could not find CUDA drivers" $log_file
}

curl --fail localhost:${port} | grep "alive"
sleep 5

# The following types do not require a GPU.
types=("custom" "test")
for type in "${types[@]}"; do
  sleep 5
  TEST_no_lib_issues "$type"
  echo "PASS: type=$type"
done

# The following types require a GPU.
types=("roc_curve" "tfdv" "tfma")
for type in "${types[@]}"; do
  sleep 5
  TEST_no_lib_issues "$type"
  sleep 20

  # Hacky-workaround: Success! Now, let's restart the container, otherwise it hangs.
  if docker logs $uid 2>&1 | grep -iq -e "Kernel died" -e "Could not find CUDA drivers"; then
    echo "PASS: type=$type"
    docker kill $uid
    start_container
    continue
  else
    echo "ERROR: Expected a GPU-related error for type=$type"
    docker logs $uid
    exit 1
  fi
done
