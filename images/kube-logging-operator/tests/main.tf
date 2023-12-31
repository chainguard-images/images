terraform {
  required_providers {
    oci    = { source = "chainguard-dev/oci" }
    helm   = { source = "hashicorp/helm" }
    random = { source = "hashicorp/random" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" { input = var.digest }

resource "random_id" "id" { byte_length = 4 }

resource "helm_release" "kube-logging-operator" {
  name             = "kube-logging-${random_id.id.hex}"
  namespace        = "kube-logging-${random_id.id.hex}"
  repository       = "https://kube-logging.dev/helm-charts"
  chart            = "logging-operator"
  create_namespace = true

  values = [
    <<EOF
image:
  repository: "${data.oci_string.ref.registry_repo}"
  tag: "${data.oci_string.ref.pseudo_tag}"
EOF
  ]
}

data "oci_exec_test" "smoke" {
  digest = var.digest # This doesn't actually matter here, just pass it something valid

  # This script calls other files in the same relative directory
  working_dir = path.module
  script      = "./smoke-test.sh"

  env = [{
    name  = "NS"
    value = helm_release.kube-logging-operator.namespace
  }]

  depends_on = [helm_release.kube-logging-operator]
}

module "helm_cleanup" {
  depends_on = [data.oci_exec_test.smoke]
  source     = "../../../tflib/helm-cleanup"
  name       = helm_release.kube-logging-operator.id
  namespace  = helm_release.kube-logging-operator.namespace
}
