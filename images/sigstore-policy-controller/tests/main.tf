terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "digest" {
  input = var.digest
}

resource "random_pet" "suffix" {}

resource "helm_release" "policy-controller" {
  name       = "pc-${random_pet.suffix.id}"
  repository = "https://sigstore.github.io/helm-charts"
  chart      = "policy-controller"

  namespace        = "policy-controller"
  create_namespace = true

  set {
    name  = "webhook.image.repository"
    value = data.oci_string.digest.registry_repo
  }
  set {
    name  = "webhook.image.version"
    value = data.oci_string.digest.digest
  }
}

data "oci_exec_test" "upstream-cosigned-tests" {
  depends_on = [helm_release.policy-controller]

  digest      = var.digest
  script      = "./e2e_test.sh"
  working_dir = path.module

  env {
    name  = "TEST_NAMESPACE"
    value = "pc-test-${random_pet.suffix.id}"
  }
}

module "helm_cleanup" {
  depends_on = [data.oci_exec_test.upstream-cosigned-tests]
  source     = "../../../tflib/helm-cleanup"
  name       = helm_release.policy-controller.id
  namespace  = helm_release.policy-controller.namespace
}
