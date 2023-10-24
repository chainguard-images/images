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

data "oci_exec_test" "help" {
  digest = var.digest
  script = "${path.module}/container-test.sh"
}

resource "random_pet" "suffix" {}

resource "helm_release" "trino" {
  repository       = "https://trinodb.github.io/charts/"
  name             = "trino-${random_pet.suffix.id}"
  chart            = "trino"
  namespace        = "trino-${random_pet.suffix.id}"
  create_namespace = true
  timeout          = 900

  values = [jsonencode({
    image = {
      repository = data.oci_string.ref.registry_repo
      tag        = data.oci_string.ref.pseudo_tag
    }
    server = {
      workers = 1
    }
  })]
}

module "helm_cleanup" {
  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.trino.id
  namespace = helm_release.trino.namespace
}
