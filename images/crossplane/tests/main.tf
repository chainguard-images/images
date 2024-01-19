terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digests" {
  description = "The image digest to run tests over."
  type = object({
    crossplane = string
  })
}

data "oci_string" "ref" {
  for_each = var.digests
  input    = each.value
}

resource "helm_release" "crossplane" {
  name       = "crossplane"
  repository = "https://charts.crossplane.io/stable"
  chart      = "crossplane"

  create_namespace = true
  namespace        = "crossplane-system"

  values = [jsonencode({
    image = {
      repository = data.oci_string.ref["crossplane"].registry_repo
      tag        = data.oci_string.ref["crossplane"].pseudo_tag
    }
  })]
}

module "helm-cleanup" {
  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.crossplane.id
  namespace = helm_release.crossplane.namespace
}
