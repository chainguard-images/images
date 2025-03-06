#!/bin/bash 

set -euo pipefail

cd /data

# make new project
docker run --rm \
  -v $VOLUME_ID:/data \
  --workdir /data \
  --entrypoint dotnet "$SDK_IMAGE" \
  new console --name tzdata

# copy source into project
cp src/tzdata.cs /data/tzdata/Program.cs

# build runtime linked executable
docker run --rm \
  -v $VOLUME_ID:/data \
  --workdir /data/tzdata \
  --entrypoint dotnet "$SDK_IMAGE" \
  publish -c Release -o /data/tzdata-runtime

# check tzdata with runtime linked executable
docker run --rm \
  -v $VOLUME_ID:/data \
  --workdir /data/tzdata-runtime \
  --entrypoint ./tzdata "$RUNTIME_IMAGE" \

# build standalone executable
docker run --rm \
  -v $VOLUME_ID:/data \
  --workdir /data/tzdata \
  --entrypoint dotnet "$SDK_IMAGE" \
  publish -c Release -r $(cat /tmp/arch) --sc true -p:PublishSingleFile=true -o /data/tzdata-standalone

# check tzdata with standalone executable
docker run --rm \
  -v $VOLUME_ID:/data \
  --workdir /data/tzdata-standalone \
  --entrypoint ./tzdata "$RUNTIME_IMAGE" \

# because we can
cd /data/tzdata-standalone
./tzdata