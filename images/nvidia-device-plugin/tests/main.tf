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

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "nvidia-device-plugin"
  inventory = data.imagetest_inventory.this

  sandbox = {
    envs = {
      "IMAGE_REGISTRY"   = data.oci_string.ref.registry
      "IMAGE_REPOSITORY" = data.oci_string.ref.repo
      "IMAGE_TAG"        = data.oci_string.ref.pseudo_tag
    }

    mounts = [
      {
        source      = path.module
        destination = "/tests"
      }
    ]
  }


}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Basic functionality of the nvidia-device-plugin Helm chart."

  steps = [
    {
      name = "Run Test"
      cmd  = "/tests/helm.sh"
    },
  ]

  labels = {
    type = "k8s"
  }
}
