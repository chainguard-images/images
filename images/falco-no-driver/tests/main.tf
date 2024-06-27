terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "target_repository" {}

variable "digest" {
  description = "The image digest to run tests over."
}

locals { parsed = provider::oci::parse(var.digest) }

data "imagetest_inventory" "this" {}

module "cluster_harness" {
  source = "../../../tflib/imagetest/harnesses/k3s/"

  inventory         = data.imagetest_inventory.this
  name              = basename(path.module)
  target_repository = var.target_repository
  cwd               = path.module

  envs = {
    "IMAGE_REGISTRY"   = local.parsed.registry
    "IMAGE_REPOSITORY" = local.parsed.repo
    "IMAGE_TAG"        = local.parsed.pseudo_tag
  }
}

resource "imagetest_feature" "basic" {
  name        = "basic"
  description = "Basic installation test for falco-no-driver"
  harness     = module.cluster_harness.harness

  steps = [
    {
      name = "Install and test with helm"
      cmd  = "$WORK/falco-helm-install.sh"
    },
  ]

  labels = {
    type = "k8s"
  }
}
