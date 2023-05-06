#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

if [[ "${IMAGE_NAME}" == "" ]]; then
    echo "Must set IMAGE_NAME environment variable. Exiting."
    exit 1
fi

# Start up the mariadb container in the background
docker run -d --name mariadb -e MYSQL_ROOT_PASSWORD=secret "${IMAGE_NAME}"
sleep 5

# Exec into the container and run the mysql command
docker exec mariadb mysql -u root -psecret -e "SHOW status;" | grep Uptime
