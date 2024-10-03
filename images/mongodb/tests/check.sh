#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

TMPDIR="$(mktemp -d)"
ID="$(uuidgen | tr '[[:upper:]]' '[[:lower:]]' | cut -d'-' -f1)"
MONGOD_CONTAINER_NAME="mongod-${ID}"
MONGO_CONTAINER_NAME="mongo-${ID}"
MONGO_NET_NAME="mongo-net-${ID}"

cleanup() {
  docker stop "${MONGOD_CONTAINER_NAME}"
  docker container rm "${MONGOD_CONTAINER_NAME}"
  docker network rm "${MONGO_NET_NAME}"
  rm -rf "${TMPDIR}"
}
trap cleanup EXIT

chmod -R 777 "${TMPDIR}"

openssl genrsa 2048 > "${TMPDIR}/ca-key.pem"

openssl req -new -nodes -x509 \
  -days 2 \
  -key "${TMPDIR}/ca-key.pem" \
  -out "${TMPDIR}/ca-cert.pem" \
  -subj "/CN=mongo CA"
cat "${TMPDIR}/ca-key.pem" "${TMPDIR}/ca-cert.pem" > "${TMPDIR}/ca.pem"

# generate a key+cert to use with mongod
openssl req \
	-newkey rsa:2048 -nodes \
	-keyout "${TMPDIR}/privkey.pem" \
	-x509 -days 2 \
	-out "${TMPDIR}/cert.pem" \
	-CA "${TMPDIR}/ca-cert.pem" \
	-CAkey "${TMPDIR}/ca-key.pem" \
	-subj "/CN=mongod.local"
cat "${TMPDIR}/privkey.pem" "${TMPDIR}/cert.pem" > "${TMPDIR}/fullchain.pem"

docker network create "${MONGO_NET_NAME}"

# run mongod with tls required and our temporary key+cert
docker run -d \
  --name "${MONGOD_CONTAINER_NAME}" \
  -v "${TMPDIR}":/ssl \
	-p "${FREE_PORT}":27017 \
	--hostname mongod.local \
	--network "${MONGO_NET_NAME}" \
	"${IMAGE_NAME}" \
    --dbpath /data \
    --bind_ip_all \
    --tlsAllowInvalidCertificates \
    --tlsCertificateKeyFile /ssl/fullchain.pem \
    --tlsCAFile /ssl/ca.pem \
    --tlsMode=requireTLS

count=0
until docker logs "${MONGOD_CONTAINER_NAME}" | grep -qi "listening"; do
  if ((count >= 12)); then
    echo "container is not listening after a minute"
    docker logs "${MONGOD_CONTAINER_NAME}"
    exit 1
  fi

  ((count=count+1))
  sleep 5
done


if ((FIPS_ENABLED == 1)); then
  echo "checking FIPS status..."
  docker exec -t "${MONGOD_CONTAINER_NAME}" /usr/bin/openssl-fips-test
fi

# start another container with mongo (the shell) and connect to the TLS enabled mongod
DBS=$(docker run --rm -t \
  -v "${TMPDIR}":/ssl \
  --entrypoint=mongo \
  --hostname mongo.local \
  --network "${MONGO_NET_NAME}" \
  "${IMAGE_NAME}" \
    --tls \
    --tlsAllowInvalidCertificates \
    --tlsCAFile /ssl/ca.pem \
    --tlsCertificateKeyFile /ssl/fullchain.pem \
    --quiet \
    --host mongod.local \
    --eval "db.getMongo().getDBNames()")

# the output from getDBNames is formatted exactly as shown inside the single quotes
echo "${DBS}" | grep -q '[ "admin", "config", "local" ]'
