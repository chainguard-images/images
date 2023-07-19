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

resource "helm_release" "ingress-nginx-controller" {
  name = "foo"

  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"

  namespace        = "ingress-nginx-controller"
  create_namespace = true

  values = [jsonencode({
    image = {
      tag        = data.oci_string.ref.pseudo_tag
      repository = data.oci_string.ref.registry_repo
    }
  })]
}