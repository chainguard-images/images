#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x


ID=$(docker run --rm -p 8000:8000 -d "${IMAGE_NAME}" parseable local-store)

trap "docker logs $ID && docker rm -f $ID" EXIT

# wait for parseable to start
until curl --output /dev/null --silent --head --fail http://localhost:8000; do
    printf '.'
    sleep .5
done

curl --location --request POST 'http://localhost:8000/api/v1/ingest' \
--header 'X-P-Stream: demo' \
--header 'Authorization: Basic YWRtaW46YWRtaW4=' \
--header 'Content-Type: application/json' \
--data-raw '[
    {
        "id": "434a5f5e-2f5f-11ed-a261-asdasdafgdfd",
        "datetime": "24/Jun/2022:14:12:15 +0000",
        "host": "153.10.110.81", 
        "user-identifier": "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0", 
        "method": "PUT", 
        "status": 500, 
        "referrer": "http://www.google.com/"
    }
]'

sleep 2

curl --location --request POST 'http://localhost:8000/api/v1/query' \
--header 'Authorization: Basic YWRtaW46YWRtaW4=' \
--header 'Content-Type: application/json' \
--data-raw "{
    \"query\": \"select * from demo\",
    \"startTime\": \"$(date -u -v-5M +"%Y-%m-%dT%H:%M:%S+00:00")\",
    \"endTime\": \"$(date -u +"%Y-%m-%dT%H:%M:%S+00:00")\"
}" | grep -q "434a5f5e-2f5f-11ed-a261-asdasdafgdfd"
