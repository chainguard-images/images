terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" { input = var.digest }

data "oci_exec_test" "run" {
  digest      = var.digest
  script      = "./run.sh"
  working_dir = path.module
}

resource "helm_release" "haproxy-ingress" {
  name = "haproxy-ingress"

  repository = "https://haproxy-ingress.github.io/charts"
  chart      = "haproxy-ingress"

  namespace        = "haproxy-ingress"
  create_namespace = true

  values = [jsonencode({
    controller = {
      image = {
        repository = data.oci_string.ref.registry_repo
        tag        = data.oci_string.ref.digest
      }
    }
  })]
}
