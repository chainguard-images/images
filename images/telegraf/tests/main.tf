terraform {
  required_providers {
    imagetest = { source = "chainguard-dev/imagetest" }
    oci       = { source = "chainguard-dev/oci" }
  }
}

variable "target_repository" {
}

variable "digest" {
  description = "The image digest to run tests over."
}

locals {
  parsed = provider::oci::parse(var.digest)
}

data "imagetest_inventory" "this" {
}

module "cluster_harness" {
  cwd               = path.module
  inventory         = data.imagetest_inventory.this
  name              = basename(path.module)
  source            = "../../../tflib/imagetest/harnesses/k3s/"
  target_repository = var.target_repository
}

module "helm" {
  chart  = "telegraf"
  repo   = "https://helm.influxdata.com"
  source = "../../../tflib/imagetest/helm"
  values = {
    image = {
      repo = local.parsed.registry_repo
      tag  = local.parsed.pseudo_tag
    }
  }
}

resource "imagetest_feature" "basic" {
  description = "Basic installation"
  harness     = module.cluster_harness.harness
  labels = {
    type = "k8s"
  }
  name = "basic"
  steps = [
    {
      name = "Helm Install"
      cmd  = module.helm.install_cmd
    }
  ]
}

