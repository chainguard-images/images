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
resource "random_string" "helm" {
  length  = 8
  special = false
  numeric = false
  upper   = false
}

resource "helm_release" "ingress-nginx-controller" {
  name = random_string.helm.result

  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"

  namespace        = "ingress-nginx"
  create_namespace = true

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