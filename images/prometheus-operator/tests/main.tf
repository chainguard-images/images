terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" {
  input = var.digest
}

resource "random_pet" "suffix" {}

resource "helm_release" "kube-prometheus-stack" {
  name       = "prometheus-operator-${random_pet.suffix.id}"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"

  namespace        = "prometheus-operator-${random_pet.suffix.id}"
  create_namespace = true

  // operator
  set {
    name  = "prometheusOperator.image.registry"
    value = data.oci_string.ref.registry
  }
  set {
    name  = "prometheusOperator.image.repository"
    value = data.oci_string.ref.repo
  }
  set {
    name  = "prometheusOperator.image.tag"
    value = data.oci_string.ref.pseudo_tag
  }
}

module "helm_cleanup" {
  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.kube-prometheus-stack.id
  namespace = helm_release.kube-prometheus-stack.namespace
}

