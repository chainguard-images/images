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

locals { parsed = { for k, v in var.digests : k => provider::oci::parse(v) } }

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
        repository = local.parsed["keda"].registry_repo
        tag        = local.parsed["keda"].pseudo_tag
      }
      metricsApiServer = {
        repository = local.parsed["keda-adapter"].registry_repo
        tag        = local.parsed["keda-adapter"].pseudo_tag
      }
      webhooks = {
        repository = local.parsed["keda-admission-webhooks"].registry_repo
        tag        = local.parsed["keda-admission-webhooks"].pseudo_tag
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
