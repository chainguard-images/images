terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" {
  input = var.digest
}

resource "helm_release" "test" {
  name       = "prometheus-adapter"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "prometheus-adapter"

  values = [jsonencode({
    image = {
      repository = data.oci_string.ref.registry_repo
      tag        = data.oci_string.ref.pseudo_tag
    }
  })]
}

data "oci_exec_test" "cleanup" {
  digest     = var.digest
  script     = "${path.module}/cleanup.sh"
  depends_on = [helm_release.test]
}
