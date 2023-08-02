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

variable "image_tag" {
  description = "image tag to pass to helm"
}

resource "helm_release" "ingress-nginx-controller" {
  name = "ingress-nginx"

  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"

  namespace        = "ingress-nginx"
  create_namespace = true
  timeout = 120
  values = [
    jsonencode({
      controller = {
        image = {
          image    = data.oci_string.ref.repo
          tag      = var.image_tag
          registry = data.oci_string.ref.registry
          digest   = data.oci_string.ref.digest
        }
        livenessProbe = {}
        startupProbe = {}
        readinessProbe = {}
        extraEnvs = [{
          name = "LD_PRELOAD"
          value = "/usr/lib/libmimalloc.so"
        }]
      }
    })
  ]
}