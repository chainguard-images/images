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

  namespace        = "ingress-nginx"
  create_namespace = true

  values = [jsonencode({
    controller = {
      image = {
        image = data.oci_string.ref.repo
        tag        = data.oci_string.ref.pseudo_tag
        registry = data.oci_string.ref.registry
        digest = data.oci_string.ref.digest
      }
    }
  })]
}