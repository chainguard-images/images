#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

#!/bin/bash

# Get server and worker node names from k3d, filtering by role
node_names=$(k3d node list -o json | jq -r '.[] | select(.role == "server" or .role == "agent") | .name')

# Loop over each node name and execute the commands
for node in $node_names; do
    echo "Configuring node: $node"

    # Create directory
    docker exec $node mkdir -p /mnt/fast-disks/vol1

    # Mount tmpfs
    docker exec $node mount -t tmpfs vol1 /mnt/fast-disks/vol1

    echo "Configuration complete for node: $node"
done

echo "All eligible nodes configured."

# wait a little bit 
sleep 15

# Check if there are any Persistent Volumes in the cluster
pv_count=$(kubectl get pv --no-headers | wc -l)

# Check if the count of PVs is zero
if [ "$pv_count" -eq "0" ]; then
  echo "Error: No Persistent Volumes found in the cluster."
  exit 1
else
  echo "Success: Found $pv_count Persistent Volume(s) in the cluster."
fi