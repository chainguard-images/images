#!/usr/bin/env bash

#
# Tests pytorch with its helm chart and runs sample scripts to 
# confirm its functionality
#
# This helm installation is intendended to run on devices with only cpu;
# to test features utilizing GPU, please refer TESTING.md

set -o errexit -o nounset -o errtrace -o pipefail -x

test_script="/home/runner/work/images-private/images-private/images/pytorch/tests/torch_optim.py"
exit_code=1

run_scripts() {
  pod_name=$(kubectl get pods -n ${RELEASE_NAMESPACE} -l "app.kubernetes.io/instance=${RELEASE_NAME}" -o custom-columns=:metadata.name --no-headers | head -n 1)
  kubectl cp "$test_script" "$pod_name":/tmp/pytorch.py -n ${RELEASE_NAMESPACE}
  kubectl exec "$pod_name" -n ${RELEASE_NAMESPACE} -- python /tmp/pytorch.py
  exit_code=$?
  if [ $exit_code -eq 0 ]; then
      printf "Test ran successfully"
    return 0
  fi
  echo "FAILED: Unable to run test scripts"
  exit 1
}

run_scripts

