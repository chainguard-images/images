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
  default = "gpu-operator"
}

locals { parsed = provider::oci::parse(var.digest) }

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
  name      = "gpu-operator"
  repo      = "https://helm.ngc.nvidia.com/nvidia"
  chart     = "gpu-operator"
  namespace = "gpu-operator"

  values = {
    image = {
      repository = local.parsed.registry_repo
      tag        = local.parsed.pseudo_tag
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
      name  = "Verify GPU Feature Discovery Daemonset (workers)"
      cmd   = <<EOF
        kubectl get daemonset -n gpu-operator -l app.kubernetes.io/name=node-feature-discovery
      EOF
      retry = { attempts = 3, delay = "10s" }
    },
    {
      name  = "Verify GPU Feature Discovery Deployments (gc and master)"
      cmd   = <<EOF
        kubectl get deploy -n gpu-operator -l app.kubernetes.io/name=node-feature-discovery
      EOF
      retry = { attempts = 3, delay = "10s" }
    },
    {
      name  = "Change GPU Operator deployment"
      cmd   = <<EOF
        kubectl set image rs/gpu-operator="${local.parsed.registry_repo}:${local.parsed.pseudo_tag}" -n gpu-operator -l app.kubernetes.io/name=gpu-operator
      EOF
      retry = { attempts = 3, delay = "10s" }
    },
    {
      name  = "Ensure it comes up healthy"
      cmd   = <<EOF
        kubectl rollout status rs/gpu-operator -n gpu-operator --timeout=120s
        kubectl wait --for=condition=ready pod -l app.kubernetes.io/name=gpu-operator
       EOF
      retry = { attempts = 3, delay = "2s", factor = 2 }
    },
  ]

  labels = {
    type = "k8s"
  }
}
