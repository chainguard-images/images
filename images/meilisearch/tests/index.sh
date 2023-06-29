#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

ID=$(docker run \
	--rm \
	-d \
	-p 7700:7700 \
	"${IMAGE_NAME}" \
	--db-path /var/data.ms \
	--dump-dir /var/data.ms/dumps \
	--http-addr 0.0.0.0:7700)
sleep 5

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
	docker stop -t 0 "$ID"
        exit 1
fi

docker stop -t 0 "$ID"
