terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    minio        = string
    minio-client = string
  })
}

variable "check-dev" {
  default     = false
  description = "Whether to check for dev extensions"
}

data "oci_string" "ref" {
  for_each = var.digests
  input    = each.value
}

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "crossplane-aws"
  inventory = data.imagetest_inventory.this

  sandbox = {
    mounts = [
      {
        source      = path.module
        destination = "/tests"
      }
    ]
    envs = {
      "MINIO_IMAGE" = var.digests["minio"]
      "MC_IMAGE"    = var.digests["minio-client"]
    }
  }
}

resource "imagetest_feature" "basic" {
  name        = "Basic"
  description = "Basic minio k8s installation"
  harness     = imagetest_harness_k3s.this

  steps = [
    {
      name    = "Helm install"
      workdir = "/tests"
      cmd     = "./test.sh"
    },
  ]

  labels = {
    type = "k8s",
  }
}
