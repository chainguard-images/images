terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

// Invoke a script with the test.
// $IMAGE_NAME is populated with the image name by digest.
// TODO: Update or remove this test as appropriate.
# data "oci_exec_test" "manifest" {
#   digest      = var.digest
#   script      = "./test.sh"
#   working_dir = path.module
# }

resource "random_pet" "suffix" {}

data "oci_exec_test" "helm" {
  digest = var.digest
  script = "${path.module}/helm.sh"
}

resource "helm_release" "helm" {
  name             = "helm-operator-${random_pet.suffix.id}"
  namespace        = "helm-operator-${random_pet.suffix.id}"
  chart            = "https://bsgrigorov.github.io/helm-operator/helm-operator-0.0.2.tgz"

  skip_crds = true

  values = [
    jsonencode({
      image = {
        operator = "bsgrigorov/helm-operator"
        pullPolicy = "Always"
      }
    })
  ]
}

module "helm_cleanup" {
  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.helm.id
  namespace = helm_release.helm.namespace
}
