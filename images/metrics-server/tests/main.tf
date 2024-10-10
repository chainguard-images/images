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
}

module "helm" {
  source = "../../../tflib/imagetest/helm"

  name      = "metrics-server"
  repo      = "https://kubernetes-sigs.github.io/metrics-server"
  chart     = "metrics-server"
  namespace = "metrics-server"

  values = {
    image = {
      tag        = local.parsed.pseudo_tag
      repository = local.parsed.registry_repo
    }
    args = ["--kubelet-insecure-tls"]
  }
}

resource "imagetest_feature" "basic" {
  name        = "basic"
  description = "Basic installation"
  harness     = module.cluster_harness.harness

  steps = [
    {
      name = "Helm Install"
      cmd  = module.helm.install_cmd
    },
    {
      name = "Check metrics server"
      cmd  = "kubectl top pods -A && kubectl top nodes"
      retry = {
        attempts = 5
        delay    = "5s"
        factor   = "2"
      }
    }
  ]

  labels = {
    type = "k8s"
  }
}
