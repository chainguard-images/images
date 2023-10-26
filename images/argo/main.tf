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
    cli                 = module.cli.image_ref
    exec                = module.exec.image_ref
    worfkflowcontroller = module.workflowcontroller.image_ref
  }
}

resource "oci_tag" "latest" {
  depends_on = [module.test-latest]
  for_each = {
    "cli" : module.cli.image_ref
    "exec" : module.exec.image_ref
    "workflowcontroller" : module.workflowcontroller.image_ref
  }
  digest_ref = each.value
  tag        = "latest"
}

resource "oci_tag" "latest-dev" {
  depends_on = [module.test-latest]
  for_each = {
    "cli" : module.cli.dev_ref
    "exec" : module.exec.dev_ref
    "workflowcontroller" : module.workflowcontroller.dev_ref
  }
  digest_ref = each.value
  tag        = "latest-dev"
}
