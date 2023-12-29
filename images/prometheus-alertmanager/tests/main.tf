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

data "oci_string" "ref" {
  input = var.digest
}

resource "random_pet" "suffix" {}

# resource "helm_release" "test" {
#   name       = "prometheus-alertmanager-${random_pet.suffix.id}"
#   repository = "https://prometheus-community.github.io/helm-charts"
#   chart      = "alertmanager"

#   values = [jsonencode({
#     image = {
#       repository = data.oci_string.ref.registry_repo
#       tag        = data.oci_string.ref.pseudo_tag
#     }
#   })]
# }

# module "helm_cleanup" {
#   source = "../../../tflib/helm-cleanup"
#   name   = helm_release.test.id
# }
