terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_exec_test" "version" {
  digest = var.digest
  script = "docker run --rm $IMAGE_NAME --version"
}

data "oci_exec_test" "docker-test" {
  digest      = var.digest
  script      = "./docker-test.sh"
  working_dir = path.module
}

locals { parsed = provider::oci::parse(var.digest) }

resource "random_pet" "suffix" {}

# resource "helm_release" "test" {
#   name       = "prometheus-alertmanager-${random_pet.suffix.id}"
#   repository = "https://prometheus-community.github.io/helm-charts"
#   chart      = "alertmanager"

#   values = [jsonencode({
#     image = {
#       repository = local.parsed.registry_repo
#       tag        = local.parsed.pseudo_tag
#     }
#   })]
# }

# module "helm_cleanup" {
#   source = "../../../tflib/helm-cleanup"
#   name   = helm_release.test.id
# }
