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
    admission-controller = string
    recommender          = string
    updater              = string
  })
}

variable "skip_crds" {
  description = "Used to deconflict between multiple installations within the same cluster."
  default     = false
}

resource "random_pet" "suffix" {}

resource "helm_release" "vertical-pod-autoscaler" {
  name             = "vertical-pod-autoscaler-${random_pet.suffix.id}"
  namespace        = "vpa-${random_pet.suffix.id}"
  repository       = "https://cowboysysop.github.io/charts"
  chart            = "vertical-pod-autoscaler"
  create_namespace = true

  set {
    name  = "installCRDs"
    value = var.skip_crds ? "false" : "true"
  }

  set {
    name  = "admissionController.image.registry"
    value = ""
  }
  set {
    name  = "admissionController.image.repository"
    value = element(split("@", var.digests["admission-controller"]), 0)
  }
  set {
    name  = "admissionController.image.tag"
    value = "unused@${element(split("@", var.digests["admission-controller"]), 1)}"
  }

  set {
    name  = "recommender.image.registry"
    value = ""
  }
  set {
    name  = "recommender.image.repository"
    value = element(split("@", var.digests["recommender"]), 0)
  }
  set {
    name  = "recommender.image.tag"
    value = "unused@${element(split("@", var.digests["recommender"]), 1)}"
  }

  set {
    name  = "updater.image.registry"
    value = ""
  }
  set {
    name  = "updater.image.repository"
    value = element(split("@", var.digests["updater"]), 0)
  }
  set {
    name  = "updater.image.tag"
    value = "unused@${element(split("@", var.digests["updater"]), 1)}"
  }

  // Use our already-released kubectl image too.
  set {
    name  = "crds.image.registry"
    value = "cgr.dev"
  }
  set {
    name  = "crds.image.repository"
    value = "chainguard/kubectl"
  }
  set {
    name  = "crds.image.tag"
    value = "latest"
  }
}
