terraform {
  required_providers {
    oci    = { source = "chainguard-dev/oci" }
    helm   = { source = "hashicorp/helm" }
    random = { source = "hashicorp/random" }
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

data "oci_string" "ref" {
  for_each = var.digests
  input    = each.value
}

resource "random_pet" "suffix" {}

resource "helm_release" "keda" {
  name             = "keda-${random_pet.suffix.id}"
  namespace        = "keda"
  repository       = "https://kedacore.github.io/charts"
  chart            = "keda"
  create_namespace = true
  timeout          = 120

  values = [
    <<EOF
image:
  keda:
    repository: "${data.oci_string.ref["controller"].registry_repo}"
    tag: "${data.oci_string.ref["controller"].pseudo_tag}"
    # The same pullPolicy is used for multiple images, so we have to allow the others to get pulled.
    pullPolicy: IfNotPresent
  metricsApiServer:
    repository: "${data.oci_string.ref["adapter"].registry_repo}"
    tag: "${data.oci_string.ref["adapter"].pseudo_tag}"
    pullPolicy: IfNotPresent
  webhooks:
    repository: "${data.oci_string.ref["webhooks"].registry_repo}"
    tag: "${data.oci_string.ref["webhooks"].pseudo_tag}"
    pullPolicy: IfNotPresent
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
