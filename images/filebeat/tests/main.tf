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
  name      = "filebeat"
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
  name   = "filebeat"
  repo   = "https://helm.elastic.co"
  chart  = "filebeat"


  values_files = [
    "/tests/values.yaml",
  ]

  values = {
    image    = local.parsed.registry_repo
    imageTag = local.parsed.pseudo_tag
  }
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Basic functionality of the image."

  steps = [
    {
      name = "Helm install"
      cmd  = module.helm.install_cmd
    },
    {
      name  = "Test filebeat"
      cmd   = "/tests/check-filebeat.sh"
      retry = { attempts = 10, delay = "10s" }
    },
  ]

  labels = {
    type = "k8s"
  }
}
