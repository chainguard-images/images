terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    family          = string
    authorization   = string
    managedidentity = string
    sql             = string
    storage         = string
  })
}

resource "helm_release" "crossplane" {
  name             = "crossplane"
  repository       = "https://charts.crossplane.io/stable"
  chart            = "crossplane"
  namespace        = "crossplane-system"
  create_namespace = true

  values = [jsonencode({
    // Our images have package config in one big layer, which might cause the
    // Crossplane control plane to have difficulty.
    resourcesCrossplane = {
      limits = {
        cpu    = "1"
        memory = "1Gi"
      }
      requests = {
        cpu    = "1"
        memory = "1Gi"
      }
    }
  })]
}

data "oci_exec_test" "install" {
  depends_on = [helm_release.crossplane]

  script = "${path.module}/install.sh"
  digest = var.digests.family // Unused but required by the data source

  env {
    name  = "AZURE_DIGEST"
    value = var.digests.family
  }
  env {
    name  = "AUTHORIZATION_DIGEST"
    value = var.digests.authorization
  }
  env {
    name  = "MANAGEDIDENTITY_DIGEST"
    value = var.digests.managedidentity
  }
  env {
    name  = "SQL_DIGEST"
    value = var.digests.sql
  }
  env {
    name  = "STORAGE_DIGEST"
    value = var.digests.storage
  }
}

module "helm_cleanup" {
  depends_on = [data.oci_exec_test.install]
  source     = "../../../tflib/helm-cleanup"
  name       = helm_release.crossplane.id
  namespace  = helm_release.crossplane.namespace
}
