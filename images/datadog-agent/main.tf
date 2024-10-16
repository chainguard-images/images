terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "test-latest" {
  source = "./tests/agent"
  digests = {
    "agent"         = module.agent.image_ref
    "cluster-agent" = module.cluster-agent.image_ref
  }
}

resource "oci_tag" "latest" {
  depends_on = [module.test-latest]
  for_each = {
    "agent" : module.agent.image_ref
    "cluster-agent" : module.cluster-agent.image_ref
  }
  digest_ref = each.value
  tag        = "latest"
}

resource "oci_tag" "latest-dev" {
  depends_on = [module.test-latest]
  for_each = {
    "agent" : module.agent.dev_ref
    "cluster-agent" : module.cluster-agent.dev_ref
  }
  digest_ref = each.value
  tag        = "latest-dev"
}
