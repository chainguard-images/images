terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    keda                    = string
    keda-adapter            = string
    keda-admission-webhooks = string
  })
}

variable "name" {
  default = "keda"
}

data "oci_string" "ref" {
  for_each = var.digests
  input    = each.value
}

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = var.name
  inventory = data.imagetest_inventory.this
  sandbox = {
    envs = {
      "SCRIPT_DIR" = "/tests"
    }
    mounts = [
      {
        source      = path.module
        destination = "/tests"
      }
    ]
  }
}

module "install" {
  source = "../../../tflib/imagetest/helm"

  name  = "keda"
  repo  = "https://kedacore.github.io/charts"
  chart = "keda"

  values = {
    image = {
      keda = {
        repository = data.oci_string.ref["keda"].registry_repo
        tag        = data.oci_string.ref["keda"].pseudo_tag
      }
      metricsApiServer = {
        repository = data.oci_string.ref["keda-adapter"].registry_repo
        tag        = data.oci_string.ref["keda-adapter"].pseudo_tag
      }
      webhooks = {
        repository = data.oci_string.ref["keda-admission-webhooks"].registry_repo
        tag        = data.oci_string.ref["keda-admission-webhooks"].pseudo_tag
      }
    }
  }
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Basic functionality of the ${var.name} helm chart."

  steps = [
    {
      name = "Helm install"
      cmd  = module.install.install_cmd
    },
    {
      name = "Smoke test"
      cmd  = <<EOF
            bash /tests/smoke-test.sh
      EOF
    },
  ]

  labels = {
    type = "k8s"
  }
}
