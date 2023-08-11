terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_exec_test" "help" {
  digest = var.digest
  script = "docker run --rm $IMAGE_NAME -h"
}

data "oci_string" "ref" { input = var.digest }

resource "helm_release" "trino" {
  name = "trino"

  repository       = "https://trinodb.github.io/charts/"
  chart            = "trino"
  create_namespace = true

  values = [jsonencode({
    manager = {
      image = {
        repository = data.oci_string.ref.registry_repo
        tag        = data.oci_string.ref.pseudo_tag
      }
    }
  })]
}
