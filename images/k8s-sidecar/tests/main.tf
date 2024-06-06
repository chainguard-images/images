terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_exec_test" "runs" {
  digest = var.digest
  script = "${path.module}/01-runs.sh"
}

locals { parsed = provider::oci::parse(var.digest) }

resource "random_pet" "suffix" {}

resource "helm_release" "k8s-sidecar" {
  name             = "prometheus-${random_pet.suffix.id}"
  namespace        = "prometheus-${random_pet.suffix.id}"
  repository       = "https://prometheus-community.github.io/helm-charts"
  chart            = "kube-prometheus-stack"
  create_namespace = true
  timeout          = 600

  set {
    name  = "grafana.sidecar.image.registry"
    value = local.parsed.registry
  }
  set {
    name  = "grafana.sidecar.image.repository"
    value = local.parsed.repo
  }
  set {
    name  = "grafana.sidecar.image.tag"
    value = local.parsed.pseudo_tag
  }
}

data "oci_exec_test" "smoke" {
  digest      = var.digest
  script      = "./02-smoke.sh"
  working_dir = path.module
  depends_on  = [helm_release.k8s-sidecar]

  env {
    name  = "NAME"
    value = "prometheus-${random_pet.suffix.id}"
  }
  env {
    name  = "NAMESPACE"
    value = "prometheus-${random_pet.suffix.id}"
  }
}

module "helm_cleanup" {
  depends_on = [data.oci_exec_test.smoke]
  source     = "../../../tflib/helm-cleanup"
  name       = helm_release.k8s-sidecar.id
  namespace  = helm_release.k8s-sidecar.namespace
}
