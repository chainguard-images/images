#!/usr/bin/env bash

read -r input

dotnet_stream=$(echo "$input" | jq -r '.dotnet_stream')
dotnet_sdk_version=$(echo "$input" | jq -r '.dotnet_sdk_version')

release_manifest="https://raw.githubusercontent.com/dotnet/core/main/release-notes/$dotnet_stream/releases.json"

dotnet_runtime_version=$(\
  curl -sf $release_manifest | \
    jq -r --arg sdk "$dotnet_sdk_version" '
      .releases[]
        | .sdks[]
        | select(.version == $sdk)
        | ."runtime-version"
    '\
)

if ! [[ "${dotnet_runtime_version}" =~ "${dotnet_stream}" ]]; then
  echo "Unable to retrieve .NET runtime version for release." && exit 1
fi

echo "{\"dotnet_runtime_version\": \"$dotnet_runtime_version\"}"
