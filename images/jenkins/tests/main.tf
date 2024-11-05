terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

locals {
  namespace = "jenkins"
}

variable "digest" {
  description = "The image digest to run tests over."
}

variable "helm_chart_version" {
  type    = string
  default = ""
}

locals { parsed = provider::oci::parse(var.digest) }

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "jenkins"
  inventory = data.imagetest_inventory.this

  sandbox = {
    mounts = [
      {
        source      = path.module
        destination = "/tests"
      }
    ]
  }
}

module "helm_controller" {
  source             = "./controller"
  helm_chart_version = var.helm_chart_version
  values = {
    namespace        = local.namespace
    fullnameOverride = local.namespace
    nameOverride     = local.namespace
    create_namespace = true

    controller = {
      javaOpts    = ""
      jenkinsOpts = ""
      sidecars = {
        configAutoReload = {
          enabled = false
        }
      }
      image = {
        registry   = local.parsed.registry
        repository = local.parsed.repo
        tag        = local.parsed.pseudo_tag
      }
    }
  }
}

resource "imagetest_feature" "this" {
  harness     = imagetest_harness_k3s.this
  name        = "jenkins"
  description = "Test jenkins functionality"

  steps = [
    {
      name = "Install controller",
      cmd  = module.helm_controller.install_cmd
    },
    {
      name = "Test running a job",
      cmd  = "/tests/hello-world.sh"
    },
  ]
}
