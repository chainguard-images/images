terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    velero                = string
    velero-plugin-for-aws = string
  })
}

variable "init_container_name" {
  description = "Init container name to override"
  default     = "testing-velero-plugin-for-aws:unused"
}

data "oci_string" "ref" {
  for_each = var.digests
  input    = each.value
}

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "velero-plugin-for-aws"
  inventory = data.imagetest_inventory.this

  sandbox = {
    envs = {
      "IMAGE_REGISTRY"   = data.oci_string.ref["velero-plugin-for-aws"].registry
      "IMAGE_REPOSITORY" = data.oci_string.ref["velero-plugin-for-aws"].repo
      "IMAGE_TAG"        = data.oci_string.ref["velero-plugin-for-aws"].pseudo_tag

      "VELERO_IMAGE_REGISTRY"   = data.oci_string.ref["velero"].registry
      "VELERO_IMAGE_REPOSITORY" = data.oci_string.ref["velero"].repo
      "VELERO_IMAGE_TAG"        = data.oci_string.ref["velero"].pseudo_tag

      "INIT_CONTAINER_NAME" = var.init_container_name
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
  description = "Basic functionality of the velero helm chart."

  steps = [
    {
      name = "Basic smoke test that providers install"
      cmd  = "/tests/docker-test.sh"
    },
  ]

  labels = {
    type = "k8s"
  }

  timeouts = {
    # This can take a while since we're working in serial to avoid disk
    # pressure
    create = "15m"
  }
}
