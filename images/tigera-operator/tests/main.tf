terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" { input = var.digest }

resource "random_id" "hex" { byte_length = 4 }

data "oci_exec_test" "helm" {
  digest      = var.digest // Not used, but required by the resource.
  script      = <<EOF
set -e

rand=${random_id.hex.hex}

if ! command -v flock; then
  echo "flock not installed; use \`brew install flock\`"
  exit 1
fi

cat > /tmp/values-$${rand}.yaml <<EOV
tigeraOperator:
  version: ${data.oci_string.ref.pseudo_tag}
  image: ${data.oci_string.ref.repo}
  registry: ${data.oci_string.ref.registry}
EOV

# Run with `flock` to ensure that only one test runs at a time.
flock -e -w 1200 /tmp/spire ./helm.sh $${rand}
EOF
  working_dir = path.module
}
