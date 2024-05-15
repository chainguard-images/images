terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

locals { parsed = provider::oci::parse(var.digest) }

resource "random_pet" "suffix" {}

resource "helm_release" "influxdb" {
  name = "influxdb-${random_pet.suffix.id}"

  repository = "https://helm.influxdata.com"
  chart      = "influxdb2"

  namespace        = "influxdb-${random_pet.suffix.id}"
  create_namespace = true


  values = [jsonencode({
    image = {
      tag        = local.parsed.pseudo_tag
      repository = local.parsed.registry_repo
    }
  })]
}

module "helm_cleanup" {
  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.influxdb.id
  namespace = helm_release.influxdb.namespace
}
