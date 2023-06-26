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
    init                  = string
    controller            = string
    background-controller = string
    cleanup-controller    = string
    reports-controller    = string
  })
}

variable "skip_crds" {
  description = "Used to deconflict between multiple installations within the same cluster."
  default     = false
}

data "oci_string" "reference" {
  for_each = var.digests

  string = each.value
}

resource "helm_release" "kyverno" {
  name             = "kyverno"
  namespace        = "kyverno"
  repository       = "https://kyverno.github.io/kyverno"
  chart            = "kyverno"
  create_namespace = true

  values = [
    <<EOF
admissionController:
  initContainer:
    image:
      registry: "${data.oci_string.reference["init"].registry}"
      repository: "${data.oci_string.reference["init"].repo}"
      tag: "${data.oci_string.reference["init"].tag}"
  container:
    image:
      registry: "${data.oci_string.reference["controller"].registry}"
      repository: "${data.oci_string.reference["controller"].repo}"
      tag: "${data.oci_string.reference["controller"].tag}"
backgroundController:
  image:
    registry: "${data.oci_string.reference["background-controller"].registry}"
    repository: "${data.oci_string.reference["background-controller"].repo}"
    tag: "${data.oci_string.reference["background-controller"].tag}"
cleanupController:
  image:
    registry: "${data.oci_string.reference["cleanup-controller"].registry}"
    repository: "${data.oci_string.reference["cleanup-controller"].repo}"
    tag: "${data.oci_string.reference["cleanup-controller"].tag}"
reportsController:
  image:
    registry: "${data.oci_string.reference["reports-controller"].registry}"
    repository: "${data.oci_string.reference["reports-controller"].repo}"
    tag: "${data.oci_string.reference["reports-controller"].tag}"
EOF
  ]
}
