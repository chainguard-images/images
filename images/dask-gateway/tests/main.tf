terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    dask-gateway        = string
    dask-gateway-server = string
  })
}

locals { parsed = { for k, v in var.digests : k => provider::oci::parse(v) } }

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "crossplane-aws"
  inventory = data.imagetest_inventory.this
}

module "helm" {
  source = "../../../tflib/imagetest/helm"

  name      = "dask-gateway"
  repo      = "https://helm.dask.org"
  chart     = "dask-gateway"
  namespace = "dask-gateway"

  values = {
    gateway = {
      image = {
        tag  = local.parsed["dask-gateway-server"].pseudo_tag
        name = local.parsed["dask-gateway-server"].registry_repo
      }
      backend = {
        image = {
          tag  = local.parsed["dask-gateway"].pseudo_tag
          name = local.parsed["dask-gateway"].registry_repo
        }
      }
    }
    controller = {
      image = {
        tag  = local.parsed["dask-gateway-server"].pseudo_tag
        name = local.parsed["dask-gateway-server"].registry_repo
      }
    }
  }
}

resource "imagetest_feature" "basic" {
  name        = "Basic"
  description = "Basic dask-gateway Helm install test"
  harness     = imagetest_harness_k3s.this

  steps = [
    {
      name = "Helm install"
      cmd  = module.helm.install_cmd
    },
  ]

  labels = {
    type = "k8s",
  }
}
