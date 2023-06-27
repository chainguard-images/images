terraform {
  required_providers {
    oci    = { source = "chainguard-dev/oci" }
    helm   = { source = "hashicorp/helm" }
    random = { source = "hashicorp/random" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    acmesolver    = string
    cainjector    = string
    controller    = string
    webhook       = string
    trust-manager = string
  })
}

variable "skip_crds" {
  description = "Used to deconflict between multiple installations within the same cluster."
  default     = false
}

resource "random_pet" "suffix" {}

resource "helm_release" "cert-manager" {
  name             = "cert-manager-${random_pet.suffix.id}"
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

resource "helm_release" "trust-manager" {
  depends_on = [helm_release.cert-manager]

  name             = "trust-manager-${random_pet.suffix.id}"
  namespace        = "cert-manager"
  repository       = "https://charts.jetstack.io"
  chart            = "trust-manager"
  create_namespace = true

  set {
    name  = "installCRDs"
    value = "false"
  }
  set {
    name  = "image.repository"
    value = element(split("@", var.digests["trust-manager"]), 0)
  }
  set {
    name  = "image.tag"
    value = "unused@${element(split("@", var.digests["trust-manager"]), 1)}"
  }
}
