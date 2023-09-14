terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    server                  = string
    agent                   = string
    oidc-discovery-provider = string
  })
}

data "oci_string" "ref" {
  for_each = var.digests
  input    = each.value
}

resource "helm_release" "spire" {
  name             = "spire"
  namespace        = "spire-system"
  create_namespace = true

  repository = "https://spiffe.github.io/helm-charts"
  chart      = "spire"
  timeout    = 120

  values = [
    jsonencode({
      spire-server = {
        image = {
          registry   = data.oci_string.ref["server"].registry
          repository = data.oci_string.ref["server"].repo
          tag        = data.oci_string.ref["server"].pseudo_tag
        }
      }
      spire-agent = {
        image = {
          registry   = data.oci_string.ref["agent"].registry
          repository = data.oci_string.ref["agent"].repo
          tag        = data.oci_string.ref["agent"].pseudo_tag
        }
      }
      spiffe-oidc-discovery-provider = {
        enabled = true
        config  = { acme = { tosAccepted = true } }
        image = {
          registry   = data.oci_string.ref["oidc-discovery-provider"].registry
          repository = data.oci_string.ref["oidc-discovery-provider"].repo
          tag        = data.oci_string.ref["oidc-discovery-provider"].pseudo_tag
        }
      }
    }),
  ]
}
