terraform {
  required_providers {
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "tests_path" {}

variable "envs" {
  type    = map(string)
  default = {}
}

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "crossplane"
  inventory = data.imagetest_inventory.this

  sandbox = {
    mounts = [
      {
        source      = var.tests_path
        destination = "/tests"
      }
    ]

    envs = var.envs
  }

  hooks = {
    post_start = [
      # crossplane isn't smart enough to reuse the creds we store in
      # containerd, so this monstrocity parses the k3s registry credentials
      # into a registry secret that crossplane can then use.
      <<EOF
#!/bin/sh

DOCKER_CONFIG_JSON="{\"auths\":{"

# Read and parse the YAML file using grep and sed
parse_yaml() {
  local docker_server=""
  local docker_username=""
  local docker_password=""

  while IFS= read -r line; do
    # Match the registry name (e.g., "gcr.io:")
    if echo "$line" | grep -q '^[ ]*".*":$'; then
      docker_server=$(echo "$line" | sed 's/[ ":]//g')

    # Match the username line
    elif echo "$line" | grep -q '^[ ]*username:'; then
      docker_username=$(echo "$line" | sed 's/^[ ]*username:[ ]*//; s/"//g')  # Strip quotes

    # Match the password line
    elif echo "$line" | grep -q '^[ ]*password:'; then
      docker_password=$(echo "$line" | sed 's/^[ ]*password:[ ]*//; s/"//g')  # Strip quotes

      # Once we have docker_server, docker_username, and docker_password, process them
      if [ -n "$docker_server" ] && [ -n "$docker_username" ] && [ -n "$docker_password" ]; then
        # Create the base64 encoded auth string
        auth=$(echo -n "$docker_username:$docker_password" | base64 -w 0)
        echo "Adding $docker_server with encoded credentials"
        DOCKER_CONFIG_JSON="$DOCKER_CONFIG_JSON\"$docker_server\":{\"auth\":\"$auth\"},"

        # Reset variables for the next config block
        docker_server=""
        docker_username=""
        docker_password=""
      fi
    fi
  done < "/etc/rancher/k3s/registries.yaml"
}

parse_yaml

# Remove the trailing comma from the JSON and close the structure
DOCKER_CONFIG_JSON="$${DOCKER_CONFIG_JSON%,}}}"

# Create namespace if it doesn't exist
kubectl get namespace crossplane-system >/dev/null 2>&1 || kubectl create namespace crossplane-system

# Create the Kubernetes secret with the Docker config JSON
kubectl create secret generic "regcred" \
  -n "crossplane-system" \
  --from-literal=.dockerconfigjson="$DOCKER_CONFIG_JSON" \
  --type=kubernetes.io/dockerconfigjson
      EOF
    ]
  }
}

output "harness" {
  value = imagetest_harness_k3s.this
}
