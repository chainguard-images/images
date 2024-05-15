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
  name      = "step-ca"
  inventory = data.imagetest_inventory.this

  sandbox = {
    envs = {
      "IMAGE_REGISTRY"   = local.parsed.registry
      "IMAGE_REPOSITORY" = local.parsed.repo
      "IMAGE_TAG"        = local.parsed.pseudo_tag
    }
    mounts = [
      {
        source      = path.module
        destination = "/tests"
      }
    ]
  }
}

module "helm" {
  source = "../../../tflib/imagetest/helm"

  name      = "step-ca"
  namespace = "step-ca"
  repo      = "https://smallstep.github.io/helm-charts"
  chart     = "step-certificates"

  values = {
    command = ["/usr/bin/step-ca"]
    image = {
      repository = local.parsed.registry_repo
      tag        = local.parsed.pseudo_tag
    }
  }

}

resource "imagetest_feature" "helm-install" {
  name    = "step-ca"
  harness = imagetest_harness_k3s.this

  description = "Testing step-ca helm deployment in k3s cluster."

  steps = [
    {
      name = "Install the helm chart"
      cmd  = module.helm.install_cmd
    },
    {
      name = "Test the image deployment"
      cmd  = "/tests/k8s-test.sh"
    }
  ]
}
