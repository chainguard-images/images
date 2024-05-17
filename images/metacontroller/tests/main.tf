terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

locals { parsed = provider::oci::parse(var.digest) }

resource "helm_release" "metacontroller" {
  name       = "metacontroller"
  repository = "oci://ghcr.io/metacontroller"
  chart      = "metacontroller-helm"
  version    = "v4.10.3"

  values = [jsonencode({
    image = {
      repository = local.parsed.registry_repo
      tag        = local.parsed.pseudo_tag
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
