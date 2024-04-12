terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "values" {
  type = any
  default = {
    name             = "istio-system-base"
    namespace        = "istio-system"
    create_namespace = true

    global = {
      istioNamespace = "istio-system"
    }
    defaultRevision = ""
  }
}

module "helm" {
  source = "../../../../tflib/imagetest/helm"

  namespace = var.values.namespace

  chart = "base"
  repo  = "https://istio-release.storage.googleapis.com/charts/"

  values = var.values
}

output "install_cmd" {
  value = module.helm.install_cmd
}

output "release_name" {
  value = module.helm.release_name
}
