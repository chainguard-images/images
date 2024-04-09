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
    image    = data.oci_string.ref.registry_repo
    imageTag = data.oci_string.ref.pseudo_tag
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
      cmd   = <<EOF
            export FB_NAMESPACE=default
            /tests/check-filebeat.sh
      EOF
      retry = { attempts = 10, delay = "10s" }
    },
  ]

  labels = {
    type = "k8s"
  }
}
