terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_exec_test" "version" {
  digest = var.digest
  script = "docker run --rm $IMAGE_NAME --version"
}

data "oci_string" "ref" { input = var.digest }

resource "random_pet" "suffix" {}

resource "helm_release" "bitnami" {
  name             = "postgres-exporter-bitnami-${random_pet.suffix.id}"
  repository       = "oci://registry-1.docker.io/bitnamicharts"
  chart            = "postgresql"
  namespace        = "postgres-exporter-bitnami-${random_pet.suffix.id}"
  create_namespace = true

  values = [jsonencode({
    auth = {
      postgresPassword = "${random_pet.suffix.id}"
      username         = "${random_pet.suffix.id}"
      password         = "${random_pet.suffix.id}"
      database         = "${random_pet.suffix.id}"
    }
    metrics = {
      enabled = true
      image = {
        registry   = data.oci_string.ref.registry
        repository = data.oci_string.ref.repo
        tag        = data.oci_string.ref.pseudo_tag
      }
    }
  })]
}

module "helm-cleanup" {
  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.bitnami.id
  namespace = helm_release.bitnami.namespace
}
