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

  repo      = "https://grafana.github.io/helm-charts"
  chart     = "promtail"
  namespace = "promtail"

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
  description = "Basic installation test for promtail"
  harness     = module.cluster_harness.harness

  steps = [
    {
      name = "Install promtail"
      cmd  = module.helm.install_cmd
    },
    {
      name = "Check logs"
      cmd  = "$WORK/tests.sh ${module.helm.release_name}"
    },
  ]

  labels = {
    type = "k8s"
  }
}

resource "imagetest_harness_docker" "docker" {
  name      = "docker"
  inventory = data.imagetest_inventory.this

  envs = {
    IMAGE_NAME : var.digest
  }
}

resource "imagetest_feature" "image" {
  name        = "image"
  description = "Basic image test for promtail"
  harness     = imagetest_harness_docker.docker

  steps = [
    {
      name = "--version"
      cmd  = "docker run --rm $IMAGE_NAME --version"
    },
  ]

  labels = {
    type = "container"
  }
}
