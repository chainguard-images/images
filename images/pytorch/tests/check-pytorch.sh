#!/usr/bin/env bash


set -o errexit -o nounset -o errtrace -o pipefail -x

my_d=$(cd "${0%/*}" && pwd)
exit_code=1

run_scripts() {
	pod_name=$(kubectl get pods -n pytorch -l "app.kubernetes.io/instance=pytorch" -o custom-columns=:metadata.name --no-headers | head -n 1)
	kubectl cp "${my_d}/quickstart.py" "$pod_name":/tmp/pytorch.py -n pytorch
	kubectl exec "$pod_name" -n pytorch -- python /tmp/pytorch.py
	exit_code=$?
	if [ $exit_code -eq 0 ]; then
		printf "Test ran successfully"
		return 0
	fi
	echo "FAILED: Unable to run test scripts"
	exit 1
}

run_scripts
