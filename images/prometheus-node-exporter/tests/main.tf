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

resource "random_pet" "suffix" {}

resource "helm_release" "test" {
  name       = "prometheus-node-exporter-${random_pet.suffix.id}"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "prometheus-node-exporter"

  values = [jsonencode({
    image = {
      registry   = data.oci_string.ref.registry
      repository = data.oci_string.ref.repo
      digest     = data.oci_string.ref.digest
    }
  })]
}

resource "helm_release" "bitnami" {
  name       = "bitnami-prometheus-node-exporter-${random_pet.suffix.id}"
  repository = "oci://registry-1.docker.io/bitnamicharts"
  chart      = "node-exporter"

  values = [jsonencode({
    image = {
      registry   = data.oci_string.ref.registry
      repository = data.oci_string.ref.repo
      digest     = data.oci_string.ref.digest
    }
  })]
}
