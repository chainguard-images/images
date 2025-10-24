terraform {
  required_providers {
    imagetest = { source = "chainguard-dev/imagetest" }
    oci       = { source = "chainguard-dev/oci" }
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

locals {
  parsed = { for k, v in var.digests : k => provider::oci::parse(v) }
}

data "imagetest_inventory" "this" {
}

resource "imagetest_harness_k3s" "this" {
  inventory = data.imagetest_inventory.this
  name      = "crossplane-aws"
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
  description = "Basic minio k8s installation"
  harness     = imagetest_harness_k3s.this
  labels = {
    type = "k8s",
  }
  name = "Basic"
  steps = [
    {
      name    = "Helm install"
      workdir = "/tests"
      cmd     = "./test.sh"
    },
  ]
}

