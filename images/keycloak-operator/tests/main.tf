terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "keycloak-operator"
  inventory = data.imagetest_inventory.this

  sandbox = {
    mounts = [
      {
        source      = path.module
        destination = "/tests"
      }
    ]
    envs = {
      "IMAGE_NAME" = var.digest
    }
  }
}

resource "imagetest_feature" "basic" {
  name        = "Basic"
  description = "Keycloak operator tests that deploys Keycloak"
  harness     = imagetest_harness_k3s.this

  steps = [{
    name = "Smoke test"
    cmd  = <<EOF
            bash /tests/keycloak-test.sh
      EOF
    },
  ]

  labels = {
    type = "k8s",
  }
}
