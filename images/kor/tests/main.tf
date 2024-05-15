terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

locals { parsed = provider::oci::parse(var.digest) }

data "oci_exec_test" "helm-install" {
  digest = var.digest
  script = "${path.module}/script.sh"

  env {
    name  = "IMAGE_REGISTRY_REPO"
    value = local.parsed.registry_repo
  }
  env {
    name  = "IMAGE_TAG"
    value = local.parsed.pseudo_tag
  }
}
