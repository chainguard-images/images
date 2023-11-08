terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "test-latest" {
  source = "./tests"
  digests = {
    vault     = module.vault.image_ref
    vault-k8s = module.vault-k8s.image_ref
  }
}

resource "oci_tag" "latest" {
  depends_on = [module.test-latest]
  for_each = {
    "vault" : module.vault.image_ref,
    "vault-k8s" : module.vault-k8s.image_ref,
  }
  digest_ref = each.value
  tag        = "latest"
}

resource "oci_tag" "latest-dev" {
  depends_on = [module.test-latest]
  for_each = {
    "vault" : module.vault.dev_ref,
    "vault-k8s" : module.vault-k8s.dev_ref,
  }
  digest_ref = each.value
  tag        = "latest-dev"
}
