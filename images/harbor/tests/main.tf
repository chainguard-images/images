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

data "oci_string" "ref" {
  for_each = var.digests
  input    = each.value
}

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
        repository = data.oci_string.ref["core"].registry_repo
        tag        = data.oci_string.ref["core"].pseudo_tag
      }
    }
    database = {
      internal = {
        image = {
          repository = data.oci_string.ref["db"].registry_repo
          tag        = data.oci_string.ref["db"].pseudo_tag
        }
      }
    }
    jobservice = {
      image = {
        repository = data.oci_string.ref["jobservice"].registry_repo
        tag        = data.oci_string.ref["jobservice"].pseudo_tag
      }
    }
    portal = {
      image = {
        repository = data.oci_string.ref["portal"].registry_repo
        tag        = data.oci_string.ref["portal"].pseudo_tag
      }
    }
    registry = {
      registry = {
        image = {
          repository = data.oci_string.ref["registry"].registry_repo
          tag        = data.oci_string.ref["registry"].pseudo_tag
        }
      }
      registryctl = {
        image = {
          repository = data.oci_string.ref["registryctl"].registry_repo
          tag        = data.oci_string.ref["registryctl"].pseudo_tag
        }
      }
      trivy = {
        image = {
          repository = data.oci_string.ref["trivy-adapter"].registry_repo
          tag        = data.oci_string.ref["trivy-adapter"].pseudo_tag
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
