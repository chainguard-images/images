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

data "oci_string" "ref" { input = var.digest }

resource "helm_release" "memcached" {
  name       = "memcached"
  repository = "oci://registry-1.docker.io/bitnamicharts"
  chart      = "memcached"

  values = [jsonencode({
    image = {
      registry   = data.oci_string.ref.registry
      repository = data.oci_string.ref.repo
      digest     = data.oci_string.ref.digest
    }
  })]
}

module "helm_cleanup" {
  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.memcached.id
  namespace = helm_release.memcached.namespace
}
