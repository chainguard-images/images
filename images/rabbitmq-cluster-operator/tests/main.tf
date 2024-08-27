terraform {
  required_providers {
    imagetest = { source = "chainguard-dev/imagetest" }
    oci       = { source = "chainguard-dev/oci" }
  }
}

variable "target_repository" {
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "imagetest_inventory" "this" {
}

module "cluster_harness" {
  cwd = path.module
  envs = {
    "RABBITMQ_CLUSTER_OPERATOR_IMAGE" : var.digest
  }
  inventory         = data.imagetest_inventory.this
  name              = basename(path.module)
  source            = "../../../tflib/imagetest/harnesses/k3s/"
  target_repository = var.target_repository
}

resource "imagetest_feature" "basic" {
  description = "Basic installation test"
  harness     = module.cluster_harness.harness
  labels = {
    type = "k8s"
  }
  name = "basic"
  steps = [
    {
      name = "Run tests"
      cmd  = "$WORK/test.sh"
    },
  ]
}

