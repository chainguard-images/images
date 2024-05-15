terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The digest of the image"
}

locals { parsed = provider::oci::parse(var.digest) }


variable "target_repository" {
  description = "The docker repo name"
}

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "step-issuer"
  inventory = data.imagetest_inventory.this

  sandbox = {
    envs = {
      "IMAGE_REGISTRY"   = local.parsed.registry
      "IMAGE_REPOSITORY" = local.parsed.repo
      "IMAGE_TAG"        = local.parsed.pseudo_tag
    }
  }
}

module "helm" {
  source = "../../../tflib/imagetest/helm"

  name      = "step-issuer"
  namespace = "step-issuer-system"
  repo      = "https://smallstep.github.io/helm-charts"
  chart     = "step-issuer"

  values = {
    image = {
      repository = local.parsed.registry_repo
      tag        = local.parsed.pseudo_tag
    }
  }
}

resource "imagetest_feature" "helm-install" {
  name        = "step-issuer"
  harness     = imagetest_harness_k3s.this
  description = "Testing step-issuer helm deployment in k3s cluster."


  steps = [
    {
      name = "Install the helm chart"
      cmd  = module.helm.install_cmd
    }
  ]
}
