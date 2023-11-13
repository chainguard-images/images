terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    reporter = string
    ui       = string
    plugin   = string
  })
}

variable "chart-version" {
  description = "The image digests to run tests over."
  default     = ""
}

data "oci_string" "ref" {
  for_each = var.digests
  input    = each.value
}

resource "random_pet" "suffix" {}

resource "helm_release" "kyverno" {
  name       = "kyverno-${random_pet.suffix.id}"
  repository = "https://kyverno.github.io/kyverno"
  chart      = "kyverno"

  namespace        = "kyverno-${random_pet.suffix.id}"
  create_namespace = true

  values = [jsonencode({
    admissionController = {
      container = {
        image = {
          registry   = "cgr.dev"
          repository = "chainguard/kyverno"
          tag        = "latest"
        }
      }
      initContainer = {
        image = {
          registry   = "cgr.dev"
          repository = "chainguard/kyvernopre"
          tag        = "latest"
        }
      }
    }
    backgroundController = {
      container = {
        image = {
          registry   = "cgr.dev"
          repository = "chainguard/kyverno-background-controller"
          tag        = "latest"
        }
      }
    }
    cleanupController = {
      container = {
        image = {
          registry   = "cgr.dev"
          repository = "chainguard/kyverno-cleanup-controller"
          tag        = "latest"
        }
      }
    }
    reportsController = {
      container = {
        image = {
          registry   = "cgr.dev"
          repository = "chainguard/kyverno-reports-controller"
          tag        = "latest"
        }
      }
    }
  })]
}

resource "helm_release" "kyverno-policy-reporter" {
  depends_on = [helm_release.kyverno]
  name       = "policy-reporter"
  repository = "https://kyverno.github.io/policy-reporter"
  chart      = "policy-reporter"
  version    = var.chart-version
  timeout    = 600

  create_namespace = true
  namespace        = "policy-reporter"

  values = [jsonencode({
    image = {
      registry   = data.oci_string.ref["reporter"].registry
      repository = data.oci_string.ref["reporter"].repo
      tag        = data.oci_string.ref["reporter"].pseudo_tag
    }

    ui = {
      enabled = true
      plugins = {
        kyverno = true
      }
      image = {
        registry   = data.oci_string.ref["ui"].registry
        repository = data.oci_string.ref["ui"].repo
        tag        = data.oci_string.ref["ui"].pseudo_tag
      }
    }

    kyvernoPlugin = {
      enabled = true
      image = {
        registry   = data.oci_string.ref["plugin"].registry
        repository = data.oci_string.ref["plugin"].repo
        tag        = data.oci_string.ref["plugin"].pseudo_tag
      }
    }
  })]
}

module "helm_cleanup-kpr" {
  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.kyverno-policy-reporter.id
  namespace = helm_release.kyverno-policy-reporter.namespace
}

module "helm_cleanup" {
  depends_on = [module.helm_cleanup-kpr]
  source     = "../../../tflib/helm-cleanup"
  name       = helm_release.kyverno.id
  namespace  = helm_release.kyverno.namespace
}
