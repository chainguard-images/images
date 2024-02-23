#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

output_file="env_variables.txt"


echo "Variables:" > "$output_file"
echo "DIGEST=${DIGEST}" >> "$output_file"
echo "REGISTRY=${REGISTRY}" >> "$output_file"
echo "REPOSITORY=${REPOSITORY}" >> "$output_file"
echo "TAG=${TAG}" >> "$output_file"

echo "Vales saved at '$output_file'."