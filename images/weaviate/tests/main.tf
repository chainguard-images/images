terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" { input = var.digest }

data "oci_exec_test" "help" {
  digest = var.digest
  script = "${path.module}/01-help.sh"
}

resource "helm_release" "weaviate" {
  name = "weaviate"

  repository = "https://weaviate.github.io/weaviate-helm"
  chart      = "weaviate"

  namespace        = "weaviate"
  create_namespace = true

  # Split the digest ref into repository and digest. The helm chart expects a
  # tag, but it just appends it to the repository again, so we just specify a
  # dummy tag and the digest to test.
  set {
    name  = "image.registry"
    value = data.oci_string.ref.registry
  }
  set {
    name  = "image.repo"
    value = data.oci_string.ref.repo
  }
  set {
    name  = "image.tag"
    value = data.oci_string.ref.pseudo_tag
  }
}

module "helm_cleanup" {
  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.weaviate.id
  namespace = helm_release.weaviate.namespace
}
