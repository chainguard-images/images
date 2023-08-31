terraform {
  required_providers {
    oci        = { source = "chainguard-dev/oci" }
    helm       = { source = "hashicorp/helm" }
    kubernetes = { source = "hashicorp/kubernetes" }
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

  wait = true
}

resource "kubernetes_manifest" "providers" {
  depends_on = [helm_release.crossplane]

  for_each = var.digests

  manifest = {
    apiVersion = "pkg.crossplane.io/v1"
    kind       = "Provider"
    metadata = {
      name = each.key == "aws" ? "provider-aws" : "provider-aws-${each.key}"
    }
    spec = {
      package = each.value
    }
  }

  wait {
    condition {
      type   = "Installed"
      status = "True"
    }
    /*
    condition {
      type   = "Healthy"
      status = "True"
    }
    */
  }

  timeouts {
    create = "1m"
    update = "1m"
  }
}
