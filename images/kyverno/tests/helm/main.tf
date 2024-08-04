// WARNING: This has the potential to be flaky for tests using this module. If
// the upstream helm chart introduces a breaking change we'll need to build and
// publish the kyverno images before dependent modules will be able to use the
// updated images and pass tests.
variable "values" {
  type = any
  default = {
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
  }
}

variable "chart_version" {
  type        = string
  description = "If set, override the chart version to install for older versions of kyverno to test version-streamed images."
  default     = ""
}

module "helm" {
  source = "../../../../tflib/imagetest/helm"

  name          = "kyverno"
  namespace     = "kyverno"
  repo          = "https://kyverno.github.io/kyverno"
  chart         = "kyverno"
  chart_version = length(var.chart_version) > 0 ? var.chart_version : ""

  values = var.values
}

output "install_cmd" {
  value = module.helm.install_cmd
}


