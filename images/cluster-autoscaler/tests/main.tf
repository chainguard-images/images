terraform {
  required_providers {
    imagetest = { source = "chainguard-dev/imagetest" }
    oci       = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

locals {
  parsed = provider::oci::parse(var.digest)
}

data "imagetest_inventory" "this" {
}

resource "imagetest_harness_k3s" "this" {
  inventory = data.imagetest_inventory.this
  name      = "cluster-autoscaler"
}

module "helm" {
  chart     = "cluster-autoscaler"
  namespace = "cluster-autoscaler"
  repo      = "https://kubernetes.github.io/autoscaler"
  source    = "../../../tflib/imagetest/helm"
  values = {
    cloudProvider = "clusterapi"
    global = {
      image = {
        tag        = local.parsed.pseudo_tag
        repository = local.parsed.registry_repo
      }
    }
    autoDiscovery = {
      clusterName = "foo"
    }
  }
}

resource "imagetest_feature" "basic" {
  description = "Basic functionality of the cluster-autoscaler helm chart."
  harness     = imagetest_harness_k3s.this
  labels = {
    type = "k8s"
  }
  name = "Basic"
  steps = [
    {
      name = "Convert cluster to a CAPI management cluster"
      cmd  = <<EOF
apk add clusterctl
clusterctl init --infrastructure docker
      EOF
    },
    {
      name = "Install the cluster-autoscaler helm chart, using the CAPI as a mock endpoint"
      cmd  = module.helm.install_cmd
    },
  ]
}

