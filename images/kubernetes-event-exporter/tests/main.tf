terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" { input = var.digest }

resource "random_pet" "suffix" {}

resource "helm_release" "kubernetes-event-exporter" {
  name             = "kubernetes-event-exporter-${random_pet.suffix.id}"
  namespace        = "k8s-event-exporter"
  create_namespace = true
  repository       = "oci://registry-1.docker.io/bitnamicharts"
  chart            = "kubernetes-event-exporter"

  values = [jsonencode({
    containerName = "kubernetes-event-exporter"
    image = {
      registry   = data.oci_string.ref.registry
      repository = data.oci_string.ref.repo
      digest     = data.oci_string.ref.digest
    }
  })]
}

module "helm_cleanup" {
  source     = "../../../tflib/helm-cleanup"
  name       = helm_release.kubernetes-event-exporter.id
  namespace  = helm_release.kubernetes-event-exporter.namespace
  depends_on = [data.oci_exec_test.log-review-test]
}

data "oci_exec_test" "log-review-test" {
  digest = var.digest
  script = "${path.module}/logs.sh"

  env = [
    {
      name  = "RELEASE_NAME"
      value = helm_release.kubernetes-event-exporter.name
    },
    {
      name  = "RELEASE_NAMESPACE"
      value = helm_release.kubernetes-event-exporter.namespace
    }
  ]
}

