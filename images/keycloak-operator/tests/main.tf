terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

// Invoke a script with the test.
// $IMAGE_NAME is populated with the image name by digest.
// TODO: Update or remove this test as appropriate.
data "oci_exec_test" "manifest" {
  digest      = var.digest
  script      = "./keycloak-test.sh"
  working_dir = path.module
}

#No helm chart provided
#resource "random_pet" "suffix" {}

# resource "helm_release" "helm" {
#   name             = "keycloak-operator-${random_pet.suffix.id}"
#   namespace        = "keycloak-operator-${random_pet.suffix.id}"
#   repository       = "" // TODO
#   chart            = "" // TODO
#   create_namespace = true

#   values = [
#     jsonencode({
#       // TODO:
#     })
#   ]
# }

# module "helm_cleanup" {
#   source    = "../../../tflib/helm-cleanup"
#   name      = helm_release.helm.id
#   namespace = helm_release.helm.namespace
# }
