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

variable "keycloak-operator_version" {
  description = "The Keycloak Operator version."
}

# Run the keycloak-operator image tests with this image.
module "run-keycloak-tests" {
  source           = "../../keycloak-operator/tests"
  digest           = "keycloak/keycloak-operator:${var.keycloak-operator_version}"
  keycloak-image   = var.digest
  keycloak_version = var.keycloak_version
}
