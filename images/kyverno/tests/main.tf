terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    admission  = string
    background = string
    cleanup    = string
    cli        = string
    init       = string
    reports    = string
  })
}

data "oci_exec_test" "help" {
  for_each = var.digests
  digest   = each.value
  script   = "docker run --rm $IMAGE_NAME --help"
}

resource "helm_release" "kyverno" {
  name             = "kyverno"
  namespace        = "kyverno"
  repository       = "https://kyverno.github.io/kyverno"
  chart            = "kyverno"
  create_namespace = true

  // admission
  set {
    name  = "admissionController.container.image.registry"
    value = ""
  }
  set {
    name  = "admissionController.container.image.repository"
    value = element(split("@", var.digests["admission"]), 0)
  }
  set {
    name  = "admissionController.container.image.tag"
    value = "unused@${element(split("@", var.digests["admission"]), 1)}"
  }

  // background
  set {
    name  = "backgroundController.container.image.registry"
    value = ""
  }
  set {
    name  = "backgroundController.container.image.repository"
    value = element(split("@", var.digests["background"]), 0)
  }
  set {
    name  = "backgroundController.container.image.tag"
    value = "unused@${element(split("@", var.digests["background"]), 1)}"
  }

  // cleanup
  set {
    name  = "cleanupController.container.image.registry"
    value = ""
  }
  set {
    name  = "cleanupController.container.image.repository"
    value = element(split("@", var.digests["cleanup"]), 0)
  }
  set {
    name  = "cleanupController.container.image.tag"
    value = "unused@${element(split("@", var.digests["cleanup"]), 1)}"
  }

  // init
  set {
    name  = "admissionController.initContainer.image.registry"
    value = ""
  }
  set {
    name  = "admissionController.initContainer.image.repository"
    value = element(split("@", var.digests["init"]), 0)
  }
  set {
    name  = "admissionController.initContainer.image.tag"
    value = "unused@${element(split("@", var.digests["init"]), 1)}"
  }

  // reports
  set {
    name  = "reportsController.container.image.registry"
    value = ""
  }
  set {
    name  = "reportsController.container.image.repository"
    value = element(split("@", var.digests["reports"]), 0)
  }
  set {
    name  = "reportsController.container.image.tag"
    value = "unused@${element(split("@", var.digests["reports"]), 1)}"
  }
}
