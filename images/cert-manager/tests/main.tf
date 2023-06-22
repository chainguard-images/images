terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    acmesolver = string
    cainjector = string
    controller = string
    webhook    = string
  })
}

variable "suffix" {
  description = "Suffix to append to the helm release name."
  default     = ""
}

variable "skip_crds" {
  default = false
}

resource "helm_release" "cert-manager" {
  name             = "cert-manager${var.suffix}"
  namespace        = "cert-manager"
  repository       = "https://charts.jetstack.io"
  chart            = "cert-manager"
  create_namespace = true

  set {
    name  = "installCRDs"
    value = var.skip_crds ? "false" : "true"
  }

  set {
    name  = "image.repository"
    value = element(split("@", var.digests["controller"]), 0)
  }

  set {
    name  = "image.tag"
    value = "unused@${element(split("@", var.digests["controller"]), 1)}"
  }

  set {
    name  = "acmesolver.image.repository"
    value = element(split("@", var.digests["acmesolver"]), 0)
  }

  set {
    name  = "acmesolver.image.tag"
    value = "unused@${element(split("@", var.digests["acmesolver"]), 1)}"
  }

  set {
    name  = "cainjector.image.repository"
    value = element(split("@", var.digests["cainjector"]), 0)
  }

  set {
    name  = "cainjector.image.tag"
    value = "unused@${element(split("@", var.digests["cainjector"]), 1)}"
  }

  set {
    name  = "webhook.image.repository"
    value = element(split("@", var.digests["webhook"]), 0)
  }

  set {
    name  = "webhook.image.tag"
    value = "unused@${element(split("@", var.digests["webhook"]), 1)}"
  }
}
