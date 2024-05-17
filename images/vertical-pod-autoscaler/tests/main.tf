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

locals { parsed = { for k, v in var.digests : k => provider::oci::parse(v) } }

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
        registry   = local.parsed["admission-controller"].registry
        repository = local.parsed["admission-controller"].repo
        tag        = local.parsed["admission-controller"].pseudo_tag
      }
    }
    recommender = {
      image = {
        registry   = local.parsed["recommender"].registry
        repository = local.parsed["recommender"].repo
        tag        = local.parsed["recommender"].pseudo_tag
      }
    }
    updater = {
      image = {
        registry   = local.parsed["updater"].registry
        repository = local.parsed["updater"].repo
        tag        = local.parsed["updater"].pseudo_tag
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
