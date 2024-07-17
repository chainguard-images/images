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

  chart     = "oci://registry-1.docker.io/bitnamicharts/kubernetes-event-exporter"
  namespace = "kubernetes-event-exporter"

  values = {
    containerName = "kubernetes-event-exporter"
    image = {
      registry   = local.parsed.registry
      repository = local.parsed.repo
      digest     = local.parsed.digest
    }
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
      name = "Check logs"
      cmd  = "$WORK/logs.sh ${module.helm.release_name}"
    }
  ]

  labels = {
    type = "k8s"
  }
}

