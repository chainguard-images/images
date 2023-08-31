terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    aws = string
    iam = string
    rds = string
    s3  = string
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
  digest = var.digests.aws // Unused but required by the data source

  env {
    name  = "AWS_DIGEST"
    value = var.digests.aws
  }
  env {
    name  = "IAM_DIGEST"
    value = var.digests.iam
  }
  env {
    name  = "RDS_DIGEST"
    value = var.digests.rds
  }
  env {
    name  = "S3_DIGEST"
    value = var.digests.s3
  }
}
