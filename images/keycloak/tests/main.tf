terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

# Allows us to define the args passed to the helm chart test. We need to change
# these for the FIPS image, which also invokes this test.
variable "args" {
  description = "Args for the helm test"
  type        = list(string)
  default     = ["start-dev"]
}

# invoking '--help' instead of '--version' due to:
# - https://github.com/keycloak/keycloak/issues/23783
data "oci_exec_test" "help" {
  digest = var.digest
  script = "docker run --rm $IMAGE_NAME --help"
}
data "oci_string" "ref" {
  input = var.digest
}

resource "random_pet" "suffix" {}

resource "helm_release" "test" {
  name       = "keycloak-${random_pet.suffix.id}"
  repository = "oci://registry-1.docker.io/bitnamicharts"
  chart      = "keycloak"
  values = [jsonencode({
    image = {
      registry   = ""
      repository = data.oci_string.ref.registry_repo,
      digest     = data.oci_string.ref.digest
    },
    args = var.args
  })]
}

data "oci_exec_test" "keycloak-production-test" {
  digest = var.digest
  script = "${path.module}/keycloak-production-mode.sh"
}

module "helm_cleanup" {
  source = "../../../tflib/helm-cleanup"
  name   = helm_release.test.id
}
