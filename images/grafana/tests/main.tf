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

resource "random_id" "hex" { byte_length = 4 }

resource "helm_release" "helm_test" {
  name             = "grafana-${random_id.hex.hex}"
  namespace        = "grafana-${random_id.hex.hex}"
  chart            = "grafana"
  repository       = "https://grafana.github.io/helm-charts"
  create_namespace = true
  timeout          = 600

  values = [jsonencode({
    image = {
      registry   = data.oci_string.ref.registry
      repository = data.oci_string.ref.repo
      tag        = data.oci_string.ref.pseudo_tag
    }
  })]
}

data "oci_exec_test" "smoke" {
  digest = var.digest # This doesn't actually matter here, just pass it something valid

  # This script calls other files in the same relative directory
  working_dir = path.module
  script      = "./smoke-test.sh"

  env {
    name  = "K8S_NAME"
    value = helm_release.helm_test.id
  }
  env {
    name  = "K8S_NAMESPACE"
    value = helm_release.helm_test.namespace
  }

  depends_on = [helm_release.helm_test]
}

module "helm_cleanup" {
  depends_on = [data.oci_exec_test.smoke]
  source     = "../../../tflib/helm-cleanup"
  name       = helm_release.helm_test.id
  namespace  = helm_release.helm_test.namespace
}
