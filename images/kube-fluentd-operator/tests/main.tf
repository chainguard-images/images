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

resource "helm_release" "kfo" {
  name             = "kfo"
  namespace        = "kfo"
  chart            = "https://github.com/vmware/kube-fluentd-operator/releases/download/v1.17.4/log-router-0.4.0.tgz" # not sure how we can get the correct version of the chart rather than hardcoding a version below
  create_namespace = true
  timeout          = 120

  values = [
    <<EOF
rbac:
  create: true
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

  depends_on = [helm_release.kfo]
}

module "helm_cleanup" {
  depends_on = [data.oci_exec_test.smoke]
  source     = "../../../tflib/helm-cleanup"
  name       = helm_release.kfo.id
  namespace  = helm_release.kfo.namespace
}
