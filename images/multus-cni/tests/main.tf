terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_exec_test" "manifest" {
  digest      = var.digest
  script      = "./deploy.sh"
  working_dir = path.module
}

resource "random_pet" "suffix" {}

resource "helm_release" "helm" {
  name             = "multus-cni-${random_pet.suffix.id}"
  namespace        = "multus-cni-${random_pet.suffix.id}"
  repository       = "https://startechnica.github.io/apps"
  chart            = "multus-cni"
  version          = "0.1.4"
  create_namespace = true

  values = [file("${path.module}/values.yaml")]

}

module "helm_cleanup" {
  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.helm.id
  namespace = helm_release.helm.namespace
  depends_on = [ helm_release.helm ]
}
