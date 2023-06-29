terraform {
  required_providers {
    oci    = { source = "chainguard-dev/oci" }
    helm   = { source = "hashicorp/helm" }
    random = { source = "hashicorp/random" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    acmesolver = string
    cainjector = string
    controller = string
    webhook    = string
  })
}

data "oci_string" "ref" {
  for_each = var.digests
  input    = each.value
}

variable "skip_crds" {
  description = "Used to deconflict between multiple installations within the same cluster."
  default     = false
}

resource "random_pet" "suffix" {}

resource "helm_release" "cert-manager" {
  name             = "cert-manager-${random_pet.suffix.id}"
  namespace        = "cert-manager"
  repository       = "https://charts.jetstack.io"
  chart            = "cert-manager"
  create_namespace = true

  values = [jsonencode({
    installCRDs = var.skip_crds ? "false" : "true"
    image = {
      repository = data.oci_string.ref["controller"].registry_repo
      tag        = data.oci_string.ref["controller"].pseudo_tag
    }
    acmesolver = {
      repository = data.oci_string.ref["acmesolver"].registry_repo
      tag        = data.oci_string.ref["acmesolver"].pseudo_tag
    }
    cainjector = {
      repository = data.oci_string.ref["cainjector"].registry_repo
      tag        = data.oci_string.ref["cainjector"].pseudo_tag
    }
    webhook = {
      repository = data.oci_string.ref["webhook"].registry_repo
      tag        = data.oci_string.ref["webhook"].pseudo_tag
    }
  })]
}
