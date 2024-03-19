terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" { input = var.digest }

data "oci_exec_test" "version" {
  digest = var.digest
  script = "docker run --rm $IMAGE_NAME --version"
}

resource "random_pet" "suffix" {}

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "fluent-bit"
  inventory = data.imagetest_inventory.this
}

module "helm" {
  source = "../../../tflib/imagetest/helm"

  name      = "fluent-bit-${random_pet.suffix.id}"
  repo      = "https://fluent.github.io/helm-charts"
  chart     = "fluent-bit"
  namespace = "fluent-bit-${random_pet.suffix.id}"

  values = {
    image = {
      repository = data.oci_string.ref.registry_repo
      tag        = data.oci_string.ref.pseudo_tag
    }

    # the helm chart rewrites the entrypoint to /fluent-bit/bin/fluent-bit so we explicitly set it to the path in our image
    command = ["/usr/bin/fluent-bit"]
  }
}

resource "imagetest_feature" "basic" {
  name        = "Basic"
  description = "Basic fluent-bit Helm install test"
  harness     = imagetest_harness_k3s.this

  steps = [
    {
      name = "Helm install"
      cmd  = module.helm.install_cmd
    },
  ]

  labels = {
    type = "k8s",
  }
}
