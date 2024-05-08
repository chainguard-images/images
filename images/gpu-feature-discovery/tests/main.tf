terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

variable "name" {
  default = "gpu-feature-discovery"
}

data "oci_string" "ref" { input = var.digest }

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = var.name
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

module "helm" {
  source    = "../../../tflib/imagetest/helm"
  name      = "nvgfd"
  repo      = "https://nvidia.github.io/gpu-feature-discovery"
  chart     = "gpu-feature-discovery"
  namespace = "gpu-feature-discovery"

  values = {
    image = {
      repository = data.oci_string.ref.registry_repo
      tag        = data.oci_string.ref.pseudo_tag
    }
  }
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Basic functionality of the image."

  steps = [
    {
      name = "Helm install"
      cmd  = module.helm.install_cmd
    },
    {
      name  = "Verify GPU Feature Discovery Daemonset"
      cmd   = <<EOF
        kubectl get daemonset -n gpu-feature-discovery -l app.kubernetes.io/name=gpu-feature-discovery
      EOF
      retry = { attempts = 3, delay = "10s" }
    },
  ]

  labels = {
    type = "k8s"
  }
}
