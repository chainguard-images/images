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

data "oci_exec_test" "run" {
  digest      = var.digest
  script      = "./run.sh"
  working_dir = path.module
}

resource "helm_release" "haproxy-ingress" {
  name = "haproxy-ingress"

  repository = "https://haproxy-ingress.github.io/charts"
  chart      = "haproxy-ingress"

  namespace        = "haproxy-ingress"
  create_namespace = true

  # Split the digest ref into repository and digest. The helm chart expects a
  # tag, but it just appends it to the repository again, so we just specify a
  # dummy tag and the digest to test.
  set {
    name  = "controller.image.repository"
    value = data.oci_string.ref.registry_repo
  }
  set {
    name  = "controller.image.tag"
    value = data.oci_string.ref.pseudo_tag
  }
}
