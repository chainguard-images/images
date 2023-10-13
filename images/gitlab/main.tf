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
    kas = module.kas.image_ref
  }
  namespace = "gitlab-${random_pet.suffix.id}"
}

resource "random_pet" "suffix" {}

resource "oci_tag" "latest" {
  depends_on = [module.test-latest]
  for_each = {
    "kas" : module.kas.image_ref,
  }
  digest_ref = each.value
  tag        = "latest"
}

resource "oci_tag" "latest-dev" {
  depends_on = [module.test-latest]
  for_each = {
    "kas" : module.kas.dev_ref,
  }
  digest_ref = each.value
  tag        = "latest-dev"
}
