#!/usr/bin/env bash

#
# Tests grafana-rollout-operator with its helm chart and reviews the logs
# to ensure expected behaviour
#

set -o errexit -o nounset -o errtrace -o pipefail -x

# Defining log entries we are looking for in the k8s-event-export logs
declare -a terms=(
	"informer caches are syncing"
	"informer caches have synced"
    "reconcile started"
    "reconcile done"
)

declare -a missing_terms=()

search_logs() {
	local retries=10
	local delay=15

	for ((i = 1; i <= retries; i++)); do
		local logs=$(kubectl logs deployment/grafana-rollout-operator -n grafana-rollout-operator 2>&1)
		local all_terms_found=true

		for term in "${terms[@]}"; do
			if echo "$logs" | grep -Fq "$term"; then
				echo "Found log term: $term"
			else
				echo "Log term NOT found: $term (attempt $i of $retries)"
				all_terms_found=false
			fi
		done

		if $all_terms_found; then
			return 0
		elif [[ $i -lt $retries ]]; then
			echo "Some log terms were missing. Retrying in $delay seconds..."
			sleep $delay

		fi
	done

	# After all retries, record the missing terms
	for term in "${terms[@]}"; do
		if ! echo "$logs" | grep -Fq "$term"; then
			missing_terms+=("$term")
		fi
	done

	echo "FAILED: After $retries attempts, the following terms were not found:"
	printf '%s\n' "${missing_terms[@]}"
	exit 1
}

TEST_logs_emit_expected_entries() {
	# Look for each log term. Will record any which are not found.
	search_logs

	if [[ ${#missing_terms[@]} -ne 0 ]]; then
		echo "The following terms were not found:"
		printf '%s\n' "${missing_terms[@]}"
		exit 1
	fi
}

TEST_logs_emit_expected_entries
