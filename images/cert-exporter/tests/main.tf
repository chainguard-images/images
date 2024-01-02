terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

# The package does not expose a --version endpoint, but does expose --help.
data "oci_exec_test" "test_help_cmd" {
  digest = var.digest
  script = "docker run --rm $IMAGE_NAME --help"
}

data "oci_string" "ref" {
  input = var.digest
}

resource "random_pet" "suffix" {}

resource "helm_release" "test_helm_deploy" {
  name             = "cert-exporter-${random_pet.suffix.id}"
  repository       = "https://joe-elliott.github.io/cert-exporter"
  chart            = "cert-exporter"
  namespace        = "cert-exporter-${random_pet.suffix.id}"
  create_namespace = true

  values = [jsonencode({
    image = {
      repository = data.oci_string.ref.registry_repo
      tag        = data.oci_string.ref.pseudo_tag
    }
  })]
}

data "oci_exec_test" "test_validate_logs" {
  depends_on  = [helm_release.test_helm_deploy]
  digest      = var.digest
  working_dir = path.module
  script      = "./test-pod-logs.sh"

  env {
    name  = "K8S_NAME"
    value = "${helm_release.test_helm_deploy.id}-cert-manager"
  }
  env {
    name  = "K8S_NAMESPACE"
    value = helm_release.test_helm_deploy.namespace
  }

}

module "helm_cleanup" {
  depends_on = [data.oci_exec_test.test_validate_logs]
  source     = "../../../tflib/helm-cleanup"
  name       = helm_release.test_helm_deploy.id
  namespace  = helm_release.test_helm_deploy.namespace
}
