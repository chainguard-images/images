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

data "oci_exec_test" "help" {
  digest = var.digest
  script = "${path.module}/container-test.sh"
}

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "k3s" {
  name      = "k3s"
  inventory = data.imagetest_inventory.this
}

module "helm" {
  source = "../../../tflib/imagetest/helm"

  repo      = "https://trinodb.github.io/charts/"
  name      = "trino"
  chart     = "trino"
  namespace = "trino"
  timeout   = "900s"

  values = {
    image = {
      repository = local.parsed.registry_repo
      tag        = local.parsed.pseudo_tag
    }
    server = {
      workers = 1
    }
  }
}

resource "imagetest_feature" "basic" {
  name        = "basic"
  description = "Basic installation of the Trino chart"
  harness     = imagetest_harness_k3s.k3s

  steps = [
    {
      name = "Helm install"
      cmd  = module.helm.install_cmd
    }
  ]
}
