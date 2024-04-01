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

resource "random_pet" "suffix" {}

resource "helm_release" "postgres-operator" {
  name             = "postgres-operator-${random_pet.suffix.id}"
  namespace        = "postgres-operator"
  repository       = "https://opensource.zalando.com/postgres-operator/charts/postgres-operator"
  chart            = "postgres-operator"
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

data "oci_exec_test" "smoke" {
  digest      = var.digest
  script      = "./smoke-test.sh"
  working_dir = path.module
  depends_on  = [helm_release.postgres-operator]

  env = [
    {
      name  = "NAMESPACE"
      value = helm_release.postgres-operator.namespace
    },
    {
      name  = "NAME"
      value = helm_release.postgres-operator.name
    }
  ]
}

module "helm_cleanup" {
  source     = "../../../tflib/helm-cleanup"
  name       = helm_release.postgres-operator.id
  namespace  = helm_release.postgres-operator.namespace
  depends_on = [data.oci_exec_test.smoke]
}
