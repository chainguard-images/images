terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_exec_test" "manifest" {
  digest      = var.digest
  script      = "./EXAMPLE_TEST.sh"
  working_dir = path.module
}

resource "random_pet" "suffix" {}

resource "helm_release" "helm" {
  name             = "logstash-oss-with-opensearch-output-plugin-${random_pet.suffix.id}"
  namespace        = "logstash-oss-with-opensearch-output-plugin-${random_pet.suffix.id}"
  repository       = "" // TODO
  chart            = "" // TODO
  create_namespace = true

  values = [
    jsonencode({
      // TODO:
    })
  ]
}

module "helm_cleanup" {
  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.helm.id
  namespace = helm_release.helm.namespace
}
