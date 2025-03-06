#!/bin/bash 

set -euo pipefail

cd /data

# make new project
docker run --rm \
  -v $VOLUME_ID:/data \
  --workdir /data \
  --entrypoint dotnet "$SDK_IMAGE" \
  new console --name keypair

# copy source into project
cp src/keypair.cs /data/keypair/Program.cs

# build runtime linked executable
docker run --rm \
  -v $VOLUME_ID:/data \
  --workdir /data/keypair \
  --entrypoint dotnet "$SDK_IMAGE" \
  publish -c Release -o /data/keypair-runtime

# generate keypair with runtime linked binary
docker run --rm \
  -v $VOLUME_ID:/data \
  --workdir /data/keypair-runtime \
  --entrypoint ./keypair "$RUNTIME_IMAGE" \
  keypair

# validate keypair with runtime linked binary
docker run --rm \
  -v $VOLUME_ID:/data \
  --workdir /data/keypair-runtime \
  --entrypoint ./keypair "$RUNTIME_IMAGE" \
  validate

# build standalone executable
docker run --rm \
  -v $VOLUME_ID:/data \
  --workdir /data/keypair \
  --entrypoint dotnet "$SDK_IMAGE" \
  publish -c Release -r $(cat /tmp/arch) --sc true -p:PublishSingleFile=true -o /data/keypair-standalone

# generate keypair with standalone binary - should work with glibc-dynamic-openssl but needs libz
docker run --rm \
  -v $VOLUME_ID:/data \
  --workdir /data/keypair-standalone \
  --entrypoint ./keypair "$RUNTIME_IMAGE" \
  keypair

# validate cert with standalone binary - should work with glibc-dynamic-openssl but needs libz
docker run --rm \
  -v $VOLUME_ID:/data \
  --workdir /data/keypair-standalone \
  --entrypoint ./keypair "$RUNTIME_IMAGE" \
  validate

# standalone binary should run in the host container, so why not?
apk add libunwind # dotnet 6 wants this :shrug:
cd /data/keypair-standalone
./keypair keypair
./keypair validate

# check ca_key public key component matches ca_cert public key
openssl pkey -in ca_key.pem -pubout -out ca_key_pub.pem
openssl x509 -in ca_cert.pem -noout -pubkey -out ca_cert_pub.pem
cmp ca_key_pub.pem ca_cert_pub.pem
