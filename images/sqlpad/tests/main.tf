terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_exec_test" "manifest" {
  digest      = var.digest
  script      = "./02-curl-test.sh"
  working_dir = path.module
}

data "oci_string" "ref" { input = var.digest }
# Will work only when we use updated version postgresql 13.2.23 in upstream charts https://github.com/sqlpad/sqlpad/blob/f42ce1a84e1327e69178f38e7b3a2462dcaeeb7c/sqlpad-charts/requirements.yaml#L3
# Have created PR for this in upstream https://github.com/sqlpad/sqlpad/pull/1212
data "oci_exec_test" "helm-install" {
  digest = var.digest
  script = "${path.module}/03-helm-test.sh"

  env {
    name  = "IMAGE_REGISTRY_REPO"
    value = data.oci_string.ref.registry_repo
  }
  env {
    name  = "IMAGE_TAG"
    value = data.oci_string.ref.pseudo_tag
  }
}