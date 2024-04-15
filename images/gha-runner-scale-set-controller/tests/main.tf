terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" {
  input = var.digest
}

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "gha-runner-scale-set-controller"
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
  source    = "../../../tflib/imagetest/helm"
  chart     = "oci://ghcr.io/actions/actions-runner-controller-charts/gha-runner-scale-set-controller"
  name      = "gha-runner-scale-set-controller"
  namespace = "arc-systems"
  values = {

    image = {
      repository = data.oci_string.ref.registry_repo
      tag        = data.oci_string.ref.pseudo_tag
    }

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
      name  = "Wait for controller pod to be ready"
      cmd   = <<EOF
kubectl wait --for=condition=ready pod -n arc-systems -l app.kubernetes.io/name=gha-rs-controller --timeout=5m
      EOF
      retry = { attempts = 10, delay = "1s" }
    },
  ]

  labels = {
    type = "k8s"
  }
}

