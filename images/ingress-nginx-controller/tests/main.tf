terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

variable "ingress_class" {
  description = "The ingressClass to use. This is useful for running multiple ingress tests side-by-side"
  default     = "nginx"
}

data "oci_string" "ref" { input = var.digest }

resource "helm_release" "ingress-nginx-controller" {
  name = "ingress-${var.ingress_class}"

  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"

  namespace        = "ingress-${var.ingress_class}"
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
        ingressClass = var.ingress_class
        ingressClassResource = {
          name            = var.ingress_class
          controllerValue = "k8s.io/ingress-${var.ingress_class}"
        }
        service = {
          type = "NodePort"
        }
        admissionWebhooks = {
          failurePolicy = "Ignore"
          namespaceSelector = {
            matchLabels = {
              controllerNamespace = "ingress-${var.ingress_class}"
            }
          }
        }
      }
    })
  ]
}

data "oci_exec_test" "can-expose-a-backend" {
  digest     = var.digest
  depends_on = [helm_release.ingress-nginx-controller]
  env {
    name  = "INGRESS_CLASS"
    value = var.ingress_class
  }
  script = "${path.module}/backend.sh"
}

module "helm_cleanup" {
  depends_on = [data.oci_exec_test.can-expose-a-backend]
  source     = "../../../tflib/helm-cleanup"
  name       = helm_release.ingress-nginx-controller.id
  namespace  = helm_release.ingress-nginx-controller.namespace
}
