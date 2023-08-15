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

# resource "helm_release" "cert-manager" {
#  name             = "cert-manager"
#   repository       = "https://charts.jetstack.io"
#   chart            = "cert-manager"
#   namespace        = "cert-manager"
#   create_namespace = true
#   version          = "1.12.0"
#   set {
#    name = "installCRDs"
#    value = true 
#   }
# }
resource "helm_release" "ingress-nginx-controller" {
  //depends_on = [ helm_release.cert-manager ]
  name = "ingress-nginx"

  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"

  namespace        = "ingress-nginx"
  create_namespace = true
  timeout = 600
  values = [
    jsonencode({
      controller = {
        image = {
          image    = data.oci_string.ref.repo
          tag      = var.image_tag
          registry = data.oci_string.ref.registry
          digest   = data.oci_string.ref.digest
        }
      }
    })
  ]
}