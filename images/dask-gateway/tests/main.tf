terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    dask-gateway        = string
    dask-gateway-server = string
  })
}

data "oci_string" "ref" {
  for_each = var.digests
  input    = each.value
}

resource "helm_release" "dask-gateway" {
  name = "dask-gateway"

  repository = "https://helm.dask.org"
  chart      = "dask-gateway"

  namespace        = "dask-gateway"
  create_namespace = true

  values = [
    jsonencode({
      gateway = {
        image = {
          tag  = data.oci_string.ref["dask-gateway-server"].pseudo_tag
          name = data.oci_string.ref["dask-gateway-server"].registry_repo
        }
        backend = {
          image = {
            tag  = data.oci_string.ref["dask-gateway"].pseudo_tag
            name = data.oci_string.ref["dask-gateway"].registry_repo
          }
        }
      }
      controller = {
        image = {
          tag  = data.oci_string.ref["dask-gateway-server"].pseudo_tag
          name = data.oci_string.ref["dask-gateway-server"].registry_repo
        }
      }
    }),
  ]
}

module "helm_cleanup" {
  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.dask-gateway.id
  namespace = helm_release.dask-gateway.namespace
}
