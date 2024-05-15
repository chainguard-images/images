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
    velero-plugin-for-csi = string
  })
}

variable "init_container_names" {
  description = "Init container names to override"
  default = {
    velero-plugin-for-csi = "testing-velero-plugin-for-csi:unused"
    velero-plugin-for-aws = "chainguard-velero-plugin-for-aws:unused"
  }
}

locals { parsed = { for k, v in var.digests : k => provider::oci::parse(v) } }

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "velero-plugin-for-csi"
  inventory = data.imagetest_inventory.this

  sandbox = {
    envs = {
      "IMAGE_REGISTRY"   = local.parsed["velero-plugin-for-csi"].registry
      "IMAGE_REPOSITORY" = local.parsed["velero-plugin-for-csi"].repo
      "IMAGE_TAG"        = local.parsed["velero-plugin-for-csi"].pseudo_tag

      "AWS_IMAGE_REGISTRY"   = local.parsed["velero-plugin-for-aws"].registry
      "AWS_IMAGE_REPOSITORY" = local.parsed["velero-plugin-for-aws"].repo
      "AWS_IMAGE_TAG"        = local.parsed["velero-plugin-for-aws"].pseudo_tag

      "VELERO_IMAGE_REGISTRY"   = local.parsed["velero"].registry
      "VELERO_IMAGE_REPOSITORY" = local.parsed["velero"].repo
      "VELERO_IMAGE_TAG"        = local.parsed["velero"].pseudo_tag

      "CSI_INIT_CONTAINER_NAME" = var.init_container_names["velero-plugin-for-csi"]
      "AWS_INIT_CONTAINER_NAME" = var.init_container_names["velero-plugin-for-aws"]
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
