#!/bin/bash 

set -euo pipefail

cd /data

docker run --rm \
  -v $VOLUME_ID:/data \
  --workdir /data \
  --entrypoint dotnet "$SDK_IMAGE" \
  new console --name keypair

cp src/keypair.cs /data/keypair/Program.cs

docker run --rm \
  -v $VOLUME_ID:/data \
  --workdir /data/keypair \
  --entrypoint dotnet "$SDK_IMAGE" \
  publish -c Release -o /data/keypair-runtime

docker run --rm \
  -v $VOLUME_ID:/data \
  --workdir /data/keypair-runtime \
  --entrypoint ./keypair "$RUNTIME_IMAGE" \
  keypair

docker run --rm \
  -v $VOLUME_ID:/data \
  --workdir /data/keypair-runtime \
  --entrypoint ./keypair "$RUNTIME_IMAGE" \
  validate

docker run --rm \
  -v $VOLUME_ID:/data \
  --workdir /data/keypair \
  --entrypoint dotnet "$SDK_IMAGE" \
  publish -c Release -r $(cat /tmp/arch) --sc true -p:PublishSingleFile=true -o /data/keypair-standalone

docker run --rm \
  -v $VOLUME_ID:/data \
  --workdir /data/keypair-standalone \
  --entrypoint ./keypair "$RUNTIME_IMAGE" \
  keypair

docker run --rm \
  -v $VOLUME_ID:/data \
  --workdir /data/keypair-standalone \
  --entrypoint ./keypair "$RUNTIME_IMAGE" \
  validate

apk add libunwind # dotnet 6 wants this :shrug:
cd /data/keypair-standalone
./keypair keypair
./keypair validate

openssl pkey -in ca_key.pem -pubout -out ca_key_pub.pem
openssl x509 -in ca_cert.pem -noout -pubkey -out ca_cert_pub.pem
cmp ca_key_pub.pem ca_cert_pub.pem
