terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    acmesolver = string
    cainjector = string
    controller = string
    webhook    = string
  })
}

variable "skip_crds" {
  description = "Used to deconflict between multiple installations within the same cluster."
  default     = false
}

data "oci_string" "ref" {
  for_each = var.digests
  input    = each.value
}

resource "random_id" "hex" { byte_length = 4 }

data "oci_exec_test" "helm" {
  digest      = var.digests["controller"] // Not used, but required by the resource.
  script      = <<EOF
set -e

rand=${random_id.hex.hex}

if ! command -v flock; then
  echo "flock not installed; use \`brew install flock\`"
  exit 1
fi

cat > /tmp/values-$${rand}.yaml <<EOV
installCRDs: true
image:
  repository: ${data.oci_string.ref["controller"].registry_repo}
  tag: ${data.oci_string.ref["controller"].pseudo_tag}
acmesolver:
  image:
    repository: ${data.oci_string.ref["acmesolver"].registry_repo}
    tag: ${data.oci_string.ref["acmesolver"].pseudo_tag}
cainjector:
  image:
    repository: ${data.oci_string.ref["cainjector"].registry_repo}
    tag: ${data.oci_string.ref["cainjector"].pseudo_tag}
webhook:
  image:
    repository: ${data.oci_string.ref["webhook"].registry_repo}
    tag: ${data.oci_string.ref["webhook"].pseudo_tag}
EOV

# Run with `flock` to ensure that only one test runs at a time.
flock -e -w 1200 /tmp/cert-manager ./helm.sh $${rand}
EOF
  working_dir = path.module
}
