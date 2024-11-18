#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# Start up the mariadb container in the background
name=mariadb-${RANDOM}
docker run -d --name $name -e MARIADB_ROOT_PASSWORD=secret "${IMAGE_NAME}"
# Database needs some time to start up
sleep 30

# Exec into the container and run the mysql command
docker exec $name mariadb -uroot -psecret -e "SHOW status;" | grep Uptime

docker kill $name
