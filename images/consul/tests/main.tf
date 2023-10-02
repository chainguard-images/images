terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

variable "skip_crds" {
  description = "Used to deconflict between multiple installations within the same cluster."
  default     = false
}

data "oci_exec_test" "version" {
  digest = var.digest
  script = "docker run --rm $IMAGE_NAME --version"
}

resource "random_pet" "suffix" {}

resource "helm_release" "consul" {
  name = "consul-${random_pet.suffix.id}"

  repository = "https://helm.releases.hashicorp.com"
  chart      = "consul"

  namespace        = "consul-${random_pet.suffix.id}"
  create_namespace = true
  skip_crds        = var.skip_crds

  values = [jsonencode({
    global = {
      images = var.digest
    }
  })]
}

module "helm_cleanup" {
  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.consul.id
  namespace = helm_release.consul.namespace
}
