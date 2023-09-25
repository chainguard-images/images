terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
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

variable "skip_crds" {
  description = "Used to deconflict between multiple installations within the same cluster."
  default     = false
}

data "oci_string" "ref" {
  for_each = var.digests
  input    = each.value
}

resource "random_pet" "suffix" {}

resource "helm_release" "cert-manager" {
  name       = "cert-manager-${random_pet.suffix.id}"
  repository = "https://charts.jetstack.io"
  chart      = "cert-manager"
  timeout    = 600

  namespace        = "cert-manager-${random_pet.suffix.id}"
  create_namespace = true
  skip_crds        = var.skip_crds

  values = [jsonencode({
    installCRDs = "${!var.skip_crds}"
    image = {
      repository = data.oci_string.ref["controller"].registry_repo
      tag        = data.oci_string.ref["controller"].pseudo_tag
    }
    acmesolver = {
      image = {
        repository = data.oci_string.ref["acmesolver"].registry_repo
        tag        = data.oci_string.ref["acmesolver"].pseudo_tag
      }
    }
    cainjector = {
      image = {
        repository = data.oci_string.ref["cainjector"].registry_repo
        tag        = data.oci_string.ref["cainjector"].pseudo_tag
      }
    }
    webhook = {
      image = {
        repository = data.oci_string.ref["webhook"].registry_repo
        tag        = data.oci_string.ref["webhook"].pseudo_tag
      }
    }
  })]
}
