terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The digest of the image"
}

data "oci_string" "ref" { input = var.digest }


variable "target_repository" {
  description = "The docker repo name"
}

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "step-issuer"
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

  name      = "step-issuer"
  namespace = "step-issuer"
  repo      = "https://smallstep.github.io/helm-charts"
  chart     = "step-issuer"

  values = {
    entrypoint = ["/usr/bin/step-issuer"]
    image = {
      repository = data.oci_string.ref.registry_repo
      tag        = data.oci_string.ref.pseudo_tag
    }
  }

}

resource "imagetest_feature" "helm-install" {
  name        = "step-issuer"
  harness     = imagetest_harness_k3s.this
  description = "Testing step-issuer helm deployment in k3s cluster."

  steps = [
    {
      name = "Install the helm chart"
      cmd  = <<EOF
        apk add helm
        helm repo add smallstep https://smallstep.github.io/helm-charts
        helm repo update
        helm install step-issuer smallstep/step-issuer
      EOF
    },
    {
      name = "Test the image deployment"
      cmd  = <<EOF
        helm test step-issuer
      EOF
    }
  ]
}
