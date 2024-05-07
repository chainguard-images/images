terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

resource "random_pet" "suffix" {}

data "oci_string" "ref" { input = var.digest }

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "cassandra-medusa"
  inventory = data.imagetest_inventory.this

  sandbox = {
    mounts = [
      {
        source      = path.module
        destination = "/tests"
      }
    ]
    envs = {
      "NAMESPACE"              = "k8s-medusa-${random_pet.suffix.id}"
      "IMAGE_REGISTRY"         = data.oci_string.ref.registry
      "IMAGE_REPOSITORY"       = split("/", data.oci_string.ref.repo)[0]
      "NAME"                   = split("/", data.oci_string.ref.repo)[1]
      "K8SSANDRA_CLUSTER_NAME" = "foo-${random_pet.suffix.id}"
      "IMAGE_TAG"              = data.oci_string.ref.pseudo_tag
    }
  }
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Basic functionality of the cert-manager helm chart."

  steps = [
    {
      name = "Test"
      cmd  = "/tests/medusa-install.sh"
    },
  ]

  labels = {
    type = "k8s"
  }
}
