terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

locals { parsed = provider::oci::parse(var.digest) }

data "oci_exec_test" "e2e" {
  digest      = var.digest
  script      = "./e2e.sh"
  working_dir = path.module

  env {
    name  = "IMAGE_TAG"
    value = local.parsed.pseudo_tag
  }

  env {
    name  = "IMAGE_REGISTRY_REPO"
    value = local.parsed.registry_repo
  }
}
