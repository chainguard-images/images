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

resource "random_pet" "suffix" {}


resource "helm_release" "kuberay-operator" {
  name             = "kuberay-operator-${random_pet.suffix.id}"
  namespace        = "kuberay-operator"
  repository       = "https://ray-project.github.io/kuberay-helm/"
  chart            = "kuberay-operator"
  create_namespace = true

  values = [
    jsonencode({
      image = {
        registry   = data.oci_string.ref.registry
        repository = data.oci_string.ref.repo
        tag        = data.oci_string.ref.pseudo_tag
      }
    }),
  ]
}

module "helm_cleanup" {
  source     = "../../../tflib/helm-cleanup"
  name       = helm_release.kuberay-operator.id
  namespace  = helm_release.kuberay-operator.namespace
  depends_on = [helm_release.kuberay-operator]
}
