terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
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

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "vertical-pod-autoscaler"
  inventory = data.imagetest_inventory.this
}

module "install" {
  source = "../../../tflib/imagetest/helm"

  name      = "vertical-pod-autoscaler"
  namespace = "vertical-pod-autoscaler"
  repo      = "https://cowboysysop.github.io/charts"
  chart     = "vertical-pod-autoscaler"

  values = {
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
  }
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Basic functionality of the vertical-pod-autoscaler helm chart."

  steps = [
    {
      name = "Helm install"
      cmd  = module.install.install_cmd
    }
  ]
}
