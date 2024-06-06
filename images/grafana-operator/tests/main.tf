terraform {
  required_providers {
    imagetest = { source = "chainguard-dev/imagetest" }
    oci       = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

locals { parsed = provider::oci::parse(var.digest) }

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "harbor"
  inventory = data.imagetest_inventory.this

  sandbox = {
    mounts = [{
      source      = path.module
      destination = "/tests"
    }]
    envs = {
      "IMAGE_NAME" = local.parsed.registry_repo
      "IMAGE_TAG"  = local.parsed.pseudo_tag
    }
  }
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Basic functionality of Grafana Operator."

  steps = [{
    name    = "Grafana Operator test"
    workdir = "/tests"
    cmd     = <<EOF
      ./check-operator.sh
    EOF
  }]

  labels = {
    type = "k8s"
  }
}
