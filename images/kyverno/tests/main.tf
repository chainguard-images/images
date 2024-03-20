terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    admission  = string
    background = string
    cleanup    = string
    cli        = string
    init       = string
    reports    = string
  })
}

data "oci_string" "ref" {
  for_each = var.digests
  input    = each.value
}

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "kyverno"
  inventory = data.imagetest_inventory.this
}

module "helm" {
  # Use a separate module because this chart is re-used by
  # the kyverno-policy-reporter tests
  source = "./helm"
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Basic functionality of the kyverno helm chart."

  steps = [
    {
      name = "Helm install"
      cmd  = module.helm.install_cmd
    },
    {
      # TODO: These aren't exhaustive, but they seem to be pretty
      # representative outside the full upstream sweep.
      name = "helm test"
      cmd  = "helm test -n kyverno kyverno"
    },
  ]

  labels = {
    type = "k8s"
  }
}
