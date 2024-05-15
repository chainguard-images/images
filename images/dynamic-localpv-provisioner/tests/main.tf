terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

locals { parsed = provider::oci::parse(var.digest) }

resource "helm_release" "dynamic-localpv-provisioner" {
  name = "dynamic-localpv-provisioner"

  repository = "https://openebs.github.io/dynamic-localpv-provisioner"
  chart      = "localpv-provisioner"

  values = [jsonencode({
    localpv = {
      image = {
        registry   = join("", [local.parsed.registry, "/"])
        repository = local.parsed.repo
        tag        = local.parsed.pseudo_tag
      }
    }
  })]
}

module "helm_cleanup" {
  source = "../../../tflib/helm-cleanup"
  name   = helm_release.dynamic-localpv-provisioner.id
}
