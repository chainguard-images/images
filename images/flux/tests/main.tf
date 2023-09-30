terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    cli                         = string
    helm-controller             = string
    kustomize-controller        = string
    notification-controller     = string
    source-controller           = string
    image-automation-controller = string
    image-reflector-controller  = string
  })
}

data "oci_string" "ref" {
  for_each = var.digests
  input    = each.value
}

resource "helm_release" "flux" {
  name             = "flux"
  namespace        = "flux-system"
  repository       = "https://fluxcd-community.github.io/helm-charts"
  chart            = "flux2"
  create_namespace = true

  values = [
    jsonencode({
      cli = {
        image = data.oci_string.ref["cli"].registry_repo
        tag   = data.oci_string.ref["cli"].pseudo_tag
      }
      helmController = {
        image = data.oci_string.ref["helm-controller"].registry_repo
        tag   = data.oci_string.ref["helm-controller"].pseudo_tag
      }
      kustomizeController = {
        image = data.oci_string.ref["kustomize-controller"].registry_repo
        tag   = data.oci_string.ref["kustomize-controller"].pseudo_tag
      }
      notificationController = {
        image = data.oci_string.ref["notification-controller"].registry_repo
        tag   = data.oci_string.ref["notification-controller"].pseudo_tag
      }
      sourceController = {
        image = data.oci_string.ref["source-controller"].registry_repo
        tag   = data.oci_string.ref["source-controller"].pseudo_tag
      }
      imageAutomationController = {
        image = data.oci_string.ref["image-automation-controller"].registry_repo
        tag   = data.oci_string.ref["image-automation-controller"].pseudo_tag
      }
      imageReflectorController = {
        image = data.oci_string.ref["image-reflector-controller"].registry_repo
        tag   = data.oci_string.ref["image-reflector-controller"].pseudo_tag
      }
    })
  ]
}

module "helm_cleanup" {
  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.flux.id
  namespace = helm_release.flux.namespace
}
