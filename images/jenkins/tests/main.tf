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

data "oci_string" "ref" { input = var.digest }

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
  source = "./controller"
  values = {
    namespace        = local.namespace
    fullnameOverride = local.namespace
    nameOverride     = local.namespace
    create_namespace = true

    controller = {
      javaOpts       = ""
      jenkinsOpts    = ""
      installPlugins = false
      admin = {
        createSecret = false
      }
      sidecars = {
        configAutoReload = {
          enabled = false
        }
      }
      image = {
        registry   = data.oci_string.ref.registry
        repository = data.oci_string.ref.repo
        tag        = data.oci_string.ref.pseudo_tag
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