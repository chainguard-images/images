terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "values" {
  type = any
  default = {
    installCRDs = true
    image = {
      repository = "cgr.dev/chainguard/cert-manager-controller"
      tag        = "latest"
    }
    acmesolver = {
      image = {
        repository = "cgr.dev/chainguard/cert-manager-acmesolver"
        tag        = "latest"
      }
    }
    cainjector = {
      image = {
        repository = "cgr.dev/chainguard/cert-manager-cainjector"
        tag        = "latest"
      }
    }
    webhook = {
      image = {
        repository = "cgr.dev/chainguard/cert-manager-webhook"
        tag        = "latest"
      }
    }
  }
}

module "helm" {
  source = "../../../../tflib/imagetest/helm"

  namespace = "cert-manager"
  chart     = "cert-manager"
  repo      = "https://charts.jetstack.io"

  values = var.values
}

output "install_cmd" {
  value = module.helm.install_cmd
}

output "release_name" {
  value = module.helm.release_name
}
