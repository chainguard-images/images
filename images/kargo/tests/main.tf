terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_exec_test" "version" {
  digest = var.digest
  script = "docker run --rm $IMAGE_NAME version"
}

data "oci_string" "ref" { input = var.digest }

# Deploy the helm chart (this requires a few others setup as dependencies, and uses oci:// which the helm provider doesn't support)
data "oci_exec_test" "deploy" {
  digest      = var.digest
  script      = "./deploy.sh"
  working_dir = path.module
  env {
    name  = "IMAGE_REGISTRY"
    value = data.oci_string.ref.registry
  }

  env {
    name  = "IMAGE_REPOSITORY"
    value = data.oci_string.ref.repo
  }

  env {
    name  = "IMAGE_TAG"
    value = data.oci_string.ref.pseudo_tag
  }
}

