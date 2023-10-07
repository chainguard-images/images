terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    family         = string
    cloudfront     = string
    cloudwatchlogs = string
    dynamodb       = string
    ec2            = string
    eks            = string
    firehose       = string
    iam            = string
    kms            = string
    lambda         = string
    rds            = string
    s3             = string
    sns            = string
    sqs            = string
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

  // We are waiting for a lot of stuff to become ready!
  timeout_seconds = 600

  dynamic "env" {
    for_each = var.digests
    content {
      name  = env.key == "family" ? "AWS_DIGEST" : "${upper(env.key)}_DIGEST"
      value = env.value
    }
  }
}

module "helm_cleanup" {
  depends_on = [data.oci_exec_test.install]
  source     = "../../../tflib/helm-cleanup"
  name       = helm_release.crossplane.id
  namespace  = helm_release.crossplane.namespace
}
