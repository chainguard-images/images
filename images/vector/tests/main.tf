terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

locals { parsed = provider::oci::parse(var.digest) }

resource "random_id" "hex" { byte_length = 4 }

resource "helm_release" "vector" {
  name             = "vector-${random_id.hex.hex}"
  repository       = "https://helm.vector.dev"
  chart            = "vector"
  create_namespace = true
  namespace        = "vector-${random_id.hex.hex}"
  timeout          = 120

  values = [jsonencode({
    image = {
      repository = local.parsed.registry_repo
      tag        = "latest"
      sha        = trimprefix(local.parsed.digest, "sha256:")
    }
  })]
}

module "helm_cleanup" {
  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.vector.id
  namespace = helm_release.vector.namespace
}

