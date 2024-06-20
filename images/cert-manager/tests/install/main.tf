terraform {
  required_providers {
    imagetest = { source = "chainguard-dev/imagetest" }
    oci       = { source = "chainguard-dev/oci" }
  }
}

variable "values" {
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
  type = any
}

module "helm" {
  chart     = "cert-manager"
  namespace = "cert-manager"
  repo      = "https://charts.jetstack.io"
  source    = "../../../../tflib/imagetest/helm"
  values    = var.values
}

output "install_cmd" {
  value = module.helm.install_cmd
}

output "release_name" {
  value = module.helm.release_name
}

