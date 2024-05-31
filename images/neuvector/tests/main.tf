terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    controller = string
    enforcer   = string
    manager    = string
  })
}

locals { parsed = { for k, v in var.digests : k => provider::oci::parse(v) } }

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "neuvector"
  inventory = data.imagetest_inventory.this

  sandbox = {
    mounts = [{
      source      = path.module
      destination = "/tests"
    }]
  }
}

module "crd" {
  source = "../../../tflib/imagetest/helm"

  name      = "crd"
  namespace = "neuvector"
  repo      = "https://neuvector.github.io/neuvector-helm"
  chart     = "crd"
}

module "core" {
  source = "../../../tflib/imagetest/helm"

  name      = "core"
  namespace = "neuvector"
  repo      = "https://neuvector.github.io/neuvector-helm"
  chart     = "core"

  values = {
    registry = local.parsed["controller"].registry
    controller = {
      image = {
        repository = local.parsed["controller"].repo
        hash       = local.parsed["controller"].digest
      }
    }
    enforcer = {
      image = {
        repository = local.parsed["enforcer"].repo
        hash       = local.parsed["enforcer"].digest
      }
    }
    manager = {
      image = {
        repository = local.parsed["manager"].repo
        hash       = local.parsed["manager"].digest
      }
    }
  }
}

module "monitor" {
  source = "../../../tflib/imagetest/helm"

  name      = "monitor"
  namespace = "neuvector"
  repo      = "https://neuvector.github.io/neuvector-helm"
  chart     = "monitor"

  values = {
    exporter = {
      enabled = true
    }
  }
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Basic functionality of NeuVector."

  steps = [{
    name = "Install NeuVector CRD"
    cmd  = module.crd.install_cmd
    }, {
    name = "Deploy NeuVector core"
    cmd  = module.core.install_cmd
    }, {
    name    = "NeuVector core tests"
    workdir = "/tests"
    cmd     = "/tests/check-core.sh"
    }, {
    name = "Deploy NeuVector monitor"
    cmd  = module.monitor.install_cmd
    }, {
    name    = "NeuVector Prometheus exporter tests"
    workdir = "/tests"
    cmd     = "/tests/check-exporter.sh"
  }]

  labels = {
    type = "k8s"
  }
}
