terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

locals { parsed = provider::oci::parse(var.digest) }

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "kube-vip"
  inventory = data.imagetest_inventory.this

  sandbox = {
    mounts = [
      {
        source      = path.module
        destination = "/tests"
      }
    ]
    envs = {
      "IMAGE_REGISTRY"   = local.parsed.registry
      "IMAGE_REPOSITORY" = local.parsed.repo
      "IMAGE_TAG"        = local.parsed.pseudo_tag
    }
  }


}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Basic functionality test of kube-vip."

  steps = [
    {
      name    = "Kube-vip tests"
      workdir = "/tests"
      cmd     = <<EOF
        ./check-kube-vip.sh
      EOF
    },
  ]

  labels = {
    type = "k8s"
  }
}
