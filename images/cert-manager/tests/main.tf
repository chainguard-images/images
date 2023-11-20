terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
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

resource "random_id" "suffix" { byte_length = 4 }

module "helm-test" {
  source = "../../../tflib/helm-test"

  name       = "cert-manager-${random_id.suffix.hex}"
  namespace  = "cert-manager-${random_id.suffix.hex}"
  repository = "https://charts.jetstack.io"
  chart      = "cert-manager"

  crd_pattern = "cert-manager"
  flock_key   = "cert-manager"

  values = jsonencode({
    installCRDs : true
    image : {
      repository : data.oci_string.ref["controller"].registry_repo
      tag : data.oci_string.ref["controller"].pseudo_tag
    }
    acmesolver : {
      image : {
        repository : data.oci_string.ref["acmesolver"].registry_repo
        tag : data.oci_string.ref["acmesolver"].pseudo_tag
      }
    }
    cainjector : {
      image : {
        repository : data.oci_string.ref["cainjector"].registry_repo
        tag : data.oci_string.ref["cainjector"].pseudo_tag
      }
    }
    webhook : {
      image : {
        repository : data.oci_string.ref["webhook"].registry_repo
        tag : data.oci_string.ref["webhook"].pseudo_tag
      }
    }
  })
}
