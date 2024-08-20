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

data "oci_exec_test" "runs" {
  digest = var.digest
  script = "${path.module}/runs.sh"
}

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = basename(path.module)
  inventory = data.imagetest_inventory.this

  sandbox = {
    # Use the built image as the sandbox since pulumi requires infinity
    # dependencies and just happens to have bash.
    image = var.digest

    mounts = [
      {
        source      = path.module
        destination = "/it/work"
      }
    ]

    envs = {
      IMAGE_NAME : var.digest
      WORK_DIR : "/it/work"
    }
  }
}

resource "imagetest_feature" "basic" {
  name        = "basic"
  description = "Basic installation test"
  harness     = imagetest_harness_k3s.this

  steps = [
    {
      name = "Test"
      cmd  = "/it/work/k8s-install-all-languages.sh"
    },
  ]

  labels = {
    type = "k8s"
  }
}
