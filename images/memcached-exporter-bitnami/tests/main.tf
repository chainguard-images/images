terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

variable "name" {
  default = "memcached-exporter-bitnami"
}

locals { memcached = provider::oci::get("cgr.dev/chainguard/memcached:latest") }

locals { parsed = provider::oci::parse(var.digest) }

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = var.name
  inventory = data.imagetest_inventory.this
}

module "helm" {
  source = "../../../tflib/imagetest/helm"

  name  = "memcached-exporter"
  chart = "oci://registry-1.docker.io/bitnamicharts/memcached"

  values = {
    image = {
      registry   = "cgr.dev"
      repository = "chainguard/memcached"
      digest     = local.memcached.digest
    }
    metrics = {
      enabled = true
      image = {
        registry   = local.parsed.registry
        repository = local.parsed.repo
        digest     = local.parsed.digest
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
      cmd  = module.helm.install_cmd
    },
  ]

  labels = {
    type = "k8s"
  }
}
