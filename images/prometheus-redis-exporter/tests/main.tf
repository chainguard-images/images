terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

variable "target_repository" {}

locals { parsed = provider::oci::parse(var.digest) }

data "imagetest_inventory" "this" {}

module "cluster_harness" {
  source = "../../../tflib/imagetest/harnesses/k3s/"

  inventory         = data.imagetest_inventory.this
  name              = basename(path.module)
  target_repository = var.target_repository
  cwd               = path.module

  envs = {
    "IMAGE_NAME" = var.digest
  }
}

module "helm" {
  source = "../../../tflib/imagetest/helm"

  name = "prometheus-redis-exporter"

  git_repo = "https://github.com/prometheus-community/helm-charts.git"
  chart    = "charts/prometheus-redis-exporter"
  patches  = ["$WORK/0001-remove-the-tag-in-common-labels.patch"]

  values = {
    image = {
      repository = local.parsed.registry_repo
      tag        = local.parsed.pseudo_tag
    }
  }
}

resource "imagetest_feature" "basic" {
  name        = "basic"
  description = "Basic installation test"
  harness     = module.cluster_harness.harness

  steps = [
    {
      name = "Install chart"
      cmd  = module.helm.install_cmd
    },
    {
      name = "Run tests"
      cmd  = "$WORK/redis-installs.sh"
    },
  ]

  labels = {
    type = "k8s"
  }
}
