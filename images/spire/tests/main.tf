terraform {
  required_providers {
    oci    = { source = "chainguard-dev/oci" }
    random = { source = "hashicorp/random" }
    helm   = { source = "hashicorp/helm" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    server = string
    agent  = string
  })
}

data "oci_string" "ref" {
  for_each = var.digests
  input    = each.value
}

resource "random_pet" "suffix" {}

resource "helm_release" "spire" {
  name             = "spire-${random_pet.suffix.id}"
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
    }),
  ]
}
