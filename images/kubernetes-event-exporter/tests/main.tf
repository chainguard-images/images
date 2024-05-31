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

locals {
  release_name = "kubernetes-event-exporter"
}

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "k3s" {
  name      = "prometheus-redis-exporter"
  inventory = data.imagetest_inventory.this

  sandbox = {
    mounts = [{
      source      = path.module
      destination = "/tests"
    }]
    envs = {
      "RELEASE_NAME" : local.release_name
      "RELEASE_NAMESPACE" : local.release_name
    }
  }
}

module "helm" {
  source = "../../../tflib/imagetest/helm"

  name      = local.release_name
  chart     = "oci://registry-1.docker.io/bitnamicharts/kubernetes-event-exporter"
  namespace = local.release_name

  values = {
    containerName = "kubernetes-event-exporter"
    image = {
      registry   = local.parsed.registry
      repository = local.parsed.repo
      digest     = local.parsed.digest
    }
  }
}

resource "imagetest_feature" "basic" {
  name        = "basic"
  description = "Basic installation test for kubernetes-event-exporter"
  harness     = imagetest_harness_k3s.k3s

  steps = [
    {
      name = "Install kubernetes-event-exporter"
      cmd  = module.helm.install_cmd
    },
    {
      name = "Validate"
      cmd  = "/tests/logs.sh"
    },
  ]

  labels = {
    type = "k8s"
  }
}
