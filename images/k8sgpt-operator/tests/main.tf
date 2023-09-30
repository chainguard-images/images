terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" { input = var.digest }

resource "helm_release" "k8sgpt-operator" {
  name = "k8sgpt-operator"

  repository       = "https://charts.k8sgpt.ai/"
  chart            = "k8sgpt-operator"
  create_namespace = true

  values = [jsonencode({
    manager = {
      image = {
        repository = data.oci_string.ref.registry_repo
        tag        = data.oci_string.ref.pseudo_tag
      }
    }
  })]
}

module "helm_cleanup" {
  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.k8sgpt-operator.id
  namespace = helm_release.k8sgpt-operator.namespace
}
