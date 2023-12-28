terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

variable "helm_chart_tag" {
  description = "Whether to pull a specific version of the helm chart for testing."
  default     = ""
}

data "oci_string" "ref" { input = var.digest }

resource "random_id" "hex" { byte_length = 4 }

resource "helm_release" "vector" {
  name             = "vector-${random_id.hex.hex}"
  repository       = "https://helm.vector.dev"
  chart            = "vector"
  create_namespace = true
  namespace        = "vector-${random_id.hex.hex}"
  timeout          = 120

  values = [jsonencode({
    localpv = {
      image = {
        registry   = join("", [data.oci_string.ref.registry, "/"])
        repository = data.oci_string.ref.repo
        tag        = var.helm_chart_tag != "" ? var.helm_chart_tag : data.oci_string.ref.pseudo_tag
      }
    }
  })]
}

module "helm_cleanup" {
  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.vector.id
  namespace = helm_release.vector.namespace
}
