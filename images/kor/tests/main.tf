terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digests to run tests over."
}

variable "name" {
  default = "kor"
}

locals { parsed = provider::oci::parse(var.digest) }

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = var.name
  inventory = data.imagetest_inventory.this
}

module "helm" {
  source = "../../../tflib/imagetest/helm"
  chart  = "./kor/charts/kor"
  name   = "kor"
  values = {
    cronJob = {
      enabled = true
      image = {
        repository = local.parsed.registry_repo
        tag        = local.parsed.pseudo_tag
      }
    }
    prometheusExporter = {
      enabled = true
      deployment = {
        image = {
          repository = local.parsed.registry_repo
          tag        = local.parsed.pseudo_tag
        }
      }
    }
  }
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Basic functionality of the ${var.name} image."

  steps = [
    # kor uses a local chart that needs to be cloned first
    {
      name = "Helm install ${var.name}"
      cmd  = <<EOF
        git clone https://github.com/yonahd/kor.git
        ${module.helm.install_cmd}
      EOF
    },
    {
      name  = "Query metrics with retry"
      cmd   = <<EOF
        kubectl wait --for=condition=ready pod -l app=kor-exporter --timeout=300s
      EOF
      retry = { attempts = 5, delay = "10s" }
    },
  ]

  labels = {
    type = "k8s"
  }
}
