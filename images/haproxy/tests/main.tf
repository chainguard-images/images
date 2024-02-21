terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" {
  input = var.digest
}

resource "random_pet" "suffix" {}

resource "helm_release" "haproxy" {
  name             = "haproxy-${random_pet.suffix.id}"
  namespace        = "haproxy-${random_pet.suffix.id}"
  repository       = "https://haproxytech.github.io/helm-charts"
  chart            = "haproxy"
  create_namespace = true
  timeout          = 300

  values = [
    jsonencode({
      image = {
        repository = data.oci_string.ref.registry_repo
        tag      = data.oci_string.ref.pseudo_tag
      }
    })
  ]
}


module "helm_cleanup" {
  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.haproxy.id
  namespace = helm_release.haproxy.namespace
}