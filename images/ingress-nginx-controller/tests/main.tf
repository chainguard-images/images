terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

variable "ingress_class" {
  description = "The ingressClass to use. This is useful for running multiple ingress tests side-by-side"
  default     = "nginx"
}

data "oci_string" "ref" { input = var.digest }

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "ingress-nginx-controller"
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

  name = "ingress-nginx"

  repo  = "https://kubernetes.github.io/ingress-nginx"
  chart = "ingress-nginx"

  namespace = "ingress-nginx"
  values = {
    controller = {
      image = {
        image    = data.oci_string.ref.repo
        registry = data.oci_string.ref.registry
        digest   = data.oci_string.ref.digest
      }
      ingressClass = var.ingress_class
      ingressClassResource = {
        name            = var.ingress_class
        controllerValue = "k8s.io/ingress-nginx"
      }
      service = {
        type = "NodePort"
      }
      admissionWebhooks = {
        failurePolicy = "Ignore"
        namespaceSelector = {
          matchLabels = {
            controllerNamespace = "ingress-nginx"
          }
        }
      }
    }
  }
}

resource "imagetest_feature" "basic" {
  name    = "k3s test"
  harness = imagetest_harness_k3s.this

  steps = [
    {
      name = "Install helm chart"
      cmd  = module.helm.install_cmd
    },
    {
      name = "test backend"
      cmd  = "/tests/backend.sh"
    }
  ]
}
