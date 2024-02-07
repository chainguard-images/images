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

module "helm" {
  source = "../../../../tflib/imagetest/helm"

  name      = "kyverno"
  namespace = "kyverno"
  repo      = "https://kyverno.github.io/kyverno"
  chart     = "kyverno"

  values = var.values
}

output "install_cmd" {
  value = module.helm.install_cmd
}


