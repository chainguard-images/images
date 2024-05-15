terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

locals { parsed = provider::oci::parse(var.digest) }

data "oci_exec_test" "run" {
  digest = var.digest
  script = "docker run --rm $IMAGE_NAME --version"
}

resource "helm_release" "metrics-server" {
  name = "metrics-server"

  repository = "https://kubernetes-sigs.github.io/metrics-server"
  chart      = "metrics-server"

  namespace        = "metrics-server"
  create_namespace = true

  values = [jsonencode({
    image = {
      tag        = local.parsed.pseudo_tag
      repository = local.parsed.registry_repo
    }
    args = ["--kubelet-insecure-tls"]
  })]
}

data "oci_exec_test" "check-metrics-server" {
  digest      = var.digest
  script      = "./check-metrics-server.sh"
  working_dir = path.module
  depends_on  = [helm_release.metrics-server]
}

module "helm_cleanup" {
  depends_on = [data.oci_exec_test.check-metrics-server]
  source     = "../../../tflib/helm-cleanup"
  name       = helm_release.metrics-server.id
  namespace  = helm_release.metrics-server.namespace
}
