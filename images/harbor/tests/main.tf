terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    core          = string
    db            = string
    jobservice    = string
    portal        = string
    registry      = string
    registryctl   = string
    trivy-adapter = string
  })
}

locals { parsed = { for k, v in var.digests : k => provider::oci::parse(v) } }

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "harbor"
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

  name      = "harbor"
  namespace = "harbor"
  repo      = "https://helm.goharbor.io"
  chart     = "harbor"

  values = {
    core = {
      image = {
        repository = local.parsed["core"].registry_repo
        tag        = local.parsed["core"].pseudo_tag
      }
    }
    database = {
      internal = {
        image = {
          repository = local.parsed["db"].registry_repo
          tag        = local.parsed["db"].pseudo_tag
        }
      }
    }
    jobservice = {
      image = {
        repository = local.parsed["jobservice"].registry_repo
        tag        = local.parsed["jobservice"].pseudo_tag
      }
    }
    portal = {
      image = {
        repository = local.parsed["portal"].registry_repo
        tag        = local.parsed["portal"].pseudo_tag
      }
    }
    registry = {
      registry = {
        image = {
          repository = local.parsed["registry"].registry_repo
          tag        = local.parsed["registry"].pseudo_tag
        }
      }
      registryctl = {
        image = {
          repository = local.parsed["registryctl"].registry_repo
          tag        = local.parsed["registryctl"].pseudo_tag
        }
      }
      trivy = {
        image = {
          repository = local.parsed["trivy-adapter"].registry_repo
          tag        = local.parsed["trivy-adapter"].pseudo_tag
        }
      }
    }
  }
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Basic functionality of the Harbor Helm chart."

  steps = [
    {
      name = "Helm install"
      cmd  = module.helm.install_cmd
    },
    {
      name    = "Harbor Helm tests"
      workdir = "/tests"
      cmd     = <<EOF
        ./check-harbor.sh
      EOF
    },
  ]

  labels = {
    type = "k8s"
  }
}
