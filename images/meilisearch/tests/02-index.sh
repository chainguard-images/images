#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

EXIT=1

function preflight() {
	if [[ "${IMAGE_NAME}" == "" ]]; then
		echo "Must set IMAGE_NAME environment variable. Exiting."
		exit 1
	fi
}

function run_meilisearch() {
	ID=$(docker run --rm -d -p 7700:7700 "${IMAGE_NAME}" --db-path /var/data.ms --dump-dir /var/data.ms/dumps --http-addr 0.0.0.0:7700)
        export ID
	sleep 5
}

function test() {
	curl -s \
		-X POST 'http://127.0.0.1:7700/indexes' \
		-H 'Content-Type: application/json' \
		--data-binary '{
			"uid": "movies",
			"primaryKey": "id"
		}'

	sleep 1

	IDX=$(curl -s 127.0.0.1:7700/indexes/movies |jq -r '.uid')
	if [ "$IDX" != "movies" ]; then
		echo "Failed to create 'movies' test index. Exiting."
		return
	fi
	EXIT=0
}

function docker_stop() {
	docker stop -t 0 "$ID"
	exit $EXIT
}

preflight
run_meilisearch
test
docker_stop
