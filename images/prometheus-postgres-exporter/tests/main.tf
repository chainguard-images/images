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
  name             = "peb-${random_pet.suffix.id}"
  repository       = "oci://registry-1.docker.io/bitnamicharts"
  chart            = "postgresql"
  namespace        = "peb-${random_pet.suffix.id}"
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

data "oci_exec_test" "check-prometheus-postgres-exporter" {
  digest      = var.digest
  script      = "./check-ppe.sh"
  working_dir = path.module
  depends_on  = [helm_release.bitnami]

  env {
    name  = "PPE_NAME"
    value = helm_release.bitnami.name
  }
}

module "helm-cleanup" {
  depends_on = [data.oci_exec_test.check-prometheus-postgres-exporter]
  source     = "../../../tflib/helm-cleanup"
  name       = helm_release.bitnami.id
  namespace  = helm_release.bitnami.namespace
}
