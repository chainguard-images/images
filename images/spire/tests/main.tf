terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    server                  = string
    agent                   = string
    oidc-discovery-provider = string
  })
}

data "oci_string" "ref" {
  for_each = var.digests
  input    = each.value
}

resource "random_id" "hex" { byte_length = 4 }

data "oci_exec_test" "helm" {
  digest      = var.digests["server"] // Not used, but required by the resource.
  script      = <<EOF
set -e

rand=${random_id.hex.hex}

if ! command -v flock; then
  echo "flock not installed; use \`brew install flock\`"
  exit 1
fi

cat > /tmp/crd-values-$${rand}.yaml <<EOV
annotations:
  "helm.sh/resource-policy": "delete"
EOV

cat > /tmp/values-$${rand}.yaml <<EOV
spire-server:
  enabled: true
  image:
    registry: ${data.oci_string.ref["server"].registry}
    repository: ${data.oci_string.ref["server"].repo}
    tag: ${data.oci_string.ref["server"].pseudo_tag}
spire-agent:
  enabled: true
  image:
    registry: ${data.oci_string.ref["agent"].registry}
    repository: ${data.oci_string.ref["agent"].repo}
    tag: ${data.oci_string.ref["agent"].pseudo_tag}
spiffe-oidc-discovery-provider:
  enabled: true
  image:
    registry: ${data.oci_string.ref["oidc-discovery-provider"].registry}
    repository: ${data.oci_string.ref["oidc-discovery-provider"].repo}
    tag: ${data.oci_string.ref["oidc-discovery-provider"].pseudo_tag}
  config:
    acme:
      tosAccepted: true
EOV

# Run with `flock` to ensure that only one test runs at a time.
flock -e -w 600 /tmp/spire ./helm.sh $${rand}
EOF
  working_dir = path.module
}
