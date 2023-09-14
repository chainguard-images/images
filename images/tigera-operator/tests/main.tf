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

resource "helm_release" "tigera-operator" {
  name = "tigera-operator"

  repository       = "https://projectcalico.docs.tigera.io/charts"
  chart            = "tigera-operator"
  namespace        = "tigera-operator"
  create_namespace = true

  values = [jsonencode({
    tigeraOperator = {
      version  = data.oci_string.ref.pseudo_tag
      image    = data.oci_string.ref.repo
      registry = data.oci_string.ref.registry
    }
  })]
}
