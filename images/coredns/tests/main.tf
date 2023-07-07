terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" {
  input = var.digest
}

data "oci_exec_test" "nslookup" {
  digest = var.digest
  script = "${path.module}/nslookup-with-Corefile.sh"
}

resource "helm_release" "coredns" {
  name = "coredns"

  repository = "https://coredns.github.io/helm"
  chart      = "coredns"

  namespace        = "coredns"
  create_namespace = true

  values = [
    jsonencode({
      image = {
        repository = data.oci_string.ref.registry_repo
        tag        = data.oci_string.ref.pseudo_tag
      }
    })
  ]
}
