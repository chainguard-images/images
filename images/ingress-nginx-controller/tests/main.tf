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
  name = "ingress-nginx"

  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"

  namespace        = "ingress-nginx"
  create_namespace = true
  timeout          = 600
  values = [
    jsonencode({
      controller = {
        image = {
          image    = data.oci_string.ref.repo
          registry = data.oci_string.ref.registry
          digest   = data.oci_string.ref.digest
        }
        service = {
          type = "NodePort"
        }
      }
    })
  ]
}

data "oci_exec_test" "httpbin" {
  digest     = var.digest
  depends_on = [helm_release.ingress-nginx-controller]
  script     = "${path.module}/httpbin.sh"
}
