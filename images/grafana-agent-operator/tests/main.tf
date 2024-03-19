terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" { input = var.digest }

data "oci_exec_test" "manifest" {
  digest      = var.digest
  script      = "./verify_deployment.sh"
  working_dir = path.module
}


resource "random_pet" "suffix" {}

resource "helm_release" "operator" {
  name             = "grafana-agent-operator-${random_pet.suffix.id}"
  namespace        = "grafana-agent-operator-${random_pet.suffix.id}"
  repository       = "https://grafana.github.io/helm-charts"
  chart            = "grafana-agent-operator"
  create_namespace = true

  values = [
    jsonencode({
      image = {
        registry   = data.oci_string.ref.registry
        repository = data.oci_string.ref.repo
        tag        = data.oci_string.ref.pseudo_tag
      }
    })
  ]
}

module "helm_cleanup" {
  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.operator.id
  namespace = helm_release.operator.namespace
}
