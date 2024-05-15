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

locals { parsed = provider::oci::parse(var.digest) }

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
  repository: "${local.parsed.registry_repo}"
  tag: "${local.parsed.pseudo_tag}"
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
