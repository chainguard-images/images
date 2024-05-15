terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

locals { parsed = provider::oci::parse(var.digest) }

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "cortex"
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

  name      = "cortex"
  namespace = "cortex"
  repo      = "https://cortexproject.github.io/cortex-helm-chart"
  chart     = "cortex"

  values = {
    image = {
      tag        = local.parsed.pseudo_tag
      repository = local.parsed.registry_repo
    },
    config = {
      blocks_storage = {
        backend = "filesystem"
        filesystem = {
          dir = "/data/tsdb"
        }
      }
    },
    alertmanager = {
      enabled = false
    },
    ruler = {
      enabled = false
    }
  }
}

resource "imagetest_feature" "basic" {
  name        = "Basic"
  description = "Test a basic installation of Cortex Metrics"
  harness     = imagetest_harness_k3s.this

  steps = [
    {
      name = "Helm install"
      cmd  = module.helm.install_cmd
    }
  ]

  labels = {
    type = "k8s",
  }
}

