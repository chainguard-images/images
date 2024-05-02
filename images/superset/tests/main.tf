terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" { input = var.digest }

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "apache-superset"
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

module "helm" {
  source = "../../../tflib/imagetest/helm"

  name = "superset"

  repo  = "https://apache.github.io/superset"
  chart = "superset"

  namespace = "superset"
  values = {
    image = {
      repository = data.oci_string.ref.registry_repo
      tag        = data.oci_string.ref.pseudo_tag
    }
    extraSecretEnv = {
      SUPERSET_SECRET_KEY = "G8t0QRXk8Hn2mmDaSDbAG0aMt+85ZURBbnT5+9Gqs1KlOaXjaa5LsbBT"
    }
  }
}

resource "imagetest_feature" "basic" {
  name    = "k3s test"
  harness = imagetest_harness_k3s.this

  steps = [
    {
      name = "Install helm chart"
      cmd  = module.helm.install_cmd
    },
    {
      name = "test backend"
      cmd  = "/tests/helm-install.sh"
    }
  ]
}


