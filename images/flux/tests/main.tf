terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "target_repository" {}

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

data "imagetest_inventory" "this" {}

module "cluster_harness" {
  source = "../../../tflib/imagetest/harnesses/k3s/"

  inventory         = data.imagetest_inventory.this
  name              = basename(path.module)
  target_repository = var.target_repository
  cwd               = path.module
}

module "helm" {
  source = "../../../tflib/imagetest/helm"

  name      = "flux"
  namespace = "flux-system"
  repo      = "https://fluxcd-community.github.io/helm-charts"
  chart     = "flux2"

  values = {
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
  }
}

resource "imagetest_feature" "basic" {
  name        = "basic"
  description = "Basic installation test for flux"
  harness     = module.cluster_harness.harness

  steps = [
    {
      name = "Install flux"
      cmd  = module.helm.install_cmd
    },
    {
      name = "Run tests"
      cmd  = "$WORK/tests.sh"
    },
  ]

  labels = {
    type = "k8s"
  }
}
