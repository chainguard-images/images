terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    logserver = string
    logsigner = string
  })
}

module "scaffold-test" {
  source = "../../sigstore-scaffolding/tests"
  trillian-images = {
    logserver = var.digests["logserver"]
    logsigner = var.digests["logsigner"]
  }
}

data "oci_exec_test" "test" {
  digest = var.digests["logsigner"]
  script = "${path.module}/test.sh"

  env {
    name  = "TRILLIAN_LOG_SIGNER"
    value = var.digests["logsigner"]
  }

  env {
    name  = "TRILLIAN_LOG_SERVER"
    value = var.digests["logserver"]
  }
}
