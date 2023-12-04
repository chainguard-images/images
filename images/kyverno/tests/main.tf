terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    admission  = string
    background = string
    cleanup    = string
    cli        = string
    init       = string
    reports    = string
  })
}

data "oci_string" "ref" {
  for_each = var.digests
  input    = each.value
}

resource "random_pet" "suffix" {}

resource "helm_release" "kyverno" {
  name             = "kyverno-${random_pet.suffix.id}"
  namespace        = "kyverno-${random_pet.suffix.id}"
  repository       = "https://kyverno.github.io/kyverno"
  chart            = "kyverno"
  create_namespace = true

  values = [jsonencode({
    admissionController = {
      container = {
        image = {
          registry   = data.oci_string.ref["admission"].registry
          repository = data.oci_string.ref["admission"].repo
          tag        = data.oci_string.ref["admission"].pseudo_tag
        }
      }
      initContainer = {
        image = {
          registry   = data.oci_string.ref["init"].registry
          repository = data.oci_string.ref["init"].repo
          tag        = data.oci_string.ref["init"].pseudo_tag
        }
      }
    }
    backgroundController = {
      container = {
        image = {
          registry = data.oci_string.ref["background"].registry
          registry = data.oci_string.ref["background"].repo
          tag      = data.oci_string.ref["background"].pseudo_tag
        }
      }
    }
    cleanupController = {
      container = {
        image = {
          registry = data.oci_string.ref["cleanup"].registry
          registry = data.oci_string.ref["cleanup"].repo
          tag      = data.oci_string.ref["cleanup"].pseudo_tag
        }
      }
    }
    reportsController = {
      container = {
        image = {
          registry = data.oci_string.ref["reports"].registry
          registry = data.oci_string.ref["reports"].repo
          tag      = data.oci_string.ref["reports"].pseudo_tag
        }
      }
    }
  })]
}

module "helm_cleanup" {
  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.kyverno.id
  namespace = helm_release.kyverno.namespace
}
