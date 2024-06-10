terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    helm      = { source = "hashicorp/helm" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    server   = string
    cluster  = string
    sentinel = string
  })
}

locals { parsed = { for k, v in var.digests : k => provider::oci::parse(v) } }

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "redis-bitnami"
  inventory = data.imagetest_inventory.this

  sandbox = {
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

  name      = "redis"
  namespace = "redis"
  chart     = "oci://registry-1.docker.io/bitnamicharts/redis"

  values = {
    image = {
      registry   = local.parsed["server"].registry
      repository = local.parsed["server"].repo
      digest     = local.parsed["server"].digest
    }
    sentinel = {
      enabled = true
      image = {
        registry   = local.parsed["sentinel"].registry
        repository = local.parsed["sentinel"].repo
        digest     = local.parsed["sentinel"].digest
      }
    }
  }
}

resource "imagetest_feature" "basic" {
  name    = "k3s test"
  harness = imagetest_harness_k3s.this

  steps = [
    {
      name = "Install helm chart"
      cmd  = module.helm.install_cmd
    },
    {
      name = "test backend"
      cmd  = "/tests/run-tests.sh"
    }
  ]
}
