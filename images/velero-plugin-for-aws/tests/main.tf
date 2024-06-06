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

locals { parsed = { for k, v in var.digests : k => provider::oci::parse(v) } }

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "velero-plugin-for-aws"
  inventory = data.imagetest_inventory.this

  sandbox = {
    envs = {
      "IMAGE_REGISTRY"   = local.parsed["velero-plugin-for-aws"].registry
      "IMAGE_REPOSITORY" = local.parsed["velero-plugin-for-aws"].repo
      "IMAGE_TAG"        = local.parsed["velero-plugin-for-aws"].pseudo_tag

      "VELERO_IMAGE_REGISTRY"   = local.parsed["velero"].registry
      "VELERO_IMAGE_REPOSITORY" = local.parsed["velero"].repo
      "VELERO_IMAGE_TAG"        = local.parsed["velero"].pseudo_tag

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
