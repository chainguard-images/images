#!/bin/bash 

set -euo pipefail

cd /data

docker run --rm \
  -v $VOLUME_ID:/data \
  --workdir /data \
  --entrypoint dotnet "$SDK_IMAGE" \
  new console --name tzdata

cp src/tzdata.cs /data/tzdata/Program.cs

docker run --rm \
  -v $VOLUME_ID:/data \
  --workdir /data/tzdata \
  --entrypoint dotnet "$SDK_IMAGE" \
  publish -c Release -o /data/tzdata-runtime

docker run --rm \
  -v $VOLUME_ID:/data \
  --workdir /data/tzdata-runtime \
  --entrypoint ./tzdata "$RUNTIME_IMAGE" \

docker run --rm \
  -v $VOLUME_ID:/data \
  --workdir /data/tzdata \
  --entrypoint dotnet "$SDK_IMAGE" \
  publish -c Release -r $(cat /tmp/arch) --sc true -p:PublishSingleFile=true -o /data/tzdata-standalone

docker run --rm \
  -v $VOLUME_ID:/data \
  --workdir /data/tzdata-standalone \
  --entrypoint ./tzdata "$RUNTIME_IMAGE" \

cd /data/tzdata-standalone
./tzdata