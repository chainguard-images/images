terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

locals {
  full_repository = element(split("@", var.digest), 0)                    // cgr.dev/chainguard/tigera-operator
  registry        = element(split("/", local.full_repository), 0)         // cgr.dev
  parts           = split("/", local.full_repository)                     // ['cgr.dev', 'chainguard', 'tigera-operator']
  repository      = join("/", slice(local.parts, 1, length(local.parts))) // chainguard/tigera-operator
}

resource "helm_release" "tigera-operator" {
  name = "tigera-operator"

  repository       = "https://projectcalico.docs.tigera.io/charts"
  chart            = "tigera-operator"
  namespace        = "tigera-operator"
  create_namespace = true

  # Split the digest ref into repository and digest. The helm chart expects a
  # tag, but it just appends it to the repository again, so we just specify a
  # dummy tag and the digest to test.
  set {
    name  = "tigeraOperator.version"
    value = "unused@${element(split("@", var.digest), 1)}"
  }
  set {
    name  = "tigeraOperator.image"
    value = local.repository
  }
  set {
    name  = "tigeraOperator.registry"
    value = local.registry
  }
}
