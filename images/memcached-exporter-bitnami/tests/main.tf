terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_exec_test" "version" {
  digest = var.digest
  script = "docker run --rm $IMAGE_NAME --version"
}

data "oci_ref" "memcached" {
  ref = "cgr.dev/chainguard/memcached:latest"
}

data "oci_string" "ref" { input = var.digest }

resource "helm_release" "memcached-exporter-bitnami" {
  name       = "memcached-exporter"
  repository = "oci://registry-1.docker.io/bitnamicharts"
  chart      = "memcached"

  values = [jsonencode({
    image = {
      registry   = "cgr.dev"
      repository = "chainguard/memcached"
      digest     = data.oci_ref.memcached.digest
    }
    metrics = {
      enabled = true
      image = {
        registry   = data.oci_string.ref.registry
        repository = data.oci_string.ref.repo
        digest     = data.oci_string.ref.digest
      }
    }
  })]
}

module "helm_cleanup" {
  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.memcached-exporter-bitnami.id
  namespace = helm_release.memcached-exporter-bitnami.namespace
}
