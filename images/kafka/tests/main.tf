terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

locals { parsed = provider::oci::parse(var.digest) }

resource "random_pet" "suffix" {}

resource "helm_release" "bitnami" {
  name             = "kafka-bitnami-${random_pet.suffix.id}"
  repository       = "oci://registry-1.docker.io/bitnamicharts"
  chart            = "kafka"
  namespace        = "kafka-bitnami-${random_pet.suffix.id}"
  create_namespace = true

  values = [jsonencode({
    image = {
      registry   = local.parsed.registry
      repository = local.parsed.repo
      digest     = local.parsed.digest
    }
    controller = {
      containerSecurityContext = {
        runAsUser = 65532
      }
      podSecurityContext = {
        fsGroup = 65532
      }
      logPersistence = {
        mountPath = "/usr/lib/kafka/logs"
      }
    }
  })]
}

module "helm-cleanup" {
  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.bitnami.id
  namespace = helm_release.bitnami.namespace
}
