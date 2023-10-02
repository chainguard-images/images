terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    admission-controller = string
    recommender          = string
    updater              = string
  })
}

data "oci_string" "ref" {
  for_each = var.digests
  input    = each.value
}

resource "helm_release" "vertical-pod-autoscaler" {
  name             = "vertical-pod-autoscaler"
  namespace        = "vertical-pod-autoscaler"
  repository       = "https://cowboysysop.github.io/charts"
  chart            = "vertical-pod-autoscaler"
  create_namespace = true

  values = [jsonencode({
    installCRDs = "true"
    admissionController = {
      image = {
        registry   = data.oci_string.ref["admission-controller"].registry
        repository = data.oci_string.ref["admission-controller"].repo
        tag        = data.oci_string.ref["admission-controller"].pseudo_tag
      }
    }
    recommender = {
      image = {
        registry   = data.oci_string.ref["recommender"].registry
        repository = data.oci_string.ref["recommender"].repo
        tag        = data.oci_string.ref["recommender"].pseudo_tag
      }
    }
    updater = {
      image = {
        registry   = data.oci_string.ref["updater"].registry
        repository = data.oci_string.ref["updater"].repo
        tag        = data.oci_string.ref["updater"].pseudo_tag
      }
    }
    // Also use our already-released kubectl image too.
    crds = {
      image = {
        registry   = "cgr.dev"
        repository = "chainguard/kubectl"
        tag        = "latest"
      }
    }
  })]
}

module "helm_cleanup" {
  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.vertical-pod-autoscaler.id
  namespace = helm_release.vertical-pod-autoscaler.namespace
}
