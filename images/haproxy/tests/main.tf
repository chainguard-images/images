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

  name      = "haproxy-redis"
  namespace = "haproxy-system"
  repo      = "https://dandydeveloper.github.io/charts"
  chart     = "redis-ha"

  values = {
    image = {
      registry = "cgr.dev/chainguard/redis"
      tag      = "latest"
    }
    hardAntiAffinity = false
    haproxy = {
      enabled          = true
      hardAntiAffinity = false
      image = {
        repository = local.parsed.registry_repo
        tag        = local.parsed.pseudo_tag
      }
      containerSecurityContext = {
        capabilities = { add = ["NET_BIND_SERVICE"] }
      }
    }
  }
}

resource "imagetest_feature" "basic" {
  name        = "basic"
  description = "Basic installation test"
  harness     = module.cluster_harness.harness

  steps = [
    {
      name = "Install with helm"
      cmd  = module.helm.install_cmd
    },
  ]

  labels = {
    type = "k8s"
  }

  timeouts = {
    # The redis-ha rollout is painfully slow and prone to fruitless polling
    create = "15m"
  }
}
