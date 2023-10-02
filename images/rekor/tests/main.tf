terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    server         = string
    cli            = string
    backfill-redis = string
  })
}

module "scaffold-test" {
  source = "../../sigstore-scaffolding/tests"
  rekor-images = {
    backfill-redis = var.digests["backfill-redis"]
    rekor-cli      = var.digests["cli"]
    rekor-server   = var.digests["server"]
  }
}
