#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# Start up the percona container in the background
name=percona-${RANDOM}
docker run -d --name $name -e MYSQL_ROOT_PASSWORD=secret "${IMAGE_NAME}"
sleep 20

# Check the container logs to ensure MySQL started correctly
docker logs $name

# Exec into the container and run the mysql command
docker exec $name mysql -u root -psecret -e "SHOW status;" | grep Uptime

# Clean up
docker kill $name