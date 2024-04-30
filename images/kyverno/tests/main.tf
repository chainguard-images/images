terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
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

data "oci_string" "ref" {
  for_each = var.digests
  input    = each.value
}

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "kyverno"
  inventory = data.imagetest_inventory.this
}

module "helm" {
  # Use a separate module because this chart is re-used by
  # the kyverno-policy-reporter tests
  source = "./helm"
  values = {
    admissionController = {
      container = {
        image = {
          registry   = data.oci_string.ref["admission"].registry
          repository = data.oci_string.ref["admission"].repo
          tag        = data.oci_string.ref["admission"].pseudo_tag
        }
      }
      initContainer = {
        image = {
          registry   = data.oci_string.ref["init"].registry
          repository = data.oci_string.ref["init"].repo
          tag        = data.oci_string.ref["init"].pseudo_tag
        }
      }
    }
    backgroundController = {
      container = {
        image = {
          registry = data.oci_string.ref["background"].registry
          registry = data.oci_string.ref["background"].repo
          tag      = data.oci_string.ref["background"].pseudo_tag
        }
      }
    }
    cleanupController = {
      container = {
        image = {
          registry = data.oci_string.ref["cleanup"].registry
          registry = data.oci_string.ref["cleanup"].repo
          tag      = data.oci_string.ref["cleanup"].pseudo_tag
        }
      }
    }
    reportsController = {
      container = {
        image = {
          registry = data.oci_string.ref["reports"].registry
          registry = data.oci_string.ref["reports"].repo
          tag      = data.oci_string.ref["reports"].pseudo_tag
        }
      }
    }
  }
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Basic functionality of the kyverno helm chart."

  steps = [
    {
      name = "Helm install"
      cmd  = module.helm.install_cmd
    },
    {
      # TODO: These aren't exhaustive, but they seem to be pretty
      # representative outside the full upstream sweep.
      name = "helm test"
      cmd  = "helm test -n kyverno kyverno"
    },
  ]

  labels = {
    type = "k8s"
  }
}
