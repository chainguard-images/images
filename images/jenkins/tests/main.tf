terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

locals {
  namespace = "jenkins"
}

variable "digests" {
  description = "The image digest to run tests over."
  type = object({
    controller = string
  })
}

data "oci_string" "ref" {
  for_each = var.digests
  input    = each.value
}

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "jenkins"
  inventory = data.imagetest_inventory.this

  sandbox = {
    envs = {
      "UNUSED_NAMESPACE" = local.namespace
    }
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
    create_namespace = true
    fullnameOverride = local.namespace
    nameOverride     = local.namespace

    controller = {
      javaOpts       = "-Djenkins.security.FIPS140.COMPLIANCE=true"
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
        registry   = data.oci_string.ref["controller"].registry
        repository = data.oci_string.ref["controller"].repo
        tag        = data.oci_string.ref["controller"].pseudo_tag
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