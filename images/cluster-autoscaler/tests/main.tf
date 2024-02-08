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
  name      = "cluster-autoscaler"
  inventory = data.imagetest_inventory.this
}

module "helm" {
  source = "../../../tflib/imagetest/helm"

  namespace = "cluster-autoscaler"
  chart     = "cluster-autoscaler"
  repo      = "https://kubernetes.github.io/autoscaler"

  values = {
    cloudProvider = "clusterapi"
    global = {
      image = {
        tag        = data.oci_string.ref.pseudo_tag
        repository = data.oci_string.ref.registry_repo
      }
    }
    autoDiscovery = {
      clusterName = "foo"
    }
  }
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Basic functionality of the cluster-autoscaler helm chart."

  steps = [
    {
      name = "Convert to cluster to a CAPI management cluster"
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

  labels = {
    type = "k8s"
  }
}
