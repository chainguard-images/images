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

resource "helm_release" "k8sgpt-operator" {
  name = "k8sgpt-operator"

  repository       = "https://charts.k8sgpt.ai/"
  chart            = "k8sgpt-operator"
  create_namespace = true

  values = [jsonencode({
    manager = {
      image = {
        repository = local.parsed.registry_repo
        tag        = local.parsed.pseudo_tag
      }
    }
  })]
}

module "helm_cleanup" {
  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.k8sgpt-operator.id
  namespace = helm_release.k8sgpt-operator.namespace
}
