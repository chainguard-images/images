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
    agent             = module.agent.image_ref
    hubble-relay      = module.hubble-relay.image_ref
    hubble-ui         = module.hubble-ui.image_ref
    hubble-ui-backend = module.hubble-ui-backend.image_ref
    operator          = module.operator.image_ref
  }
}

resource "oci_tag" "latest" {
  depends_on = [module.test-latest]
  for_each = {
    "agent" : module.agent.image_ref
    "hubble-relay" : module.hubble-relay.image_ref
    "hubble-ui" : module.hubble-ui.image_ref
    "hubble-ui-backend" : module.hubble-ui-backend.image_ref
    "operator" : module.operator.image_ref
  }
  digest_ref = each.value
  tag        = "latest"
}

resource "oci_tag" "latest-dev" {
  depends_on = [module.test-latest]
  for_each = {
    "agent" : module.agent.dev_ref
    "hubble-relay" : module.hubble-relay.dev_ref
    "hubble-ui" : module.hubble-ui.dev_ref
    "hubble-ui-backend" : module.hubble-ui-backend.dev_ref
    "operator" : module.operator.dev_ref
  }
  digest_ref = each.value
  tag        = "latest-dev"
}
