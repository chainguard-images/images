terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    controller          = string
    enforcer            = string
    manager             = string
    prometheus-exporter = string
    updater             = string
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
      internal = {
        certificate = {
          secret = "internal-cert"
        }
      }
      replicas = 1
    }
    enforcer = {
      image = {
        repository = local.parsed["enforcer"].repo
        hash       = local.parsed["enforcer"].digest
      }
      internal = {
        certificate = {
          secret = "internal-cert"
        }
      }
    }
    manager = {
      image = {
        repository = local.parsed["manager"].repo
        hash       = local.parsed["manager"].digest
      }
    }
    cve = {
      scanner = {
        image = {
          registry = "docker.io"
        }
        internal = {
          certificate = {
            secret = "internal-cert"
          }
        }
        replicas = 1
      }
      updater = {
        image = {
          registry   = local.parsed["updater"].registry
          repository = local.parsed["updater"].repo
          hash       = local.parsed["updater"].digest
        }
      }
    }
    crdwebhook = {
      enabled = false
    }
    k3s = {
      enabled     = true
      runtimePath = "/run/k3s/containerd/containerd.sock"
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
    registry = local.parsed["prometheus-exporter"].registry
    exporter = {
      apiSvc = "neuvector-svc-controller:10443"
      image = {
        repository = local.parsed["prometheus-exporter"].repo
        tag        = local.parsed["prometheus-exporter"].pseudo_tag
      }
    }
  }
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Basic functionality of NeuVector."

  steps = [{
    name    = "Generate internal certs"
    workdir = "/tests"
    cmd     = "/tests/internal-certs.sh"
    }, {
    name    = "Install NeuVector CRD"
    workdir = "/tests"
    cmd     = module.crd.install_cmd
    }, {
    name    = "Deploy NeuVector core"
    workdir = "/tests"
    cmd     = module.core.install_cmd
    }, {
    name    = "NeuVector core tests"
    workdir = "/tests"
    cmd     = "/tests/check-core.sh"
    }, {
    name    = "Deploy NeuVector monitor"
    workdir = "/tests"
    cmd     = module.monitor.install_cmd
    }, {
    name    = "NeuVector Prometheus exporter tests"
    workdir = "/tests"
    cmd     = "/tests/check-exporter.sh"
  }]

  labels = {
    type = "k8s"
  }
}
