terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    controller = string
    adapter    = string
    webhooks   = string
  })
}

variable "skip_crds" {
  description = "Used to deconflict between multiple installations within the same cluster."
  default     = false
}

variable "chart-version" {
  description = "The version of the Helm chart to install."
  default     = "latest"
}

data "oci_string" "ref" {
  for_each = var.digests
  input    = each.value
}

resource "helm_release" "keda" {
  name             = "keda"
  namespace        = "keda"
  repository       = "https://kedacore.github.io/charts"
  chart            = "keda"
  create_namespace = true
  timeout          = 600

  version = var.chart-version == "latest" ? null : var.chart-version

  values = [
    <<EOF
image:
  keda:
    repository: "${data.oci_string.ref["controller"].registry_repo}"
    tag: "${data.oci_string.ref["controller"].pseudo_tag}"
  metricsApiServer:
    repository: "${data.oci_string.ref["adapter"].registry_repo}"
    tag: "${data.oci_string.ref["adapter"].pseudo_tag}"
  webhooks:
    repository: "${data.oci_string.ref["webhooks"].registry_repo}"
    tag: "${data.oci_string.ref["webhooks"].pseudo_tag}"
EOF
  ]
}

data "oci_exec_test" "smoke" {
  digest = var.digests.controller # This doesn't actually matter here, just pass it something valid

  # This script calls other files in the same relative directory
  working_dir = path.module
  script      = "./smoke-test.sh"

  depends_on = [helm_release.keda]
}

module "helm_cleanup" {
  depends_on = [data.oci_exec_test.smoke]
  source     = "../../../tflib/helm-cleanup"
  name       = helm_release.keda.id
  namespace  = helm_release.keda.namespace
}
