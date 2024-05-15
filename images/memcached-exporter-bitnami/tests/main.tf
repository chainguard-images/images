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

locals { memcached = provider::oci::get("cgr.dev/chainguard/memcached:latest") }

locals { parsed = provider::oci::parse(var.digest) }

resource "helm_release" "memcached-exporter-bitnami" {
  name       = "memcached-exporter"
  repository = "oci://registry-1.docker.io/bitnamicharts"
  chart      = "memcached"

  values = [jsonencode({
    image = {
      registry   = "cgr.dev"
      repository = "chainguard/memcached"
      digest     = local.memcached.full_ref
    }
    metrics = {
      enabled = true
      image = {
        registry   = local.parsed.registry
        repository = local.parsed.repo
        digest     = local.parsed.digest
      }
    }
  })]
}

module "helm_cleanup" {
  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.memcached-exporter-bitnami.id
  namespace = helm_release.memcached-exporter-bitnami.namespace
}
