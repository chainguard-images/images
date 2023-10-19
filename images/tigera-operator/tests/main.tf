terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" { input = var.digest }

resource "random_pet" "suffix" {}

resource "helm_release" "tigera-operator" {
  name = "tigera-operator-${random_pet.suffix.id}"

  repository       = "https://projectcalico.docs.tigera.io/charts"
  chart            = "tigera-operator"
  namespace        = "tigera-operator-${random_pet.suffix.id}"
  create_namespace = true

  values = [jsonencode({
    tigeraOperator = {
      version  = data.oci_string.ref.pseudo_tag
      image    = data.oci_string.ref.repo
      registry = data.oci_string.ref.registry
    }
  })]
}

# This doesn't seem to cleanly uninstall things.
# module "helm_cleanup" {
#   source    = "../../../tflib/helm-cleanup"
#   name      = helm_release.tigera-operator.id
#   namespace = helm_release.tigera-operator.namespace
# }
