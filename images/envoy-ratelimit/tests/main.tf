terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" { input = var.digest }

# TODO: Convert this to imagetest_harness_container when ready
data "oci_exec_test" "runs" {
  digest = var.digest
  script = "${path.module}/runs.sh"
}

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "envoy-ratelimit"
  inventory = data.imagetest_inventory.this

  sandbox = {
    mounts = [
      {
        source      = path.module
        destination = "/tests"
      }
    ]
  }
}

module "helm_istio" {
  source    = "../../../tflib/imagetest/helm"
  chart     = "base"
  repo      = "https://istio-release.storage.googleapis.com/charts"
  name      = "istio-base"
  namespace = "istio-system"
}

module "helm_ratelimit" {
  source = "../../../tflib/imagetest/helm"
  repo   = "https://xyctruth.github.io/istio-ratelimit"
  chart  = "istio-ratelimit"
  name   = "ratelimit"
  values = {
    ratelimit = {
      # Needed to pick up the right redis endpoint
      fullnameOverride = "ratelimit"
      image = {
        repository = data.oci_string.ref.registry_repo
        tag        = data.oci_string.ref.pseudo_tag
      }
    }
  }
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Basic functionality of the image."

  steps = [
    {
      name = "Helm install istio"
      cmd  = module.helm_istio.install_cmd
    },
    {
      name = "Helm install ratelimit"
      cmd  = module.helm_ratelimit.install_cmd
    },
  ]

  labels = {
    type = "k8s"
  }
}
