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
  name      = "apache-nifi"
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

module "install" {
  source = "../../../tflib/imagetest/helm"

  chart     = "cetic"
  namespace = "apache-nifi"
  repo      = "https://cetic.github.io/helm-charts"

  values = {
    image = {
      repository = local.parsed.registry_repo
      tag        = local.parsed.pseudo_tag
    }
  }
}


resource "imagetest_feature" "basic" {
  name        = "Basic"
  description = "apache-nifi tests"
  harness     = imagetest_harness_k3s.this

  steps = [
    {
      name = "Helm install"
      cmd  = module.install.install_cmd
    },
  ]

  labels = {
    type = "k8s",
  }
}
