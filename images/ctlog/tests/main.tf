terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    trillian-ctserver = string
  })
}

module "scaffold-test" {
  source       = "../../sigstore-scaffolding/tests"
  ctlog-server = var.digests["trillian-ctserver"]
}
