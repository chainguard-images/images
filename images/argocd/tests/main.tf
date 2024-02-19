terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    helm      = { source = "hashicorp/helm" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

data "imagetest_inventory" "this" {}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    server      = string
    repo-server = string
  })
}

data "oci_string" "ref" {
  for_each = var.digests
  input    = each.value
}

resource "imagetest_harness_k3s" "this" {
  name      = "argocd"
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
  chart  = "argo-cd"
  repo   = "https://argoproj.github.io/argo-helm"
  name   = "argocd"
  values = {
    server = {
      image = {
        repository = data.oci_string.ref["server"].registry_repo
        tag        = data.oci_string.ref["server"].pseudo_tag
      }
    }
    repoServer = {
      image = {
        repository = data.oci_string.ref["repo-server"].registry_repo
        tag        = data.oci_string.ref["repo-server"].pseudo_tag
      }
    }
  }
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Basic functionality of the argocd image."

  steps = [
    {
      name = "Helm install argocd"
      cmd  = module.helm.install_cmd
    },
  ]

  labels = {
    type = "k8s"
  }
}
