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
  default = "gpu-feature-discovery"
}

data "oci_string" "ref" { input = var.digest }

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = var.name
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
  name      = "nvgfd"
  repo      = "https://nvidia.github.io/gpu-feature-discovery"
  chart     = "gpu-feature-discovery"
  namespace = "gpu-feature-discovery"

  values = {
    image = {
      repository = data.oci_string.ref.registry_repo
      tag        = "unused@${element(split("@", var.digest), 1)}"
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
      name  = "Helm install GPU Feature Discovery"
      cmd   = <<EOF
        helm repo add nvgfd https://nvidia.github.io/gpu-feature-discovery
        helm repo update
        helm upgrade -i nvgfd nvgfd/gpu-feature-discovery \
          --version 0.8.2 \
          --namespace gpu-feature-discovery \
          --create-namespace
      EOF
      retry = { attempts = 3, delay = "10s" }
    },
    {
      name  = "Verify GPU Feature Discovery Daemonset"
      cmd   = <<EOF
        kubectl get daemonset -n gpu-feature-discovery -l app.kubernetes.io/name=gpu-feature-discovery
      EOF
      retry = { attempts = 3, delay = "10s" }
    },
  ]

  labels = {
    type = "k8s"
  }
}
