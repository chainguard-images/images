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

data "oci_string" "ref" {
  input = var.digest
}

resource "random_id" "hex" { byte_length = 4 }

resource "helm_release" "test" {
  name       = "prometheus-elasticsearch-exporter-${random_id.hex.hex}"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "prometheus-elasticsearch-exporter"

  namespace        = "prom-elasticsearch-${random_id.hex.hex}"
  create_namespace = true

  values = [jsonencode({
    image = {
      repository = data.oci_string.ref.registry_repo
      tag        = data.oci_string.ref.pseudo_tag
    }
  })]
}

module "helm_cleanup" {
  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.test.id
  namespace = helm_release.test.namespace
}
