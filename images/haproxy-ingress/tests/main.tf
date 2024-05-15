terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

locals { parsed = provider::oci::parse(var.digest) }

resource "helm_release" "haproxy-ingress" {
  name = "haproxy-ingress"

  repository = "https://haproxy-ingress.github.io/charts"
  chart      = "haproxy-ingress"

  namespace        = "haproxy-ingress"
  create_namespace = true

  values = [jsonencode({
    controller = {
      image = {
        repository = local.parsed.registry_repo
        tag        = local.parsed.pseudo_tag
      }
    }
  })]
}

module "helm_cleanup" {
  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.haproxy-ingress.id
  namespace = helm_release.haproxy-ingress.namespace
}
