terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "target_repository" {}

variable "digest" {
  description = "The image digests to run tests over."
  type        = string
}

locals { parsed = provider::oci::parse(var.digest) }

data "imagetest_inventory" "this" {}

module "cluster_harness" {
  source = "../../../tflib/imagetest/harnesses/k3s/"

  inventory         = data.imagetest_inventory.this
  name              = basename(path.module)
  target_repository = var.target_repository
  cwd               = path.module
}

module "helm" {
  source = "../../../tflib/imagetest/helm"

  repo      = "https://prometheus-community.github.io/helm-charts"
  chart     = "kube-state-metrics"
  namespace = "kube-state-metrics"

  values = {
    image = {
      registry   = local.parsed.registry
      repository = local.parsed.repo
      tag        = local.parsed.pseudo_tag
    }
  }
}

resource "imagetest_feature" "basic" {
  name        = "basic"
  description = "Basic installation test for KSM"
  harness     = module.cluster_harness.harness

  steps = [
    {
      name = "Install kube-state-metrics"
      cmd  = module.helm.install_cmd
    },
    {
      name = "Check metrics endpoint"
      cmd  = "$WORK/check-ksm.sh ${module.helm.release_name}"
    }
  ]

  labels = {
    type = "k8s"
  }
}