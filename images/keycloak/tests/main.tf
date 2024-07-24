terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_exec_test" "help" {
  digest = var.digest
  script = "docker run --rm $IMAGE_NAME --help"
}

# Run keycloak tests.
data "oci_exec_test" "keycloak-production-test" {
  digest = var.digest
  script = "${path.module}/keycloak-production-mode.sh"
}

variable "keycloak_version" {
  description = "The Keycloak version."
}

# Run the keycloak-operator image tests with this image.
module "run-keycloak-tests" {
  source = "../../keycloak-operator/tests"
  # need to hardcode this for the time being to unblock the release of keylcoak operator and keycloak to version 25 which is not published yet
  # due to release failures
  digest           = "keycloak/keycloak-operator:25.0.2"
  keycloak-image   = var.digest
  keycloak_version = var.keycloak_version
}
