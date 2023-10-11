terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_exec_test" "docker-compose" {
  digest      = var.digest
  script      = "./docker-compose.sh"
  working_dir = path.module
}

data "oci_string" "ref" { input = var.digest }

resource "random_pet" "suffix" {}

resource "helm_release" "bitnami" {
  name             = "kafka-bitnami-${random_pet.suffix.id}"
  repository       = "oci://registry-1.docker.io/bitnamicharts"
  chart            = "kafka"
  namespace        = "kafka-bitnami-${random_pet.suffix.id}"
  create_namespace = true

  values = [jsonencode({
    image = {
      registry   = data.oci_string.ref.registry
      repository = data.oci_string.ref.repo
      digest     = data.oci_string.ref.digest
      debug      = true
    }
  })]

  # ref https://github.com/bitnami/containers/issues/33796#issuecomment-1568061626
  set {
    name  = "extraEnvVars[0].name"
    value = "ALLOW_PLAINTEXT_LISTENER"
  }

  set {
    name  = "extraEnvVars[0].value"
    value = "yes"
  }
}

module "helm-cleanup" {
  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.bitnami.id
  namespace = helm_release.bitnami.namespace
}
