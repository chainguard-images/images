#!/usr/bin/env bash

# Input is in JSON format
read -r input

# Parse .NET stream and SDK version
dotnet_stream=$(echo "$input" | jq -r '.dotnet_stream')
dotnet_sdk_version=$(echo "$input" | jq -r '.dotnet_sdk_version')

# Point to release manifest
release_manifest="https://raw.githubusercontent.com/dotnet/core/main/release-notes/$dotnet_stream/releases.json"

# Parse .NET runtime version
dotnet_runtime_version=$(\
  curl -sf $release_manifest | \
    jq -r --arg sdk "$dotnet_sdk_version" '
      .releases[]
        | .sdks[]
        | select(.version == $sdk)
        | ."runtime-version"
    '\
)

# If we get nothing usable back, error out and exit
if ! [[ "${dotnet_runtime_version}" =~ "${dotnet_stream}" ]]; then
  echo "Unable to retrieve .NET runtime version for release." && exit 1
fi

# Return .NET runtime version in JSON format expected by terraform
echo "{\"dotnet_runtime_version\": \"$dotnet_runtime_version\"}"
