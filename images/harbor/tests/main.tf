terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    core        = string
    jobservice  = string
    portal      = string
    registry    = string
    registryctl = string
  })
}

data "oci_string" "ref" {
  for_each = var.digests
  input    = each.value
}

data "oci_exec_test" "docker-compose" {
  digest = var.digests["core"]
  script = "${path.module}/docker-compose.sh"
  env {
    name  = "CORE_IMAGE"
    value = data.oci_string.ref["core"].registry_repo
  }
  env {
    name  = "CORE_TAG"
    value = data.oci_string.ref["core"].pseudo_tag
  }
  env {
    name  = "JOBSERVICE_IMAGE"
    value = data.oci_string.ref["jobservice"].registry_repo
  }
  env {
    name  = "JOBSERVICE_TAG"
    value = data.oci_string.ref["jobservice"].pseudo_tag
  }
  env {
    name  = "PORTAL_IMAGE"
    value = data.oci_string.ref["portal"].registry_repo
  }
  env {
    name  = "PORTAL_TAG"
    value = data.oci_string.ref["portal"].pseudo_tag
  }
  env {
    name  = "REGISTRY_IMAGE"
    value = data.oci_string.ref["registry"].registry_repo
  }
  env {
    name  = "REGISTRY_TAG"
    value = data.oci_string.ref["registry"].pseudo_tag
  }
  env {
    name  = "REGISTRYCTL_IMAGE"
    value = data.oci_string.ref["registryctl"].registry_repo
  }
  env {
    name  = "REGISTRYCTL_TAG"
    value = data.oci_string.ref["registryctl"].pseudo_tag
  }
}

resource "random_pet" "suffix" {}

resource "helm_release" "harbor" {
  name             = "harbor-${random_pet.suffix.id}"
  namespace        = "harbor-helm-${random_pet.suffix.id}"
  repository       = "https://helm.goharbor.io"
  chart            = "harbor"
  create_namespace = true

  values = [jsonencode({
    core = {
      image = {
        repository = data.oci_string.ref["core"].registry_repo
        tag        = data.oci_string.ref["core"].pseudo_tag
      }
    }
    jobservice = {
      image = {
        repository = data.oci_string.ref["jobservice"].registry_repo
        tag        = data.oci_string.ref["jobservice"].pseudo_tag
      }
    }
    portal = {
      image = {
        repository = data.oci_string.ref["portal"].registry_repo
        tag        = data.oci_string.ref["portal"].pseudo_tag
      }
    }
    registry = {
      registry = {
        image = {
          repository = data.oci_string.ref["registry"].registry_repo
          tag        = data.oci_string.ref["registry"].pseudo_tag
        }
      }
      registryctl = {
        image = {
          repository = data.oci_string.ref["registryctl"].registry_repo
          tag        = data.oci_string.ref["registryctl"].pseudo_tag
        }
      }
    }
  })]
}

module "helm-cleanup" {
  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.harbor.id
  namespace = helm_release.harbor.namespace
}
