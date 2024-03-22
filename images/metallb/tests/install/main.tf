terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "values" {
  type = any
  default = {
    controller = {
      image = {
        repository = "cgr.dev/chainguard/metallb-controller"
        tag        = "latest"
      }
    }
    speaker = {
      image = {
        repository = "cgr.dev/chainguard/metallb-speaker"
        tag        = "latest"
      }
      frr = {
        enabled = false
      }
    }
  }
}

module "helm" {
  source = "../../../../tflib/imagetest/helm"

  namespace = "metallb"
  chart     = "metallb"
  repo      = "https://metallb.github.io/metallb"

  values = var.values
}

output "install_cmd" {
  value = module.helm.install_cmd
}

output "release_name" {
  value = module.helm.release_name
}
