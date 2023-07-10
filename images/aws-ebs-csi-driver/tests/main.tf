terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" { input = var.digest }

resource "helm_release" "aws-ebs-csi-driver" {
  name = "aws-ebs-csi-driver"

  repository = "https://charts.deliveryhero.io"
  chart      = "aws-ebs-csi-driver"

  values = [
    jsonencode({
      image = {
        repository = data.oci_string.ref.registry_repo
        tag        = data.oci_string.ref.pseudo_tag
      }
    }),
  ]
}
