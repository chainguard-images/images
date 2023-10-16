terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" { input = var.digest }

resource "helm_release" "metacontroller" {
  name       = "metacontroller"
  repository = "oci://ghcr.io/metacontroller"
  chart      = "metacontroller-helm"
  version    = "v4.10.3"

  values = [jsonencode({
    image = {
      repository = data.oci_string.ref.registry_repo
      tag        = data.oci_string.ref.pseudo_tag
    }
  })]
}

data "oci_exec_test" "helm" {
  depends_on  = [helm_release.metacontroller]
  digest      = var.digest
  script      = "./helm.sh"
  working_dir = path.module
}

module "helm_cleanup" {
  depends_on = [data.oci_exec_test.helm]
  source     = "../../../tflib/helm-cleanup"
  name       = helm_release.metacontroller.id
  namespace  = helm_release.metacontroller.namespace
}
