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

data "oci_exec_test" "version" {
  digest = var.digest
  script = "docker run --rm $IMAGE_NAME --version"
}

resource "random_pet" "suffix" {}

resource "helm_release" "fluent-bit" {
  name = "fluent-bit-${random_pet.suffix.id}"

  repository = "https://fluent.github.io/helm-charts"
  chart      = "fluent-bit"

  namespace        = "fluent-bit-${random_pet.suffix.id}"
  create_namespace = true

  values = [jsonencode({
    image = {
      repository = data.oci_string.ref.registry_repo
      tag        = data.oci_string.ref.pseudo_tag
    }

    # the helm chart rewrites the entrypoint to /fluent-bit/bin/fluent-bit so we explicitly set it to the path in our image
    command = ["/usr/bin/fluent-bit"]
  })]
}

module "helm_cleanup" {
  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.fluent-bit.id
  namespace = helm_release.fluent-bit.namespace
}
