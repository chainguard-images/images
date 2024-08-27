terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "values" {
  type = any
  default = {
    name             = "operator"
    namespace        = "istio-system"
    create_namespace = true

    image = {
      repository = "cgr.dev/chainguard/istio-operator"
      tag        = "latest"
    }
  }
}

module "helm" {
  source = "../../../../../tflib/imagetest/helm"

  namespace = var.values.namespace

  chart         = "istio-operator"
  repo          = "https://stevehipwell.github.io/helm-charts/"
  chart_version = "2.14.1"

  values = var.values
}

output "install_cmd" {
  value = module.helm.install_cmd
}

output "release_name" {
  value = module.helm.release_name
}
