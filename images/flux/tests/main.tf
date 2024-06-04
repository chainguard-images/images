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

locals { parsed = { for k, v in var.digests : k => provider::oci::parse(v) } }

resource "helm_release" "flux" {
  name             = "flux"
  namespace        = "flux-system"
  repository       = "https://fluxcd-community.github.io/helm-charts"
  chart            = "flux2"
  create_namespace = true

  values = [
    jsonencode({
      cli = {
        image = local.parsed["cli"].registry_repo
        tag   = local.parsed["cli"].pseudo_tag
      }
      helmController = {
        image = local.parsed["helm-controller"].registry_repo
        tag   = local.parsed["helm-controller"].pseudo_tag
      }
      kustomizeController = {
        image = local.parsed["kustomize-controller"].registry_repo
        tag   = local.parsed["kustomize-controller"].pseudo_tag
      }
      notificationController = {
        image = local.parsed["notification-controller"].registry_repo
        tag   = local.parsed["notification-controller"].pseudo_tag
      }
      sourceController = {
        image = local.parsed["source-controller"].registry_repo
        tag   = local.parsed["source-controller"].pseudo_tag
      }
      imageAutomationController = {
        image = local.parsed["image-automation-controller"].registry_repo
        tag   = local.parsed["image-automation-controller"].pseudo_tag
      }
      imageReflectorController = {
        image = local.parsed["image-reflector-controller"].registry_repo
        tag   = local.parsed["image-reflector-controller"].pseudo_tag
      }
    })
  ]
}

module "helm_cleanup" {
  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.flux.id
  namespace = helm_release.flux.namespace
}
