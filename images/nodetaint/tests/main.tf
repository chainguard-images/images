terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

locals { parsed = provider::oci::parse(var.digest) }

data "oci_exec_test" "helm" {
  digest = var.digest
  script = "${path.module}/02-helm.sh"

  env {
    name  = "IMAGE_REGISTRY"
    value = local.parsed.registry
  }
  env {
    name  = "IMAGE_REPOSITORY"
    value = local.parsed.repo
  }
  env {
    name  = "IMAGE_TAG"
    value = local.parsed.pseudo_tag
  }
}
