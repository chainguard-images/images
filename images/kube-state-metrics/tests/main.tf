terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digest" {
  description = "The image digests to run tests over."
  type        = string
}

data "oci_string" "ref" { input = var.digest }

resource "random_pet" "suffix" {}

resource "helm_release" "kube-state-metrics" {
  name = "kube-state-metrics-${random_pet.suffix.id}"

  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-state-metrics"

  namespace        = "kube-state-metrics-${random_pet.suffix.id}"
  create_namespace = true

  values = [
    jsonencode({
      image = {
        registry   = data.oci_string.ref.registry
        repository = data.oci_string.ref.repo
        tag        = data.oci_string.ref.pseudo_tag
      }
    }),
  ]
}

data "oci_exec_test" "check-kube-state-metrics" {
  digest      = var.digest
  script      = "./check-ksm.sh"
  working_dir = path.module
  depends_on  = [helm_release.kube-state-metrics]

  env {
    name  = "KSM_NAME"
    value = helm_release.kube-state-metrics.name
  }
}

module "helm_cleanup" {
  depends_on = [data.oci_exec_test.check-kube-state-metrics]
  source     = "../../../tflib/helm-cleanup"
  name       = helm_release.kube-state-metrics.id
  namespace  = helm_release.kube-state-metrics.namespace
}
