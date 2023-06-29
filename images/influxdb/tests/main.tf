terraform {
  required_providers {
    oci    = { source = "chainguard-dev/oci" }
    random = { source = "hashicorp/random" }
    helm   = { source = "hashicorp/helm" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" { input = var.digest }

resource "random_pet" "suffix" {}

resource "helm_release" "influxdb" {
  name = "influxdb-${random_pet.suffix.id}"

  repository = "https://helm.influxdata.com"
  chart      = "influxdb2"

  namespace        = "influxdb-${random_pet.suffix.id}"
  create_namespace = true


  values = [jsonencode({
    image = {
      tag        = data.oci_string.ref.pseudo_tag
      repository = data.oci_string.ref.registry_repo
    }
  })]
}
