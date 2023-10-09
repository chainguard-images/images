terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
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
    args = ["start-dev"]
  })]
}

module "helm_cleanup" {
  source = "../../../tflib/helm-cleanup"
  name   = helm_release.test.id
}
